<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amusing</title>
<link rel="stylesheet" type="text/css" href="navigationdrop.css">
</head>
<body>
	<div class="wrapper">

		<div class="top"></div>

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
	<br><br>
	<center>

		<%@ page
			import="java.io.*,java.util.*, javax.servlet.*,java.sql.*,javax.sql.*"%>
		<%@ page import="javax.servlet.http.*"%>
		<%@ page import="org.apache.commons.fileupload.*"%>
		<%@ page import="org.apache.commons.fileupload.disk.*"%>
		<%@ page import="org.apache.commons.fileupload.servlet.*"%>
		<%@ page import="org.apache.commons.io.output.*"%>

		<%
			File file;
			String name = "test";
			String genre = "NA";
			int maxFileSize = 5000 * 1024;
			int maxMemSize = 5000 * 1024;
			ServletContext context = pageContext.getServletContext();

			String filePath = "C:\\Users\\Abhi\\workspace\\Amusing\\WebContent\\sampletest";

			// Verify the content type
			String contentType = request.getContentType();
			if ((contentType.indexOf("multipart/form-data") >= 0)) {
				try {

					List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
					out.println("<html>");
					out.println("<head>");
					out.println("<title>JSP File upload</title>");
					out.println("</head>");
					out.println("<body>");
					for (FileItem item : multiparts) {
						if (!item.isFormField()) {
							name = new File(item.getName()).getName();
							item.write(new File(filePath + File.separator + name));
						} else if (item.isFormField()) {

							if (item.getFieldName().equals("genre")) {
								genre = item.getString();
								System.out.println("genre - " + genre);

							}

						}
					}

					out.println("File Uploaded - " + name + "<br>");
					out.println("</body>");
					out.println("</html>");

					Class.forName("com.mysql.jdbc.Driver");
					java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root",
							"oracle");
					String query = " insert into usertrack (username,trackname)values (?,?)";
					String query1 = " insert into tracks (trackname,genre)values (?,?)";
					String query2 = " insert into notifications (username,noti)values (?,?)";
					PreparedStatement preparedStmt = con.prepareStatement(query);
					preparedStmt.setString(1, (String) session.getAttribute("userId"));
					preparedStmt.setString(2, name);
					preparedStmt.execute();
					PreparedStatement preparedStmt1 = con.prepareStatement(query1);
					preparedStmt1.setString(1, name);
					preparedStmt1.setString(2, genre);
					preparedStmt1.execute();
					PreparedStatement preparedStmt2 = con.prepareStatement(query2);
					preparedStmt2.setString(1, (String) session.getAttribute("userId"));
					preparedStmt2.setString(2, "Uploaded " + name);
					preparedStmt2.execute();
					con.close();

				} catch (Exception ex) {
					System.out.println(ex);
				}
			} else {
				out.println("<html>");
				out.println("<head>");
				out.println("<title>Servlet upload</title>");
				out.println("</head>");
				out.println("<body>");
				out.println("<p>No file uploaded</p>");
				out.println("</body>");
				out.println("</html>");
			}
		%>
	</center>

</body>
</html>