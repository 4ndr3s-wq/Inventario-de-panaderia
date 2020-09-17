
package interfaces;

import java.util.List;
import modelo.empleados;


public interface CRUD6 {
    public List listar();
    public empleados list(int id);
    public boolean add(empleados emp);
    public boolean edit(empleados emp);
    public boolean eliminar(int id); 
}
