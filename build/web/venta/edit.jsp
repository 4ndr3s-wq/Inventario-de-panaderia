
<%@page import="java.util.Iterator"%>
<%@page import="modelo.ventas"%>
<%@page import="modelo.ventas"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ventasDAO"%>
<%@page import="java.sql.*"%>
<%@page import="controlador.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/login.css">
        <link rel="stylesheet" href="../css/miestilo.css" type="text/css">
        <link href="https://unpkg.com/ionicons@4.5.5/dist/css/ionicons.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:ital,wght@0,300;0,600;1,400&display=swap"
              rel="stylesheet">
        <title>Document</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#" id="panaderia"><img src="../css/img/baguette.png" class="logo-brand"
                                                                     alt="logo"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="icon ion-md-menu"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="../administrador.jsp" id="inventario">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../proveedor/proveedor.jsp" id="proveedor">Proveedor</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../factura/factura.jsp" id="factura">Factura</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="../productos/producto.jsp" id="productos">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../inventario/inventario.jsp" id="inventario">Inventario</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="../empleados/ReEmpleado.jsp" id="productos">Registrar</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section id="contacto" class="divisor">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card bg-secondary">
                            <div class="card-body">
                                <legend class="text-center text-white header">Modulo de Ventas</legend>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 topmargin-sm table-responsive-sm justify-content-center">
                        <div class="container justify-content-around">
                            <table border="1" class="table table-sm table-hover table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col row">#</th>
                                        <th scope="col">Factura</th>
                                        <th scope="col">Producto</th>
                                        <th scope="col">Fecha</th>
                                        <th class="text-center" scope="col" colspan="2">Acciones</th>
                                    </tr>
                                </thead>
                                <%
                                    ventasDAO dao = new ventasDAO();
                                    List<ventas> list = dao.listar();
                                    Iterator<ventas> iter = list.iterator();
                                    ventas vent = null;
                                    while (iter.hasNext()) {
                                        vent = iter.next();
                                %>
                                <tbody>
                                    <tr class="text-white">
                                        <td><%= vent.getId()%></td>
                                        <td><%=  vent.getFactura()%></td>
                                        <td><%= vent.getProducto()%></td>
                                        <td><%= vent.getFecha()%></td>                               
                                        <td> <a href="edit.jsp?accion=editar&id_venta=<%= vent.getId()%>" class="align-bottom"><i class="fa fa-pencil">Editar</i></a></td>
                                        <td><a href="delete.jsp?accion=eliminar&id_venta=<%= vent.getId()%>" class="text-center"><i class="fas fa-trash-alt red">Eliminar</i></ion-icon></a></td>

                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-4 topmargin-sm ">
                        <div class="row">
                            <!--en este codigo se hace la conexion a la base de datos ademas de ejecutar el codigo para buscar los datos en mysql--> 
                            <%
                                //conexion a la base de datos 
                                conexion con = new conexion();
                                //variables para hacer la consulta
                                PreparedStatement ps;
                                ResultSet rs;
                                //variable que toma el valor insertado en el espacio para el id del proveedor 
                                String id = (request.getParameter("id_venta"));
                                // se escribe el codigo necesario para interactuar con la base de datos y realizar la consulta segun el id ingresado
                                ps = con.getconexion().prepareStatement("select * from Venta where id_venta = '" + id + "'");
                                //con el codigo execute se ejecuta el codigo escrito arriba
                                rs = ps.executeQuery();
                                //esto es neceario para visualizar los datos de la base de datos si se quita no se podra ver ningun dato
                                while (rs.next()) {
                            %>
                            <form action="" method="post" class="form-control">
                                <div class="row">
                                    <legend class="text-center  header">Registre ventas</legend>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="id_venta"
                                                   placeholder="Identificacion de venta" value="<%=rs.getInt("id_venta")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input class="form-control" name="id_factura" id="opciones" placeholder="Nombre de producto" value="<%=rs.getInt("id_factura")%>">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input class="form-control" name="id_producto" id="opciones" placeholder="Nombre de producto" id="nombre" value="<%=rs.getInt("id_producto")%>">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="date" class="form-control" name="fecha_venta" placeholder="Fecha"
                                                 value="<%=rs.getString("fecha_venta")%>"  required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="submit" class="btn btn-negro full-width" name="accion" value="Actualizar">
                                    </div>
                                    <div class="col-md-6">
                                        <a type="submit" href="venta.jsp"  class="btn btn-negro full-width">Regresar</a>
                                    </div>
                                </div>
                            </form>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </section>
     <section id="pie" class="btn-negro footer">
            <div class="container"><img src="../../css/img/baguette.png" alt="logo" class="logo-brand">
                <ul class="list-inline">
                    <li class="list-inline-item footer-menu"><a href="#">Inicio</a></li>
                    <li class="list-inline-item footer-menu"><a href="#">Acerca de nosotros</a></li>
                    <li class="list-inline-item footer-menu"><a href="#">precios</a></li>
                    <li class="list-inline-item footer-menu"><a href="#">contacto</a></li>
                </ul>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="">
                            <ion-icon class="icon" name="logo-instagram"></ion-icon>
                        </a></li>
                    <li class="list-inline-item"><a href="">
                            <ion-icon class="icon" name="logo-twitter"></ion-icon>
                        </a></li>
                    <li class="list-inline-item"><a href="">
                            <ion-icon class="icon" name="logo-youtube"></ion-icon>
                        </a></li>
                    <li class="list-inline-item"><a href="">
                            <ion-icon class="icon" name="logo-dribbble"></ion-icon>
                        </a></li>
                    <li class="list-inline-item"><a href="">
                            <ion-icon class="icon" name="logo-facebook"></ion-icon>
                        </a></li>
                </ul>
                <small> A&ntildeo 2020 Todos los derechos reservados. Creado por Yoiber beitar</small>
            </div>
        </section>
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
    <script src="https://kit.fontawesome.com/3ba937e77e.js" crossorigin="anonymous"></script>

</html>
<!--este fragmento de codigo es necesario colocarlo afuera del html--> 
<%
    //se toman los valores de los espacion donde estabn los datos del proveedor

    String id_factura = request.getParameter("id_factura");
    String id_producto = request.getParameter("id_producto");
    String fecha_venta = request.getParameter("fecha_venta");

//si alguno de los datos tiene al menos un valor se ejecutara el update
    if (id_factura != null || id_producto != null || fecha_venta != null) {

        //se esrcibe el codigo update y los valores que se le ponen son los mismos que estaban en los input donde aparecian los datos del proveedor 
        ps = con.getconexion().prepareStatement("update Venta set fecha_venta= '" + fecha_venta + "' where id_venta='" + id + "'");

        //se ejecuta el update y se redirecciona la pagina esto con el fin de que se detecten los datos escritos en los input
        ps.executeUpdate();
        response.sendRedirect("venta.jsp");
    }
%>