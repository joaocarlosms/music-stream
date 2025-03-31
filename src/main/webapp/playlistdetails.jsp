<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="User" type="br.com.jc.streamusic.model.User" scope="session" />
<jsp:useBean id="Playlist" type="br.com.jc.streamusic.model.Playlist" scope="session" />
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes da Playlist - MusicStream</title>
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
        
        .playlist-header {
            display: flex;
            margin-bottom: 40px;
            align-items: center;
        }
        
        /* Wrapper para posicionar o ícone na capa */
        .playlist-cover-wrapper {
            position: relative;
        }
        
        .playlist-cover {
            width: 250px;
            height: 250px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 30px;
        }
        
        /* Ícone de player sobreposto na capa */
        .playlist-play-icon {
            position: absolute;
            top: calc(50% - 30px);
            left: calc(50% - 30px);
            background: rgba(0, 0, 0, 0.6);
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 28px;
            color: #fff;
            transition: background 0.3s;
        }
        
        .playlist-play-icon:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        
        .playlist-info {
            flex-grow: 1;
        }
        
        .playlist-title {
            font-size: 36px;
            margin-bottom: 10px;
        }
        
        .playlist-description {
            font-size: 16px;
            color: #b3b3b3;
            margin-bottom: 20px;
            max-width: 600px;
        }
        
        .playlist-meta {
            display: flex;
            color: #b3b3b3;
            font-size: 14px;
            margin-bottom: 20px;
        }
        
        .playlist-meta span {
            margin-right: 20px;
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
            margin-right: 10px;
        }
        
        .btn:hover {
            background-color: #fad928;
        }
        
        .btn-outline {
            background-color: transparent;
            border: 1px solid #ffffff;
        }
        
        .btn-outline:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .songs-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }
        
        .songs-table th {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #282828;
            color: #b3b3b3;
            font-weight: normal;
        }
        
        .songs-table td {
            padding: 12px 10px;
            border-bottom: 1px solid #282828;
        }
        
        .songs-table tr:hover {
            background-color: rgba(255, 255, 255, 0.05);
        }
        
        .song-title {
            font-weight: bold;
        }
        
        .song-artist {
            color: #b3b3b3;
        }
        
        .song-actions {
            text-align: right;
        }
        
        .song-actions button {
            background: none;
            border: none;
            color: #b3b3b3;
            cursor: pointer;
            margin-left: 10px;
        }
        
        .song-actions button:hover {
            color: #ffffff;
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
        
        .song-number {
            width: 40px;
            text-align: right;
            color: #b3b3b3;
        }
        
        .song-duration {
            width: 60px;
            text-align: right;
            color: #b3b3b3;
        }
        
        .add-song-section {
            margin-top: 40px;
            padding: 20px;
            background-color: #181818;
            border-radius: 8px;
        }
        
        .section-title {
            font-size: 24px;
            margin-bottom: 20px;
        }
        
        .empty-message {
            text-align: center;
            padding: 40px;
            color: #b3b3b3;
        }
        
        .empty-message p {
            margin-bottom: 20px;
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
        
        <div class="playlist-header">
            <div class="playlist-cover-wrapper">
                <img class="playlist-cover" src="https://i.pinimg.com/236x/cc/d8/72/ccd872e52df7be65f55145fd6a2f575a.jpg" alt="${Playlist.title}">
                <div class="playlist-play-icon" onclick="playPlaylist()" title="Reproduzir Playlist">▶</div>
            </div>
            <div class="playlist-info">
                <h1 class="playlist-title">${Playlist.title}</h1>
                <div class="playlist-meta">
                    <span>Criado por: ${User.name}</span>
                    <span>${fn:length(Playlist.musics)} músicas</span>
                    <span>2h 15min</span>
                </div>
                <div class="buttons">
                    <a href="${pageContext.request.contextPath}/editplaylist?id=${Playlist.id}" class="btn">Editar Playlist</a>
                    <a href="${pageContext.request.contextPath}/deleteplaylist?id=${Playlist.id}" class="btn btn-outline" onclick="return confirm('Tem certeza que deseja excluir esta playlist?')">Excluir Playlist</a>
                </div>
            </div>
        </div>
        
        <c:if test="${empty Playlist.musics}">
            <div class="empty-message">
                <p>Esta playlist ainda não tem músicas</p>
                <a href="${pageContext.request.contextPath}/recovermusics" class="btn">Adicionar Músicas</a>
            </div>
        </c:if>
        
        <c:if test="${not empty Playlist.musics}">
            <table class="songs-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Título</th>
                        <th>Artista</th>
                        <th>Álbum</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="music" items="${Playlist.musics}" varStatus="loop">
                        <tr>
                            <td class="song-number">${loop.index + 1}</td>
                            <td>
                                <div class="song-title">${music.title}</div>
                            </td>
                            <td>${music.artist}</td>
                            <td>${music.album}</td>
                            <td class="song-actions">
                                <button onclick="playMusic('${music.id}')" title="Reproduzir">▶</button>
                                <button onclick="location.href='${pageContext.request.contextPath}/removesong?playlistId=${Playlist.id}&musicId=${music.id}'" title="Remover da playlist">✕</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <div class="add-song-section">
                <h2 class="section-title">Adicionar mais músicas</h2>
                <a href="${pageContext.request.contextPath}/recovermusics?idplaylist=${Playlist.id}" class="btn">Adicionar Músicas</a>
            </div>
        </c:if>
    </div>
    
    <script>
        function playMusic(musicId) {
            // Implementar a lógica para reproduzir a música individualmente
            console.log("Reproduzindo música: " + musicId);
        }
        
        function playPlaylist() {
            // Implementar a lógica para reproduzir todas as músicas da playlist
            console.log("Reproduzindo a playlist inteira: ${Playlist.title}");
        }
    </script>
</body>
</html>