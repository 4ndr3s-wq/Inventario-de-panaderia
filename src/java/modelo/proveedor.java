
package modelo;

public class proveedor {
   int id;
   String nombre;
   String telefono;
   String direccion;
   String nom_empresa;
   String catalogo;
   int precio;

    public proveedor() {
    }

    public proveedor(int id, String nombre, String telefono, String direccion, String nom_empresa, String catalogo, int precio) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.direccion = direccion;
        this.nom_empresa = nom_empresa;
        this.catalogo = catalogo;
        this.precio = precio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNom_empresa() {
        return nom_empresa;
    }

    public void setNom_empresa(String nom_empresa) {
        this.nom_empresa = nom_empresa;
    }

    public String getCatalogo() {
        return catalogo;
    }

    public void setCatalogo(String catalogo) {
        this.catalogo = catalogo;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

   
}
