<%@page import="controlador.inicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/miestilo.css" rel="stylesheet" type="text/css"/>
        <title>Iniciar</title>
    </head>
    <body>
        <div class="container personalizada col-lg-3">
            <form action="index.jsp" method="POST" onsubmit="return caracteres()">
                <div class="form-group text-center">
                    <img src="css/img/login2.png" width="80" height="80"/>
                    <p><strong>Inicio de sesion</strong></p>
                </div>
                <div class="form-group text-center">
                    <label for="">Correo</label>
                    <input type="email" id="correo" class="form-control" id="correo" placeholder="Correo"  name="Identificacion">
                </div>
                <div class="form-group text-center">
                    <label for="">Contrase&ntildea</label>
                    <input type="password" class="form-control" id="contrasenia" placeholder="Contraseña" name="Password">
                </div>
                <div class="form-group text-center">
                    <a class="text-white" href="">Olvido su contraseña?</a>
                </div>
                <input class="btn btn-danger btn-block" type="Submit"  value="Ingresar" name="accion">
            </form>
        </div>
    </body>
    <%
        inicio ini=new inicio();
        if (request.getParameter("accion")!=null) {
                String email=request.getParameter("Identificacion");
                String pass=request.getParameter("Password");
                HttpSession sesion=request.getSession();
                switch(ini.loguear(email, pass)){
                    case 1:
                        sesion.setAttribute("email", email);
                        sesion.setAttribute("nivel", "1");
                        response.sendRedirect("administrador.jsp");
                    break;
                      case 2:
                        sesion.setAttribute("email", email);
                        sesion.setAttribute("nivel", "2");
                        response.sendRedirect("Empleado/EmpleadoInicio.jsp");
                    break;
                    default:
                        %>
                        <script>
                            alert("Usuario no existe, o clave incorrecta");
                        </script>
                        <%
                    break;
                }
            }
if (request.getParameter("cerrar")!=null) {
        session.invalidate();
    }
    %>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
      <script src="js/Validar.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
</html>