$(document).ready(function () {
    $('#fact').submit(function (e) {
        factura = document.getElementById('Factura').value;
        nit = document.getElementById('nit').value;
        total = document.getElementById('precio').value;
        producto = document.getElementById('producto').value;
        numero = document.getElementById('Numero').value;
        iva = document.getElementById('iva').value;
        fecha = document.getElementById('Fecha').value;
        if (factura.length === 0 || nit.length === 0 || total.length === 0 || producto.length === 0 || numero.length === 0 || fecha.length === 0 || iva.length === 0) {
            swal({
                title: "Error!",
                text: "Digite Todos los Datos Por favor!",
                icon: "error",
                button: "Cerrar!"
            });
            return false;
        } else {
            ruta2 = "fact=" + factura + "&Nit=" + nit + "&to=" + total + "&product=" + producto + "&numer=" + numero + "&Iva=" + iva + "&fech=" + fecha;
            try {
                $.ajax({
                    url: "../ref",
                    type: 'POST',
                    data: ruta2,
                    success: function () {
                        swal({
                            title: "Buen Trabajo!",
                            text: "La Factura con indentificacsor " + factura + " se ha insertado Correctamente!",
                            icon: "success",
                            button: "Cerrar!"
                        });
                    },
                    error: function () {
                        swal({
                            title: "Error!",
                            text: "Error al insertar!",
                            icon: "error",
                            button: "Cerrar!"
                        });
                    }
                });
            } catch (e) {
                console.log(e);
            }


            $('#fact').trigger('reset');
            e.preventDefault();
        }
    });
});
$(document).ready(function () {
    $('#Reproducto').submit(function (e) {
        ide = document.getElementById('producto').value;
        nom = document.getElementById('Nombre').value;
        cla = document.getElementById('clasificacion').value;
        mar = document.getElementById('marca').value;
        pe = document.getElementById('peso').value;
        pre = document.getElementById('precio').value;
        fec = document.getElementById('fecha').value;
        if (ide.length === 0 || nom.length === 0 || cla.length === 0 || mar.length === 0 || pe.length === 0 || pre.length === 0 || fec.length === 0) {
            swal({
                title: "Error!",
                text: "Digite Todos los Datos Por favor!",
                icon: "error",
                button: "Cerrar!"
            });
            return false;
        } else {
            ruta3 = "producto=" + ide + "&Nombre=" + nom + "&clasificacion=" + cla + "&marca=" + mar + "&peso=" + pe + "&precio=" + pre + "&fecha=" + fec;
            $.ajax({
                url: "../ReP",
                type: 'POST',
                data: ruta3,
                success: function () {
                    swal({

                        title: "Buen Trabajo!",
                        text: "El Producto " + nom + " se ha insertado Correctamente!",
                        icon: "success",
                        button: "Cerrar!"

                    });
                },
                error: function () {
                    swal({
                        title: "Error!",
                        text: "Error al insertar!",
                        icon: "error",
                        button: "Cerrar!"
                    });
                }
            });

            $('#Reproducto').trigger('reset');
            e.preventDefault();
            return false;
        }
    });
});
$(document).ready(function () {
    $('#Reproveedor').submit(function (e) {
        id = document.getElementById('Identificacion').value;
        nom = document.getElementById('Nombres').value;
        tel = document.getElementById('Telefono').value;
        dir = document.getElementById('Direccion').value;
        empre = document.getElementById('empresa').value;
        cata = document.getElementById('Catalogo').value;
        preci = document.getElementById('precio').value;
        if (id.length === 0 || nom.length === 0 || tel.length === 0 || dir.length === 0 || empre.length === 0 || cata.length === 0 || preci.length === 0) {
            swal({
                title: "Error!",
                text: "Digite Todos los Datos Por favor!",
                icon: "error",
                button: "Cerrar!"
            });
            return false;
        } else {
            ruta4 = "Identificacion=" + id + "&Nombres=" + nom + "&Telefono=" + tel + "&Direccion=" + dir + "&empresa=" + empre + "&Catalogo=" + cata + "&precio=" + preci;
            $.ajax({
                url: "../RePro",
                type: "POST",
                data: ruta4,
                success: function () {
                    swal({

                        title: "Correcto!",
                        text: `El Proveedor  ${nom} se ha insertado Correctamente!`,
                        icon: "success",
                        button: "Cerrar!"

                    });
                },
                error: function () {
                    swal({
                        title: "Error!",
                        text: "Error al insertar!",
                        icon: "error",
                        button: "Cerrar!"
                    });
                }
            });
        }



        $('#Reproveedor').trigger('reset');
        e.preventDefault();
        return false;
    });
});

