
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {
   private  String user="root";
   private  String host ="localhost";
   private  String port ="3306";
   private  String pass ="1001032661Yoiber";
   private  String classname ="com.mysql.jdbc.Driver";
   private  String database ="proyecto";
   private  String url ="jdbc:mysql://"+host+":"+port+"/"+database;
   
   private Connection con;
   
   public conexion(){
          try {
           Class.forName(classname);
           con=DriverManager.getConnection(url, user,pass);
           System.out.println("Muy bien todo normal ");
           
       } catch (ClassNotFoundException | SQLException e) {
           System.err.println("tenes un error en:" +e);
       }

}
   public  Connection getconexion(){
       return  con;
   }
}
