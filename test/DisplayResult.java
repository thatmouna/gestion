/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import General.Dbmanager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
        
/**
 *
 * @author DELL-10
 */
public class DisplayResult extends HttpServlet {

    String query;
    Connection conn;
    Statement stmt;
    ResultSet res;
    Dbmanager dbconn;
    ArrayList<String> lst= new ArrayList<>();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int i=1;
        try{
          dbconn= new Dbmanager();
          conn = Dbmanager.logIn();
          stmt= conn.createStatement();
          query="select * from db_cawa.livre;";
          res=dbconn.getResult(query, conn);
          
          while(res.next()){
              lst.add(res.getString("issn") );
              lst.add(res.getString("titre") );
              lst.add(res.getString("domaine") );
              lst.add(res.getString("resume") );
              lst.add(res.getInt("nb_pages")+"");
                        }

          res.close();
        } catch(Exception e){
           i=0;
        }
        if(i==0){
             System.out.print("ERREUR");
        }else{
            request.setAttribute("livrelist", lst);
            //lst.clear();
            
            RequestDispatcher rd= request.getRequestDispatcher("/Books.jsp");
            rd.forward(request, response);
            
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
