<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<head>
<LINK REL=STYLESHEET
      HREF="style.css"
      TYPE="text/css">
</head>

<body>
<%
if((String)session.getAttribute("u_uname") != null)
{
	out.println("Logged in: " + (String)session.getAttribute("u_uname"));
}
%>

<center>
<%@ include file="/navbar.jsp" %>
<br>

<%
   
if (session.getAttribute("u_uname").equals("admin"))
{
	String title = request.getParameter("title");
	String author_last = request.getParameter("author_last");
	String author_first = request.getParameter("author_first");
	String quantity = request.getParameter("quantity");
	String price = request.getParameter("price");
	String subject = request.getParameter("subject");
	String year = request.getParameter("year");
	String edition = request.getParameter("edition");
	String format = request.getParameter("format");
	String keywords = request.getParameter("keywords");
	
	Statement stmt;
	Connection con;
	try
	{
	 	String userName = "5530s12u54";
			String password = "ojaqitsa";
	    	String url = "jdbc:mysql://georgia.eng.utah.edu/5530s12db54";
	        Class.forName ("com.mysql.jdbc.Driver").newInstance ();
			con = DriverManager.getConnection (url, userName, password);
	
		//DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
		stmt = con.createStatement();
	} 
	catch(Exception e) 
	{
		out.print("Connection Error!");
		
		System.err.println("Unable to open oracle jdbc connection. The error is as follows,\n");
	    		System.err.println(e.getMessage());
		throw(e);
	}
	
	String insertB;
	
	insertB = "INSERT INTO books (name, author_last, author_first, quantity, price, subject, year, format, keywords, edition) VALUES ('" 
		    + title + "', '" 
		    + author_last + "', '" 
		    + author_first + "', " 
		    + quantity + ", " 
		    + price + ", '"
		    + subject + "', "
		    + year + ", '"
		    + format + "', '"
		    + keywords + "', "
		    + edition + ")";
	
	stmt.executeUpdate(insertB);
	
	stmt.close();
	con.close();
	%>
	<br><br>
	You added a book titled "<%=title %>" by author "<%=author_first %> <%=author_last %>".
	<br><br>
	
	Return to <a href="adminhub.jsp">Admin Hub</a>.
	<%
}
else
{
	
	out.print("Admin login failed. Please try again.");
    %>
	Admin Login:
		<form method="post" action = "adminhub.jsp">
		<table>
		<tr><td><label for="Username">Username</label></td>
		    <td><input type="text" size="20" name="username" id="username" value=""/></td></tr>
		<tr><td><label for="Password">Password</label></td>
		    <td><input type="password" size="20" name="password" id="password"/></td></tr>
		    
		<tr><td colspan="2"><input type="submit" value="Submit"/></td></tr>
		</table>
		</form>
		
	<% 
}
%>

</center>
</body>
</html>