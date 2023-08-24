
package ModeloDAL;

import Config.Conexion;
import Modelo.Libros;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Intefaces.ILibros;

public class LibrosDAL implements ILibros{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Libros L=new Libros();
    
    @Override
    public List listar() {
        ArrayList<Libros>list=new ArrayList<>();
        String sql="select * from libros";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Libros Lib=new Libros();
                Lib.setId(rs.getInt("Id"));
                Lib.setTitulo(rs.getString("Titulo"));
                Lib.setAutor(rs.getString("Autor"));
                Lib.setAnio(rs.getInt("Anio"));
                list.add(Lib);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Libros list(int id) {
        String sql="select * from libros where Id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                L.setId(rs.getInt("Id"));
                L.setTitulo(rs.getString("Titulo"));
                L.setAutor(rs.getString("Autor"));
                L.setAnio(rs.getInt("Anio"));
                
            }
        } catch (Exception e) {
        }
        return L;
    }

    @Override
    public boolean add(Libros Lib) {
       String sql="insert into libros(Titulo, Autor, Anio)values('"+Lib.getTitulo()+"','"+Lib.getAutor()+"','"+Lib.getAnio()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }


    @Override
    public boolean eliminar(int id) {
        String sql="delete from libros where Id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
