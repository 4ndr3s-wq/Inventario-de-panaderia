
package controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Reventas extends conexion{
    public  boolean  registrar(String venta, String factura, String producto,String fecha){
        PreparedStatement pst=null;
        try {
            String consulta="insert into venta(id_venta,id_factura,id_producto,fecha_venta)values(?,?,?,?)";
            pst=getconexion().prepareStatement(consulta);
            pst.setString(1, venta);
            pst.setString(2, factura);
            pst.setString(3, producto);
            pst.setString(4, fecha);
            
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