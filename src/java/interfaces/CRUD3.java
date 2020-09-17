
package interfaces;
import java.util.List;
import  modelo.factura;

public interface CRUD3 {
    public List listar();
    public  factura list(int id);
    public  boolean add(factura fact);
    public  boolean edit(factura  fact);
    public  boolean eliminar(int id); 
}
