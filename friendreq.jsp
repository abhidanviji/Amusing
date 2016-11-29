<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amusing</title>
</head>
<body>
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	
	String user = (String)session.getAttribute("userId");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
	
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select userid from amlogin where userid <> '"+user+"' and userid not in	(select Friendfrom from friend where status = 1 and Friendto = '"+user+"') and userid not in (select Friendto from friend where status = 1 and Friendfrom = '"+user+"')");
	%>
	<h1>Add Friend</h1>

	<form action="form.jsp" method="post">
		Select ID: <select name="username" required> 
		<%
				while (rs.next()) {
			%>
			<option><%=rs.getString(1)%></option>
			<%
				}
			%>
			
		</select> 
		
		<br> <br> 
		Add	Message: <br>
		<textarea rows="4" cols="50" name="message"
			placeholder="Enter your Message...">
</textarea>
		<br>
		<br>
		<br> <input type="submit" name="submit" value="Send Request">

	</form>

</body>
</html>