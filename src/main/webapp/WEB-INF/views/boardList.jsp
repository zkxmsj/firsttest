<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>게시판</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <style>
    	.soso a{
    		font-weight:bold;
    		font-size:20px;
    	}
    	ul{
    		list-style:none;
    	}
    	li{
    		margin-left:10px;
    		float:left;
    	
    	}
    	table{
    		margin-top:200px;
    	}
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<div style="text-align:center">
<h2>게시글 목록</h2>
<table class="table">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="board" items="${list}">
		<tr>
			<td>${board.bno}</td>
			<c:choose>
	             <c:when test="${board.comment_cnt!=0}">
	             <td><a href="boardDetail?bno=${board.bno}">${board.title}[${board.comment_cnt}]</a></td>
	             </c:when>
	             <c:otherwise>
	             <td><a href="boardDetail?bno=${board.bno}">${board.title}</a></td>
	             </c:otherwise>
			
			</c:choose>
			<td>${board.writer}</td>
			<td><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd HH:mm"/></td>
			<td>${board.view_cnt}</td>
		</tr>
	</c:forEach>
	<tr>
					<td colspan="5" align="center">
	               			<ul>
	               			
	               				<!-- 2. 이전버튼 활성화 여부 -->
	               				<c:if test="${pageHandler.prev}">
                        			<li><a class="page" href="<c:url value="list?pageNum=${pageHandler.startPage-10 }&size=${sc.size}&option=${option}&keyword=${keyword}"/>">이전</a></li>
								</c:if>
								                        		
                        		<!-- 1. 페이지번호 처리 -->
                        		<c:forEach var="num" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
	                        		
	                        	 <c:choose>
	                        	 	<c:when test="${sc.pageNum eq num }">
	                 			   		<li class="soso">
	                        			<a href="list?pageNum=${num }&size=${sc.size}&option=${sc.option}&keyword=${sc.keyword}">${num }</a></li>
	                        		</c:when>
	                        		<c:otherwise>
	                        			<li>
	                        			<a href="list?pageNum=${num }&size=${sc.size}&option=${sc.option}&keyword=${sc.keyword}">${num }</a></li>
	                        		</c:otherwise>
	                        		
	                        	</c:choose>
	                        		
	                  
	                        		
                        		</c:forEach>
                        		
                        		<!-- 3. 다음버튼 활성화 여부 -->
                        		<c:if test="${pageHandler.next}">
                        			<li><a class="page" href="<c:url value="list?pageNum=${pageHandler.endPage+1 }&size=${sc.size}&option=${sc.option}&keyword=${sc.keyword}"/>">다음</a></li>
                        		</c:if>
                    			</ul>
					
					</td>
				</tr>
	
</table>
<c:if test="${id!=null}">
<a href="registForm"><button>글 등록</button></a>
</c:if>
<a href="list"><button>게시판 홈으로</button></a>

<form action="list" method="GET">
	<select name = "option">
		<option value="A" ${sc.option eq "A" ? "selected" :""} >제목+내용</option>
		<option value="T" ${sc.option eq "T" ? "selected" :""}>제목</option>
		<option value="W" ${sc.option eq "W" ? "selected" :""}>작성자</option>
	</select>
	<input type="text" name="keyword" value="${sc.keyword }">
	<input type="submit" value="검색">
</form>
</div>
<%@include file="footer.jsp"%>
</body>
</html>