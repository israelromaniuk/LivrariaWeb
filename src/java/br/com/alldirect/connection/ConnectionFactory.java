package br.com.alldirect.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    public Connection getConnection() {
        
        Connection connection;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = ("jdbc:mysql://192.68.0.200/biblioteca");
            String user = ("aluno");
            String psw = ("123456");
            connection = DriverManager.getConnection(url, user, psw);
            return connection;
        } catch (ClassNotFoundException ex) {
            System.err.println("Erro no driver\n"+ex);
            return null;
        } catch(SQLException e){
            System.err.println("Erro no Banco de dados\n"+e);
            return null;
        }
    }
}

