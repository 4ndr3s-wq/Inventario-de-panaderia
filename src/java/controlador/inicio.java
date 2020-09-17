/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author win 8.1
 */
public class inicio {
    String driver;
    String uss;
    String contra;
    String url;

    public inicio() {
        driver ="com.mysql.jdbc.Driver";
        url="jdbc:mysql://localhost:3306/proyecto";
        contra="1001032661Yoiber";
        uss="root";
    }
    public int loguear(String email,String password){
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        int cont=0;
        int nivel=0;
        String consult="select nivel from usuario where email='"+email+"' and contraseña='"+password+"'";
        try {
            Class.forName(this.driver);
            con=DriverManager.getConnection(url,uss,contra);
            pst=con.prepareStatement(consult);
            rs=pst.executeQuery();
            while (rs.next()) {                
                nivel=rs.getInt(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error" +e);
        }
        return nivel;
    }
}
