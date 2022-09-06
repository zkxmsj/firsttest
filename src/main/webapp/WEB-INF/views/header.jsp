<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/resources/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="menu">

	<ul class="menu-ul">
	    <li id="logo">승훈</li>
	    <li><a href="<c:url value='/'/>">Home</a></li>
	    <li><a href="<c:url value='/board/list'/>">Board</a></li>
	    <c:if test="${ sessionScope.id==null }">
	    <li><a href="<c:url value='/login/login'/>">login</a></li>
	    </c:if>
	    <c:if test="${sessionScope.id!=null }">
	    <li><a href="<c:url value='/login/logout'/>">logout</a></li>
	    </c:if>
	    <c:if test="${ sessionScope.id!=null}"> 
	    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
	    </c:if>
	    <li><a href=""><i class="fas fa-search small"></i></a></li>
	</ul> 
</div>
</body>
</html>