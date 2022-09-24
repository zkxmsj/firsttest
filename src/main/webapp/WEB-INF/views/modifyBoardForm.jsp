<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
	<div class="container mt-5 py-5">
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th>제목 : <input type="text" id="title" value="${boardDto.title }"></th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>작성일 : <fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd HH:mm"/>
                                </td>
                            </tr>
                            <tr>
                                <td>글쓴이 : ${boardDto.writer} <span style='float:right'>조회 : ${boardDto.view_cnt }</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <textarea cols="150" rows="4" id="content">${boardDto.content}</textarea>
                       
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <button type="button" id="list" class="btn btn-info">목록</button>
                                        <button type="button" id="modify" class="btn btn-warning">수정</button>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
            </div>
       </div>
          
</div>
<%@include file="footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script>
$("#modify").click(function(){
	$("input[name='title']").val($("#title").val());
	$("input[name='content']").val($("#content").val());
	$(".modify_form").submit();
	
})
</script>
<form class="modify_form" action="modifyBoard" method="post" accept-charset="utf-8">
	<input type="hidden" name="bno" value="${boardDto.bno }">
	<input type="hidden" name="title" value="">
	<input type="hidden" name="writer" value="${boardDto.writer }">
	<input type="hidden" name="content" value="">
	<input type="hidden" name="view_cnt" value="${boardDto.view_cnt }">
	<input type="hidden" name="comment_cnt" value="${boardDto.comment_cnt}">
</form>
</body>
</html>