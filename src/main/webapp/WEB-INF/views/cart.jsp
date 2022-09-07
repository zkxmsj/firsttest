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
    
    </style>
	<meta charset="UTF-8">
    <title>쇼핑몰</title>    
</head>
<body>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<jsp:include page="header.jsp"/>
<div class="container">
  <table class="table table-hover table-condensed">
    <thead>
      <tr>
        <th style="width:50%">상품명</th>
        <th style="width:10%">가격</th>
        <th style="width:8%">수량</th>
        <th style="width:22%" class="text-center">금액</th>
        <th style="width:10%"></th>
      </tr>
    </thead>
    <tbody id="cart">
      <!-- <tr>
        <td data-th="Product">
          <div class="row">
            <div class="col-sm-2 hidden-xs"><img src="" alt="..." class="img-responsive" /></div>
            <div class="col-sm-10">
              <h4 class="nomargin">Product 1</h4>
            </div>
          </div>
        </td>
        <td data-th="Price">$5.11</td>
        <td data-th="Quantity">
          <input type="number" class="form-control text-center" value="1">
        </td>
        <td data-th="Subtotal" class="text-center">$5.11</td>
        <td class="actions" data-th="">
          <button class="btn btn-danger btn-lg deleteBtn"><i class="fa fa-trash-o"></i>삭제</button>
        </td>
      </tr>-->
    </tbody>
    <tfoot>
      <!-- <tr class="visible-xs">
        <td class="text-center"><strong>Total $ 5.11</strong></td>
      </tr> -->
      <tr>
        <td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i>쇼핑하러 가기</a></td>
        <td colspan="2" class="hidden-xs"></td>
        <td class="hidden-xs text-center"><strong>${data.sum}</strong></td>
        <td><a href="#" class="btn btn-success btn-block">주문하기 <i class="fa fa-angle-right"></i></a></td>
      </tr>
    </tfoot>
  </table>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>
$(document).ready(function(){
	getCartList();
	
	});
function getCartList(){
    	$.ajax({
    		type:'GET',
    		url:'/cart/user',
    		success:function(data){
    			var str = "";
    			$(data).each(function(){
    				 str += '<tr>';
    				 str += '<td data-th="Product">';
    				 str += '<div class="row">';
    				 str +='<div class="col-sm-2 hidden-xs"><img src="/resources/img/'+this.productImg+'" alt="..." class="img-responsive" width="100" height="100" /></div>';
    				 str +='<div class="col-sm-10">';
    				 str +=    '<h4 class="nomargin">'+this.productName+'</h4>';
    				 str +=   '</div>';
    				 str +=    '</div>';
    				 str +=   '</td>';
    				 str +='<td data-th="Price">'+this.productPrice+'</td>';
    				 str +='<td data-th="Quantity">';
    				 str +=    '<input type="number" class="form-control text-center" value="'+this.amount+'">';
    				 str +=  '</td>';
    				 str +='<td data-th="Subtotal" class="text-center">'+this.sum+'</td>';
    				 str += '<td class="actions" data-th="">';
    				 str +='<button class="btn btn-danger btn-lg deleteBtn"><i class="fa fa-trash-o"></i>삭제</button>';
    				 str +=  '</td>';
    				 str +='</tr>';	
	  			});
    			$("#cart").html(str);
    		},
    		error: function(){alert("error");}
    	});
    }
</script>
</html>