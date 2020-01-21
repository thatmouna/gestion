<%-- 
    Document   : product_detail
    Created on : 16 janv. 2020, 05:12:01
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
		<link href="themes/css/main.css" rel="stylesheet"/>
		<link href="themes/css/jquery.fancybox.css" rel="stylesheet"/>
				
		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<script src="themes/js/jquery.fancybox.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>	
           <%       HttpSession sessio=request.getSession();
                String msg = (String)sessio.getAttribute("msg");
                 List<Panier> paniers =  new ArrayList<>();
                int idp=Integer.parseInt(request.getParameter("id"));
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
				<h4><span>Product Detail</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">						
					<div class="span9">
						<div class="row">
							<div class="span4">
								<a href="themes/images/ladies/<%=ProductInfos.getPImage(idp)%>" class="thumbnail" data-fancybox-group="group1" title="Description 1"><img alt="" src="themes/images/ladies/<%=ProductInfos.getPImage(idp)%>"></a>												
                                                                </br>
                                                                </br>
                                                                </br>
                                                                </br>
							</div>
							<div class="span5">
								<address>
                                                                        </br></br>
                                                                        </br></br>
                                                                        </br></br>
									<strong>Product name:</strong> <span><%=ProductInfos.getPName(idp)%></span><br>
									<strong>Quantity available:</strong> <span><%=ProductInfos.getPQts(idp)%></span><br>
								</address>									
								<h4><strong>Price: <%=ProductInfos.getPprice(idp)%>$</strong></h4>
							</div>
							<div class="span5">
								<form class="form-inline" action="AjouterPanier">
									<p>&nbsp;</p>
                                                                        <input type="hidden" name="id" value="<%=idp%>">
									<button class="btn btn-inverse" type="submit">Add to cart</button>
								</form>
							</div>							
						</div>
						<div class="row">
							<div class="span9">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a href="#home">Description</a></li>
									<li class=""><a href="#profile">Additional Information</a></li>
								</ul>							 
								<div class="tab-content">
									<div class="tab-pane active" id="home">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem</div>
									<div class="tab-pane" id="profile">
										<table class="table table-striped shop_attributes">	
											<tbody>
												<tr class="">
													<th>Size</th>
													<td>Large, Medium, Small, X-Large</td>
												</tr>		
												<tr class="alt">
													<th>Colour</th>
													<td>Orange, Yellow</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>							
							</div>						

						</div>
					</div>
					
				</div>
			</section>			
                        </br></br>
                        </br></br>
                        </br></br>
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="themes/js/common.js"></script>
		<script>
			$(function () {
				$('#myTab a:first').tab('show');
				$('#myTab a').click(function (e) {
					e.preventDefault();
					$(this).tab('show');
				})
			})
			$(document).ready(function() {
				$('.thumbnail').fancybox({
					openEffect  : 'none',
					closeEffect : 'none'
				});
				
				$('#myCarousel-2').carousel({
                    interval: 2500
                });								
			});
		</script>
    </body>
</html>