<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.io.*,java.util.*, javax.servlet.*,java.sql.*,javax.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
   File file ;
String name = "test";
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      try{
	   List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	   out.println("<html>");
       out.println("<head>");
       out.println("<title>JSP File upload</title>");  
       out.println("</head>");
       out.println("<body>");
       for(FileItem item : multiparts){
           if(!item.isFormField()){
                name = new File(item.getName()).getName();
               item.write( new File(filePath + File.separator + name));
           }
       }
 
            
         out.println("File Uploaded - "+name+"<br>");
         out.println("</body>");
         out.println("</html>");
         
         Class.forName("com.mysql.jdbc.Driver");
 		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");
 		String query = " insert into usertrack (username,trackname)values (?,?)";
 		String query1 = " insert into tracks (trackname)values (?)";
 		PreparedStatement preparedStmt = con.prepareStatement(query);
 		preparedStmt.setString(1, (String)session.getAttribute("userId"));
 		preparedStmt.setString(2, name);
 		preparedStmt.execute();
 		PreparedStatement preparedStmt1 = con.prepareStatement(query1);
 		preparedStmt1.setString(1, name);
 		preparedStmt1.execute();
 		con.close();

      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
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
</body>
</html>