<jsp:useBean id="User" type="br.com.jc.streamusic.model.User" scope="session" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MusicStream - Seu app de música</title>
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
        
        .hero {
            padding: 60px 0;
            text-align: center;
        }
        
        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }
        
        .hero p {
            font-size: 18px;
            color: #b3b3b3;
            margin-bottom: 30px;
        }
        
        .categories {
            margin: 40px 0;
        }
        
        .category-title {
            font-size: 24px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #282828;
        }
        
        .music-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
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
            border-radius: 4px;
            margin-bottom: 15px;
        }
        
        .music-card h3 {
            font-size: 16px;
            margin-bottom: 8px;
        }
        
        .music-card p {
            font-size: 14px;
            color: #b3b3b3;
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
        
        .player-controls button:hover {
            color: #ffad08;
        }
        
        .progress-bar {
            flex-grow: 1;
            height: 4px;
            background-color: #ffad08;
            margin: 0 20px;
            border-radius: 2px;
            position: relative;
        }
        
        .progress {
            width: 30%;
            height: 100%;
            background-color: #ffad08;
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
                    <li><a href="${pageContext.request.contextPath}/newplaylist">Nova Playlist</a></li>
                    <li><a href="${pageContext.request.contextPath}/myplaylists">Minhas Playlists</a></li>
                    <li><a href="#">Upload Música</a></li>
                    <li><a href="#">Logout</a></li>
                    <li><a href="#">Olá, ${User.name}</a></li>
                </ul>
            </nav>
        </header>
        
        <section class="hero">
            <h1>Sua música, seu momento</h1>
            <p>Milhões de músicas para você descobrir e curtir</p>
        </section>
        
        <section class="categories">
            <h2 class="category-title">Recomendado para você</h2>
            <div class="music-grid">
                
                <div class="music-card">
                    <img src="https://via.placeholder.com/200" alt="Álbum 1">
                    <h3>Nome da Música 1</h3>
                    <p>Artista 1</p>
                </div>
                
                <div class="music-card">
                    <img src="https://via.placeholder.com/200" alt="Álbum 2">
                    <h3>Nome da Música 2</h3>
                    <p>Artista 2</p>
                </div>
                
                <div class="music-card">
                    <img src="https://via.placeholder.com/200" alt="Álbum 3">
                    <h3>Nome da Música 3</h3>
                    <p>Artista 3</p>
                </div>
                
                <div class="music-card">
                    <img src="https://via.placeholder.com/200" alt="Álbum 4">
                    <h3>Nome da Música 4</h3>
                    <p>Artista 4</p>
                </div>
                
                <div class="music-card">
                    <img src="https://via.placeholder.com/200" alt="Álbum 5">
                    <h3>Nome da Música 5</h3>
                    <p>Artista 5</p>
                </div>
            </div>
        </section>
        
        <section class="categories">
            <h2 class="category-title">Tendências</h2>
            <div class="music-grid">
                <div class="music-card">
                    <img src="https://via.placeholder.com/200" alt="Tendência 1">
                    <h3>Música Tendência 1</h3>
                    <p>Artista Popular 1</p>
                </div>
                
                <div class="music-card">
                    <img src="https://via.placeholder.com/200" alt="Tendência 2">
                    <h3>Música Tendência 2</h3>
                    <p>Artista Popular 2</p>
                </div>
                
                <div class="music-card">
                    <img src="https://via.placeholder.com/200" alt="Tendência 3">
                    <h3>Música Tendência 3</h3>
                    <p>Artista Popular 3</p>
                </div>
                
                <div class="music-card">
                    <img src="https://via.placeholder.com/200" alt="Tendência 4">
                    <h3>Música Tendência 4</h3>
                    <p>Artista Popular 4</p>
                </div>
                
                <div class="music-card">
                    <img src="https://via.placeholder.com/200" alt="Tendência 5">
                    <h3>Música Tendência 5</h3>
                    <p>Artista Popular 5</p>
                </div>
            </div>
        </section>
    </div>
    
    <div class="player">
        <div class="now-playing">
            <h3>Música Atual</h3>
            <p>Artista</p>
        </div>
        
        <div class="player-controls">
            <button>⏮</button>
            <button>▶</button>
            <button>⏭</button>
        </div>
        
        <div class="progress-bar">
            <div class="progress"></div>
        </div>
        
        <div class="volume-control">
            <button>🔊</button>
        </div>
    </div>
</body>
</html>