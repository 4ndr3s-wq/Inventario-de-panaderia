package ModeloDAO;

import controlador.conexion;
import interfaces.CRUD4;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.ventas;

public class ventasDAO implements CRUD4 {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ventas v = new ventas();

    @Override
    public List listar() {
        ArrayList<ventas> list = new ArrayList<>();
        String sql = "select *from venta";
        try {
            con = cn.getconexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ventas ven = new ventas();
                ven.setId(rs.getInt("id_venta"));
                ven.setFactura(rs.getInt("id_factura"));
                ven.setProducto(rs.getInt("id_producto"));
                ven.setFecha(rs.getString("fecha_venta"));
                list.add(ven);
            }
        } catch (Exception e) {
        }

        return list;
    }

    @Override
    public ventas list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(ventas vent) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean edit(ventas vent) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
