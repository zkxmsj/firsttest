<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="modifyBoard" method="post" accept-charset="utf-8">
	<input type="hidden" name="bno" value="${boardDto.bno}">
	<input type="text" name="title" placeholder="제목" value="${boardDto.title}" required><br>
	<input type="text" name="writer" value="${id}" readonly><br>
	<textarea rows="4" cols="20" name="content" required>${boardDto.content}</textarea><br>
	<input type="submit" value="수정">
	</form>
</body>
</html>