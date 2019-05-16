import java.lang.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
public class DBConnection {
    static Connection con;
    static{
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
             if(con==null)
                System.out.println("Connection not found");
             else
                 System.out.println("Connection found");
             } catch (Exception ex) {
                System.out.println(ex);
               }
         }
           public static Connection getConnection()
           {
             return con;   
           }
           
    
}
