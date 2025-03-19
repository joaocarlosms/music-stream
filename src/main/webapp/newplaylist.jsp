<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Playlist - MusicStream</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Gotham', 'Montserrat', 'Helvetica Neue', Arial, sans-serif;
        }
        
        body {
            background-color: #121212;
            min-height: 100vh;
            color: #fff;
        }
        
        .sidebar {
            width: 240px;
            background-color: #000;
            height: 100vh;
            position: fixed;
            padding: 24px 16px;
        }
        
        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .logo .music-icon {
            font-size: 28px;
            color: #ffad08;
            margin-right: 10px;
        }
        
        .logo h1 {
            font-size: 24px;
            font-weight: 700;
            letter-spacing: -0.5px;
        }
        
        .nav-links {
            list-style: none;
        }
        
        .nav-links li {
            margin-bottom: 16px;
        }
        
        .nav-links a {
            color: #b3b3b3;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            display: flex;
            align-items: center;
            transition: color 0.2s;
        }
        
        .nav-links a:hover {
            color: #fff;
        }
        
        .nav-links a .icon {
            margin-right: 15px;
            font-size: 20px;
        }
        
        .divider {
            border-top: 1px solid #282828;
            margin: 24px 0;
        }
        
        .main-content {
            margin-left: 240px;
            padding: 30px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .user-menu {
            display: flex;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 6px 12px;
            border-radius: 30px;
            cursor: pointer;
        }
        
        .user-avatar {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background-color: #535353;
            margin-right: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }
        
        .user-name {
            font-size: 14px;
            font-weight: 600;
            margin-right: 10px;
        }
        
        .page-title {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 30px;
        }
        
        .create-playlist-form {
            background-color: #181818;
            border-radius: 8px;
            padding: 30px;
            max-width: 600px;
        }
        
        .form-group {
            margin-bottom: 20px;
            max-width: 400px;
        }
        
        .form-group label {
            display: block;
            color: #fff;
            margin-bottom: 10px;
            font-weight: 500;
            font-size: 14px;
        }
        
        .form-label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
            color: #fff;
        }
        
        .form-group input {
            width: 100%;
            padding: 14px;
            background-color: #282828;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            transition: box-shadow 0.3s;
        }
        
        .form-group input:focus {
            outline: none;
            box-shadow: 0 0 0 2px #fad928;
        }
        
        .form-group textarea {
            width: 100%;
            padding: 14px;
            background-color: #282828;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            resize: vertical;
            min-height: 100px;
            transition: box-shadow 0.3s;
        }
        
        .form-group textarea:focus {
            outline: none;
            box-shadow: 0 0 0 2px #fad928;
        }
        
        .upload-cover {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 180px;
            height: 180px;
            background-color: #282828;
            border-radius: 8px;
            overflow: hidden;
            position: relative;
            cursor: pointer;
            margin-bottom: 20px;
        }
        
        .upload-cover input {
            opacity: 0;
            position: absolute;
            width: 100%;
            height: 100%;
            cursor: pointer;
            z-index: 2;
        }
        
        .upload-icon {
            font-size: 40px;
            color: #b3b3b3;
            margin-bottom: 10px;
        }
        
        .upload-text {
            color: #b3b3b3;
            font-size: 14px;
            text-align: center;
        }
        
        .cover-preview {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: none;
        }
        
        /* Novos estilos para os botões de rádio */
        .radio-group {
            display: flex;
            gap: 15px;
        }
        
        .radio-option {
            display: flex;
            align-items: center;
            background-color: #282828;
            border-radius: 8px;
            padding: 10px 15px;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        
        .radio-option:hover {
            background-color: #333333;
        }
        
        .radio-option input[type="radio"] {
            appearance: auto;
            width: auto;
            height: auto;
            margin-right: 8px;
            cursor: pointer;
        }
        
        .radio-option label {
            cursor: pointer;
            margin-bottom: 0;
            color: #b3b3b3;
        }
        
        input[type="radio"]:checked + label {
            font-weight: bold;
            color: #ffad08;
        }
        
        .btn {
            display: inline-block;
            padding: 14px 32px;
            border: none;
            border-radius: 500px;
            background-color: #ffad08;
            color: #000;
            font-size: 16px;
            font-weight: 700;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn:hover {
            background-color: #fad928;
            transform: scale(1.02);
        }
        
        .secondary-btn {
            display: inline-block;
            padding: 14px 32px;
            border: 1px solid #b3b3b3;
            border-radius: 500px;
            background-color: transparent;
            color: #fff;
            font-size: 16px;
            font-weight: 700;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s;
            margin-right: 10px;
        }
        
        .secondary-btn:hover {
            border-color: #fff;
        }
        
        .form-buttons {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }
        
        .error-message {
            background-color: #e22134;
            color: white;
            padding: 12px;
            border-radius: 4px;
            margin-bottom: 20px;
            font-size: 14px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <div class="music-icon">♪</div>
            <h1>MusicStream</h1>
        </div>
        
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/newplaylist">Nova Playlist</a></li>
            <li><a href="${pageContext.request.contextPath}/myplaylists">Minhas Playlists</a></li>
            <li><a href="#">Upload Música</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
        
        <div class="divider"></div>
    </div>
    
    <div class="main-content">
        <div class="header">
            <div></div>
            <div class="user-menu">
                <div class="user-name">Olá, ${User.name}</div>
                <div class="dropdown-icon">▼</div>
            </div>
        </div>
        
        <h1 class="page-title">Criar uma playlist</h1>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <div class="create-playlist-form">
            <form action="${pageContext.request.contextPath}/effectplaylist" method="post" enctype="multipart/form-data">
                <div style="display: flex; gap: 30px; margin-bottom: 30px;">
                    <div class="upload-cover">
                        <input type="file" id="cover" name="playlistCover" accept="image/*" onchange="previewImage(this);">
                        <span class="upload-icon">🖼️</span>
                        <p class="upload-text">Escolher imagem</p>
                        <img id="coverPreview" class="cover-preview" src="#" alt="Capa da playlist">
                    </div>
                    
                    <div style="flex-grow: 1;">
                        <div class="form-group">
                            <label for="titulo">Título da playlist *</label>
                            <input type="text" id="titulo" name="playlistTitle" placeholder="Minha playlist" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="descricao">Descrição</label>
                            <textarea id="descricao" name="playlistDescription" placeholder="Adicione uma descrição opcional..."></textarea>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Privacidade</label>
                    <div class="radio-group">
                        <div class="radio-option">
                            <input type="radio" id="publica" name="privacy" value="public" checked>
                            <label for="publica">Pública</label>
                        </div>
                
                        <div class="radio-option">
                            <input type="radio" id="privada" name="privacy" value="private">
                            <label for="privada">Privada</label>
                        </div>
                    </div>
                    <p style="margin-top: 8px; font-size: 12px; color: #b3b3b3;">
                        Qualquer pessoa pode encontrar playlists públicas. Apenas você pode ver playlists privadas.
                    </p>
                </div>
                
                <div class="form-buttons">
                    <button type="button" class="secondary-btn" onclick="location.href='${pageContext.request.contextPath}/biblioteca'">Cancelar</button>
                    <button type="submit" class="btn">Criar</button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                
                reader.onload = function(e) {
                    var preview = document.getElementById('coverPreview');
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                    
                    var uploadIcon = document.querySelector('.upload-icon');
                    var uploadText = document.querySelector('.upload-text');
                    uploadIcon.style.display = 'none';
                    uploadText.style.display = 'none';
                }
                
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</body>
</html>