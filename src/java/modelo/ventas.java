
package modelo;


public class ventas {
    int id;
    int factura;
    int producto;
    String fecha;

    public ventas() {
    }

    public ventas(int factura, int producto, String fecha) {
        this.factura = factura;
        this.producto = producto;
        this.fecha = fecha;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFactura() {
        return factura;
    }

    public void setFactura(int factura) {
        this.factura = factura;
    }

    public int getProducto() {
        return producto;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

   
}
