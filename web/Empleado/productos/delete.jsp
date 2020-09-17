<%-- 
    Document   : Eliminar-proveedor
    Created on : 17/05/2020, 01:30:54 PM
    Author     : Andres Aguilar
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="controlador.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="Eliminar-proveedor.css">
        <title>Eliminar producto</title>
    </head>
    <body>
        <header><h1>Eliminar producto</h1>
            <!--LOS COMENTARIOS HACEN REFERENCIA AL CODIGO QUE ESTA DEBAJO DE CADA UNO DE ELLOS--> 

        </header>

        <nav>
        </nav>
        <section>
            <article>
                <!--en este codigo se hace la conexion a la base de datos ademas de ejecutar el codigo para buscar los datos en mysql--> 
                <%
                    //conexion a la base de datos 
                    conexion con = new conexion();
                    //variables para hacer la consulta
                    Statement smt;
                    ResultSet rs;
                    PreparedStatement ps;
                    //se crea el statement para luego poner y ejecutar el codigo
                    smt = con.getconexion().createStatement();
                    rs = smt.executeQuery("select * from Proveedor");

                    int id = Integer.parseInt(request.getParameter("id"));
                %>




            </article>
        </section>

    </body>
</html>
<!--en este fragmento de codigo se hace el delete del proveedor segun su id-->
<%
    try {
        //se escribe el codigo que borrara los datos segun el id ingresado
        ps = con.getconexion().prepareStatement("delete from Producto where id_producto= ?");

        //se asigna al id_proveedor el valor que se ingreso en el espacio correspondiente del id
        ps.setInt(1, id);
        //se ejecuta el script para realizar el borrado del proveedor
        ps.executeUpdate();
        response.sendRedirect("producto.jsp");
    } catch (Exception e) {
    }


%>

