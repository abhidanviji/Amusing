<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amusing</title>
<link rel="stylesheet" type="text/css" href="navigationdrop.css">
<link rel="stylesheet" type="text/css" href="collection.css">
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%try{
		String fname = "SCA", lname = "user", email = "abc.com", uid = "user";
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");

		Statement st2 = con.createStatement();
		ResultSet rs2 = st2.executeQuery(
				"select status from friend where status = 0 and friendto = '" + (String) session.getAttribute("userId") + "';");
	%>
	<div class="wrapper">

		<div class="top"></div>

		<ul class="navigation">
			<li><a href="navigationdrop.jsp"> <%=(String) session.getAttribute("userId")%>'s
					AMUSING
			</a></li>
			<li><a href="home.jsp" title="Home"> Home</a></li>
			<li><a href="collection.jsp" title="Collection"> Collection</a></li>
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

	<header>

	<div class="nav">
		<ul>
			<li class="overview"><a href="overview.jsp">Overview</a></li>
			<li class="likes"><a href="likes.jsp">Likes</a></li>
			<li class="playlist"><a href="playlist.jsp">Playlists</a></li>
			<li class="about"><a href="albums.jsp">Albums</a></li>
			<li class="History"><a href="history.jsp">History</a></li>
			<li class="Friends"><a href="friends.jsp">Friends</a>
		</ul>

	</div>
	</header>

	<center>
		<a href="friendreq.jsp" class="button" id="frndreq">Send Request</a>
		<%
			if (rs2.next()) {
		%>
		<a href="message.jsp" class="button" id="manfrnd"><font
			color="red">Manage Friends</a>
		<%
			} else {
		%>
		<a href="message.jsp" class="button" id="manfrnd">Manage Friends</a>
		<%
			}
		%>
		<a href="manage.jsp" class="button" id="frndlist">Friend List</a>
	</center>

	<style>
.button {
	display: inline-block;
	vertical-align: middle;
	margin: 10px 5px;
	padding: 10px 20px;
	cursor: pointer;
	outline: bold;
	font-size: 13px;
	text-decoration: none !important;
	text-align: center;
	color: #fff;
	background-color: #4D90FE;
	background-image: linear-gradient(top, #4D90FE, #4787ED);
	background-image: -ms-linear-gradient(top, #4D90FE, #4787ED);
	background-image: -o-linear-gradient(top, #4D90FE, #4787ED);
	background-image: linear-gradient(top, #4D90FE, #4787ED);
	border: 1px solid #4787ED;
	box-shadow: 0 1px 3px #BFBFBF;
}

a.button {
	color: #fff;
}

.button:hover {
	box-shadow: inset 0px 1px 1px #8C8C8C;
}

.button.disabled {
	box-shadow: none;
	opacity: 0.7;
}
</style>
<%con.close(); 
	}catch(Exception e){
		
	}
%>
</body>
</html>