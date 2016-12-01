<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"  type="text/css" href="csssublime.css" >
<link rel="stylesheet"  type="text/css" href="navigationdrop.css" >
<title>Messages</title>
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
<br><br>
<div id="form-main">
  <div id="form-div">
    <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
		Statement statement = con.createStatement();
		ResultSet rs = statement.executeQuery("select to_user,from_user,text from message where to_user = '"+(String)session.getAttribute("userId")+"' or from_user = '"+(String)session.getAttribute("userId")+"';");
		 while(rs.next()){%>
      
      <p class="from">
        <input name="from" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="From" id="from" value = "From: <%=rs.getString("from_user")%>">
        <input name="to" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="To" id="to" value = "To: <%=rs.getString("to_user")%>">
        <textarea name="message" type="text" class="validate[required,length[6,300]] feedback-input"  placeholder="Your Message" id="message" ><%=rs.getString("text")%></textarea>
      </p>
      <br>
      <%
		 }
      con.close();
  	%>     
      
        <div class="ease">	
        </div>
      </div>
    </form>
  </div>
</body>
</html>
