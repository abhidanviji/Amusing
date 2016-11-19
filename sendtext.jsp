<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"  type="text/css" href="csssublime.css" >
<link rel="stylesheet"  type="text/css" href="navigationdrop.css" >
<title>Amusing</title>
</head>
<body>
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
<center><h3>Message Sent!!</h3></center>
 <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	String from_user = request.getParameter("from");
	String to_user = request.getParameter("to");
	String text = request.getParameter("message");
	int count = 0;
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
		Statement statement = con.createStatement();
		ResultSet rs = statement.executeQuery("select from_user,to_user,text from message");
		 while(rs.next()){
			 if(rs.getString(1).equals(from_user) && rs.getString(2).equals(to_user) && rs.getString(3).equals(text)){
				 count++;
			 }
		 }
		 if(count == 0){
		String query = " insert into message (from_user, to_user, text) values (?, ?, ?)";
		PreparedStatement preparedStmt = con.prepareStatement(query);
		preparedStmt.setString(1, from_user);
		preparedStmt.setString(2, to_user);
		preparedStmt.setString(3, text);
		
		preparedStmt.execute();
		con.close();
		 }	 
	%>
	<div id="form-main">
  <div id="form-div">
    <form class="form" id="form1" action="sendtext.jsp">
      
      <p class="from">
        <input name="from" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="From" id="from" />
      </p>
      
      <p class="to">
        <input name="to" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="To" id="to" />
      </p>
      
      <p class="message">
        <textarea name="message" type="text" class="validate[required,length[6,300]] feedback-input"  placeholder="Your Message" id="message"></textarea>
      </p>
      
      
      <div class="submit">
        <input type="submit" value="SEND" id="button-blue"/>
        <div class="ease">	
        </div>
      </div>
    </form>
  </div>
</body>
</html>