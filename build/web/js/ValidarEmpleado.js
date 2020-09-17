$(document).ready(function () {
    $('#ReEmpleados').submit(function (e) {
        usuario = document.getElementById('Usuarios').value;
        nombre = document.getElementById('Nombres').value;
        apellido = document.getElementById('Apellidos').value;
        correo = document.getElementById('Correos').value;
        direccion = document.getElementById('Direcciones').value;
        tel1 = document.getElementById('Tels1').value;
        tel2 = document.getElementById('Tels2').value;
        pass = document.getElementById('Passs').value;
        level = document.getElementById('Nivels').value;
        if (usuario.length === 0 || nombre.length===0 || apellido.length===0 || correo.length===0 || direccion.length===0 ||
                tel1.length===0 || tel2.length===0 || pass.length===0 || level.length===0) {
            swal({
                title: "Error!",
                text: "Digite todos los datos por favor!",
                icon: "error",
                button: "Cerrar!"
            });
            return false;
        }else {
            ruta = "ide=" + usuario + "&nom=" + nombre + "&ape=" + apellido + "&corr=" + correo + "&dir=" + direccion + "&tel1=" + tel1 + "&tel2=" + tel2 + "&cont=" + pass+ "&nive=" + level;
            $.get({
                url: "../RegistreEmpleado",
                type: "post",
                data: ruta,
                success: function () {
                    swal({
                        title: "Buen Trabajo!",
                        text: "El empleado " + nombre + " se ha insertado Correctamente!",
                        icon: "success",
                        button: "Cerrar!"
                    });
                },
                error: function (e) {
                    swal({
                        title: "Error!",
                        text: "Error al insertar!",
                        icon: "error",
                        button: "Cerrar!"
                    });
                }
            });
            $('#enviar').trigger('reset');
            e.preventDefault();
            return false;
        }
    });
});


