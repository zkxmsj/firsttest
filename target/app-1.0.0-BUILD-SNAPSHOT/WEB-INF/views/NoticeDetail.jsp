<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
 <div class="container mt-5 py-5">
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                                <th width="10%">제목</th>
                                <th width="60%">${NoticeDto.title }</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>작성일
                                </td>
                                <td>
                                <fmt:formatDate value="${NoticeDto.reg_date}" pattern="yyyy-MM-dd HH:mm"/>
                                </td>
                            </tr>
                            <tr>
                                <td>글쓴이
                                </td>
                                <td>
                                ${NoticeDto.writer} <span style='float:right'>조회 : ${NoticeDto.view_cnt }</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    ${NoticeDto.content}
                       
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <a href="/notice/list"><button type="button" id="list" class="btn btn-info">목록</button></a>
                                        <sec:authentication property="principal" var="pinfo"/>
                                        <sec:authorize access="isAuthenticated()">
                                        	<c:if test="${pinfo.username eq NoticeDto.writer }">
                                        <a href="/notice/modifyNoticeForm?bno=${NoticeDto.bno}"><button type="button" id="modify" class="btn btn-warning">수정</button></a>
                                        <a href="/notice/deleteNotice?bno=${NoticeDto.bno}"><button type="button" id="delete" class="btn btn-danger">삭제</button></a>
                                        	</c:if>
                                        </sec:authorize>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
                    <sec:authorize access="isAuthenticated()">
                    <table id="commentTable" class="table table-condensed"></table>
                    <table class="table table-condensed">
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                   <textarea id="comment" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                                <br>
                                <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-secondary writeBtn">댓글 등록</button>
                            </td>
                        </tr>
                    </table>
                    </sec:authorize>
				</div>
            </div>
            <hr/>
        </div>
<div class="modal" tabindex="-1" id="testModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">댓글 수정하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<input type="hidden" name="cno" id="cno" value="">
        <input type="text" name="comment" id="reply" value="">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창 닫기</button>
        <button type="button" class="btn btn-warning modifysubmit">수정하기</button>
      </div>
    </div>
  </div>
</div>
    


<c:if test="${id eq NoticeDto.writer or id eq 'admin'}">
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
<%@include file="footer.jsp"%>
<script>
	var user = null;

	
	<sec:authorize access="isAuthenticated()">
	user = "<c:out value='${pinfo.username}'/>";
	</sec:authorize>

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
    		$("#comment").focus();
    		return;
    	}else{
    		$.ajax({
    			type:'POST',
    			url:'/noticecomments/?bno='+bno,
    			headers : {"content-type": "application/json"},
    			data: JSON.stringify({bno:bno,comment:comment}),
    			success:function(list){
    				getCommentList();
    			},
    			error: function(){alert("error");
    			}    		
    		});
    		$("#comment").val("");	
    	}
    });
    $("#commentList").on("click",".delBtn",function(){
    	let cno = $(this).closest("tr").attr("data-cno");
    	$.ajax({
    		type:'DELETE',
    		url:'/noticecomments/'+cno+'?bno='+bno,
    		success:function(list){
    			getCommentList();	
    		},
    		error: function(){alert("error");
    		}
    			
    	});	
	  });
    $("#commentList").on("click",".modifyBtn",function(){
    	let cno = $(this).closest("tr").attr("data-cno");
    	var replyComment = $(this).closest("tr");
    	var reply = replyComment.find("td:eq(1)").text().trim();
    	$("#reply").val(reply);
    	$("#cno").val(cno);
    	$('#testModal').modal("show");
    });
    function getCommentList(){
    	$.ajax({
    		type:'GET',
    		url:'/noticecomments/?bno='+bno,
    		async: false,
    		datatype: 'JSON',
    		success:function(list){
    			var comments = "";
    			$(list).each(function(){
    				comments += '<tr data-cno='+this.cno+' ';
    				comments += 'data-pcno='+this.pcno+' ';
    				comments += 'data-bno='+this.bno+' ';
    				comments += "><td><strong>";
    				comments += this.commenter+"</strong></td>";
    				comments += '<td class="replyCommment"><strong>'+this.comment+"</strong>&nbsp;&nbsp;&nbsp;&nbsp;</td>";
    				if(user==this.commenter){
    				comments += '<td><button type="button" class="modifyBtn btn btn-warning">수정</button>&nbsp;&nbsp;<button type="button" class = "delBtn btn btn-danger">삭제</button></td>';
    				comments += "</td>";
    				}
    				comments += "</tr>";	
	  			});
    			
    			$("#commentList").html(comments);
    		},
    		error: function(){alert("error");}
    	});
    };
    $(".modifysubmit").click(function(){
    	var cno = $("#cno").val();
    	var reply = $("#reply").val();
    	$.ajax({
    		type:'PATCH',
    		url:'/noticecomments/'+cno,
    		headers : {"content-type": "application/json"},
    		data: JSON.stringify({cno:cno,comment:reply}),
    		success:function(list){
    			getCommentList();
    			$('#testModal').modal("hide");
    		},
    		error: function(){alert("error");
    		}
    			
    	});
    	
    });
    	
 </script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 </body>
</html>