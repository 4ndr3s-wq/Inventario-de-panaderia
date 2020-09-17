
package controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;


public class Reinventario extends  conexion{
    public boolean  registrar(String producto,String total,String realizadas,String vendidos,String comprados){
         PreparedStatement pst=null;
         try {
             String consulta = "insert into inventario(id_producto,total_inventario,ventas_realizadas,"
                     + "productos_vendidos,productos_comprados)values("
                    + "?,?,?,?,?)"; 
             pst = getconexion().prepareStatement(consulta);
             pst.setString(1, producto);
             pst.setString(2,total);
             pst.setString(3, realizadas);
             pst.setString(4,vendidos);
             pst.setString(5, comprados);
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
