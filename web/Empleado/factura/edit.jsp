<%-- 
    Document   : edit
    Created on : 06-jun-2020, 14:49:02
    Author     : win 8.1
--%>

<%@page import="java.util.List"%>
<%@page import="ModeloDAO.facturaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.factura"%>
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
        <script src="../js/fecha.js" type="text/javascript"></script>
        <script src="https://momentjs.com/downloads/moment.js"></script>
        <title>Document</title>
    </head>
    <body>
        <%
            //conexion a la base de datos 
            conexion con = new conexion();
            //variables para hacer la consulta
            PreparedStatement ps;
            ResultSet rs;
            //variable que toma el valor insertado en el espacio para el id del proveedor 
            String id = (request.getParameter("id_factura"));
            // se escribe el codigo necesario para interactuar con la base de datos y realizar la consulta segun el id ingresado
            ps = con.getconexion().prepareStatement("select * from factura where id_factura = '" + id + "'");
            //con el codigo execute se ejecuta el codigo escrito arriba
            rs = ps.executeQuery();
            //esto es neceario para visualizar los datos de la base de datos si se quita no se podra ver ningun dato
            while (rs.next()) {
        %>
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
                            <a class="nav-link" href="..administrador.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../productos/producto.jsp">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../venta/venta.jsp">Ventas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../inventario/inventario.jsp">Inventario</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../proveedor/proveedor.jsp">Proveedor</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="../empleados/ReEmpleado.jsp">Registrar</a>
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
                                <legend class="text-center text-white header">Modulo de Facturas</legend>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 topmargin-sm  justify-content-center">
                        <div class="container justify-content-around">
                            <table border="1" class="table table-sm table-hover table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">NIT</th>
                                        <th scope="col">Precio total</th>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">Numero</th>
                                        <th scope="col">Iva</th>
                                        <th scope="col">Fecha</th>
                                        <th scope="col" class="text-center" colspan="2">Acciones</th>
                                    </tr>
                                </thead>
                                <%
                                    facturaDAO dao = new facturaDAO();
                                    List<factura> list = dao.listar();
                                    Iterator<factura> iter = list.iterator();
                                    factura fact = null;
                                    while (iter.hasNext()) {
                                        fact = iter.next();

                                %>
                                <tbody>
                                    <tr class="text-white">
                                        <td><%= fact.getId()%></td>
                                        <td><%= fact.getNit()%></td>
                                        <td>$<%= fact.getPrecio()%></td>
                                        <td><%= fact.getProducto()%></td>               
                                        <td><%= fact.getNumero()%></td>
                                        <td><%= fact.getIva()%></td>
                                        <td><%= fact.getFecha()%></td>
                                        <td> <a href="edit.jsp?id_factura=<%=fact.getId()%>" class="align-bottom"><i class="fa fa-pencil">Editar</i></a></td>
                                        <td><a href="eliminar.jsp?id_factura=<%=fact.getId()%>" class="text-center"><i class="fas fa-trash-alt red">Eliminar</i></ion-icon></a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-5 topmargin-sm" >
                        <div class="row">
                            <form class="form-control" action="" method="POST">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" 
                                                   placeholder="Identificacion factura" name="id"  value="<%=rs.getInt("id_factura")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control"  name="nit" placeholder="Nit"  value="<%=rs.getInt("nit")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="precio_total" placeholder="Precio total" value="<%=rs.getInt("precio_total")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="cant_producto" placeholder="Cantidad de productos" value="<%=rs.getInt("cant_producto")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="numero_facturaNumero" placeholder="Numero"
                                                   value="<%=rs.getInt("numero_factura")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="iva" placeholder="Iva"
                                                   value="<%=rs.getInt("iva")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="date" id="date" class="form-control"  value="<%=rs.getString("fecha_venta")%>" name="fecha_venta"
                                                   placeholder="fecha" onchange="obtenerFecha(this)" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="submit" class="btn btn-negro full-width" id="proveedorid" value="Actualizar">
                                    </div>
                                    <div class="col-md-6">
                                        <a type="Submit"  class="btn btn-negro full-width nav-link" href="factura.jsp">Regresar</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </section>
        <section id="pie" class="btn-negro footer">
            <div class="container"><img src="css/img/baguette.png" alt="logo" class="logo-brand">
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
</html>
<!--este fragmento de codigo es necesario colocarlo afuera del html--> 
<%
    //se toman los valores de los espacion donde estabn los datos del proveedor

    String nit = request.getParameter("nit");
    String precio_total = request.getParameter("precio_total");
    String cant_producto = request.getParameter("cant_producto");
    String fecha_venta = request.getParameter("fecha_venta");
    String numero_factura = (request.getParameter("numero_factura"));
    String iva = (request.getParameter("iva"));

//si alguno de los datos tiene al menos un valor se ejecutara el update
    if (nit != null || precio_total != null || cant_producto != null || fecha_venta != null || numero_factura != null || iva != null) {

        //se esrcibe el codigo update y los valores que se le ponen son los mismos que estaban en los input donde aparecian los datos del proveedor 
        ps = con.getconexion().prepareStatement("update factura set nit='" + nit + "',"
                + " precio_total='" + precio_total + "', cant_producto='" + cant_producto + "', fecha_venta='" + fecha_venta + "',"
                + "numero_factura ='" + numero_factura + "', iva='" + iva + "' where id_factura='" + id + "'");

        //se ejecuta el update y se redirecciona la pagina esto con el fin de que se detecten los datos escritos en los input
        ps.executeUpdate();
        response.sendRedirect("factura.jsp");
    }
%>
