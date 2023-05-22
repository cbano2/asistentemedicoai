

 function mostrarInformacion() {
    var pacienteSelect = document.getElementById('paciente');
    var infoPaciente = document.getElementById('info-paciente');

    var isbn = pacienteSelect.value;
    console.log(isbn)

    // Buscar la consulta correspondiente al ISBN seleccionado
    var consulta = data.consultas.find(function(c) {
    console.log(consulta)
      return c.diagnostico_isbn.isbn === isbn;
    });

    if (consulta) {
      var paciente = consulta.diagnostico_isbn.paciente_id;
      // Actualizar el contenido del div con la información del paciente
      infoPaciente.innerHTML = '<h5 class="card-title">Paciente seleccionado:</h5>' +
        '<p class="card-text">ISBN: ' + isbn + '</p>' +
        '<p class="card-text">Nombre: ' + paciente.nombre_completo() + '</p>' +
        '<p class="card-text">Cédula: ' + paciente.cedula + '</p>' +
        '<p class="card-text">Género: ' + paciente.genero + '</p>' +
        '<p class="card-text">Edad: ' + paciente.edad() + '</p>';
    } else {
      // Si no se encuentra la consulta correspondiente, mostrar un mensaje de error o limpiar el contenido
      infoPaciente.innerHTML = 'No se encontró información para el paciente seleccionado.';
    }
  }

