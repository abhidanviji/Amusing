<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amusing</title>
<link rel="stylesheet" type="text/css" href="navigationdrop.css">
<link rel="stylesheet" type="text/css" href="collection.css">
</head>
</body>
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

<header>
<div class="nav">
	<ul>
		<li class="overview"><a href="#">Overview</a></li>
		<li class="Likes"><a href="playlist.jsp">Playlists</a></li>
		<li class="about"><a href="#">Albums</a></li>
		<li class="History"><a href="#">History</a></li>
		<li class="Friends"><a href="#">Friends</a>

			<ul class = "friend">
				<li class = "frnd"><a href="friendreq.jsp">Request Friend</a></li>
				<li class = "frnd"><a href="message.jsp">Manage Friends</a></li>
				<li class = "frnd"><a href="manage.jsp">View Friends</a></li>
				
			</ul>
		</li>

	</ul>
</div>
</header>

</body>
</html>