
package controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Reproducto extends  conexion{
    public boolean registrar(String ide, String nombre, String clasificacion, String marca, String precio,String peso, String caducacion){
        PreparedStatement pst=null;
        try {
            String consulta="insert into producto(id_producto ,nom_producto, id_clasificacion ,"
                    + "marca,peso,precio,fecha_caducacion)values(?,?,?,?,?,?,?)";
            pst = getconexion().prepareStatement(consulta);
            pst.setString(1, ide);
            pst.setString(2, nombre);
            pst.setString(3, clasificacion);
            pst.setString(4, marca);
            pst.setString(5, precio);
            pst.setString(6,peso);
            pst.setString(7, caducacion);
            
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
