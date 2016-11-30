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
			<li><a href="navigationdrop.jsp"> SOUNDCLOUD-AMUSE</a></li>
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
			<li class="overview"><a href="#">Overview</a></li>
			<li class="Likes"><a href="playlist.jsp">Playlists</a></li>
			<li class="about"><a href="#">Albums</a></li>
			<li class="History"><a href="#">History</a></li>
			<li class="Friends"><a href="#">Friends</a></li>
		</ul>
	</div>
	</header>
	<h3>Album Successfully Created</h3>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	String user = (String)session.getAttribute("userId");
	String aname = request.getParameter("album");
		String[] track = request.getParameterValues("trackname");
		String albumtrack = "";
		for (int i = 0; i < track.length; i++)
			albumtrack += track[i] + " ";

		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
	    
		if(albumtrack != "" && aname != null && user != null){
			String sql = " insert into album (username, aname,tracks) values (?, ?,?)";
			PreparedStatement preparedStmt = con.prepareStatement(sql);
			preparedStmt.setString(1, user);
			preparedStmt.setString(2,aname );
			preparedStmt.setString(3,albumtrack);
			preparedStmt.execute();
			
			String sql1 = " insert into notifications (username, noti) values (?, ?)";
			PreparedStatement preparedStmt1 = con.prepareStatement(sql1);
			preparedStmt1.setString(1, user);
			preparedStmt1.setString(2,"Created "+aname+" album");
			preparedStmt1.execute();
			
		}
	
	%>

</body>
</html>