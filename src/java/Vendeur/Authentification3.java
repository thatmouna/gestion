package Vendeur;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL-10
 */
public class Authentification3 extends HttpServlet {


    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        PrintWriter out= response.getWriter();   
        String login = request.getParameter("username"),
            password = request.getParameter("password"),
            msg= "";
            String req ="select * from db_cawa.admin where login=? and password=?";
            HttpSession session=request.getSession(false);
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_cawa", "root", "root");
                PreparedStatement pst= c.prepareStatement(req);
                pst.setString(1, login);
                pst.setString(2, password);
                ResultSet cur = pst.executeQuery();

             if (cur.next()) {
                 msg= "valide";
                  request.setAttribute("msg",msg);
                  session.setAttribute("msg",msg);
                 this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
             }  
             else{
                 msg= "incorrect";
                 PrintWriter p= response.getWriter();
                 p.print("<html><body>username/Password incorrect</body></html>");
                 
                 session.setAttribute("msg",msg);
                 RequestDispatcher rd=request.getRequestDispatcher("/register.html");
                 rd.include(request,response);
             }
            } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Authentification3.class.getName()).log(Level.SEVERE, null, ex);
        }

}}
