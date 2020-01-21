
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="General.Panier"%>
<%@page import="General.Produit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                session=request.getSession(false);
                String msg = (String)request.getAttribute("msg");
               List<Panier> paniers =  new ArrayList<>();

                int x=1; int i=0;
                if (msg!= null && msg.equalsIgnoreCase("valide") && session!=null){
                        x=0; 
                    msg="valide";
                    request.setAttribute("msg",msg);
                }
                else if(session!=null){
                     paniers = (List<Panier>) session.getAttribute("listpr");
                    if (paniers != null) {
                         session.removeAttribute("listpr");
                        i = paniers.size();
                    }
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
					<a href="index.html" class="logo pull-left"><img src="themes/images/logo.png" class="site_logo" alt=""></a>
					
				</div>
			</section>				
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
				<h4><span>Check Out</span></h4>
			</section>	
			<section class="main-content">
				<div class="row">
					<div class="span12">
                                         <section class="header_text sub">   <h4><span>Thank you</span></h4>	
                                         </section>
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