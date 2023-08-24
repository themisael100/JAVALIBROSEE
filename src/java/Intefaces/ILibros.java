
package Intefaces;

import Modelo.Libros;
import java.util.List;


public interface ILibros {
    public List listar();
    public Libros list(int id);
    public boolean add(Libros lib);
    public boolean eliminar(int id);
}
