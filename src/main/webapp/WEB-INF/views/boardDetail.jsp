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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<jsp:include page="header.jsp"/>
<br><br>
 <div class="container">
            <hr/>
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                                <th width="10%">제목</th>
                                <th width="60%">${boardDto.title }</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>작성일
                                </td>
                                <td>
                                <fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd HH:mm"/>
                                </td>
                            </tr>
                            <tr>
                                <td>글쓴이
                                </td>
                                <td>
                                ${boardDto.writer} <span style='float:right'>조회 : ${boardDto.view_cnt }</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    ${boardDto.content}
                       
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table id="commentTable" class="table table-condensed"></table>
                    <table class="table table-condensed">
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                   <textarea id="comment" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                                <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-secondary writeBtn">댓글 등록</button>
                            </td>
                        </tr>
                    </table>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <button type="button" id="list" class="btn btn-info">목록</button>
                                        <a href="/board/modifyBoardForm?bno=${boardDto.bno}"><button type="button" id="modify" class="btn btn-warning">수정</button></a>
                                        <button type="button" id="delete" class="btn btn-danger">삭제</button>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
</div>
            </div>
            <hr/>
        </div>    


<c:if test="${id eq boardDto.writer or id eq 'admin'}">
</c:if>
<div class="container">
    <table class="table table-hover">
    <tr>
        <th>작성자</th>
        <th>내용</th>
    </tr>
    <tbody id="commentList">
    </tbody>
    </table>
</div>
<script>
	let query = window.location.search;
	let param = new URLSearchParams(query);
	let bno = param.get('bno');
	
    $(document).ready(function(){
    	getCommentList();
    	
 	});
    $(".writeBtn").click(function(){
    	let comment = $("#comment").val();
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
    			var comments = "";
    			$(list).each(function(){
    				comments += '<tr>';
    				comments += '<td data-cno='+this.cno+' ';
    				comments += 'data-pcno='+this.pcno+' ';
    				comments += 'data-bno='+this.bno+' ';
    				comments += "><strong>";
    				comments += this.commenter+"</strong></td>";
    				comments += '<td><strong>'+this.comment+"</strong>&nbsp;&nbsp;&nbsp;&nbsp;";
    				comments += '<button type="button" class="modifyBtn btn btn-warning">수정</button>&nbsp;&nbsp;<button type="button" class = "delBtn btn btn-danger">삭제</button></td>';
    				comments += "</td>";
    				comments += "</tr>";	
	  			});
    			
    			$("#commentList").html(comments);
    		},
    		error: function(){alert("error");}
    	});
    };
    	
 </script>
 </body>
</html>