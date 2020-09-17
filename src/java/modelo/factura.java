package modelo;


public class factura {
    int id;
    int nit;
    int precio;
    int producto;
    int fecha;
    int numero;
    int iva;

    public factura() {
    }

    public factura(int nit, int precio, int producto, int fecha, int numero, int iva) {
        this.nit = nit;
        this.precio = precio;
        this.producto = producto;
        this.fecha = fecha;
        this.numero = numero;
        this.iva = iva;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNit() {
        return nit;
    }

    public void setNit(int nit) {
        this.nit = nit;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getProducto() {
        return producto;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }

    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getIva() {
        return iva;
    }

    public void setIva(int iva) {
        this.iva = iva;
    }
    
    
    
}
