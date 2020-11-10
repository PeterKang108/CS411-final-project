package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBChelp {
    //Peter session info:
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/ComputerParts?serverTimezone=UTC";
    private static final String username = "root";
    private static final String password = "123456";

//    //Youcheng session info:
//    private static final String driver = "com.mysql.jdbc.Driver";
//    private static final String url = "jdbc:mysql://localhost:3306/Youcheng'dbname?serverTimezone=UTC";
//    private static final String username = "root";
//    private static final String password = "Youcheng's db password";
//
//    //Pang session info:
//    private static final String driver = "com.mysql.jdbc.Driver";
//    private static final String url = "jdbc:mysql://localhost:3306/ComputerParts?serverTimezone=UTC";
//    private static final String username = "root";
//    private static final String password = "123456";

    private static Connection conn = null;

    static
    {
        try
        {
            Class.forName(driver);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

    public static Connection getConnection() throws Exception
    {
        if(conn == null)
        {
            conn = DriverManager.getConnection(url, username, password);
            return conn;

        }
        return conn;
    }

}
