package General;

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
import java.util.ArrayList;
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
public class DisplayProducts extends HttpServlet {


    ArrayList<String> lst= new ArrayList<>();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String req ="select id,libelle,photo,prix from produits;";
        int i=1;
        HttpSession session=request.getSession(false);
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestventes", "root", "root");
                PreparedStatement pst= c.prepareStatement(req);
                ResultSet res = pst.executeQuery();
                while(res.next()){
                    lst.add(res.getInt("id")+"" );
                    //lst.add(res.getString("libelle"));
                   lst.add(res.getString("photo"));
                    //lst.add(res.getDouble("prix")+"" );
          
                }
            
        } catch( Exception e){
           i=0;
        }
        if(i==0){
            PrintWriter out= response.getWriter();
             out.print("<html><body>\"ERREUR\"</body></html>");
        }else{
            request.setAttribute("ProductsList", lst);
            RequestDispatcher rd= request.getRequestDispatcher("/products.jsp");
            rd.include(request, response);
            
        }
 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
