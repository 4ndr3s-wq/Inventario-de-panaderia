<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="controlador.conexion"%>
<%@page import="controlador.conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ventas"%>
<%@page import="ModeloDAO.ventasDAO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/login.css">
        <link rel="stylesheet" href="../css/miestilo.css" type="text/css">
        <link href="https://unpkg.com/ionicons@4.5.5/dist/css/ionicons.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:ital,wght@0,300;0,600;1,400&display=swap"
              rel="stylesheet">
        <title>Ventas</title>
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
                                        <td><a  href="delete.jsp?accion=eliminar&id_venta=<%= vent.getId()%>" class="text-center"><i class="fas fa-trash-alt red">Eliminar</i></ion-icon></a></td>

                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-4 topmargin-sm ">
                        <div class="row">
                            <form id="Reventa"  class="form-control">
                                <div class="row">
                                    <legend class="text-center  header">Registre ventas</legend>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" id="venta1"
                                                   placeholder="Identificacion de venta" >
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <select  class="form-control borrar" id="factura1">
                                                <%
                                                    conexion cn = new conexion();
                                                    PreparedStatement pst = null;
                                                    ResultSet rs = null;
                                                    try {
                                                        cn.getconexion();
                                                        String sql = "select *from factura";
                                                        pst = cn.getconexion().prepareStatement(sql);
                                                        rs = pst.executeQuery();
                                                        while (rs.next()) {
                                                            conexion c = new conexion();
                                                            out.println("<option>" + rs.getInt(2) + "</option>");
                                                        }
                                                    } catch (Exception e) {
                                                        out.print(e.toString());
                                                    }
                                                %>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <select  class="form-control" id="producto1">
                                                <%
                                                    try {
                                                        cn.getconexion();
                                                        String sql = "select *from producto";
                                                        pst = cn.getconexion().prepareStatement(sql);
                                                        rs = pst.executeQuery();
                                                        while (rs.next()) {
                                                            conexion c = new conexion();
                                                            out.println("<option id='productoo'>" + rs.getInt(1) + "</option>");
                                                        }
                                                    } catch (Exception e) {
                                                        out.print(e.toString());
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="date" class="form-control" id="fecha1" placeholder="Fecha">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <input type="submit" class="btn btn-negro full-width" name="accion" value="agregar">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="pie" class="btn-negro footer">
            <div class="container"><img src="../css/img/baguette.png" alt="logo" class="logo-brand">
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
                <small> A&ntildeo © 2020 Todos los derechos reservados. Creado por Yoiber beitar</small>
            </div>
        </section>
    </body>
    <script
        src="https://code.jquery.com/jquery-1.12.4.js"
        integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
    <script src="https://kit.fontawesome.com/3ba937e77e.js" crossorigin="anonymous"></script>
    <script src="../js/Validar.js" type="text/javascript"></script> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../js/fecha.js" type="text/javascript"></script>

</html>