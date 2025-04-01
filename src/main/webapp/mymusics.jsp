<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="User" type="br.com.jc.streamusic.model.User" scope="session" />
<jsp:useBean id="ListMusics" type="java.util.List" scope="request" />
<jsp:useBean id="Playlist" type="br.com.jc.streamusic.model.Playlist" scope="session" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minhas Músicas - MusicStream</title>
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
        
        /* Estilização para o grid de músicas */
        .music-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }
        
        .music-card {
            background-color: #181818;
            border-radius: 8px;
            padding: 15px;
            transition: background-color 0.3s;
            cursor: pointer;
        }
        
        .music-card:hover {
            background-color: #282828;
        }
        
        .music-card img {
            width: 100%;
            aspect-ratio: 1/1;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        
        .music-card h3 {
            font-size: 16px;
            margin-bottom: 8px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .music-card h3 a {
            color: #ffffff;
            text-decoration: none;
        }
        
        .music-card h3 a:hover {
            color: #ffad08;
        }
        
        .music-card p {
            font-size: 14px;
            color: #b3b3b3;
            margin-bottom: 5px;
        }
        
        .music-actions {
            margin-top: 10px;
            display: flex;
            justify-content: space-between;
        }
        
        .music-actions button {
            background: none;
            border: none;
            color: #b3b3b3;
            cursor: pointer;
            font-size: 18px;
        }
        
        .music-actions button:hover {
            color: #ffffff;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">MusicStream</div>
            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home">Início</a></li>
                    <li><a href="${pageContext.request.contextPath}/newplaylist">Nova Playlist</a></li>
                    <li><a href="${pageContext.request.contextPath}/myplaylists">Minhas Playlists</a></li>
                    <li><a href="${pageContext.request.contextPath}/newmusic">Upload Música</a></li>
                    <li><a href="#">Logout</a></li>
                    <li><a href="#">Olá, ${User.name}</a></li>
                </ul>
            </nav>
        </header>
        
        <h1 class="page-title">Minhas Músicas</h1>
            <div class="music-grid">
                <c:forEach var="music" items="${ListMusics}">
                    <div class="music-card">
                        <h3>
                            <a href="${pageContext.request.contextPath}/musicdetails?id=${music.id}">
                                ${music.title}
                            </a>
                        </h3>
                        <p>Artista: ${music.artist}</p>
                        <p>Álbum: ${music.album}</p>
                        <p>Estilo:
                        	<c:if test="${music.style == 2}">Pop</c:if>
                        	<c:if test="${music.style == 3}">Rock</c:if>
                        	<c:if test="${music.style == 4}">Hip Hop</c:if>
                        	<c:if test="${music.style == 5}">Samba</c:if>
                        	<c:if test="${music.style == 6}">Jazz</c:if>
                        	<c:if test="${music.style == 7}">Clássica</c:if>
                        	<c:if test="${music.style == 8}">Eletrônica</c:if>
                        	<c:if test="${music.style == 9}">Reggae</c:if>
                        	<c:if test="${music.style == 10}">Funk</c:if>
                        	<c:if test="${music.style == 11}">Metal</c:if>
                        	<c:if test="${music.style == 12}">Outro</c:if>
                        </p>
                        <div class="music-actions">
                        	<%
                        		String idPlaylist = Integer.toString(Playlist.getId());
                        	%>
                        	<button onclick="location.href='${pageContext.request.contextPath}/includeplaylist?playlistId=${idPlaylist}&musicId=${music.id}'" title="Adicionar à Playlist">➕</button>
                            <button onclick="playMusic('${music.id}')" title="Reproduzir">▶</button>
                            <button onclick="location.href='${pageContext.request.contextPath}/removemusic?id=${music.id}'" title="Remover">✕</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
    </div>
    
    <script>
        function playMusic(musicId) {
            // Implementar a lógica para reproduzir a música
            console.log("Reproduzindo música: " + musicId);
        }
    </script>
    <script>
	    function addMusic(idPlaylist, idMusic) {
	    	alert("Recebi os valores Playlist = "+idPlaylist+" Musica = "+idMusic);
	    }
    </script>
</body>
</html>
