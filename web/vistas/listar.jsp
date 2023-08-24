
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Libros"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAL.LibrosDAL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1>Libros</h1>
            <a class="btn btn-success" href="Controller?accion=add">Agregar Nuevo</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">TITULO</th>
                        <th class="text-center">AUTOR</th>
                         <th class="text-center">AÑO</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    LibrosDAL dao=new LibrosDAL();
                    List<Libros>list=dao.listar();
                    Iterator<Libros>iter=list.iterator();
                    Libros Lib=null;
                    while(iter.hasNext()){
                        Lib=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= Lib.getId()%></td>
                        <td class="text-center"><%= Lib.getTitulo()%></td>
                        <td class="text-center"><%= Lib.getAutor()%></td>
                        <td class="text-center"><%= Lib.getAnio()%></td>
                        <td class="text-center">
                
                            <a class="btn btn-danger" href="Controller?accion=eliminar&id=<%= Lib.getId()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
