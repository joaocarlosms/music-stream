<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="User" type="model.User" scope="request"/>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>JSP Page</title>
</head>
<body>
	<h1>Welcome!</h1>
	<hr/>
	Id: <strong>${User.id}</strong><br/>
	Nome: <strong>${User.fullname}</strong><br/>
	Username: <strong>${User.username}</strong><br/>
	Email: <strong>${User.email}</strong><br/>
	
</body>
</html>