<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amusing</title>
<link rel="stylesheet" type="text/css" href="navigationdrop.css">
</head>
</body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
	String fname = "SCA", lname = "user", email = "abc.com", uid = "user";
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
	Statement st1 = con.createStatement();
	ResultSet rs1 = st1.executeQuery(
			"select * from amlogin where userid='" + (String) session.getAttribute("userId") + "';");
	if (rs1.next()) {
		fname = rs1.getString("fname");
		lname = rs1.getString("lname");
		email = rs1.getString("email");
		uid = rs1.getString("userid");
	}
	Statement st2 = con.createStatement();
	ResultSet rs2 = st2.executeQuery("select status from friend where status = 0 and friendto = '" + (String) session.getAttribute("userId") + "';");
	
	
%>
<div class="wrapper">

	<div class="top"></div>

	<ul class="navigation">
	
		<li><a href="navigationdrop.jsp" name = "app"><%=fname%>'s AMUSING</a>
		
			<ul>
				<li><a title="lname">Email : <%=email%></a></li>
				<li><a title="lname"> Lname : <%=lname%></a></li>
				<li><a title="fname"> Fname : <%=fname%></a></li>
				<li><a title="lname"> UserID : <%=uid%></a></li>

			</ul></li>
		<li><a href="home.jsp" title="Home"> Home</a></li>
		<%
	if(rs2.next()){
	%>
		<li><a href="collection.jsp" title="Collection"><font color="red"> Collection</a></li>
		<%}else{ %>
		<li><a href="collection.jsp" title="Collection">Collection</a></li>
		<%} %>
		<li><a href="fileupload.html" title="Upload"> Upload</a></li>

		<li><a href="###" title="Lyrics"> Lyrics</a>
			<ul>
				<li><a href="lyrics.html" title="Upload"> Upload</a></li>
				<li><a href="lyricreceiver.jsp" title="View"> View</a></li>
			</ul>
		<li>
		<li><a href="###" title="Message">Message</a>
			<ul>
				<li><a href="messagesublime.jsp" title="Send">Send</a></li>
				<li><a href="receive.jsp" title="View">View</a></li>
			</ul></li>
		<li><a href="index.html" title="Logout">Logout</a></li>
		<form action="searchresult.jsp">
			<li><a><input id="search-bar" name="search" type="text"
					placeholder="Search to find tracks"> <input
					id="search-button" name="search_submit" type="submit"
					value="Search"></a></li>
		</form>
		<div class="clear"></div>
	</ul>
</div>
<br><br>
<center>
	<div id="track">

		<%
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select song,trackname from usertrack where username = '"+(String) session.getAttribute("userId")+"';");
			while (rs.next()) {
		%>
		
		<form action=ind.jsp>
			<input type="hidden" name="page" value="navigationdrop.jsp">
			<input type="hidden" id="track" name="track" value=<%=rs.getString(2)%>>
			<input type="submit" id="tr" name="tr" value=<%=rs.getString(1)%>>
		</form>

		<%
			}
			con.close();
		%>

	</div>
</center>
</body>
</html>
