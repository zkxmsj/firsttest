<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="registBoard" method="post" accept-charset="utf-8">
	<input type="text" name="title" placeholder="제목" required><br>
	<input type="text" name="writer" value="${id}" readonly><br>
	<textarea rows="4" cols="20" name="content" placeholder="내용" required></textarea><br>
	<input type="submit" value="등록">
	</form>
</body>
</html>