<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amusing</title>
<link rel="stylesheet" type="text/css" href="navigationdrop.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
.w3-btn {
	width: 100px;
}

.grey {
	background-color: grey;
	color: Black;
	margin: 0px 0px 30px 0;
	padding: 50px;
}

.white {
	color: Black;
	padding: 0px;
	margin: 30px 30px 30px 50px;
}
</style>
<script>
	function myFunction() {
		alert("Thankyou for your response!");
	}
</script>
</head>
</body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%try{
	String fname = "SCA", lname = "user", email = "abc.com", uid = "user";
	String trk = request.getParameter("trk");
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
	ResultSet rs2 = st2.executeQuery("select status from friend where status = 0 and friendto = '"
			+ (String) session.getAttribute("userId") + "';");
%>
<div class="wrapper">

	<div class="top"></div>

	<ul class="navigation">

		<li><a href="navigationdrop.jsp" name="app"><%=fname%>'s
				AMUSING</a>

			<ul>
				<li><a title="lname">Email : <%=email%></a></li>
				<li><a title="lname"> Lname : <%=lname%></a></li>
				<li><a title="fname"> Fname : <%=fname%></a></li>
				<li><a title="lname"> UserID : <%=uid%></a></li>

			</ul></li>
		<li><a href="home.jsp" title="Home"> Home</a></li>
		<%
			if (rs2.next()) {
		%>
		<li><a href="collection.jsp" title="Collection"><font
				color="red"> Collection</a></li>
		<%
			} else {
		%>
		<li><a href="collection.jsp" title="Collection">Collection</a></li>
		<%
			}
		con.close();
		%>
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
<br>

<div class="grey">
	<h2>Report song for:</h2>
	<form action="rep.jsp">
		<input type="checkbox" name="rep" value="Spam"> Spam <br>
		<input type="checkbox" name="rep" value="Impersonation">
		Impersonation<br> <input type="checkbox" name="rep" value="Abuse">
		Abuse<br> <input type="checkbox" name="rep"
			value="TrademarkInfringement"> Trademark infringement<br>
		Please specify if other: <input type="text" name="other"> <input
			type="hidden" name="track" value=<%=trk %>>
		<p>
			<button class="w3-btn w3-round-large" input type="submit"
				onclick="myFunction()">SUBMIT</button>
		</p>

	</form>
	<br>
	<p>
		<b>Disclaimer:</b><br> Reported songs are reviewed by a
		specialist team who take action if the contents or activity violates
		our Guidelines or Terms. Repeat violation or serious breaches can
		result in the permanent deletion of accounts.
	</p>
</div>

<div class="white">
	<p>We try to maintain a fair and balanced approach and will remove
		any content that violates these rules, or applicable law. Reporting
		content will not always result in that content being removed if it
		does not break the rules.</p>
</div>

<%
			}catch(Exception e){
			}
			%>
</body>
</html>