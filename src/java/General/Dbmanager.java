package General;




import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Dbmanager {
   Statement stmt;
    ResultSet res;
    Dbmanager dbconn;    
    Connection conn;
    static Connection cnx;

    public  static Connection logIn(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
             Connection conx= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_cawa", "root", "root");
            return conx;
        }
        catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Dbmanager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    
    }
    public ResultSet getResult (String sql, Connection conn){
        this.conn =conn;
       try {
           stmt=conn.createStatement();
           res=stmt.executeQuery(sql) ;
       } catch (SQLException ex) {
           Logger.getLogger(Dbmanager.class.getName()).log(Level.SEVERE, null, ex);
       }
       return res;
    }
}