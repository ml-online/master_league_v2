
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Lucas
 */
public class linkSQL {
    
    private static Connection connection = null;
    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        connectMySQL();
        //executeDeleteMySQL();
        executeInsertMySQL();
        executeSelectMySQL();
        executeProcedureMySQL();
        connection.close();

    }
 
    public static void connectMySQL() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Properties props = new Properties();
        props.put("user", "root");
        props.put("password", "");
        props.put("useSSL", "false");
        connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/galaticos_league/bdtestecadastro", props);
    }
    private static void executeDeleteMySQL() throws SQLException {
        String delete = "DELETE FROM empregado;";
        Statement st = connection.createStatement();
        st.executeUpdate(delete);
    }
    private static void executeInsertMySQL() throws SQLException {
        String insert = "INSERT INTO EMPREGADO\n "
                + "(FNOME, MINICIAL, UNOME, SSN, DATANASC, ENDERECO, "
                + " SEXO, SALARIO, SUPERSSN, DNO)\n "
                + "  VALUES ('Luiz', 'P', 'Leme', 123, null, null, 'M', null, null, 0);";
        Statement st = connection.createStatement();
        st.executeUpdate(insert);
    }
    public static void executeSelectMySQL() throws SQLException {
        String select = "SELECT FNOME, UNOME FROM EMPREGADO;";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(select);
        while (rs.next())
            System.out.println(rs.getString("FNOME") + " " + rs.getString("UNOME"));
    }
  
    public static void executeProcedureMySQL() throws SQLException {
        CallableStatement cs = connection.prepareCall("{call select_employees(?)}");
        cs.setString(1, "DFHFGHDF");
        ResultSet rs = cs.executeQuery();

        while (rs.next()) {
            String first_name = rs.getString("first_name");
            String last_name = rs.getString("last_name");
            System.out.println(first_name + " " + last_name);
        }

    }
}
    
