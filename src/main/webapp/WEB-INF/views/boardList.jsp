<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>게시판</title>
    
    <style>
    
   
    	
    	table{
    		margin-top:200px;
    	}
    	td ul{
    		text-align=center;
    	}
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@include file="header.jsp"%>
<div class = "container" style="text-align:center">
<h2>게시글 목록</h2>
<table class="table table-striped">
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
					<td colspan="5">
					<nav aria-label="Page navigation example">
	               			<ul class="pagination">
	               			
	               				<!-- 2. 이전버튼 활성화 여부 -->
	               				<c:if test="${pageHandler.prev}">
                        			<li class="page-item previous"><a class="page-link" href="<c:url value="list?pageNum=${pageHandler.startPage-10 }&size=${sc.size}&option=${option}&keyword=${keyword}"/>">이전</a></li>
								</c:if>
								                        		
                        		<!-- 1. 페이지번호 처리 -->
                        		<c:forEach var="num" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
	                        		
	                        	 <c:choose>
	                        	 	<c:when test="${sc.pageNum eq num }">
	                 			   		<li class="active paginate_button page-item">
	                        			<a class="page-link" href="list?pageNum=${num }&size=${sc.size}&option=${sc.option}&keyword=${sc.keyword}">${num }</a></li>
	                        		</c:when>
	                        		<c:otherwise>
	                        			<li>
	                        			<a class="page-link" href="list?pageNum=${num }&size=${sc.size}&option=${sc.option}&keyword=${sc.keyword}">${num }</a></li>
	                        		</c:otherwise>
	                        		
	                        	</c:choose>
	                        		
	                  
	                        		
                        		</c:forEach>
                        		
                        		<!-- 3. 다음버튼 활성화 여부 -->
                        		<c:if test="${pageHandler.next}">
                        			<li><a class="page-link" href="<c:url value="list?pageNum=${pageHandler.endPage+1 }&size=${sc.size}&option=${sc.option}&keyword=${sc.keyword}"/>">다음</a></li>
                        		</c:if>
                    			</ul>
					</nav>
					</td>
				</tr>
	
</table>
<c:if test="${id!=null}">
<a href="registForm"><button>글 등록</button></a>
</c:if>
<a href="list"><button class="btn btn-primary">게시판 홈으로</button></a>
<a href="registBoard"><button class="btn btn-dark">글 등록</button></a>
<br><br>

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