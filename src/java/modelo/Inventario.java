
package modelo;


public class Inventario {
    int productos;
    int inventario;
    int ventas;
    String vendidos;
    String comprados;

    public Inventario() {
    }

    public Inventario(int inventario, int ventas, String vendidos, String comprados) {
        this.inventario = inventario;
        this.ventas = ventas;
        this.vendidos = vendidos;
        this.comprados = comprados;
    }

    public int getProductos() {
        return productos;
    }

    public void setProductos(int productos) {
        this.productos = productos;
    }

    public int getInventario() {
        return inventario;
    }

    public void setInventario(int inventario) {
        this.inventario = inventario;
    }

    public int getVentas() {
        return ventas;
    }

    public void setVentas(int ventas) {
        this.ventas = ventas;
    }

    public String getVendidos() {
        return vendidos;
    }

    public void setVendidos(String vendidos) {
        this.vendidos = vendidos;
    }

    public String getComprados() {
        return comprados;
    }

    public void setComprados(String comprados) {
        this.comprados = comprados;
    }

    public void setProductos(String producto) {
        
    }

    public void setInventario(String inventario) {
        
    }

    public void setVentas(String ventas) {
       
    }

  
}
