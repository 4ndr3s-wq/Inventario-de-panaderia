
package interfaces;

import java.util.List;
import modelo.ventas;


public interface CRUD4 {
    public List listar();
    public ventas list(int id);
    public boolean add(ventas vent);
    public boolean edit(ventas vent);
    public boolean eliminar(int id); 
}
