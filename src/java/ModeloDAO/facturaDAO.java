package ModeloDAO;

import controlador.conexion;
import interfaces.CRUD3;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.factura;

public class facturaDAO implements CRUD3{

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    factura f = new factura();

    @Override
    public List listar() {
       ArrayList<factura> list = new ArrayList<>();
       String sql = "select *from factura";
               try {
            con = cn.getconexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                factura fa = new factura();
                fa.setId(rs.getInt("id_factura"));
                fa.setNit(rs.getInt("nit"));
                fa.setPrecio(rs.getInt("precio_total"));
                fa.setProducto(rs.getInt("cant_producto"));
                fa.setFecha(rs.getInt("fecha_venta"));
                fa.setNumero(rs.getInt("numero_factura"));
                fa.setIva(rs.getInt("iva"));
                list.add(fa);
            }
        } catch (SQLException e) {
        }
       
        return list;
    }

    @Override
    public factura list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(factura fact) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean edit(factura fact) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
