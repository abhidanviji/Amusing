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
	<%
	
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");

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
			<li class="Friends"><a href="friends.jsp">Friends</a></li>

		</ul>

	</div>
	</header>
	<div class = "ogrey">
	<center><h3>Likes: </h3>
	
	<center>
	<%
	Statement st2 = con.createStatement();
	ResultSet rs2 = st2.executeQuery("select noti from notifications where noti LIKE 'Like%' and username = '"+(String)session.getAttribute("userId")+"';");
	
	while(rs2.next()){
		String msg[] = rs2.getString(1).split(" ");
		
		Statement st3 = con.createStatement();
		ResultSet rs3 = st3.executeQuery("select song,trackname from usertrack where trackname = '"+msg[1]+"';");
		
		while(rs3.next()){
			%>
			
			<form action=ind.jsp>
				<input type="hidden" name="page" value="overview.jsp">
				<input type="hidden" id="track" name="track" value=<%=rs3.getString(2)%>>
				<input type="submit" id="tr" name="tr" value=<%=rs3.getString(1)%>>
			</form>

			<%
		}
		
	}
	%>
	</div>
	
	
	<div class = "ogrey">
	<center><h3>Playlists: </h3>
	
	<%
	int count =1; 
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
	
		%><br>
		<script>
		<%for(int i=1;i<=count;i++){%>
		var audio    = document.getElementById(<%=i%>);

		audio.addEventListener("ended", function() {
			
			document.getElementById(<%=i+1%>).play();
		   
		}); 
		<%}%>
		
		</script>
	
	<table width=55% border=1> </table></center>
	</div>
	<div class = "ogrey">
	<center><h3>Albums: </h3>
	
	<%
			String user = (String) session.getAttribute("userId");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from album where username='" + user + "';");
			while (rs.next()) {
				String aname = rs.getString("aname");
				String tracks = rs.getString("tracks");
				session.setAttribute("tracklist", tracks);
		%>
		<form action="showalb.jsp">
			<input type="hidden" name="tracks" value=<%=tracks%>> <input
				type="submit" name="aname" id="aname" value=<%=aname%>>
		</form>
		<%
			}
		%>
		
	
	<table width=55% border=1> </table></center>
	</div>
	<div class = "ogrey">
	<center><h3>History: </h3>
	<center><table width=55% border=1> 

 <%
    try{
    PreparedStatement pst = con.prepareStatement("select track from history where user = '"+user+"' order by ts desc");
  
    ResultSet rs5 = pst.executeQuery();
    
    while(rs5.next()){
  %>
    <tr>
    <td align="center">User <%=user%> listened to <%=rs5.getString(1)%></td>
    </tr>
<%
    }
    }
catch(Exception e){       
   out.println(e);       
} 

%>
</table></center><br>
	<table width=55% border=1> </table></center>
	
	</div>
	<div class = "ogrey">
	<center><h3>Friends: </h3>
	
	<h4 align="center">
	<font><strong>List of Friends</strong></font>
</h4>
<table align="center" border="1" width=55% >
	<tr>

	</tr>
	<tr >

		<td align = "center"><font color="white"><b>Friends</b></td>

	</tr>
	<%
		try {
			
			String sql = "SELECT Friendto from friend where status=1 and friendfrom = '"+(String)session.getAttribute("userId")+"' union SELECT Friendfrom from friend where status=1 and friendto = '"+(String)session.getAttribute("userId")+"'";
			Statement statement = con.createStatement();			
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
	%>
	<tr align = "center" >

		<td><font color="white"><%=resultSet.getString("Friendto")%></td>


	</tr>

	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</table>
</div>
</center>

<% con.close();%>
</body>

</html>