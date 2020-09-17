package ModeloDAO;

import interfaces.CRUD;
import java.util.List;
import modelo.proveedor;
import controlador.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class proveedorDAO implements  CRUD{
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    proveedor p=new proveedor();

    @Override
    public List listar() {
        ArrayList<proveedor>list=new ArrayList<>();
        String sql="select * from Proveedor";
        try {
            con=cn.getconexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                proveedor pro=new proveedor();
                pro.setId(rs.getInt("id_proveedor"));
                pro.setNombre(rs.getNString("nombre"));
                pro.setTelefono(rs.getNString("telefono"));
                pro.setDireccion(rs.getNString("direccion"));
                pro.setNom_empresa(rs.getNString("nom_empresa"));
                pro.setCatalogo(rs.getNString("catalogo"));
                pro.setPrecio(rs.getInt("precio"));
                list.add(pro);    
                
            }
            
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public proveedor list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(proveedor pro) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean edit(proveedor pro) {
        
        String sql = "update Proveedor set nombre='"+p.getNombre()+"',"
            + " telefono='"+p.getTelefono()+"', direccion='"+p.getDireccion()+"', nom_empresa='"+p.getNom_empresa()+"',"
            + "catalogo='"+p.getCatalogo()+"', precio='"+p.getPrecio()+"' where id_proveedor='"+p.getId()+"'";
        
        try {
            con=cn.getconexion();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
