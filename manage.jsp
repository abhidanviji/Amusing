<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("username");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "sys";
	String userId = "root";
	String password = "oracle";

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<h2 align="center">
	<font><strong>List of Friends</strong></font>
</h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
	<tr>

	</tr>
	<tr bgcolor="#A52A2A">

		<td><b>Friends</b></td>

	</tr>
	<%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "SELECT Friendto from friend where status=1";

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
	%>
	<tr bgcolor="#DEB887">

		<td><%=resultSet.getString("Friendto")%></td>


	</tr>

	<%
		}

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</table>