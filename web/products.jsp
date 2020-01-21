<%-- 
    Document   : products
    Created on : 16 janv. 2020, 05:12:59
    Author     : DELL-10
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="General.Panier"%>
<%@page import="General.Produit"%>
<%@page import="General.ProductInfos"%>
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
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>
            <% 
                HttpSession sessio=request.getSession();
                String msg = (String)sessio.getAttribute("msg");
                 List<Panier> paniers =  new ArrayList<>();
                int x=1; int i=0;
                if (msg!= null && msg.equalsIgnoreCase("valide") && session!=null){
                        x=0; 
                         paniers = (List<Panier>) sessio.getAttribute("listpr");
                    if (paniers != null) {
                        i = paniers.size();
                    }
                    msg="valide";
                sessio.setAttribute("msg",msg);}
                else if(session!=null){
                     paniers = (List<Panier>) sessio.getAttribute("listpr");
                    if (paniers != null) {
                        i = paniers.size();
                    }}
                else{
                List<Panier> listpr =  new ArrayList<>();
                sessio.setAttribute("listpr",listpr);
                x=0;
                }
            %>
		<div id="top-bar" class="container">
			<div class="row">
                                <div class="span4">

				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">	
                                                                         <li><a href="DisplayProducts">Catalogue</a></li>  
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
				<h4><span>New products</span></h4>
			</section>
			<section class="main-content">
                            
                 <% ArrayList<String> data= (ArrayList)request.getAttribute("ProductsList"); %>		
         
				<div class="row">						
					<div class="span9">								
						<ul class="thumbnails listing-products">
                                                <% int j=0,idp=0;
                                                    out.print( "Products found :"+ (data.size()/2));
                                                    while (j<data.size()){
                                                 %>  
							<li class="span3">
								<div class="product-box">
									<span class="sale_tag"></span>												
                                                                        <a href="product_detail.jsp?id=<%idp=Integer.parseInt(data.get(j++)); out.print(idp);%>" >  <img alt="" src="themes/images/ladies/<%=data.get(j++)%>"></a><br/>
									<a href="product_detail.jsp" class="title"><%=ProductInfos.getPName(idp)%></a><br/>
									<p class="price"><%=ProductInfos.getPprice(idp)%>$</p>
								</div>
							</li>       

                                                 <% } data.clear(); %>
						</ul>								
						<hr>
						
					</div>
			
				</div>
			</section>
	
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="themes/js/common.js"></script>	
    </body>
</html>