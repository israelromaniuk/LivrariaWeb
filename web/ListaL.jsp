<%-- 
    Document   : ListaL
    Created on : 22/09/2016, 09:05:08
    Author     : Administrador
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.alldirect.model.ModelLivro"%>
<%@page import="br.com.alldirect.dao.ControllerLivro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- CSS do Bootstrap -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Biblioteca jQuery-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- JavaScript do Bootstrap -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Livros</title>
    </head>
    <body>
        <div class="contrainer">
            <table class="table table-bordered">
                <tr>
                    <td>Código</td>
                    <td>Isbn</td>
                    <td>Titulo</td>
                    <td>Ano</td>
                    <td>Editora</td>
                    <td>Autor</td>
                </tr>
                <%
                    ControllerLivro controllerLivro = new ControllerLivro();
                    List<ModelLivro> livros = controllerLivro.listaLivro();

                    for (ModelLivro p : livros) {
                %>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getIsbn()%></td>
                    <td><%=p.getTitulo()%></td>
                    <td><%=p.getAno()%></td>
                    <td><%=p.getEditora()%></td>
                    <td><%=p.getAutor()%></td>
                </tr>
                <%}%>
            </table>
        </div>
        <div class="contrainer">
                <a class="btn btn-default" href="http://localhost:49492/Livraria/" role="button">Back</a>
        </div>
    </body>
</html>
