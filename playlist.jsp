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
        <li class="overview"><a href="#">Overview</a></li>
        <li class="Likes"><a href="playlist.jsp">Playlists</a></li>
        <li class="about"><a href="#">Albums</a></li>
        <li class="History"><a href="#">History</a></li>
        <li class="Friends"><a href="#">Friends</a></li>
      </ul>
    </div>
  </header>
  
  <center><h1>Your favourites!!</h1>
  <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
		int count = 1;
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select trackname from playlists where usename = '"+(String)session.getAttribute("userId")+"';");
		
			%>

				<%
					while (rs1.next()) {
				%>
		<%=rs1.getString(1)%><br><audio id = <%=count%> src = <%=rs1.getString(1)%> controls></audio><br>
				<%
				count++;
					}
				
			
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select trackname from usertrack where trackname not in (select trackname from  playlists where usename = '"+(String)session.getAttribute("userId")+"')");
		
		%>
		<br><br>
		<script>
		<%for(int i=1;i<=count;i++){%>
		var audio    = document.getElementById(<%=i%>);

		audio.addEventListener("ended", function() {
			
			document.getElementById(<%=i+1%>).play();
		   
		}); 
		<%}%>
		
		</script>
		<form action="addplaylist.jsp">
		Song Name: <select name="trackname">

			<%
				while (rs.next()) {
			%>
			<option><%=rs.getString(1)%></option>
			<%
				}
			%>
			
		</select> 
		
		<input type = "submit" id="addsong" name = "addsong" value = "Add To Playlist">
		</form>
		<%Statement st2 = con.createStatement();
		ResultSet rs2 = st2.executeQuery("select trackname from  playlists where usename = '"+(String)session.getAttribute("userId")+"';");
		%>
		<form action="removeplaylist.jsp">
		Song Name: <select name="trackname1">

			<%
				while (rs2.next()) {
			%>
			<option><%=rs2.getString(1)%></option>
			<%
				}
			con.close();
			%>
			
		</select> 
		
		<input type = "submit" id="delsong" name = "delsong" value = "Remove from Playlist">
		</form>
		</center>

</body>
</html>