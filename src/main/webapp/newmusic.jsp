<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload de Música - MusicStream</title>
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
        
        .upload-music-form {
            background-color: #181818;
            border-radius: 8px;
            padding: 30px;
            max-width: 600px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            color: #fff;
            margin-bottom: 10px;
            font-weight: 500;
            font-size: 14px;
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
            box-shadow: 0 0 0 2px #ffad08;
        }
        
        .form-group select {
            width: 100%;
            padding: 14px;
            background-color: #282828;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 14px center;
            background-size: 16px;
            transition: box-shadow 0.3s;
        }
        
        .form-group select:focus {
            outline: none;
            box-shadow: 0 0 0 2px #ffad08;
        }
        
        .custom-file-upload {
		    position: relative;
		    width: 100%;
		    margin-bottom: 10px;
		}
		
		.custom-file-upload input[type="file"] {
		    position: absolute;
		    width: 100%;
		    height: 100%;
		    opacity: 0;
		    cursor: pointer;
		    z-index: 2;
		}
		
		.file-upload-label {
		    display: flex;
		    align-items: center;
		    gap: 10px;
		    padding: 14px;
		    background-color: #282828;
		    border-radius: 4px;
		    cursor: pointer;
		    transition: all 0.3s ease;
		}
		
		.file-upload-label:hover {
		    background-color: #333;
		}
		
		.upload-icon {
		    font-size: 20px;
		    color: #ffad08;
		}
		
		.upload-text {
		    font-weight: 600;
		    color: #b3b3b3;
		}
		
		.selected-file-name {
		    color: #b3b3b3;
		    margin-left: auto;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    max-width: 200px;
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
            display: ${errorSTR != null ? 'block' : 'none'};
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
            <li><a href="${pageContext.request.contextPath}/home">Início</a></li>
            <li><a href="${pageContext.request.contextPath}/newplaylist">Nova Playlist</a></li>
            <li><a href="${pageContext.request.contextPath}/myplaylists">Minhas Playlists</a></li>
            <li><a href="${pageContext.request.contextPath}/uploadmusic">Upload Música</a></li>
            <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
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
        
        <h1 class="page-title">Upload de Música</h1>
        
        <div class="error-message">
            <h1>${errorSTR}</h1>
        </div>
        
        <div class="upload-music-form">
            <form action="${pageContext.request.contextPath}/musicupload" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="titulo">Título da música:</label>
                    <input type="text" id="titulo" name="musicTitle" placeholder="Nome da música" required>
                </div>
                
                <div class="form-group">
                    <label for="artista">Artista:</label>
                    <input type="text" id="artista" name="musicArtist" placeholder="Nome do artista" required>
                </div>
                
                <div class="form-group">
                    <label for="album">Álbum:</label>
                    <input type="text" id="album" name="musicAlbum" placeholder="Nome do álbum">
                </div>
                
                <div class="form-group">
                    <label for="estilo">Estilo:</label>
                    <select id="estilo" name="musicStyle" required>
                        <option value="1">Selecione um estilo</option>
                        <option value="2">Pop</option>
                        <option value="3">Rock</option>
                        <option value="4">Hip Hop</option>
                        <option value="5">Samba</option>
                        <option value="6">Jazz</option>
                        <option value="7">Clássica</option>
                        <option value="8">Eletrônica</option>
                        <option value="9">Reggae</option>
                        <option value="10">Funk</option>
                        <option value="11">Metal</option>
                        <option value="12">Outro</option>
                    </select>
                </div>
                
                <div class="form-group">
				    <label for="musicFile">Arquivo da música:</label>
				    <div class="custom-file-upload">
				        <input type="file" id="musicFile" name="musicFile" accept="audio/*" required>
				        <label for="musicFile" class="file-upload-label">
				            <span class="upload-icon">&#128193;</span>
				            <span class="upload-text">Escolher arquivo</span>
				        </label>
				    </div>
				</div>
                
                <div class="form-buttons">
                    <button type="button" class="secondary-btn" onclick="location.href='${pageContext.request.contextPath}/home'">Cancelar</button>
                    <button type="submit" class="btn">Enviar</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>