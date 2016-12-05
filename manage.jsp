<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amusing</title>
<link rel="stylesheet"  type="text/css" href="navigationdrop.css" >
<link rel="stylesheet"  type="text/css" href="collection.css" >
 </head>
<body>
<div class="wrapper">
   
  <div class="top"> 
    
  </div>
  
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
      </ul>
    </li>
    <li><a href="index.html" title="Logout">Logout</a></li>
    <form action = "searchresult.jsp" >
    <li><a><input id="search-bar" name="search" type="text" placeholder="Search to find tracks">
      <input id="search-button" name="search_submit" type="submit" value="Search"></a></li>
      </form>
    <div class="clear"></div>
  </ul>
</div>
<header>
    <div class="nav">
      <ul>
        <li class="overview"><a href="overview.jsp">Overview</a></li>
        <li class="Likes"><a href="playlist.jsp">Playlists</a></li>
        <li class="about"><a href="albums.jsp">Albums</a></li>
        <li class="History"><a href="history.jsp">History</a></li>
        <li class="Friends"><a href="friends.jsp">Friends</a></li>
      </ul>
    </div>
  </header>
  
  <center>
  <div class = "ogrey">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("username");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "sys";
	String userId = "root";
	String password = "oracle";

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<h2 align="center">
	<font><strong>List of Friends</strong></font>
</h2>
<table align="center" cellpadding="5" cellspacing="5" border="1" width=35% >
	<tr>

	</tr>
	<tr >

		<td align = "center"><font color="white"><b>Friends</b></td>

	</tr>
	<%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "SELECT Friendto from friend where status=1 and friendfrom = '"+(String)session.getAttribute("userId")+"' union SELECT Friendfrom from friend where status=1 and friendto = '"+(String)session.getAttribute("userId")+"'";

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
	%>
	<tr align = "center" >

		<td><font color="white"><%=resultSet.getString("Friendto")%></td>


	</tr>

	<%
		}
connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</table>
</div>
</center>

</body>
</html>