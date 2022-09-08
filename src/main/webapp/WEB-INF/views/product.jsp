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
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="/resources/img/${product.productImg}" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">SKU: BST-498</div>
                        <h1 class="display-5 fw-bolder">${product.productName }</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">${product.productPrice+1000}</span>
                            <span>-> ${product.productPrice}원</span>
                        </div>
                        <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
                        <div class="d-flex">
                            <input name="amount" class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0 addCart btn-space" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                장바구니 담기
                            </button>
                            <a href="/cart"><button class="btn btn-primary flex-shrink-0 btn-space cartList" type="button"><i class="bi-cart-fill me-1"></i>장바구니 가기</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">같은 카테고리 상품</h2>
                
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="relative" items="${list}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/resources/img/${relative.productImg}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${relative.productName }</h5>
                                    <!-- Product price-->
                                    ${relative.productPrice}원
                                </div>
                            </div>
                    
                          
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/product?pno=${relative.pno}">상품 상세보기</a></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                      <!--
                    <div class="col mb-5">
                        <div class="card h-100">
                            
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            
                            <div class="card-body p-4">
                                <div class="text-center">
                            
                                    <h5 class="fw-bolder">Special Item</h5>
                            
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                          
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                          
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                          
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                          
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                          
                            <div class="card-body p-4">
                                <div class="text-center">
                          
                                    <h5 class="fw-bolder">Sale Item</h5>
                          
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                          
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                          
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                          
                            <div class="card-body p-4">
                                <div class="text-center">
                          
                                    <h5 class="fw-bolder">Popular Item</h5>
                          
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                          
                                    $40.00
                                </div>
                            </div>
                  
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                                 
                            </div>
                        </div>
                    </div>Product actions-->
                </div>
            </div>
        </section>

<jsp:include page="footer.jsp"/>
<script>
	let query = window.location.search;
	let param = new URLSearchParams(query);
	let pno = param.get('pno');

	$(".addCart").click(function(){
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
	
</script>
</body>