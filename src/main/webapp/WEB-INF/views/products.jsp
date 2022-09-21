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
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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

    </style>
	<meta charset="UTF-8">
    <title>쇼핑몰</title>    
</head>
<body>
<jsp:include page="header.jsp"/>
<section class="py-5">
		
   <div class="container px-4 px-lg-5 mt-5" >
   <div id="category">
 
</div>
<br><br>

            
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="list">

                </div>
            </div>
        </section>
<jsp:include page="footer.jsp"/>

</body>
<script>

$(document).ready(function(){
	getCategorytList();	
	getProductList();
	$(document).on("change",".form-check-input",function(){
        if($(".form-check-input").is(":checked")){
        	var category=$(this).val();
        	$.ajax({
        		type:'GET',
        		url:'/productsSearch?category='+category,
        		success:function(data){
        			var str = "";
        			$(data).each(function(){
        				str+='<div class="col mb-5">';
                        str+='<div class="card h-100">';
                        let fileCallPath = encodeURIComponent(this.uploadPath + "/s_" + this.uuid + "_" + this.fileName);
                            str += "<img class = 'card-img-top' src='/display?fileName=" + fileCallPath +"'>";
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

        			$("#list").html(str);
        		},
        		error: function(){alert("error");}
        	});
        }else{
            alert("체크박스 체크 해제!");
        }
    });
    
    var obj = "<c:out value='${list}'/>";
    alert(obj);
   
    function getProductList(){
    	$.ajax({
    		type:'GET',
    		url:'/productsSearch?category=all',
    		success:function(data){
    			var str = "";
    			$(data).each(function(){
    				str+='<div class="col mb-5">';
                    str+='<div class="card h-100">';
                    let fileCallPath = encodeURIComponent(this.uploadPath + "/s_" + this.uuid + "_" + this.fileName);
                        str += "<img class = 'card-img-top' src='/display?fileName=" + fileCallPath +"'>";
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

    			$("#list").html(str);
    		},
    		error: function(){alert("error");}
    	});
    }
    function getCategorytList(){
    	$.ajax({
    		type:'GET',
    		url:'/getCategory',
    		success:function(data){
    			var str = "";
    			str+='<div class="form-check form-check-inline ">';
    		    str+='<input class="form-check-input" type="radio" value="all" name="category" checked>';
    		    str+='<label class="form-check-label" for="flexCheckDefault">';
    		    str+='전체보기';
    		    str+='</label>';
    		  	str+='</div>';
    			$(data).each(function(){
    				
    				str+='<div class="form-check form-check-inline ">';    				
    			    str+='<input class="form-check-input" type="radio" value="'+this.category+'" name="category">';
    			    str+='<label class="form-check-label" for="flexCheckDefault">';
    			     str+=this.category;
    			    str+='</label>';
    			  str+='</div>';
	  			});

    			$("#category").html(str);
    		},
    		error: function(){alert("error");}
    	});
    }
              

});
</script>