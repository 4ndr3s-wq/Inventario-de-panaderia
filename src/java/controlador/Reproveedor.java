
package controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Reproveedor extends  conexion{
    public  boolean  registrar(String ide, String nombre, String telefono,String direccion,String empresa, String catalogo, String precio){
        PreparedStatement pst=null;
        try {
            String consulta="insert into proveedor(id_proveedor,nombre, telefono, direccion, nom_empresa,catalogo"
                    + ",precio)values(?,?,?,?,?,?,?)";
            pst = getconexion().prepareStatement(consulta);
            pst.setString(1, ide);
            pst.setString(2, nombre);
            pst.setString(3, telefono);
            pst.setString(4, direccion);
            pst.setString(5, empresa);
            pst.setString(6, catalogo);
            pst.setString(7, precio);
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

      