$(document).ready(function () {
    $(function () {
        const selecte = 'Facutar ID';
        if (selecte) {
            $('#cambiar').val(selecte).html(selecte);
        }
    });
    $(function () {
        const selecte = 'Producto ID';
        if (selecte) {
            $('#productoo').val(selecte).html(selecte);
        }
    });
    $('#Facturaa :selected').click(function () {
        swal({
            title: "Error!",
            text: "Digite Todos los Datos Por favor!",
            icon: "error",
            button: "Cerrar!"
        });
        return false;
    });
    $('#Reventa').submit(function (e) {
        iden = document.getElementById('venta1').value;
        factu = document.getElementById('factura1').value;
        prove = document.getElementById('producto1').value;
        fecha = document.getElementById('fecha1').value;
        if (iden.length === 0 || factu.length === 0 || prove.length === 0 || fecha.length === 0) {
            swal({
                title: "Error!",
                text: "Digite Todos los Datos!",
                icon: "error",
                button: "Cerrar!"
            });
            return false;
        } else {
            ruta5 = "venta=" + iden + "&factura=" + factu + "&producto=" + prove + "&fecha=" + fecha;
            $.ajax({
                url: "../ReVe",
                type: 'POST',
                data: ruta5,
                success: function () {
                    swal({

                        title: "Correcto!",
                        text: "La factura  se ha insertado Correctamente!",
                        icon: "success",
                        button: "Cerrar!"

                    });
                },
                error: function () {
                    swal({
                        title: "Error!",
                        text: "Error al insertar!",
                        icon: "error",
                        button: "Cerrar!"
                    });
                }
            });
        }


        $('#Reventa').trigger('reset');
        e.preventDefault();
        return false;
    });
});

$(document).ready(function () {
    $(function () {
        const selecte = 'Producto ID';
        if (selecte) {
            $('#prodd').val(selecte).html(selecte);
        }
    });
    $('#frmIn').submit(function (e) {
        opciones = document.getElementById('op').value;
        inventario = document.getElementById('inv').value;
        ventas = document.getElementById('ven').value;
        vendido = document.getElementById('vend').value;
        comprado = document.getElementById('com').value;
        postData = "op=" + opciones + "&inv=" + inventario + "&ven=" + ventas + "&vend=" + vendido + "&com=" + comprado;
        if (opciones.length === 0 || inventario.length === 0 || ventas.length === 0 || vendido.length === 0 || comprado.length === 0) {
            swal({
                title: "Error!",
                text: "Digite Todos los Datos Por favor!",
                icon: "error",
                button: "Cerrar!"
            });
            return false;
        } else {
            $.ajax({
                url: "../ReIn",
                type: 'POST',
                data: postData,
                error: function () {
                    swal({
                        title: "Error!",
                        text: "Error al insertar!",
                        icon: "error",
                        button: "Aww yiss!"
                    });
                },
                success: function () {
                    swal({
                        title: "Correcto!",
                        text: "Insertado Correctamente Recargue la pagina para ver resultados!",
                        icon: "success",
                        button: "Cerrar!"
                    });
                }


            });
        }

        $('#frmIn').trigger('reset');
        e.preventDefault();
        return false;
    });
});





