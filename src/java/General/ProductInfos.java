/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author DELL-10
 */
public class ProductInfos {
    
    static public String getPName(int id) throws ClassNotFoundException, SQLException{
                String req ="select libelle from produits where id="+id+";";
                String x="N";
                Class.forName("com.mysql.jdbc.Driver");
                Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestventes", "root", "root");
                PreparedStatement pst= c.prepareStatement(req);
                ResultSet res = pst.executeQuery();
                while(res.next()){
                    x=res.getString("libelle");
                }
             return x;   
    }
    
    
    static public String getPprice(int id) throws ClassNotFoundException, SQLException{
                String req ="select prix from produits where id="+id+";";
                String x="N";
      
                Class.forName("com.mysql.jdbc.Driver");
                Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestventes", "root", "root");
                PreparedStatement pst= c.prepareStatement(req);
                ResultSet res = pst.executeQuery();
                while(res.next()){
                    x=res.getString("prix");          
                }
                return x;
    }
    
        
    static public String getPImage(int id) throws ClassNotFoundException, SQLException{
                String req ="select photo from produits where id="+id+";";
                String x="N";
                Class.forName("com.mysql.jdbc.Driver");
                Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestventes", "root", "root");
                PreparedStatement pst= c.prepareStatement(req);
                ResultSet res = pst.executeQuery();
                while(res.next()){
                    x=res.getString("photo");
                }
        return x;
    }
            
            
    static public int getPQts(int id) throws ClassNotFoundException, SQLException{
                String req ="select qts from produits where id="+id+";";
                int x=0;
                Class.forName("com.mysql.jdbc.Driver");
                Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestventes", "root", "root");
                PreparedStatement pst= c.prepareStatement(req);
                ResultSet res = pst.executeQuery();
                while(res.next()){
                    x=res.getInt("qts");
                }
                return x;
    }



 public void setPQts(int id) throws ClassNotFoundException, SQLException{
                String req ="update produits set qts="+(getPQts(id)-1)+"where id="+id+";";
                int x=0;
                Class.forName("com.mysql.jdbc.Driver");
                Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestventes", "root", "root");
                PreparedStatement pst= c.prepareStatement(req);
                pst.executeUpdate(req);
  
 }
}