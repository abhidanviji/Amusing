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
			<li class="notifications"><a href="noti.jsp">Notifics</a></li>
			<li class="charts"><a href="charts.jsp">Charts</a></li>
			<li class="discover"><a href="discover.jsp">Discover</a></li>

		</ul>
	</div>
	</header>

	<center>
		<form action="charts.jsp">
			Select Genre:<select name="genre" id="genre">
				<option value="Fast Beat">Fast Beat</option>
				<option value="Romantic Number">Romantic Number</option>
				<option value="Audio Book">Audio Book</option>
				<option value="Other">Other</option>
			</select> <input type="submit" value="Search">
		</form>
		<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		<%
String genre = request.getParameter("genre");	
		if(genre != null)
		out.println("\n\nGenre - "+genre);
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
			if(genre != null){
				Statement stmt = con.createStatement();
				ResultSet rset = stmt.executeQuery("select song,tracks.trackname from tracks,usertrack where genre = '"+genre+"' and tracks.trackname = usertrack.trackname and username = '"+(String)session.getAttribute("userId")+"';");
				while(rset.next()){
					%>
					<center><form action = ind.jsp>
					<input type="hidden" name = "page" value="charts.jsp">
					<input type="hidden" id="track" name="track" value=<%=rset.getString(2)%>>
					<input type = "submit" id="tr" name = "tr" value = <%=rset.getString(1)%>>
					</form></center>
							
					<%	
				}
			}
		%>

	</center>

</body>
</html>