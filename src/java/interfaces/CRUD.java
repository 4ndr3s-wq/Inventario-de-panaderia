
package interfaces;

import  java.util.List;
import modelo.proveedor;


public interface CRUD {
    public List listar();
    public proveedor list(int id);
    public boolean add(proveedor pro);
    public boolean edit(proveedor pro);
    public boolean eliminar(int id); 
}
