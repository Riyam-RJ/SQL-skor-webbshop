import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private String connectionUrl = "jdbc:mysql://localhost:3306/registration";
    private String username = "root";
    private String password = "password";

    public Connection createConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(connectionUrl,username,password);
        } catch (Exception e) {
            System.out.println("Failed to connect to the database");
            System.out.println(e);
        }
        return conn;
    }

    public void closeConnection(Connection conn) throws SQLException {
        conn.close();
    }

}
