(function() {
    const btnsConsultar = document.getElementsByClassName('btnConsultar')[0];
    
    let pacienteId = null;
    btnsConsultar.addEventListener('click', function() {
            pacienteId = document.getElementById("paciente").value;
            confirmarConsulta();
        });


    const confirmarConsulta = () => {
        Swal.fire({
            title: '¿Confirma la consulta del paciente seleccionado?',
            inputAttributes: {
                autocapitalize: 'off'
            },
            showCancelButton: true,
            confirmButtonText: 'Consultar',
            showLoaderOnConfirm: true,
            preConfirm: async () => {
                const form = document.querySelector('.form-diagnostico');
                console.log(form)
                const signosVitales = form.querySelector('input[name="signos_vitales"]').value;
                const sintomas = form.querySelector('input[name="sintomas"]').value;
                const examenesExtra = form.querySelector('input[name="examenes_extra"]').value;

                return await fetch(`${window.origin}/consultarPaciente`, {
                    method: 'POST',
                    mode: 'same-origin',
                    credentials: 'same-origin',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        // 'isbn': cedulaPacienteSeleccionado,
                        'paciente_id': pacienteId, 
                        'signos_vitales': signosVitales,
                        'sintomas': sintomas,
                        'examenes_extra': examenesExtra,
                    })
                }).then(response => {
                    if (!response.ok) {
                        notificacionSwal('Error', response.statusText, 'error', 'Cerrar');
                    }
                    return response.json();
                }).then(data => {
                    if (data.exito) {
                        notificacionSwal('¡Éxito!', 'Consulta realizada', 'success', '¡OK!');
                        mostrarRespuestaOpenAI(data.openai_response);
                    } else {
                        notificacionSwal('¡Alerta!', data.mensaje, 'warning', 'OK');
                    }
                }).catch(error => {
                    notificacionSwal('Error', error, 'error', 'Cerrar');
                });
            },
            allowOutsideClick: () => false,
            allowEscapeKey: () => false
        });
    };

    const mostrarRespuestaOpenAI = (respuesta) => {
        try {
        const jsonObject = JSON.parse(respuesta);
        console.log(jsonObject)
        const respuestaContainer = document.getElementById('respuestaContainer');
        respuestaContainer.style.backgroundColor = jsonObject.Emergency_Color;
        respuestaContainer.innerHTML = '';
        
        
        const divContainer = document.createElement('div');
        divContainer.className = 'mi-contenedor'; 
        
        const greetingsParagraph = document.createElement('p');
        greetingsParagraph.textContent = jsonObject.Greetings;
        divContainer.appendChild(greetingsParagraph);

        const emergencyParagraph = document.createElement('p');
        emergencyParagraph.textContent = "Nivel de urgencia: " + jsonObject.Emergency;
        divContainer.appendChild(emergencyParagraph);
      
        const diagnosticTable = createTable(
          ['Diágnostico', 'Descripción'],
          [
            [jsonObject['Diagnoses_1'], jsonObject['Description_1']],
            [jsonObject['Diagnoses_2'], jsonObject['Description_2']],
            [jsonObject['Diagnoses_3'], jsonObject['Description_3']]
          ]
        );
        divContainer.appendChild(diagnosticTable);
      
        const testTreatmentTable = createTable(
          ['Test', 'Tratamientos'],
          [
            [jsonObject['Test_1'], jsonObject['Treatment_1']],
            [jsonObject['Test_2'], jsonObject['Treatment_2']],
            [jsonObject['Test_3'], jsonObject['Treatment_3']]
          ]
        );
        divContainer.appendChild(testTreatmentTable);
      
        const conclusionHeader = document.createElement('h6');
        conclusionHeader.textContent = 'Evaluación final:';
        divContainer.appendChild(conclusionHeader);
      
        const conclusionParagraph = document.createElement('p');
        conclusionParagraph.textContent = jsonObject.Conclusion;
        divContainer.appendChild(conclusionParagraph);
      
        respuestaContainer.appendChild(divContainer);
        }
        catch (error) {
            console.error('Error al analizar el JSON', error);
        }
      };
      
      const createTable = (headers, data) => {
        const table = document.createElement('table');
        table.className = 'table table-striped';
      
        const thead = document.createElement('thead');
        const headerRow = document.createElement('tr');
        headers.forEach(headerText => {
          const headerCell = document.createElement('th');
          headerCell.textContent = headerText;
          headerRow.appendChild(headerCell);
          
        });
        thead.appendChild(headerRow);
        table.appendChild(thead);
      
        const tbody = document.createElement('tbody');
        data.forEach(rowData => {
          const row = document.createElement('tr');
          rowData.forEach(cellData => {
            const cell = document.createElement('td');
            cell.textContent = cellData;
            row.appendChild(cell);
          });
          tbody.appendChild(row);
        });
        table.appendChild(tbody);
      
        return table;
    };
})();
