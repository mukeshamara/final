<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<%-- <head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Home Page</title>

</head>
 

<body>
<%--
<% 
User name=(User)session.getAttribute("xyz"); 
		
out.print("Hello User: You have entered the name: "+name);
%>
 
 <h2> welcome user : ${sessionScope.xyz.userid}</h2>
		Search here: 
		 <select name="item">
  <option value="searchone" name="searched">search one</option>
  <option value="comics" name="searched">comics</option>
  <option value="romance" name="searched">romance</option>
  <option value="thriller" name="searched">thriller</option>
  <option value="emotion" name="searched">emotion</option>
</select>
<button type="submit" name="searchcategory" class="btn btn-primary">Search</button>
		
--%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Search</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style>
       body {
       
              
  background-image:linear-gradient(rgba(0,0,0,0.1),rgba(0,0,0,0.1)),url(im.jpeg);

 

       height:100vh;

 

       background-size:cover;

 

       background-position:center;
       
       }
</style>
</head>
<body>
       <!--  Navbar -->
       <%-- <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
         <a class="navbar-brand" href="#">Gain Knowledge---------!</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
         </button>
       --%>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
          
           <div class="navbar-right" style="color: white; font-size: 20px;">
              <div  class="nav-item dropdown" style="cursor: pointer">
                     <div class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           
                            <span style="border: 1px solid white; border-radius: 100%; margin-right: 10px; text-align: center">
                                  <span class="fa fa-user" style="padding-left: 10px; padding-right: 5px;"></span>
                            </span>
                                                
                            ${ sessionScope.xyz.userid}
                            
                        </div>
                     
                        <a class="active" href="lo.jsp"><font face="verdana" color="MediumBlue">Home Page </font>  </a>&emsp;
                        <a href="userincart.jsp"> <font face="verdana" color="MediumBlue">Go to cart</font></a>&emsp;
                        <a href="${pageContext.request.contextPath}/beforecancel.do"><font face="verdana" color="MediumBlue" >Ordered Details to cancel</font></a>&emsp;
                        <a href="order.jsp"><font face="verdana" color="MediumBlue">Make Payment</font></a>&emsp;
                     	<a href="profile.jsp"><font face="verdana" color="MediumBlue">Profile</font></a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                     	<a href="${pageContext.request.contextPath}/ordered.do"><font face="verdana" color="MediumBlue">Ordered Details</font></a>&emsp;
                     	<a href="${pageContext.request.contextPath}/logout.do"><font face="verdana" color="MediumBlue">Logout</font></a>&emsp;
                      </div>
              </div>
           </div>
         </div>
       </nav>
              
       
      
       <div class="wrapper container">
       
       <!-- Search window -->
   
       <div class=row style="margin-top: 50px;">
       
              <div class="container" style="background-color: rgba(0, 0, 0, 0); color: white; padding: 20px;">
                     
                     <h1>
                           Search Books
                     </h1>
                     
                    
                     
                         
                           
                           <br/>
                           
                           <div class="form-row">
                              
                                  <div class="col-sm-6">
                                  <h2> Books under the selected category <font color="greenblack">${sessionScope.item}</font></h2>
                                        <%--  <label> Search</label> --%>
										<%-- <select name="item">
									  <option value="searchone" name="searched">search one</option>
									  <option value="comics" name="searched">comics</option>
									  <option value="romance" name="searched">romance</option>
									  <option value="thriller" name="searched">thriller</option>
									  <option value="emotion" name="searched">emotion</option>
									</select>
									--%>
                                 </div>
                                  
                              
                           
                           </div>
                     
                    
                     
              </div>
       
       </div>
       
       </div>
      
   <sql:setDataSource driver="com.mysql.jdbc.Driver"

            url="jdbc:mysql://localhost:3306/mfrpproject"

            user="root" password="root"

            var="mysrc"

    />
   

 

    <sql:query var="stmt" dataSource="${mysrc}">

        select * from product where category_name='${sessionScope.item}';

    </sql:query>
    <form action="cart.do" method="post">

    <table border='1'>

        <tr>
		<font color="whiteblue"></font>
           <th>click here</th> <th>Category Name</th><th>Book ID</th><th>Book Name</th><th>Language</th><th>Price</th><th>Binding</th><th>Delivery_Time</th><th>Author Name</th>

        </tr>

        <c:forEach var="rs" items="${stmt.rows}">
	
            <tr>
				<td><input  type="checkbox" name="book_id" value="${rs.book_id}"></td>
                <td><font face="verdana" color="white">${rs.category_name}</font></td>

                <td><font face="verdana" color="white">${rs.book_id}</font></td>
					
                <td><font face="verdana" color="white">${rs.book_name}</font></td>
                <td><font face="verdana" color="white">${rs.Language}</font></td>
                <td><font face="verdana" color="white">${rs.Price}</font></td>
                <td><font face="verdana" color="white">${rs.Binding}</font></td>
                <td><font face="verdana" color="white">${rs.Delivery_Time}</font></td>
                <td><font face="verdana" color="white">${rs.Author_name}</font></td>
				<td>
				
		<td/>
            </tr>

        </c:forEach>
        
        	
			<input type="submit" value="Add to Cart"/>
		</form>

    </table>
    
    <br></br>
    <h2> <font color="white">To add more books click the below link or go to home page</font></h2>
    <a href="lo.jsp"><font color="black"><h2>Click this</h2></font></a>

  </body>

</html>




<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% User u=(User)request.getAttribute("xyz"); %>
		<h2> welcome user : ${sessionScope.xyz.userid}</h2>
		
		 Search here:
		<select>
  <option value="searchone" name="searched">search one</option>
  <option value="comics" name="searched">comics</option>
  <option value="romance" name="searched">romance</option>
  <option value="thriller" name="searched">thriller</option>
  <option value="emotion" name="searched">emotion</option>
</select>
<button type="submit" name="searchcategory" class="btn btn-primary">Search</button>
	
	<%--
		<% 
		List<product> plist=(List<product>) request.getAttribute("list");
		for(product p:plist){ %>
		<table border="1">
				<tr>
						<td align="left"></td>
						<td> p.getCat_name()</td>
		</table>
	 	<%= p.getCat_name(),"----",p.getCat_id(),"----",p.getBook_id(),"----",p.getBook_name(),"----",p.getLanguage(),"----",p.getPrice(),"----"
		,p.getBinding(),"----",p.getDelivery_time(),"----",p.getAuthor_name(),"----",p.getQuantity()%> 
		<% } %>
		<table width="59%" border="1">
		  <ul class="contain" >
		<%
		List<product> plist=(List<product>) request.getAttribute("list");
		for(product p:plist){ %>
		<li class="list-group-item">
		<div class="searched category books">
		<div class="col">
		
		<%--  <input type="radio" name="cart" value="<%= p.getBook_id() %>"><%= p.getBook_id() %> 
		<input type = \"radio\" name = \"cart\" value=\"True\"> True 
			<%= p.getCat_name() %>
		
			
			<%= p.getCat_id() %>
			
			<%= p.getBook_id() %>
		
			<%= p.getBook_name() %>
		
			<%= p.getLanguage() %>
		
			<%= p.getPrice() %>
		
			<%= p.getBinding() %>
		
			<%= p.getDelivery_time() %>
		
			<%= p.getAuthor_name() %>
		
			<%=p.getQuantity() %>
			<form action="cart.jsp" method="post">
			<input type="submit" value="Add to Cart"/>
		</form>
	
		</div>
		</div>
		</li>
		<% } %>
		</ul>
		
		
	</table>
	
</body>
</html>
--%>