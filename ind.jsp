<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amusing audio player</title>
<link rel="stylesheet" href="main.css" />
</head>
<body>

	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%try{
		String name = request.getParameter("track");
		System.out.println(name);
        String pagecall = request.getParameter("page");
		if (pagecall.equals("navigationdrop.jsp")) {
			pagecall = "songupdate.jsp";
		} 
		 
		else
			System.out.println(name);
		int lc = 0;
		int dc = 0;
		int count = 0;
		int lcol = 0,dcol = 0;
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "oracle");

		Statement stat = con.createStatement();
		ResultSet res = stat.executeQuery("SELECT * FROM history WHERE TIMESTAMPDIFF(SECOND, ts, NOW()) < 10 and track = '"+name+"';");
		
		if(!res.next()){
			
		
		
		String sql1 = " insert into history (user, track) values (?, ?)";
		PreparedStatement preparedStmt1 = con.prepareStatement(sql1);
		preparedStmt1.setString(1, (String) session.getAttribute("userId"));
		preparedStmt1.setString(2, name);
		preparedStmt1.execute();
		}
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select likes,dislikes from tracks where trackname = '" + name + "';");
		if (rs.next()) {
			lc = rs.getInt("likes");
			dc = rs.getInt("dislikes");
		}
		
		ResultSet set = st.executeQuery("select ld from ldstatus where track = '" + name + "' and username = '" + (String)session.getAttribute("userId") + "';");
		if (set.next()) {
			if(set.getInt(1) == 1){
				lcol = 1;
			}else{
				dcol = 1;
			}
		}
	%>


	<div id="wrapper">

		<audio id="mytrack" ontimeupdate='updateTrackTime(this);'> <source
			src="<%=name%>"></audio>

		<nav>
		<div id="waveform"></div>
		<div id="defaultBar">
			<div id="progressBar"></div>
		</div>
		<div id="buttons">
			&nbsp&nbsp&nbsp&nbsp
			<button type="button" id="playButton"></button>
			&nbsp&nbsp
			<button type="button" id="rwdButton"></button>
			<button type="button" id="fwdButton"></button>
			<span id="currentTime">0:00</span>/<span id="fullDuration">0:00</span>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<button type="button" id="muteButton"></button>
			<input id="volumeslider" type="range" min="0" max="100" value="100"
				step="1">
		</div>
		<div id="extras">
			<br>
			<form action=<%=pagecall%> method=post>
				&nbsp&nbsp&nbsp&nbsp
				<%if(lcol == 1){ %>
				<input type="text" id="likeButton" name="count"
					style="color: transparent; text-shadow: 0 0 0; background-image: url(../images/lik.png);"
					 /> 
					 <input class="count" id="likecount"
					type="text" name="likecount" value=<%=lc%>>
					
					
				<%}else{ %>
				<input type="text" id="likeButton" name="count"
					style="color: transparent; text-shadow: 0 0 0;"
					onclick="myLikeFunction();" /> 
					<input class="count" id="likecount"
					type="text" name="likecount" value=<%=lc%>>
					
					<%} %>
					
				
				&nbsp&nbsp&nbsp 
				<%if(dcol == 1) {%>
				
				
				<input type="text" id="dislikeButton" name="count"
					style="color: transparent; text-shadow: 0 0 0; background-image: url(../images/dis.png);"
					/> <input class="count"
					id="dislikecount" type="text" name="dislikecount" value=<%=dc%>>
				
				<%}else{ %>
				
					
					<input type="text" id="dislikeButton" name="count"
					style="color: transparent; text-shadow: 0 0 0;"
					onclick="myDislikeFunction();" /> <input class="count"
					id="dislikecount" type="text" name="dislikecount" value=<%=dc%>>
				
				
				<%} %>
				<input type="hidden" name="trackname" value=<%=name%>></input>
		</div>
		<div id="greyBar"></div>
		<div id="blackBar"></div>
		<div class="fb-comments"
			data-href="http://localhost:8070/Amusing/mycode/ind.jsp/<%=name%>"
			data-width="640" data-numposts="3">
		</nav>
	</div>

	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=899850216811528";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>




	<center>
		<input id="but" type="submit" value="Back" />
		</form>
		<br> <br>
		<form action="download.jsp">
			<input type="hidden" name="trk" id="trk" value=<%=name%>> <input
				type="hidden" name="lc" id="lc" value=<%=lc%>> <input
				type="hidden" name="dc" id="dc" value=<%=dc%>> <input
				id="but" type="submit" value="Download" />
		</form>
		<br>
		<form action="report.jsp">
			<input type="hidden" name="trk" id="trk" value=<%=name%>> <input
				id="but" type="submit" value="Report" />
		</form>
		<%con.close(); 
		}catch(Exception e){
		}
		%>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<script type="text/javascript" src="controls.js"></script>
		<div id="fb-root"></div>
		<script>
			(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id))
					return;
				js = d.createElement(s);
				js.id = id;
				js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=899850216811528";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		</script>
		<div class="fb-share-button"
			data-href="https://localhost:8091/Amusing/sampletest/titlecard.html"
			data-layout="button" data-size="small" data-mobile-iframe="true">
			<a class="fb-xfbml-parse-ignore" target="_blank"
				href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Flocalhost%3A8091%2FAmusing%2Fsampletest%2Ftitlecard.html&amp;src=sdkpreparse">Share</a>
		</div>
	</center>
</body>
</html>