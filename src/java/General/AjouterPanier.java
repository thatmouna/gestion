package General;



import static General.ProductInfos.getPImage;
import static General.ProductInfos.getPName;
import static General.ProductInfos.getPprice;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Part;

/**
 *
 * @author Lachagr
 */
@WebServlet(name = "AjouterPanier", urlPatterns = {"/AjouterPanier"})
public class AjouterPanier extends HttpServlet {

    List<Panier> paniers = new ArrayList<>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int i=1;
        int qtsStock;
        boolean OutOfStock=false;
        boolean IsInCart=false;
        String remove  = request.getParameter("delete");
        
        
        if(remove==null){
        int id = Integer.parseInt(request.getParameter("id"));
            Produit p = new Produit();
            p.setId(id);
            try {  
                p.setLibelle(getPName(id));
                p.setPrix(Double.parseDouble(getPprice (id)));
                p.setPhoto(getPImage(id));
              
                HttpSession session = request.getSession();
                if (OutOfStock==false) {
                    if (session.getAttribute("listpr") != null) {
                        paniers = (List<Panier>) session.getAttribute("listpr");
                        for (Panier p1 : paniers) {
                            if ((p1.getProduit().getId()) == id) {
                                p1.setQte(p1.getQte() + 1);
                                p.setQts(p.getQts()+1);
                                IsInCart=true;
                            }
                        }
                    }
                    if (IsInCart==false) {
                        paniers.add(new Panier(p, 1));
                         p.setQts(p.getQts()+1);
                        session.setAttribute("listpr", paniers);
                    }
                }
                 RequestDispatcher rd= request.getRequestDispatcher("/cart.jsp");
                 rd.forward(request, response);
                } catch(IOException | ClassNotFoundException | SQLException e){
                        e.printStackTrace();
                }
        }
        
        else {
             int id = Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession();
            paniers = (List<Panier>) session.getAttribute("listpr");
             if (session.getAttribute("listpr") != null) {
                        paniers = (List<Panier>) session.getAttribute("listpr");
                        for (Panier p1 : paniers) {
                            if ((p1.getProduit().getId()) == id) {
                                if(p1.getQte()>0){
                                    p1.setQte(p1.getQte() - 1);
                                }
                            }
                        }
                    }
            RequestDispatcher rd= request.getRequestDispatcher("/cart.jsp");
                        rd.forward(request, response);
        }

    }


}