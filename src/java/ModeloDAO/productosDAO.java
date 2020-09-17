package ModeloDAO;

import controlador.conexion;
import interfaces.CRUD5;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.productos;

public class productosDAO implements CRUD5 {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    productos f = new productos();

    @Override
    public List listar() {
        ArrayList<productos>list=new ArrayList<>();
        String sql="select *from producto";
        try {
            con=cn.getconexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);
            while (rs.next()) {
                productos pr = new productos();
                pr.setId(rs.getInt("id_producto"));
                pr.setNombre(rs.getString("nom_producto"));
                pr.setClasificacion(rs.getInt("id_clasificacion"));
                pr.setMarca(rs.getString("marca"));
                pr.setPeso(rs.getString("peso"));
                pr.setPrecio(rs.getInt("precio"));
                pr.setFecha(rs.getString("fecha_caducacion"));
                list.add(pr);
            }

        } catch (SQLException e) {
        }
        return list;
    }

    @Override
    public productos list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(productos prod) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean edit(productos prod) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
