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
<br><br>
<center>
<%@ page
		import="java.io.*,java.util.*, javax.servlet.*,java.sql.*,javax.sql.*"%>
	<%
		try {
			String track = request.getParameter("trk");
			String home = System.getProperty("user.home");
			File path = new File(home + "/Downloads/Amuse/");
			if (!path.exists()) {
				if (path.mkdir()) {
					System.out.println("Directories are created!");
				}
			}
			File src = new File("C:/Users/Abhi/workspace/Amusing/WebContent/sampletest/" + track);

			File dest = new File(home + "/Downloads/Amuse/" + track);

			dest.createNewFile();

			InputStream inin = new FileInputStream(src);
			OutputStream inout = new FileOutputStream(dest);
			byte[] buffer = new byte[1024];
			int length;
			//copy the file content in bytes 
			while ((length = inin.read(buffer)) > 0) {
				inout.write(buffer, 0, length);
			}
			out.println("File downloaded successfully to " + home + "\\Downloads\\Amuse");
			inin.close();
			inout.flush();
			inout.close();
		} catch (Exception e) {
			System.out.println("Error" + e);
		}
	%>
</center>
</body>
</html>