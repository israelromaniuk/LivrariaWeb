<%-- 
    Document   : ListaL
    Created on : 22/09/2016, 09:05:08
    Author     : Administrador
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="br.com.alldirect.model.ModelLivro"%>
<%@page import="br.com.alldirect.dao.ControllerLivro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="index.css">
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
    <c:import url="Cabecalho.jsp"/>
        <jsp:useBean id="dao" class="br.com.alldirect.dao.ControllerLivro"/>
        <div class="contrainer conteudo" >
            <table class="table table-bordered">
                <tr>
                    <td>Código</td>
                    <td>Isbn</td>
                    <td>Titulo</td>
                    <td>Ano</td>
                    <td>Editora</td>
                    <td>Autor</td>
                    <td>Data</td>
                </tr>
                <c:forEach var="p" items="${dao.lista}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.isbn}</td>
                    <td>${p.titulo}></td>
                    <td>${p.ano}</td>
                    <td>${p.editora}</td>
                    <td>${p.autor}</td>
                    <td><fmt:formatDate value="${p.data}" pattern="dd/MM/yyyy"/></td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="contrainer">
                <a class="btn btn-default" href="http://localhost:8080/LivrariaWeb/" role="button">Back</a>
        </div>
        <c:import url="Rodape.jsp"/>
    </body>
</html>
