<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.productos"%>
<%@page import="ModeloDAO.productosDAO"%>
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
        <title>Actaulizar</title>
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
                            <a class="nav-link" href="../factura/factura.jsp" id="factura">Factura</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../venta/venta.jsp" id="ventas">Ventas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../inventario/inventario.jsp" id="inventario">Inventario</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../proveedor/proveedor.jsp" id="proveedor">Proveedor</a>
                        </li>
                        <li class="nav-item">
                            <a href="proveedor.jsp" class="nav-link"></a>
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
                                <legend class="text-center text-white header">Modulo de Productos</legend>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 topmargin-sm  justify-content-center">
                        <div class="container justify-content-around">
                            <table border="1" class="table table-sm table-hover table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Clasificacion</th>
                                        <th scope="col">Marca</th>
                                        <th scope="col">Peso</th>
                                        <th scope="col">Precio</th>
                                        <th scope="col">Caducidad</th>
                                        <th scope="col" class="text-center" colspan="2">Acciones</th>
                                    </tr>
                                </thead>
                                <%
                                    productosDAO dao = new productosDAO();
                                    List<productos> list = dao.listar();
                                    Iterator<productos> iter = list.iterator();
                                    productos pro = null;
                                    while (iter.hasNext()) {
                                        pro = iter.next();

                                %>
                                <tbody>
                                    <tr class="text-white">
                                        <td><%= pro.getId()%></td>
                                        <td><%= pro.getNombre()%></td>
                                        <td><%= pro.getClasificacion()%></td>
                                        <td><%= pro.getMarca()%></td>
                                        <td><%= pro.getPeso()%></td>
                                        <td><%= pro.getPrecio()%></td>
                                        <td><%= pro.getFecha()%></td>
                                        <td> <a href="edit.jsp?accion=editar&id=<%= pro.getId()%>" class="align-bottom"><i class="fa fa-pencil">Editar</i></a></td>
                                        <td><a href="delete.jsp?accion=eliminar&id=<%= pro.getId()%>" class="text-center"><i class="fas fa-trash-alt red">Eliminar</i></ion-icon></a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-4 topmargin-sm" >
                        <div class="row">
                                    <!--en este codigo se hace la conexion a la base de datos ademas de ejecutar el codigo para buscar los datos en mysql--> 
        <%
            //conexion a la base de datos 
        conexion con = new conexion();
        //variables para hacer la consulta
        PreparedStatement ps;
        ResultSet rs;
        //variable que toma el valor insertado en el espacio para el id del proveedor 
        int id =Integer.parseInt(request.getParameter("id"));
       // se escribe el codigo necesario para interactuar con la base de datos y realizar la consulta segun el id ingresado
        ps=con.getconexion().prepareStatement("select * from Producto where id_producto = '"+id+"'");
        //con el codigo execute se ejecuta el codigo escrito arriba
        rs=ps.executeQuery();
        //esto es neceario para visualizar los datos de la base de datos si se quita no se podra ver ningun dato
        while(rs.next()){
        %>
                            <form class="form-control" action="" method="POST">
                                <div class="row">
                                    <legend class="text-center header">Actualize sus Productos</legend>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" 
                                                   placeholder="Identificacion producto" name="id"  value="<%=rs.getInt("id_producto") %>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control"  name="nombre" placeholder="nombre" value="<%=rs.getString("nom_producto") %>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="clasificacion" placeholder="Clasificacion" value="<%=rs.getString("id_clasificacion") %>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="marca" placeholder="Marca"  value="<%=rs.getString("marca") %>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="peso" placeholder="Peso"
                                                 value="<%=rs.getInt("peso") %>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="precio" placeholder="Precio"
                                                 value="<%=rs.getInt("precio") %>"  required>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="date" class="form-control" name="fecha_caducacion"
                                                   placeholder="fecha" value="<%=rs.getString("fecha_caducacion") %>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="submit" class="btn btn-negro full-width" name="accion" value="Actualizar">
                                    </div>
                                        <div class="col-md-6">
                                            <a type="submit" href="producto.jsp" class="btn btn-negro full-width"  >Regresar</a>
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
String nombre = request.getParameter("nombre");
String clasificacion = request.getParameter("clasificacion");
String marca = request.getParameter("marca");
String peso = request.getParameter("peso");
String precio = request.getParameter("precio");
String fecha_caducacion = (request.getParameter("fecha_caducacion"));
    
//si alguno de los datos tiene al menos un valor se ejecutara el update
if(nombre!=null || clasificacion!=null || marca!=null || peso!=null || precio!=null || fecha_caducacion!=null){
    
    //se esrcibe el codigo update y los valores que se le ponen son los mismos que estaban en los input donde aparecian los datos del proveedor 
    
    ps=con.getconexion().prepareStatement("update Producto set nom_producto='"+nombre+"',"
            + "id_clasificacion='"+clasificacion+"', marca='"+marca+"', peso='"+peso+"',"
            + "precio='"+precio+"', fecha_caducacion='"+fecha_caducacion+"' where id_producto='"+id+"'");
    
    //se ejecuta el update y se redirecciona la pagina esto con el fin de que se detecten los datos escritos en los input
    
    ps.executeUpdate();
    response.sendRedirect("producto.jsp");
}
%>