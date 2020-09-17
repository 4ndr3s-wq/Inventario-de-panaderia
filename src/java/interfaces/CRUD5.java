
package interfaces;

import java.util.List;
import modelo.productos;


public interface CRUD5 {
    public List listar();
    public productos list(int Id);
    public boolean add(productos pro);
    public boolean edit(productos pro);
    public boolean eliminar(int id); 
}
