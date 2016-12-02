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
		<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		<%
			String user = (String) session.getAttribute("userId");
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select userid from amlogin where userid <> '" + user
					+ "' and userid not in	(select Friendto from friend where status = 0 and Friendfrom = '" + user
					+ "') and userid not in	(select Friendfrom from friend where status = 1 and Friendto = '" + user
					+ "') and userid not in (select Friendto from friend where status = 1 and Friendfrom = '" + user
					+ "')");
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

			</select> <br> <br> Add Message: <br>
			<textarea rows="4" cols="50" name="message"
				placeholder="Enter your Message...">
</textarea>
			<br> <br> <br> <input type="submit" name="submit"
				value="Send Request">

		</form>
		</center>
</body>
</html>