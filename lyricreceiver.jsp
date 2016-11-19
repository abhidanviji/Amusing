<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css" href="lyricupload.css" >
<link rel="stylesheet"  type="text/css" href="navigationdrop.css">
 </head>
</body>
<div class="wrapper">
   
  <div class="top"> 
    
  </div>
  
  <ul class="navigation">
  <li><a href="navigationdrop.jsp"> SOUNDCLOUD-AMUSE</a></li>
    <li><a href="###" title="Home"> Home</a></li>
    <li><a href="###" title="Collection"> Collection</a></li>
    <li><a href="http://localhost:8085/NewFileUpload/index.html" title="Upload"> Upload</a></li>

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
<div id="form-main">
  <div id="form-div">
    <form class="form" id="form1">
      <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
		Statement statement = con.createStatement();
		ResultSet rs = statement.executeQuery("select lyricname,lyricstext from lyrics");
		while(rs.next()){
		%>
      <p class="lyricname">
        <textarea name="lyricname" type="text" class="validate[required,length[0,100]] feedback-input" placeholder="Song name" id="lyricname" >  <%=rs.getString("lyricname")%></textarea>    
      
        <textarea name="lyrics" type="text" class="validate[required,length[6,300]] feedback-input"  placeholder="Lyrics" id="lyrics"><%=rs.getString("lyricstext")%></textarea>
      </p>
      <%} %>
        </div>
      </div>
    </form>
  </div>
</body>
</html>