 <%@page import="java.util.Iterator"%>
<%@page import="walexFab.model"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="walexFab.WalexModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Insert title here</title>
<script src="js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/cart1.css"/>
</head>
<body>

<jsp:include page="header_ui.jsp"></jsp:include>
	
<div  class="container cart-page">

<table>
<tr>
<th>Product</th>
<th>Quantity</th>
<th>Subtotal</th>
</tr>



<tr>
<%
		  
		  //Get main cart to display   Add empty Space in list and check for two user
		  
		  	if(new WalexModel().cart_pay(request) != null){
		  	    @SuppressWarnings("unchecked") 
		  	    ArrayList<Map<String, model>> list=	(ArrayList<Map<String, model>>) new WalexModel().start_Ses(request).getAttribute("cart");
		  	    
		  	  for (Map<String, model> result : list) {  
	  		   %>
<td>
		
<div class="cart-info">
<img  src="<%=result.get("image")%>"  style="width: 150px; height: 150px"/>
<input type="hidden" name="image" value="<%=result.get("image")%>">
<div>
<p>Red Printed Tshirt</p>
<small>Price:<%=result.get("price")%>
<input type="hidden" name="price" value="<%=result.get("price")%>"></small>
<br>

<form action="calculate"   method="post">
<button value="<%=result.get("id")%>" name="delete" id="button" >delete</button>
</form>
</div>
</div>
</td>

<td>
<input type="text" readonly="false" name="input" value="<%=result.get("input")%>">
</td>
<td>Total:<%=result.get("total")%> 
<input type="hidden" name="total" value="<%=result.get("total")%>"> 
</td>
 	    
</tr>
<%}
System.out.println(list); 
}%>
</table> 
<div class="total-price">
<table>
<tr>
<td>Subtotal</td>
<td>$200.00</td>
</tr>
<tr>
<td>Tax</td>
<td>$35.00</td>
</tr>
<tr>
<td>Total</td>
<td>$230.00</td>
</tr>
</table>
</div>
</div>
	
</body>
</html>