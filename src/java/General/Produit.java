package General;

import static General.ProductInfos.getPImage;
import static General.ProductInfos.getPName;
import static General.ProductInfos.getPprice;
import java.sql.SQLException;




/**
 *
 * @author lachgar
 */
public class Produit {

    public int id;
    public String libelle;
    public double prix;
    public String photo;
    public int qts=0;

    public Produit() {
    }
   public Produit(int id) throws ClassNotFoundException, SQLException {
         this.id = id;
        this.libelle = getPName(id);
        this.prix=Double.parseDouble(getPprice (id));
        this.photo = getPImage(id);
    }
    public Produit(int id, String libelle, double prix, String photo) {
        this.id = id;
        this.libelle = libelle;
        this.prix = prix;
        this.photo = photo;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

   public int getQts() {
        return qts;
    }
    
    public void setQts(int qts) {
        this.qts = qts;
    }
    
    
}
