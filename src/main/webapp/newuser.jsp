<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - MusicStream</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            padding: 20px;
        }
        
        .container {
            width: 450px;
            max-width: 90%;
            padding: 40px;
        }
        
        .logo {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .logo h1 {
            font-size: 32px;
            font-weight: 700;
            letter-spacing: -1px;
        }
        
        .logo .music-icon {
            font-size: 36px;
            color: #ffad08;
            margin-bottom: 10px;
        }
        
        .divider {
            border-top: 1px solid #282828;
            margin: 30px 0;
            position: relative;
        }
        
        .divider span {
            position: absolute;
            top: -10px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #121212;
            padding: 0 15px;
            color: #b3b3b3;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
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
            box-shadow: 0 0 0 2px #fad928;
        }
        
        .form-group input::placeholder {
            color: #b3b3b3;
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
            cursor: pointer;
            transition: box-shadow 0.3s;
        }
        
        .form-group select:focus {
            outline: none;
            box-shadow: 0 0 0 2px #fad928;
        }
        
        .form-group select option {
            background-color: #282828;
            color: #fff;
        }
        
        .options {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .checkbox-container {
            display: flex;
            align-items: flex-start;
        }
        
        .checkbox-container input {
            appearance: none;
            width: 16px;
            height: 16px;
            border: 1px solid #535353;
            border-radius: 3px;
            margin-right: 10px;
            position: relative;
            cursor: pointer;
            flex-shrink: 0;
            margin-top: 3px;
        }
        
        .checkbox-container input:checked::after {
            content: "";
            position: absolute;
            top: 2px;
            left: 5px;
            width: 4px;
            height: 8px;
            border: solid #1DB954;
            border-width: 0 2px 2px 0;
            transform: rotate(45deg);
        }
        
        .checkbox-container label {
            color: #b3b3b3;
            font-size: 14px;
            cursor: pointer;
        }
        
        .btn {
            display: block;
            width: 100%;
            padding: 16px;
            border: none;
            border-radius: 500px;
            background-color: #ffad08;
            color: #000;
            font-size: 16px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn:hover {
            background-color: #fad928;
            transform: scale(1.02);
        }
        
        .social-login {
            margin-top: 20px;
        }
        
        .social-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 14px;
            border-radius: 500px;
            background-color: transparent;
            border: 1px solid #535353;
            color: #fff;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            margin-bottom: 12px;
            transition: border-color 0.3s;
        }
        
        .social-btn:hover {
            border-color: #fad928;
        }
        
        .social-btn .icon {
            margin-right: 8px;
            font-size: 18px;
        }
        
        .login {
            margin-top: 40px;
            text-align: center;
            color: #b3b3b3;
            font-size: 16px;
        }
        
        .login a {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
        }
        
        .login a:hover {
            text-decoration: underline;
            color: #fad928;
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
        
        .terms-text {
            font-size: 12px;
            color: #b3b3b3;
            margin-top: 20px;
            line-height: 1.5;
        }
        
        .terms-text a {
            color: #fff;
            text-decoration: none;
        }
        
        .terms-text a:hover {
            text-decoration: underline;
            color: #fad928;
        }
        
        <% if (request.getAttribute("error") != null) { %>
            .error-message {
                display: block;
            }
        <% } %>
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <div class="music-icon">♪</div>
            <h1>MusicStream</h1>
        </div>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <form action="${pageContext.request.contextPath}/effectregister" method="post">
            <div class="form-group">
                <label for="email">Informe seu nome:</label>
                <input type=text id="name" name="txtName" placeholder="Seu nome" required>
            </div>
            
            <div class="form-group">
                <label for="email">Informe seu e-mail:</label>
                <input type="email" id="email" name="txtEmail" placeholder="Seu e-mail" required>
            </div>
            
            <div class="form-group">
                <label for="password">Crie uma senha:</label>
                <input type="password" id="password" name="txtPassword" placeholder="Senha" required>
            </div>
            
            <div class="form-group">
                <label for="confirm_password">Confirmar senha:</label>
                <input type="password" id="password" name="txtConfirmPassword" placeholder="Senha" required>
            </div>
            
            <div class="options">
                <div class="checkbox-container">
                    <input type="checkbox" id="termos" name="termos" value="true" required>
                    <label for="termos">Concordo com os <a href="${pageContext.request.contextPath}/termos" style="color: #fff; text-decoration: underline;">Termos e Condições de Uso</a> do MusicStream</label>
                </div>
            </div>
            
            <div class="terms-text">
                Ao clicar em Cadastrar, você confirma que leu e concorda com os <a href="${pageContext.request.contextPath}/termos">Termos e Condições de Uso</a> do MusicStream e com a <a href="${pageContext.request.contextPath}/privacidade">Política de Privacidade</a>.
            </div>
            
            <button type="submit" class="btn" style="margin-top: 20px;">Cadastrar</button>
            
            <div class="divider">
                <span>ou</span>
            </div>
            
            <div class="social-login">
                <button type="button" class="social-btn" onclick="location.href='${pageContext.request.contextPath}/oauth/google'">
                    <span class="icon">G</span>
                    Continuar com o Google
                </button>
                <button type="button" class="social-btn" onclick="location.href='${pageContext.request.contextPath}/oauth/facebook'">
                    <span class="icon">f</span>
                    Continuar com o Facebook
                </button>
                <button type="button" class="social-btn" onclick="location.href='${pageContext.request.contextPath}/oauth/apple'">
                    <span class="icon">&#63743;</span>
                    Continuar com a Apple
                </button>
            </div>
            
            <div class="login">
                Já tem uma conta? <a href="${pageContext.request.contextPath}/login">Faça login</a>
            </div>
        </form>
    </div>
</body>
</html>