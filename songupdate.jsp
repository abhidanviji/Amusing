<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amusing</title>
<link rel="stylesheet"  type="text/css" href="navigationdrop.css" >
 </head>
</body>
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
<br><br>
<div id="track">
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	try{	
	Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select song,trackname from usertrack where username = '"+(String) session.getAttribute("userId")+"';");
		while (rs.next()) {	
		%>
		
		<center>
		<form action=ind.jsp>
			<input type="hidden" name="page" value="navigationdrop.jsp">
			<input type="hidden" id="track" name="track" value=<%=rs.getString(2)%>>
			<input type="submit" id="tr" name="tr" value=<%=rs.getString(1)%>>
		</form>
		</center>
				
		<%	
		}
		
		int lc = Integer.parseInt(request.getParameter("likecount"));
		int dc = Integer.parseInt(request.getParameter("dislikecount"));
		String trackname = request.getParameter("trackname");
		String user = (String)session.getAttribute("userId");
		int prevlc = -1,prevdc = -1;
		
		
		
		Statement stmt = con.createStatement();
		ResultSet rset = stmt.executeQuery("select likes,dislikes from tracks where trackname = '"+trackname+"';");
		
		if(rset.next()){
			prevlc = rset.getInt(1);
			prevdc = rset.getInt(2);
		}
		
		if(prevlc != lc){
		String query = " update tracks set likes = ? where trackname = '"+trackname+"';";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, lc);
		ps.execute();
		
		String sql = " insert into notifications (username, noti) values (?, ?)";
		PreparedStatement preparedStmt = con.prepareStatement(sql);
		preparedStmt.setString(1, user);
		preparedStmt.setString(2,"Likes "+trackname );
		preparedStmt.execute();
		
		String sql2 = " insert into history (user, track) values (?, ?)";
		PreparedStatement preparedStmt2 = con.prepareStatement(sql2);
		preparedStmt2.setString(1, (String) session.getAttribute("userId"));
		preparedStmt2.setString(2, " and liked "+trackname);
		preparedStmt2.execute();
		}
		
		if(prevdc != dc){
		String query1 = " update tracks set dislikes = ? where trackname = '"+trackname+"';";
		PreparedStatement ps1 = con.prepareStatement(query1);
		ps1.setInt(1, dc);
		ps1.execute();
		
		String sql1 = " insert into notifications (username, noti) values (?, ?)";
		PreparedStatement preparedStmt1 = con.prepareStatement(sql1);
		preparedStmt1.setString(1, user);
		preparedStmt1.setString(2,"Dislikes "+trackname );
		preparedStmt1.execute();
		
		String sql2 = " insert into history (user, track) values (?, ?)";
		PreparedStatement preparedStmt2 = con.prepareStatement(sql2);
		preparedStmt2.setString(1, (String) session.getAttribute("userId"));
		preparedStmt2.setString(2, " and disiked "+trackname);
		preparedStmt2.execute();
		}
		
		
		
		con.close();
		}catch(Exception e){
			System.out.println("Error - "+e);
		}
		%>
</div>

</body>
</html>
