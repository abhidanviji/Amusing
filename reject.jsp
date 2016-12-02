<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		String userid = (String) session.getAttribute("userid");
		String userfrom = request.getParameter("userfrom");

		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
		Statement st = con.createStatement();
		ResultSet rs;
	
	int i = st.executeUpdate("Update  friend set Status=2 where Friendfrom='" + userid + "';");
	con.close();
	%>
	<script>
		alert("updated successfully");
		window.location = "collection.jsp";
	</script>
	
</body>
</html>