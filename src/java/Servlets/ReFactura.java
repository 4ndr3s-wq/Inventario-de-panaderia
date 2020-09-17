
package Servlets;
import controlador.Refactura;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReFactura extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String identificacion = String.valueOf(request.getParameter("fact"));
            String nit=String.valueOf(request.getParameter("Nit"));
            String precio =String.valueOf(request.getParameter("to"));
            String producto=String.valueOf(request.getParameter("product"));
            String fecha =request.getParameter("fech"); 
            String numero=String.valueOf(request.getParameter("numer"));
            String iva =String.valueOf(request.getParameter("Iva"));
                 
                    
            Refactura fact=new Refactura();
            if (fact.registrar(identificacion, nit, precio,producto,fecha, numero, iva)) {
                response.sendRedirect("/js/Validacion.js");
        }else{   
        }
        } catch (Exception e) {
            System.out.println("Servlets.ReFactura.processRequest()");
        }
        
        
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
