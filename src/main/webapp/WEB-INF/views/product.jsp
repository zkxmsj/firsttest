<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

  <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

<link href="https://getbootstrap.kr/docs/5.1/examples/carousel/carousel.css" rel="stylesheet">
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
    .btn-space {
    	margin-right:10px; 
    	padding-right:10px;
    }
    </style>
	<meta charset="UTF-8">
    <title>쇼핑몰</title>    
</head>
<body>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<jsp:include page="header.jsp"/>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center" id="product">
                         
                    </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">같은 카테고리 상품</h2>
                
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="relative">
                   
                    
                  
                </div>
            </div>
        </section>
        <div class="container">
        	<div class="row text-center">
				<h2><Strong>리뷰 페이지</Strong></h2>
			</div>
    	<table class="table table-hover mt-5 py-5">
    	<tr>
    	<th></th>
        <th>작성자</th>
        <th>리뷰</th>
        <th>작성일</th>
    </tr>
    <tbody id="commentList">
    </tbody>
    </table>
</div>

<jsp:include page="footer.jsp"/>
<script>
	let query = window.location.search;
	let param = new URLSearchParams(query);
	let pno = param.get('pno');
	$(document).ready(function(){
		getProduct();
    	getCommentList();
    	getRelativeList();
    	
 	});
	$(document).on("click",".addCart",function(){
    	let amount = $("input[name=amount]").val();
    	if(isNaN(amount)){
    		alert("숫자만 입력가능합니다.");
    		return;
    	}
    	if(amount<=0){
    		alert("0보다 같거나 작을수 없습니다");
    		return;
    	}
    	$.ajax({
    		type:'POST',
    		url:'/cart',
    		headers : {"content-type": "application/json"},
    		data: JSON.stringify({pno:pno,amount:amount}),
    		success:function(list){
    			alert("장바구니에 추가하였습니다");
    		},
    		error: function(){alert("error");
    		}	
    	});	
    });
	function getProduct(){
		$.ajax({
    		type:'GET',
    		url:'/product/'+pno,
    		success:function(data){

    			var str = "";
    			let fileCallPath = encodeURIComponent(data.uploadPath + "/" + data.uuid + "_" + data.fileName);
    			str+='<div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="/display?fileName='+fileCallPath+'" alt="..." /></div>';
            	str+='<div class="col-md-6">';
               	 str+='<div class="small mb-1">'+data.category+'</div>';
               	 str+='<h1 class="display-5 fw-bolder">'+data.productName+'</h1>';
               	 str+='<div class="fs-5 mb-5">';
                 str+='  <span>'+data.productPrice+'원</span>';
                 str+='</div>';
                 str+='<div class="fs-5 mb-5">수량:'+data.productStock+'</div>';
                 str+='<p class="lead">'+data.productIntro+'</p>';
                 str+='<div class="d-flex">';
                 str+='<input name="amount" class="form-control text-center me-3 mb-5" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />';  
             	 str+='</div>';
		         str+='<button class="btn btn-outline-dark flex-shrink-0 addCart btn-space" type="button">';
                 str+='<i class="bi-cart-fill me-1"></i>';
                 str+='장바구니 담기';
                 str+='</button>';
                 str+='<a href="/cart"><button class="btn btn-primary flex-shrink-0 btn-space cartList" type="button"><i class="bi-cart-fill me-1"></i>장바구니 가기</button></a>';
    			
    			$("#product").html(str);
    		},
    		error: function(){alert("error");}
    	});
	}
function getCommentList(){
    	$.ajax({
    		type:'GET',
    		url:'/review/'+pno,
    		success:function(list){
    			var comments = "";
    			$(list).each(function(){
    				comments += '<tr data-cno='+this.cno+' ';
    				comments += 'data-pno='+this.pno+' ';
    				comments += "><td></td><td><strong>";
    				comments += this.commenter+"</strong></td>";
    				comments += '<td class="replyCommment"><strong>'+this.comment+"</strong>&nbsp;&nbsp;&nbsp;&nbsp;</td>";
    				var time= new Date(this.reg_date);
    				var date=time.toLocaleDateString(); 
    				comments += '<td>'+date+"</td>";
    				comments += '<td><button type="button" class="modifyBtn btn btn-warning">수정</button>&nbsp;&nbsp;<button type="button" class = "delBtn btn btn-danger">삭제</button></td>';
    				comments += "</td>";
    				comments += "</tr>";
    				
	  			});
    			
    			$("#commentList").html(comments);
    		},
    		error: function(){alert("error");}
    	});
}
function getRelativeList(){
	$.ajax({
		type:'GET',
		url:'/relative/'+pno,
		success:function(list){
			var comments = "";
			$(list).each(function(){
				let fileCallPath = encodeURIComponent(this.uploadPath + "/" + this.uuid + "_" + this.fileName);
    			comments+='<div class="col mb-5"  id="relative">';
			    comments+='<div class="card h-100">';
			    comments+='<img class="card-img-top" src="/display?fileName='+fileCallPath+'" alt="..." />';
			    comments+='<div class="card-body p-4">';
			    comments+='<div class="text-center">';
			    comments+='<h5 class="fw-bolder"></h5>';
			    comments+='</div>';
			    comments+='</div>';
				comments+='<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
				comments+='<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/product?pno='+this.pno+'">상품 상세보기</a></div>';
			    comments+='</div>';
			    comments+='</div>';
			    comments+='</div>';
  			});
			
			$("#relative").html(comments);
		},
		error: function(){alert("error");}
	});
}
	
</script>
</body>