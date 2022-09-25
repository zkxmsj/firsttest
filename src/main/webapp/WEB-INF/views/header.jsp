<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>




    <!-- Bootstrap core CSS -->

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Headers · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/headers/">

    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
    	
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .welcome{
      	color:white;
      }
      
    </style>
	
    
    <!-- Custom styles for this template -->
  </head>
  <body>
  
  <div>
 <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		<!-- 
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        </a>
         -->

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="/" class="nav-link px-2 text-secondary">Home</a></li>
          <li><a href="/notice/list" class="nav-link px-2 text-white">공지사항</a></li>
          <li><a href="/products" class="nav-link px-2 text-white">쇼핑하기</a></li>
          <li><a href="/board/list" class="nav-link px-2 text-white">게시판</a></li>
          <sec:authorize access="hasRole('ROLE_ADMIN')">
          <li><a href="/admin/adminPage" class="nav-link px-2 text-white">관리자</a></li>
          </sec:authorize>
          
        </ul>
      </div>
        <div class="text-end">
        <sec:authorize access="isAnonymous()">
          <a href="/customLogin"><button type="button" class="btn btn-outline-light me-2">로그인</button></a>
          <a href="/user/register"><button type="button" class="btn btn-warning">회원가입</button></a>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          	<span class="welcome"><sec:authentication property="principal.user.userName"/>님 반갑습니다.</span>		
          	<form:form action="/logout" methos="post">
          	<button type="button" class="btn btn-warning" onclick="mycart()">장바구니</button>
          		<button type="button" class="btn btn-success" onclick="myPage()">마이페이지</button>
          		<button type="submit" class="btn btn-danger">로그아웃</button>
          	</form:form>	
          </sec:authorize>
        </div>
    </div>
</nav>
</div>

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
    $(document).ready(function(){
    	  var currentPosition = parseInt($(".quickmenu").css("top"));
    	  $(window).scroll(function() {
    	    var position = $(window).scrollTop(); 
    	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
    	  });
    	});

    
    	function myPage(){
    		location.href = "/user/myPage";
    	}
    	function mycart(){
    		location.href = "/cart";
    	}
    </script>
  </body>
</html>