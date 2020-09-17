/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import ModeloDAO.inventarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Inventario;

/**
 *
 * @author win 8.1
 */
public class inventario extends HttpServlet {
    String listar="inventario/listar.jsp";
    String add="inventario/inventario.jsp";
    String edit="inventario/edit.jsp";
    Inventario inv = new Inventario();
    inventarioDAO dao=new inventarioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
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
        String acceso="";
        String action=request.getParameter("accion");
        if (action.equalsIgnoreCase("listar")) {
            acceso=listar;
        }else if (action.equalsIgnoreCase("add")) {
            acceso=add;
        }
        else if (action.equalsIgnoreCase("agregar")) {
            String producto=request.getParameter("producto");
            String inventario=request.getParameter("inventario");
            String ventas=request.getParameter("ventas");
            String vendidos=request.getParameter("vendidos");
            String comprados=request.getParameter("comprados");
            inv.setProductos(producto);
            inv.setInventario(inventario);
            inv.setVentas(ventas);
            inv.setVendidos(vendidos);
            inv.setComprados(comprados);
            dao.add(inv);
            acceso=listar;
            
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
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
