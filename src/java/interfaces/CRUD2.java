
package interfaces;

import java.util.List;
import modelo.Inventario;


public interface CRUD2 {
    public List listar();
    public Inventario list(int productos);
    public boolean add(Inventario inv);
    public boolean edit(Inventario inv);
    public boolean eliminar(int productos);
    public  List buscar(String texto);
}
