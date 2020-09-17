<%@page import="java.util.Iterator"%>
<%@page import="modelo.empleados"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.empleadosDAO"%>
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
        <title>Actualizar</title>
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
                            <a class="nav-link" href="..administrador.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../proveedor/proveedor.jsp">Proveedor</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../factura/factura.jsp">Factura</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../venta/venta.jsp">Ventas</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="../productos/producto.jsp">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../inventario/inventario.jsp">Inventario</a>
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
                                <legend class="text-center text-white header">Modulo para registrar</legend>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 topmargin-sm table-responsive-sm ">
                        <div class="container ">
                            <table border="1" class="table table1 table-sm table-hover table-dark">
                                <thead>
                                <th scope="col" class="table1" style="font-size: 10px">#</th>
                                <th scope="col" style="font-size: 10px">Nombres</th>
                                <th scope="col" style="font-size: 10px">Apellidos</th>
                                <th scope="col" style="font-size: 10px">Correo</th>
                                <th scope="col" style="font-size: 10px">Direccion</th>
                                <th scope="col" style="font-size: 10px">Telefono 1</th>
                                <th scope="col" style="font-size: 10px">Telefono 2</th>
                                <th scope="col" style="font-size: 10px">Contraseña</th>
                                <th scope="col" class="text-center" colspan="2" style="font-size: 10px">Acciones</th>
                                </tr>
                                </thead>
                                <%
                                    empleadosDAO dao = new empleadosDAO();
                                    List<empleados> list = dao.listar();
                                    Iterator<empleados> iter = list.iterator();
                                    empleados emp = null;
                                    while (iter.hasNext()) {
                                        emp = iter.next();


                                %>
                                <tbody>
                                    <tr class="text-white" style="font-size: 10px">
                                        <td ><%= emp.getId()%></td>
                                        <td><%= emp.getNombre()%></td>
                                        <td><%= emp.getApellidos()%></td>
                                        <td><%= emp.getEmail()%></td>
                                        <td><%= emp.getDireccion()%></td>
                                        <td><%= emp.getTel1()%></td>
                                        <td><%= emp.getTel2()%></td>
                                        <td><%= emp.getContraseña()%></td>                                
                                        <td> <a  href="edit.jsp?accion=editar&id_empleado=<%= emp.getId()%>" class="align-bottom"><i class="fa fa-pencil">Editar</i></a></td>
                                        <td><a href="delete.jsp?accion=eliminar&id_empleado=<%= emp.getId()%>" class="text-center"><i class="fas fa-trash-alt red">Eliminar</i></ion-icon></a></td>

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
                        String id = (request.getParameter("id_empleado"));
                        // se escribe el codigo necesario para interactuar con la base de datos y realizar la consulta segun el id ingresado
                        ps = con.getconexion().prepareStatement("select * from Usuario where id_usuario = '" + id + "'");
                        //con el codigo execute se ejecuta el codigo escrito arriba
                        rs = ps.executeQuery();
                        //esto es neceario para visualizar los datos de la base de datos si se quita no se podra ver ningun dato
                        while (rs.next()) {
                    %>
                    <div class="col-md-4 topmargin-sm ">
                        <div class="row">
                            <form class="form-control"  method="POST">
                                <div class="row">
                                    <legend class="text-center header">Actualize Datos</legend>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" 
                                                   placeholder="Identificacion" name="id"  value="<%=rs.getInt("id_usuario")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control"  name="nom_usuario" placeholder="Nombres" value="<%=rs.getString("nom_usuario")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="apellido_usuario" placeholder="Apellidos" value="<%=rs.getString("apellido_usuario")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" placeholder="Correo" value="<%=rs.getString("email")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="direccion" placeholder="Direccion"
                                                   value="<%=rs.getString("direccion")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="telefono_1" placeholder="Telefono 1"
                                                   value="<%=rs.getString("telefono_1")%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="telefono_2"
                                                   value="<%=rs.getString("telefono_2")%>" placeholder="Telefono 2" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" class="form-control" name="pass"
                                                   value="<%=rs.getString("contraseña")%>" placeholder="Contraseña" >
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="Submit" id="proveedorid" value="Actualizar" class="btn btn-negro full-width">
                                    </div>
                                    <div class="col-md-6">
                                        <a type="Submit"  class="btn btn-negro full-width nav-link" href="ReEmpleado.jsp">Regresar</a>
                                    </div>
                                </div>
                            </form>
                                       
                        </div>
                                        <%}%>
                    </div>
                </div>
            </div>
             
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
                <small> A&ntildeo© 2020 Todos los derechos reservados. Creado por Yoiber beitar</small>
            </div>
        </section>

    </body>
</html>
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
<!--este fragmento de codigo es necesario colocarlo afuera del html--> 
<%
    //se toman los valores de los espacion donde estabn los datos del proveedor

    String id_administrador = request.getParameter("id_administrador");
    String nom_usuario = request.getParameter("nom_usuario");
    String apellido_usuario = request.getParameter("apellido_usuario");
    String email = request.getParameter("email");
    String direccion = (request.getParameter("direccion"));
    String telefono_1 = (request.getParameter("telefono_1"));
    String telefono_2 = (request.getParameter("telefono_2"));
    String contraseña = (request.getParameter("contrasena"));

//si alguno de los datos tiene al menos un valor se ejecutara el update
    if (id_administrador != null || nom_usuario != null || apellido_usuario != null || email != null || direccion != null || telefono_1 != null || telefono_2 != null || contraseña != null) {

        //se esrcibe el codigo update y los valores que se le ponen son los mismos que estaban en los input donde aparecian los datos del proveedor 
        ps = con.getconexion().prepareStatement("update Usuario set nom_usuario='" + nom_usuario + "',"
                + " apellido_usuario='" + apellido_usuario + "', email='" + email + "', telefono_1='" + telefono_1 + "',"
                + "telefono_2='" + telefono_2 + "', contraseña='" + contraseña + "' where id_usuario='" + id + "'");

        //se ejecuta el update y se redirecciona la pagina esto con el fin de que se detecten los datos escritos en los input
        ps.executeUpdate();
        response.sendRedirect("ReEmpleado.jsp");
    }
%>