<jsp:useBean id="errorSTR" type="java.lang.String" scope="request" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MusicStream - Erro de Login</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .error-container {
            background-color: #181818;
            border-radius: 8px;
            padding: 30px;
            max-width: 450px;
            width: 90%;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        
        .error-icon {
            font-size: 48px;
            color: #ff5252;
            margin-bottom: 20px;
        }
        
        .error-title {
            font-size: 24px;
            margin-bottom: 15px;
            color: #ff5252;
        }
        
        .error-message {
            font-size: 16px;
            margin-bottom: 25px;
            color: #b3b3b3;
            line-height: 1.5;
        }
        
        .btn {
            background-color: #1DB954;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 50px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn:hover {
            background-color: #1ed760;
        }
        
        .btn-outline {
            background-color: transparent;
            border: 1px solid #b3b3b3;
            color: #ffffff;
            margin-left: 10px;
        }
        
        .btn-outline:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">⚠️</div>
        
        <h1 class="error-title">Dados incorretos</h1>
        
        <p class="error-message">
			${errorSTR}
        </p>
        
        <div class="actions">
            <a href="login.jsp" class="btn">Tentar novamente</a>
            <a href="recuperar-senha.jsp" class="btn btn-outline">Esqueci a senha</a>
        </div>
    </div>
</body>
</html>