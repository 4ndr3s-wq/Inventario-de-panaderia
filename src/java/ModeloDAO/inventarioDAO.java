package ModeloDAO;

import controlador.conexion;
import interfaces.CRUD2;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Inventario;

public class inventarioDAO implements CRUD2 {
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Inventario inv = new Inventario();

    @Override
    public List listar() {
        ArrayList<Inventario> list = new ArrayList<>();
        String sql = "select *from inventario";
        try {
            con = cn.getconexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Inventario in = new Inventario();
                in.setProductos(rs.getInt("id_producto"));
                in.setInventario(rs.getInt("total_inventario"));
                in.setVentas(rs.getInt("ventas_realizadas"));
                in.setVendidos(rs.getNString("productos_vendidos"));
                in.setComprados(rs.getNString("productos_comprados"));
                list.add(in);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    @Override
    public Inventario list(int productos) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Inventario inv) {
        String sql = "insert into inventario(id_producto,total_inventario,ventas_realizadas,productos_vendidos,productos_comprados)values('" + inv.getProductos() + "','" + inv
                .getInventario() + "','" + inv.getVentas() + "','" + inv.getVendidos() + "','" + inv.getComprados() + "')";
        try {
            con = cn.getconexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(Inventario inv) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int productos) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    @Override
    public List buscar(String texto){
        List<Inventario> lista = new ArrayList<>();
        String sql="select *from inventario where id_producto like '&"+texto+"&' or total_inventario like '&"+texto+"&'"
                + "or ventas_realizadas like '&"+texto+"&' ";
        try {
            con = cn.getconexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Inventario in =new Inventario();
                in.setProductos(rs.getInt("id_producto"));
                in.setInventario(rs.getInt("total_inventario"));
                in.setVentas(rs.getInt("ventas_realizadas"));
                in.setVendidos(rs.getNString("productos_vendidos"));
                in.setComprados(rs.getNString("productos_comprados"));
                lista.add(in);
            }
        } catch (Exception e) {
        }
        return lista;
        
    }
}
