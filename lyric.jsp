<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet"  type="text/css" href="lyricupload.css" > 
<link rel="stylesheet"  type="text/css" href="navigationdrop.css">
<title>Amusing</title>
</head>
<body>
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	String lyricname = request.getParameter("lyricname");
	String lyrics = request.getParameter("lyrics");
	
	int count = 0;
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
		Statement statement = con.createStatement();
		ResultSet rs = statement.executeQuery("select lyricstext,lyricname from lyrics");
		 while(rs.next()){
			 if(rs.getString(1).equals(lyrics) && rs.getString(2).equals(lyricname) ){
				 count++;
			 }
		 }
		 if(count == 0){
		String query = " insert into lyrics (username, lyricname, lyricstext) values (?, ?, ?);";
		PreparedStatement preparedStmt = con.prepareStatement(query);
		preparedStmt.setString(1, (String)session.getAttribute("userId"));
		preparedStmt.setString(2, lyricname);
		preparedStmt.setString(3, lyrics);
		
		preparedStmt.execute();
		con.close();
		 }
	%>
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
	<center><h3>Lyric Uploaded Successfully!</h3></center>
	<div id="form-main">
  <div id="form-div">
    <form class="form" id="form1" action="lyric.jsp">
      
      <p class="lyricname">
        <input name="lyricname" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="Song name" id="lyricname" >
      </p>
      
      <p class="lyrics">
        <textarea name="lyrics" type="text" class="validate[required,length[6,300]] feedback-input"  placeholder="Lyrics" id="lyrics"></textarea>
      </p>
      
      
      <div class="submit">
        <input type="submit" value="UPLOAD" id="button-blue"/>
        <div class="ease">	
        </div>
      </div>
    </form>
  </div>
</body>
</html>