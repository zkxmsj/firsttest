<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<p>번호:${boardDto.bno}</p>
<p>제목:${boardDto.title}</p>
<p>작성자:${boardDto.writer}</p>
<p>내용:${boardDto.content}</p>
<p>등록일자:${boardDto.reg_date}</p>
<p>조회수:${boardDto.view_cnt}</p>
<c:if test="${id eq boardDto.writer or id eq 'admin'}">
<a href="modifyBoardForm?bno=${boardDto.bno}"><button>수정</button></a>
<a href="deleteBoard?bno=${boardDto.bno}"><button>삭제</button></a><br>
</c:if>
<p>------------------댓글-------------------------</p><br>
<input type="text" name="comment"><br>
<button class="writeBtn">댓글 등록</button>
<div id="commentList"></div>
<script>
	let query = window.location.search;
	let param = new URLSearchParams(query);
	let bno = param.get('bno');
	
    $(document).ready(function(){
    	getCommentList();
    	
 	});
    $(".writeBtn").click(function(){
    	let comment = $("input[name=comment]").val();
    	if(comment.trim()==''){
    		alert("댓글을 입력해 주세요");
    		return;
    	}
    	$.ajax({
    		type:'POST',
    		url:'/comments/?bno='+bno,
    		headers : {"content-type": "application/json"},
    		data: JSON.stringify({bno:bno,comment:comment}),
    		success:function(list){
    			getCommentList();	
    		},
    		error: function(){alert("error");
    		}
    			
    	});	
    });
    $("#commentList").on("click",".delBtn",function(){
    	let cno = $(this).parent().attr("data-cno");
    	$.ajax({
    		type:'DELETE',
    		url:'/comments/'+cno+'?bno='+bno,
    		success:function(list){
    			getCommentList();	
    		},
    		error: function(){alert("error");
    		}
    			
    	});	
	  });
    function getCommentList(){
    	$.ajax({
    		type:'GET',
    		url:'/comments/?bno='+bno,
    		success:function(list){
    			var comments = "<ul>";
    			$(list).each(function(){
    				comments += '<li data-cno='+this.cno+' ';
    				comments += 'data-pcno='+this.pcno+' ';
    				comments += 'data-bno='+this.bno+' ';
    				comments += ">";
    				comments += '<br>';
    				comments += '<span class="commenter"><strong>';
    				comments += '작성자:'+this.commenter+"</strong></span>&nbsp";
    				comments += '작성 날짜:'+new Date(this.reg_date);
    				comments += '<br>';
    				comments += '<span class="comment">댓글 내용:'+this.comment+"</span>&nbsp";
    				comments += '<button class = "delBtn">삭제</button>';
    				comments += "</li>";
    				
	  			});
    			comments += "</ul>";
    			$("#commentList").html(comments);
    		},
    		error: function(){alert("error");}
    	});
    };
    	
 </script>
 </body>
</html>