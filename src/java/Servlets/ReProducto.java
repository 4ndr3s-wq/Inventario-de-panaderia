
package Servlets;

import controlador.Reproducto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ReProducto extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String producto=String.valueOf(request.getParameter("producto"));
            String nombre=request.getParameter("Nombre");
            String clasificacion=String.valueOf(request.getParameter("clasificacion"));
            String marca = request.getParameter("marca");
            String peso=request.getParameter("peso");
            String precio=String.valueOf(request.getParameter("precio"));
            String caducacion=request.getParameter("fecha");
            
            Reproducto pro=new Reproducto();
            
            if (pro.registrar(producto, nombre, clasificacion, marca,peso, precio, caducacion)) {
                
            response.sendRedirect("productos/producto.jsp");
        }else{
           response.sendRedirect("index.jsp");          
        }
        } catch (Exception e) {
            System.out.println("Servlets.ReFactura.processRequest()");
        }
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
