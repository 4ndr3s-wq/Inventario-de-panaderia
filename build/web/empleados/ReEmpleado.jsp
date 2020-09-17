<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.empleados"%>
<%@page import="ModeloDAO.empleadosDAO"%>
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
        <link href="../css/default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/alertify.min.css" rel="stylesheet" type="text/css"/>
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
                            <a class="nav-link" href="../administrador.jsp">Inicio</a>
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
        <div class="row">
            <div class="col-md-12">
                <section id="contacto">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card bg-secondary">
                                    <div class="card-body">
                                        <legend class="text-center text-white header">Modulo para registrar</legend>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8 mt-5">
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
                                    <th scope="col" style="font-size: 10px">Rol</th>
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
                                            <td><%= emp.getLevel()%></td>
                                            <td> <a  href="edit.jsp?accion=editar&id_empleado=<%= emp.getId()%>" class="align-bottom"><i class="fa fa-pencil">Editar</i></a></td>
                                            <td><a  href="delete.jsp?accion=eliminar&id_empleado=<%= emp.getId()%>" class="text-center"><i class="fas fa-trash-alt red">Eliminar</i></ion-icon></a></td>

                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-4 mt-5">
                                <div class="row">
                                    <form class="form-control" id="ReEmpleados" method="post">
                                        <div class="row">
                                            <legend class="text-center header">Registrar usuarios</legend>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="number" class="form-control" 
                                                           placeholder="Identificacion" id="Usuarios">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Nombres" id="Nombres" >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Apellidos" id="Apellidos" >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="email" class="form-control" placeholder="Correo" id="Correos" >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control"  placeholder="Direccion"
                                                           id="Direcciones" >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="number" class="form-control"  placeholder="Telefono 1"
                                                           id="Tels1"  >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="number" class="form-control"
                                                           id="Tels2"  placeholder="Telefono 2" >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="password" class="form-control"
                                                           id="Passs"   placeholder="" >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="">
                                                    <select id="Nivels">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <input type="submit" class="btn btn-negro full-width" name="accion" value="agregar">
                                            </div>
                                            <div class="col-md-12" id="respuesta"></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
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
                <small> A&ntildeo© 2020 Todos los derechos reservados. Creado por Yoiber beitar</small>
            </div>
        </section>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
    <script src="https://kit.fontawesome.com/3ba937e77e.js" crossorigin="anonymous"></script>
    <script src="../js/ValidarEmpleado.js" type="text/javascript"></script>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</html>