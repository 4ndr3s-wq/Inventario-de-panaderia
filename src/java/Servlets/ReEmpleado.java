package Servlets;
/*estos son los servlets para insertar todos estan es la carpeta "serlvelts"* ahi como ves esta el codigo comentado
solo en esta */
import controlador.Reusuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ReEmpleado extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // capturamos los datos de los input en ReEmpleado.jsp
        try (PrintWriter out = response.getWriter()) {
        String identi = String.valueOf(request.getParameter("ide"));
        String nom = request.getParameter("nom");
        String apell= request.getParameter("ape");
        String correo= request.getParameter("corr");
        String direcc = request.getParameter("dir");
        String teluno = request.getParameter("tel1");
        String teldos = request.getParameter("tel2");
        String contra = request.getParameter("cont");
        String level= request.getParameter("nive");
        // enviamos los datos a la base de datos
        Reusuario em=new Reusuario();
        if (em.registrar(identi, nom, apell, correo, direcc, teluno, teldos, contra, level)) {
          
        } else {
            }
        } catch (Exception e) {
            System.out.println("Servlets.ReEmpleado.processRequest()");
        }
           
    }

}
