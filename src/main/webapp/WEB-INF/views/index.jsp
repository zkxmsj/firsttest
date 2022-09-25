<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>


<meta name="theme-color" content="#7952b3">

<link href="https://getbootstrap.kr/docs/5.1/examples/carousel/carousel.css" rel="stylesheet">
<style>
		div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
		a {text-decoration:none;}

		.quickmenu {position:absolute;width:130px;top:50%;margin-top:-50px;right:10px;background:#fff;}
		.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;}
		.quickmenu ul li {float:left;width:100%;text-align:center;display:inline-block;*display:inline;}
		.quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:black;font-size:9.5pt;}	
		.quickmenu ul li:last-child {border-bottom:0;}

		.content {position:relative;min-height:1000px;}
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
      #chatting{
      	display:none;
      }
      

    </style>
	<meta charset="UTF-8">
    <title>쇼핑몰</title>    
</head>
<body>
<jsp:include page="header.jsp"/>
<main>
<div class="container">
<iframe src="https://service.dongledongle.com/lshchat" frameborder="0" width="100%" height="800" id="chatting" class="mt-5 py-5"></iframe>
</div>
<div class="quickmenu">
  <ul>
    <li><img src="/resources/img/chat.png" style="width:50px;height:50px;"></li>
    <li><button type="button" class="btn btn-dark" id="chatopen">채팅방 열기</button></li>
    <li><button type="button" class="btn btn-warning" id="chatclose">채팅방 닫기</button></li>
  </ul>
</div>
<div class="container mt-5">
  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/img/main1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/main2.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/main3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
  </div>
</div>
<div class="text-center mt-5 mb-5	">
	<h2>베스트 판매 상품</h2>
</div>
<div class="container">
	<div class="row" id="productList">
	</div>
</div>



</main>
<jsp:include page="footer.jsp"/>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
$(document).ready(function(){
	getProductList();
});
$("#chatopen").click(function(){
	$("#chatting").show();
})
$("#chatclose").click(function(){
	$("#chatting").hide();
})
function getProductList(){
    	$.ajax({
    		type:'GET',
    		url:'/topProduct',
    		datatype: 'JSON',
    		success:function(list){
    			var str = "";
    			$(list).each(function(){
    				str+='<div class="col mb-5">';
                    str+='<div class="card h-100">';
                    let fileCallPath = encodeURIComponent(this.uploadPath + "/" + this.uuid + "_" + this.fileName);
                        str += "<img class = 'card-img-top' src='/display?fileName=" + fileCallPath +"'	>";
                        str+='<div class="card-body p-4">';
                        str+='<div class="text-center">';
                        str+='<h5 class="fw-bolder">'+this.productName+'</h5>';
                        str+=+this.productPrice+'원';
                        str+='</div>';
                        str+='</div>';
                        str+='<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
                        str+='<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/product?pno='+this.pno+'">상품정보 보기</a></div>';
                        str+='</div>';
                    str+='</div>';
                str+='</div>';
	  			});
    			
    			$("#productList").html(str);
    		},
    		error: function(){alert("error");}
    	});
    };
</script>
</body>