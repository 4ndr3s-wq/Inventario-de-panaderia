package controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;
// clase´para registrar empleados heredada de conexion

public class Reusuario extends conexion {

    public boolean registrar(String identificacion, String nombre, String apellido, String email, String direccion, String tel1, String tel2, String contraseña,String nivel) {
        PreparedStatement pst = null;
        try {
            // creamos la conuslta para insertar a la base de datos
            String consulta = "insert into usuario(id_usuario,nom_usuario,apellido_usuario,email,"
                    + "direccion,telefono_1,telefono_2,contraseña,nivel)values("
                    + "?,?,?,?,?,?,?,?,?)";
            // preparamos la consulta con la conexion
            pst = getconexion().prepareStatement(consulta);
            // pasamos cada uno de los parametros
            // en la primera pasad de datos convertimos la variable ide de string a int 
            pst.setString(1, identificacion);
            pst.setString(2, nombre);
            pst.setString(3, apellido);
            pst.setString(4, email);
            pst.setString(5, direccion);
            pst.setString(6, tel1);
            pst.setString(7, tel2);
            pst.setString(8, contraseña);
            pst.setString(9, nivel);
            // creamos una condicion que si la variable pst recibio un dato nos retorne true que es verdadero
            if (pst.executeUpdate() == 1) {
                return true;
            }
            // si ocurre algun error nos imprima ese error en estas lineas
        } catch (SQLException e) {
            System.err.println("tenes un eror en :" + e);
            // con el finally cerramos las dos conexiones getconexion y pst para evitar ataques
        } finally {
            try {
                // si el metodo conexion es diferente de null cerramos la conexion
                if (getconexion() != null) {
                    getconexion().close();
                }
                // si la variable preparestatement es diferente de null tambien cerramos la conexion
                if (pst != null) {
                    pst.close();
                }
                // si hay algun error nos imprima ese error
            } catch (SQLException e) {
                System.err.println("tenes un eror en :" + e);
            }
        }

        return false;
    }
}
