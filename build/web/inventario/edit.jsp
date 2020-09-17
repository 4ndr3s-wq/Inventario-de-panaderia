

<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.inventarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Inventario"%>
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
                        <li class="nav-item">
                            <a class="nav-link" href="../venta/venta.jsp" id="ventas">Ventas</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="../productos/producto.jsp" id="productos">Productos</a>
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
                            <legend class="text-center text-white header">Modulo de inventarios</legend>
                        </div>
                    </div>
                </div>
                <div class="col-md-7 topmargin-sm  justify-content-center">
                    <div class="container justify-content-around">
                        <nav class="navbar navbar-light  bg-light">
                            <form class="form-control">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input class="form-control" type="search" placeholder="Buscar por identificacion de inventario" aria-label="Search">
                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-success" type="submit">Buscar</button>
                                    </div>
                                </div>
                            </form>
                        </nav>

                        <table border="1" class="table table-sm table-hover table-dark">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Inventario</th>
                                    <th scope="col">ventas</th>
                                    <th scope="col">Vendidos</th>
                                    <th scope="col">Comprados</th>
                                    <th scope="col" class="text-center" colspan="2">Acciones</th>
                                </tr>
                            </thead>
                            <%
                                inventarioDAO dao = new inventarioDAO();
                                List<Inventario> list = dao.listar();
                                Iterator<Inventario> iter = list.iterator();
                                Inventario inv = null;
                                while (iter.hasNext()) {
                                    inv = iter.next();
                            %>
                            <tbody>
                                <tr class="text-white">
                                    <td><%= inv.getProductos()%></td>
                                    <td><%= inv.getInventario()%></td>
                                    <td><%= inv.getVentas()%></td>
                                    <td><%= inv.getVendidos()%></td>
                                    <td><%= inv.getComprados()%></td>
                                    <td> <a href="edit.jsp?id_producto=<%= inv.getProductos()%>" class="align-bottom"><i class="fa fa-pencil">Editar</i></a></td>
                                    <td><a href="delete.jsp?id_producto=<%= inv.getProductos()%>" class="text-center"><i class="fas fa-trash-alt red">Eliminar</i></ion-icon></a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
                                    <!--en este codigo se hace la conexion a la base de datos ademas de ejecutar el codigo para buscar los datos en mysql--> 
        <%
            //conexion a la base de datos 
        conexion con = new conexion();
        //variables para hacer la consulta
        PreparedStatement ps;
        ResultSet rs;
        //variable que toma el valor insertado en el espacio para el id del proveedor 
        int id =Integer.parseInt(request.getParameter("id_producto"));
       // se escribe el codigo necesario para interactuar con la base de datos y realizar la consulta segun el id ingresado
        ps=con.getconexion().prepareStatement("select * from inventario where id_producto = '"+id+"'");
        //con el codigo execute se ejecuta el codigo escrito arriba
        rs=ps.executeQuery();
        //esto es neceario para visualizar los datos de la base de datos si se quita no se podra ver ningun dato
        while(rs.next()){
        %>
                <div class="col-md-5 topmargin-sm" >
                    <div class="row">
                        <form class="form-control" action="" method="POST">
                            <legend class="text-center header">Actualice inventarios</legend>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">                   
                                        <input type="number" class="form-control"  name="id" placeholder="Producto" value="<%=rs.getInt("id_producto")%>" disabled="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="number" class="form-control"  name="total_inventario" placeholder="Total inventario" value="<%=rs.getInt("total_inventario")%>" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="number" class="form-control" name="ventas_realizadas" placeholder="Ventas realizadas" value="<%=rs.getInt("ventas_realizadas")%>" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="productos_vendidos" placeholder="Productos vendidos"
                                               value="<%=rs.getString("productos_vendidos")%>"  required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="productos_comprados"
                                               value="<%=rs.getString("productos_comprados")%>"  placeholder="Productos comprados" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <input type="submit" class="btn btn-negro full-width" value="Actualizar">
                                </div>
                                <div class="col-md-6">
                                    <a type="submit" href="inventario.jsp" class="btn btn-negro full-width">Regresar</a>
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
                <small> A&ntildeo 2020 Todos los derechos reservados. Creado por Yoiber beitar</small>
            </div>
        </section>
                    <!--este fragmento de codigo es necesario colocarlo afuera del html--> 
<%
//se toman los valores de los espacion donde estabn los datos del proveedor
String total_inventario = request.getParameter("total_inventario");
String ventas_realizadas = request.getParameter("ventas_realizadas");
String productos_vendidos = request.getParameter("productos_vendidos");
String productos_comprados = request.getParameter("productos_comprados");

//si alguno de los datos tiene al menos un valor se ejecutara el update
 if (total_inventario != null || ventas_realizadas != null || productos_vendidos != null || productos_comprados != null) {

        //se esrcibe el codigo update y los valores que se le ponen son los mismos que estaban en los input donde aparecian los datos del proveedor 
        ps = con.getconexion().prepareStatement("update inventario set total_inventario='" + total_inventario + "',"
                + "ventas_realizadas='" +ventas_realizadas + "', productos_vendidos='" +productos_vendidos+ "', productos_comprados='" +productos_comprados+ "' where id='" +id+ "'");

        //se ejecuta el update y se redirecciona la pagina esto con el fin de que se detecten los datos escritos en los input
        ps.executeUpdate();
        response.sendRedirect("inventario.jsp");
    }
%>
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
    <script src="../js/fecha.js" type="text/javascript"></script>
</html>