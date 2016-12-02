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
	<div class="wrapper">

		<div class="top"></div>

		<ul class="navigation">
			<li><a href="navigationdrop.jsp"> <%=(String)session.getAttribute("userId")%>'s AMUSING</a></li>
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
		<h1>Deleted Album Successfully!!</h1>
		<br>
		<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		<%
			String user = (String) session.getAttribute("userId");
		String aname = request.getParameter("delalb");
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
			String query = " delete from album where aname = ? and username = ?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.setString(1, aname);
			preparedStmt.setString(2, user);		
			
			preparedStmt.execute();
		
				con.close();
			%>
	</center>

</body>
</html>