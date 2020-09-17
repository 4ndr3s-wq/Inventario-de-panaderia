package ModeloDAO;

import controlador.conexion;
import interfaces.CRUD6;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.empleados;

public class empleadosDAO implements CRUD6 {
conexion cn=new conexion();
Connection con;
PreparedStatement ps;
ResultSet rs;
empleados e=new empleados();

    @Override
    public List listar() {
        /* esta es la funcion para listar por si quiere cambiar algo asi estan iguales en todos los demas
        modulos*/
        ArrayList<empleados>list=new ArrayList<>();
        String sql="select *from usuario";
        try {
            con=cn.getconexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);
            while (rs.next()) {
                empleados emp = new empleados();
                emp.setId(rs.getInt("id_usuario"));
                emp.setNombre(rs.getNString("nom_usuario"));
                emp.setApellidos(rs.getNString("apellido_usuario"));
                emp.setEmail(rs.getNString("email"));
                emp.setDireccion(rs.getNString("direccion"));
                emp.setTel1(rs.getNString("telefono_1"));
                emp.setTel2(rs.getNString("telefono_2"));
                emp.setContraseña(rs.getNString("contraseña"));
                emp.setLevel(rs.getInt("nivel"));
                list.add(emp);
                
            }
            
        } catch (SQLException e) {
        }
    return list;
    }

    @Override
    public empleados list(int id) {
        String sql="select *from usuario where id_usuario=?";
        try {
            con=cn.getconexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);
            while (rs.next()) {
                e.setId(rs.getInt("id_usuario"));
                e.setNombre(rs.getNString("nom_usuario"));
                e.setApellidos(rs.getNString("apellido_usuario"));
                e.setEmail(rs.getNString("email"));
                e.setDireccion(rs.getNString("direccion"));
                e.setTel1(rs.getNString("telefono_1"));
                e.setTel2(rs.getNString("telefono_2"));
                e.setContraseña(rs.getNString("contraseña"));
                e.setLevel(rs.getInt("nivel"));
                
            }
            
        } catch (SQLException ex) {
        }
    return e;
    }

    @Override
    // aqui estaba tratando de hacer ese actualizar pero no me dio la verdad y admeas como he estado estos dias asi no me ha dado la cabeza para hacer eso
    public boolean add(empleados emp) {
       String sql="insert into usuario(id_usuario,nom_usuario,apellido_usuario,email,"
               + "direccion,telefono_1,telefono_2,contraseña,nivel)values('"+emp.getId()+"','"+emp.getNombre()+"',"
               + "'"+emp.getApellidos()+"','"+emp.getEmail()+"','"+emp.getDireccion()+"','"+emp.getTel1()+"',"
               + "'"+emp.getTel2()+"','"+emp.getContraseña()+"','"+emp.getLevel()+"')";
        try {
            con=cn.getconexion();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException ex) {
        }
       
    return false;
    }

    @Override
    public boolean edit(empleados emp) {
        String sql="update usuario set nom_usuario=?,apellido_usuario=?,"
                + "email=?,direccion=?,telefono_1=?,"
                + "telefono_2=?,contraseña=?,nivel=? where id_usuario=?";
        try {
            con=cn.getconexion();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    return false;
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   

}
