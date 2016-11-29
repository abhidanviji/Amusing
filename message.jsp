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
	<%@ page import="java.util.*"%>
	<%
		try {
			String userid = (String) session.getAttribute("userId");
			String userfrom = "";
			System.out.println("userid -  " + userid);
			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
			Statement stmt = conn.createStatement();
			//PreparedStatement pst = conn.prepareStatement("Select usertag from noti where usertag='"+userid+"';");
			ResultSet rs = stmt.executeQuery("Select Friendfrom,message from friend where status = 0 and Friendto='" + userid + "';");

			if (rs.next()) {
				userfrom = rs.getString(1);
				out.println(userfrom + ": ");
				
	%><br>
	<textarea rows="4" cols="50"><%=rs.getString(2)%></textarea>
	<br>
	<br>
	<br>
	<form action="update.jsp" method="post">
	<input type = "hidden" name="userfrom" value = <%=userfrom%>>
		<input type=submit method=post name=submit value=Confirm>
	</form>
		<br>
	<form action="reject.jsp" method="post">
	<input type = "hidden" name="userfrom" value = <%=userfrom%>>
		<input type=submit method=post name=submit value=Delete>
	</form>
	<%
		} else {
				response.sendRedirect("nomessage.html");
			}

		}

		catch (Exception e) {
			out.println("Something went wrong !! Please try again");
		}
		
		%>
	</body>
</html>