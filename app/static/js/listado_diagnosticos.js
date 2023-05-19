(function() {
    const btnsConsultar = document.querySelectorAll('.btnConsultar');
    let cedulaPacienteSeleccionado = null;
    let pacienteId = null;
    btnsConsultar.forEach((btn) => {
        btn.addEventListener('click', function() {
            cedulaPacienteSeleccionado = this.id;
            pacienteId = this.title;
            confirmarConsulta();
        });
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
                        'isbn': cedulaPacienteSeleccionado,
                        'paciente_id': pacienteId, 
                        'signos_vitales': signosVitales,
                        'sintomas': sintomas,
                        'examenes_extra': examenesExtra
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
        Swal.fire({
            title: 'Respuesta de TriaIAge',
            text: respuesta,
            icon: 'success',
            confirmButtonText: 'Cerrar'
        });
    }
})();
