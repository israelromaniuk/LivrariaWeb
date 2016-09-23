package br.com.alldirect.servlet;

import br.com.alldirect.dao.ControllerLivro;
import br.com.alldirect.model.ModelLivro;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Servlet", urlPatterns = {"/Servlet"})
public class Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        int ano = Integer.parseInt(request.getParameter("ano"));
        String editora = request.getParameter("editora");
        String autor = request.getParameter("autor");

        try {
            ModelLivro livro = new ModelLivro();
            livro.setIsbn(isbn);
            livro.setTitulo(titulo);
            livro.setAno(ano);
            livro.setEditora(editora);
            livro.setAutor(autor);
            ControllerLivro contrlLivro = new ControllerLivro();

            contrlLivro.cadastraLivro(livro);
        } catch (SQLException ex) {
            System.out.println("Erro no Servlet: "+ex);
        }

        String pagina = "http://localhost:49492/Livraria/";
        response.sendRedirect(pagina);

    }
}
