<%-- 
    Document   : cart.jsp
    Created on : 16 janv. 2020, 05:05:54
    Author     : DELL-10
--%>
<%@page import="General.ProductInfos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="General.Panier"%>
<%@page import="General.Produit"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Shopper</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">      
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">		
		<link href="themes/css/bootstrappage.css" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="themes/css/flexslider.css" rel="stylesheet"/>
		<link href="themes/css/main.css" rel="stylesheet"/>

		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="themes/js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>
                        <% double total = 0;%>

<%       HttpSession sessio=request.getSession();
                String msg = (String)sessio.getAttribute("msg");  
                 List<Panier> paniers =  new ArrayList<>();
                int x=1; int i=0;
                if (msg!= null && msg.equalsIgnoreCase("valide") && session!=null){
                        x=0; 
                        paniers = (List<Panier>) session.getAttribute("listpr");
                    if (paniers != null) {
                        i = paniers.size();
                    }
                    msg="valide";
                sessio.setAttribute("msg",msg);}
                 else if(session!=null){
                    paniers = (List<Panier>) session.getAttribute("listpr");
                    if (paniers != null) {
                        i = paniers.size();
                    }
                }
                else{
                List<Panier> listpr =  new ArrayList<>();
                sessio.setAttribute("listpr",listpr);
                x=0;
                }
        if (paniers != null) {
            %>
		<div id="top-bar" class="container">
			<div class="row">
                                <div class="span4">

				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">	<li><a href="DisplayProducts">Catalogue</a></li>  	
                                                                          <li><a  href="cart.jsp">Cart <img src="themes/images/cart.png" ><%= i%></a> </li> 
							<% if (x==1){ %> <li><a href="register.jsp">Login</a></li>	
                                                        <% } else { %>   <li><a href="AjouterProduit.jsp">New Product</a></li>
                                                                          <li><a href="Logout">Logout</a></li>       
                                                        <%}%>			
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index.jsp" class="logo pull-left"><img src="themes/images/logo.png" class="site_logo" alt=""></a>
					<nav id="menu" class="pull-right">
		
					</nav>
				</div>
			</section>				
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
				<h4><span>Shopping Cart</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">
					<div class="span9">					
						<h4 class="title"><span class="text"><strong>Your</strong> Cart</span></h4>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Remove/add</th>
									<th>Image</th>
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Unit Price</th>
									<th>Total</th>
								</tr>
							</thead>
							<tbody>
                                                            <% for (Panier p : paniers) {
                                                                            total += p.getQte() * p.getProduit().getPrix();
                                                               %>
								<tr>
                                                                    <td> <a href="AjouterPanier?id=<%=p.getProduit().getId()%>&delete=1" >  REMOVE</a> <p>  </p>    
                                                                         <a href="AjouterPanier?id=<%=p.getProduit().getId()%>" >  ADD</a></td>
									<td><a href="product_detail.jsp?id=<%=p.getProduit().getId()%>"><img alt="" src="themes/images/ladies/<%=ProductInfos.getPImage(p.getProduit().getId())%>"></a></td>
									<td><%=ProductInfos.getPName(p.getProduit().getId())%></td>
									<td><input type="text" value="<%=p.getQte()%>" class="input-mini"></td>
									<td><%=ProductInfos.getPprice(p.getProduit().getId())%>$</td>
									<td><%=p.getQte() * p.getProduit().getPrix()%>$</td>
								</tr>			  
                                                            <%    }
                                                                }%>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><strong><%=total%>$</strong></td>
								</tr>		  
							</tbody>
						</table>

						<hr>
						<p class="cart-total right">
							<strong>Eco Tax (-2.00)</strong>: 2.00$<br>
							<strong>Total</strong>: <%=total+2%>$<br>
						</p>
						<hr/>
						<p class="buttons center">				
							<button class="btn" type="submit" id="continue"name="continue" >Continue</button>
							<button class="btn btn-inverse" type="submit" id="checkout">Checkout</button>
						</p>					
					</div>
	
				</div>
			</section>			
			
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="themes/js/common.js"></script>
		<script>
			$(document).ready(function() {
				$('#checkout').click(function (e) {
					document.location.href = "Checkout.jsp";
				});
                                $('#continue').click(function (e) {
                                        document.location.href = "DisplayProducts";
				});
    
                         });
				
		</script>		
    </body>
</html>
