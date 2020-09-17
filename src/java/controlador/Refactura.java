
package controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;


public class Refactura extends  conexion{
    public boolean registrar(String ide,String nit ,String precio, String cantidad, String fecha,String fact_num,String iva){
        PreparedStatement pst=null;
        try {
            String consulta = "insert into factura(id_factura,nit,precio_total,cant_producto,fecha_venta,"
                    + "numero_factura,iva)values("
                    + "?,?,?,?,?,?,?)";          
             pst = getconexion().prepareStatement(consulta);            
             pst.setString(1, ide);
             pst.setString(2, nit);
             pst.setString(3, precio);
             pst.setNString(4, cantidad);
             pst.setNString(5,fecha);
             pst.setString(6, fact_num);
             pst.setString(7, iva);
             
             if (pst.executeUpdate()==1) {
                return  true;
            }
        }catch (SQLException e) {
            System.err.println("tenes un eror en :" + e);
        } finally {
            try {
                if (getconexion() != null) {
                    getconexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                System.err.println("tenes un eror en :" + e);
            }
        }

        return false;
    }
}
