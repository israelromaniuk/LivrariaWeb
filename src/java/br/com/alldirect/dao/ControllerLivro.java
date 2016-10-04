package br.com.alldirect.dao;

import br.com.alldirect.connection.ConnectionFactory;
import br.com.alldirect.model.ModelLivro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ControllerLivro {

    Connection connection = null;

    public ControllerLivro() {
        this.connection = new ConnectionFactory().getConnection();
    }

    public void cadastraLivro(ModelLivro livro) throws SQLException {
        String sql = "INSERT INTO LIVROS(ISBN, TITULO, ANO, EDITORA, AUTOR) VALUES(?,?,?,?,?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, livro.getIsbn());
            stmt.setString(2, livro.getTitulo());
            stmt.setInt(3, livro.getAno());
            stmt.setString(4, livro.getEditora());
            stmt.setString(5, livro.getAutor());
            stmt.execute();
            stmt.close();
            connection.close();
        }
    }

    public List<ModelLivro> listaLivro() {
        String sql = "SELECT * FROM LIVROS";
        List<ModelLivro> livros = new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()) {
                ModelLivro livro = new ModelLivro();
                livro.setId(resultSet.getInt("ID"));
                livro.setIsbn(resultSet.getString("ISBN"));
                livro.setTitulo(resultSet.getString("TITULO"));
                livro.setAno(resultSet.getInt("ANO"));
                livro.setEditora(resultSet.getString("EDITORA"));
                livro.setAutor(resultSet.getString("AUTOR"));
                livro.setData(resultSet.getDate("DATA_CAD"));
                livros.add(livro);
            }
            return livros;
        } catch (SQLException e) {
            System.out.println("Erro ao listar: " + e);
        }
        return livros;
    }
}
