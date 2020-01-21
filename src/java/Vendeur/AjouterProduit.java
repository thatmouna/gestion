package Vendeur;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
        
/**
 *
 * @author DELL-10
 */
 @MultipartConfig(fileSizeThreshold =1024*1024*2,
         maxFileSize = 1024*1024*10,
         maxRequestSize = 1024*1024*50)

public class AjouterProduit extends HttpServlet {
    ArrayList<String> lst= new ArrayList<>();
 private static final String SAVE_DIR = "FileUpload";  
private String fileName=""; 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String name = request.getParameter("name"),
               price = request.getParameter("price"),
               quantity = request.getParameter("quantity"),
               image =request.getParameter("image");
       Part part=request.getPart("image");
        fileName = extractFileName(part);
        String savePath = "C:\\Users\\DELL-10\\Documents\\NetBeansProjects\\gestion\\web\\themes\\images" +File.separator + fileName;
        part.write(savePath);
        
        int qts;
        double prix;
        qts  = Integer.parseInt(quantity);
        prix  =Double.parseDouble(price);
        int i=1;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestventes", "root", "root");
                Statement stmt= conn.createStatement();
                Statement st=conn.createStatement();
                String query="insert into produits (libelle,photo,prix,qts) values('" +name+ "','" +fileName+"',"+prix+",'"+qts+ "');";
                stmt.executeUpdate(query);
            } catch(Exception e){
               i=0;
            }
            if(i==0){
                out.print("<html><body>\"ERREUR\"</body></html>");
            }else{
                RequestDispatcher rd= request.getRequestDispatcher("/AjouterProduit.jsp");
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

       private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }

}
