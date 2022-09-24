<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.ses{
		width:500px;
	}
	.ck-editor__editable{
		min-height:500px;
	}
</style>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="container mt-5 py-5" role="main">
		<h2 class="text-center">게시글 등록</h2>	
		<form name="form" id="form" role="form" method="post" action="/notice/registNotice">
			<div class="ses">
			<div class="mb-3 input-group">
				<label for="title">제목 : </label>&nbsp;&nbsp;
				<input type="text" class="form-control ml-5" name="title" id="title" placeholder="제목을 입력해 주세요">
			</div>
			</div>
			<div class="ses">
			<div class="mb-3 input-group">
				<label for="reg_id">작성자 : </label>&nbsp;&nbsp;
				<input type="text" class="form-control" name="writer" id="reg_id" value=<sec:authentication property="principal.user.userId"/> readonly >	
			</div>
			</div>
			<div class="mb-3">
				<label for="content">내용</label>	
				<textarea class="form-control" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
			</div>
		</form>
		<div class="container text-center">
			<button type="button" class="btn btn-primary" onclick="regist()">등록</button>
			<button type="button" class="btn btn-danger" onclick="cancel()">취소</button>
		</div>
	</div>

<jsp:include page="footer.jsp"/>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script>
function regist(){
	let content = $("#title").val()
	if(content==''){
		alert("제목을 입력해 주세요");
		return;
	}
	$("#form").submit();
}
function cancel(){
	location.href("/board/list");
}
</script>
</body>
</html>