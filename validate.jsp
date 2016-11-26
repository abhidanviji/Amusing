<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"  type="text/css" href="navigationdrop.css">
<title></title>
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
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	String uname = "";
String userid=request.getParameter("username"); 
session.putValue("userid",userid); 
String pwd=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","oracle"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from amlogin where userid='"+userid+"'"); 

if(rs.next()) 
{ 
if(rs.getString(2).equals(pwd)) 
{
uname = rs.getString("fname");
	session.setAttribute("userId", userid);
	
} 
else 
{ 
out.println("Invalid password try again"); 
} 
} 
else 
%>
<center>Welcome <%=uname%>!<br>
<a href="navigationdrop.jsp">Click to proceed to home page.</a></center>
</body>
</html>