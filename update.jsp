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
		String userid = (String) session.getAttribute("userId");
		String userfrom = request.getParameter("userfrom");
		System.out.println("User ID - "+userid);
		System.out.println("User From - "+userfrom);
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
		Statement st = con.createStatement();
		ResultSet rs;
		if(userid != null && userfrom != null){
		int i = st.executeUpdate(
				"Update  friend set status=1 where Friendfrom='" + userfrom + "' and Friendto='" + userid + "';");
	
		String query2 = " insert into notifications (username,noti)values (?,?)";
		PreparedStatement preparedStmt2 = con.prepareStatement(query2);
		preparedStmt2.setString(1, (String) session.getAttribute("userId"));
		preparedStmt2.setString(2, "Became friend of " + userfrom);
		preparedStmt2.execute();
		}
		con.close();
	%>
	<script>
		alert("You are now a friend!");
		window.location = "collection.jsp";
	</script>
	
	
</body>
</html>