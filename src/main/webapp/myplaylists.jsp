<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="User" type="br.com.jc.streamusic.model.User"
	scope="session" />
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Minhas Playlists - MusicStream</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	background-color: #121212;
	color: #ffffff;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 0;
	border-bottom: 1px solid #282828;
}

.logo {
	font-size: 24px;
	font-weight: bold;
	color: #ffad08;
}

nav ul {
	display: flex;
	list-style: none;
}

nav ul li {
	margin-left: 20px;
}

nav ul li a {
	color: #ffffff;
	text-decoration: none;
	transition: color 0.3s;
}

nav ul li a:hover {
	color: #ffad08;
}

.page-title {
	font-size: 32px;
	margin: 40px 0 20px;
}

.playlist-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 20px;
	margin-bottom: 40px;
}

.playlist-card {
	background-color: #181818;
	border-radius: 8px;
	padding: 15px;
	transition: background-color 0.3s;
	cursor: pointer;
}

.playlist-card:hover {
	background-color: #282828;
}

.playlist-card img {
	width: 100%;
	aspect-ratio: 1/1;
	object-fit: cover;
	border-radius: 4px;
	margin-bottom: 15px;
}

.playlist-card h3 {
	font-size: 16px;
	margin-bottom: 8px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.playlist-card p {
	font-size: 14px;
	color: #b3b3b3;
}

.playlist-stats {
	display: flex;
	justify-content: space-between;
	font-size: 12px;
	color: #b3b3b3;
	margin-top: 10px;
}

.btn {
	background-color: #ffad08;
	color: white;
	border: none;
	padding: 12px 24px;
	border-radius: 50px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
	text-decoration: none;
	display: inline-block;
	margin-bottom: 30px;
}

.btn:hover {
	background-color: #fad928;
}

.create-playlist {
	border: 2px dashed #535353;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	padding: 20px;
}

.create-playlist-icon {
	font-size: 32px;
	margin-bottom: 10px;
}

.section-title {
	font-size: 24px;
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid #282828;
}

.player {
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: #181818;
	padding: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-top: 1px solid #282828;
}

.player-controls {
	display: flex;
	align-items: center;
}

.player-controls button {
	background: none;
	border: none;
	color: #ffffff;
	font-size: 24px;
	cursor: pointer;
	margin: 0 10px;
}

.progress-bar {
	flex-grow: 1;
	height: 4px;
	background-color: #535353;
	margin: 0 20px;
	border-radius: 2px;
	position: relative;
}

.progress {
	width: 30%;
	height: 100%;
	background-color: #1DB954;
	border-radius: 2px;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<div class="logo">MusicStream</div>
			<nav>
				<ul>
				<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/newplaylist">Nova
							Playlist</a></li>
					<li><a href="${pageContext.request.contextPath}/myplaylists">Minhas
							Playlists</a></li>
					<li><a href="#">Upload Música</a></li>
					<li><a href="#">Logout</a></li>
					<li><a href="#">Olá, ${User.name}</a></li>
				</ul>
			</nav>
		</header>

		<h1 class="page-title">Minhas Playlists</h1>
		<a href="${pageContext.request.contextPath}/newplaylist" class="btn">+
			Nova Playlist</a>

		<c:if test="${empty User.playlist}">
			<p>Você ainda não possui playlists cadastradas.</p>
		</c:if>
		<c:if test="${not empty User.playlist}">
			<div class="playlist-grid">
				<c:forEach var="playlist" items="${User.playlist}">
					<div class="playlist-card">
						<img src="https://i.pinimg.com/236x/cc/d8/72/ccd872e52df7be65f55145fd6a2f575a.jpg" alt="Playlist">
						<h3>${playlist.title}</h3>
						<div class="playlist-stats">
							<span>${fn:length(playlist.musics)}</span> 
							<span>2h 15min</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>
</html>