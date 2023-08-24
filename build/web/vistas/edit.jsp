
<%@page import="Modelo.Libros"%>
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
            <div class="col-lg-6">
              <%
              LibrosDAL dal=new LibrosDAL();
              int id  =Integer.parseInt((String)request.getAttribute("idlib"));
              Libros L=(Libros)dal.list(id);
          %>
            <h1>Modificar Libro</h1> 
            <form action="Controller">
                TUTULO: <br>
                <input class="form-control" type="text" name="txtTitulo" value="<%= L.getTitulo()%>"><br>
                AUTOR: <br>
                <input class="form-control" type="text" name="txtAutor" value="<%= L.getAutor()%>"><br>
                  AÑO: <br>
                <input class="form-control" type="text" name="txtAnio" value="<%= L.getAnio()%>"><br>
                
                <input type="hidden" name="txtid" value="<%= id%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a class="btn btn-warning"  href="Controller?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
