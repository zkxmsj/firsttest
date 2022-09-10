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
      <c:forEach var="list" items="${list}">
       <tr>
        <td data-th="Product">
          <div class="row">
            <div class="col-sm-2 hidden-xs"><img src="/resources/img/${list.productImg}" alt="..." class="img-responsive" width="100" height="100" /></div>
            <div class="col-sm-12">
              <h4 class="nomargin">${list.productName }</h4>
            </div>
          </div>
        </td>
        <td data-th="productPrice" class="price">${list.productPrice }</td>
        <td data-th="Quantity">
          <input type="number" class="form-control text-center amount" value="${list.amount}"  min="0" max="100">
        </td>
        <td data-th="Subtotal" class="text-center sum">${list.sum }</td>
        <td class="actions" data-th="" data-cno=${list.cno } data-pno="${list.pno }">
          <button class="btn btn-danger btn-lg" id="delBtn"><i class="fa fa-trash-o"></i>삭제</button>
        </td>
      </tr>
      </c:forEach>
    </tbody>
    <tfoot>
      <!-- <tr class="visible-xs">
        <td class="text-center"><strong>Total $ 5.11</strong></td>
      </tr> -->
      <tr>
        <td><a href="/products" class="btn btn-warning"><i class="fa fa-angle-left"></i>쇼핑하러 가기</a></td>
        <td colspan="2" class="hidden-xs"></td>
        <td class="hidden-xs text-center" id="total">${total}</td>
        <td><a href="#" class="btn btn-success btn-block order">주문하기 <i class="fa fa-angle-right"></i></a></td>
      </tr>
    </tfoot>
  </table>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>
$(document).ready(function(){
	//getCartList();
		 $(".amount").change(function(){
			 var amount = $(this).val();
			 if(amount>100){
				 alert("100개이상 살수 없습니다");
				 return;
			 }
			 if(amount<0){
				 alert("0개 이하로 살수 없습니다");
				 return;
			 }
		 
			  
			
			 var price = $(this).parent().siblings(".price").text();
			 var sum = amount*price;
			 let total = 0;
			 $(this).parent().siblings(".sum").text(sum);
			
			 $(".sum").each(function(i,e){
				 	total += parseInt($(e).text());
			 });
			 $("#total").text(total);
			});
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
    				 str +='<div class="col-sm-12">';
    				 str +=    '<h4 class="nomargin">'+this.productName+'</h4>';
    				 str +=   '</div>';
    				 str +=    '</div>';
    				 str +=   '</td>';
    				 str +='<td data-th="Price" class="price">'+this.productPrice+'</td>';
    				 str +='<td data-th="Quantity">';
    				 str +=    '<input type="number" class="form-control text-center amount" value="'+this.amount+'">';
    				 str +=  '</td>';
    				 str +='<td data-th="Subtotal" class="text-center sum">'+this.sum+'</td>';
    				 str += '<td id="delete" data-pno ="'+this.pno+'"data-cno ="'+this.cno+'" class="actions" data-th="">';
    				 str +='<button class="btn btn-danger btn-lg" id="delBtn"><i class="fa fa-trash-o"></i>삭제</button>';
    				 str +=  '</td>';
    				 str +='</tr>';
	  			});
    			$("#cart").html(str);
    		},
    		error: function(){alert("error");}
    	});
    }
	$(document).on("click","#delBtn",function(){
		alert("삭제되었습니다.");
		
    	let pno = $(this).parent().attr("data-pno");
    	let cno = $(this).parent().attr("data-cno");
    	$.ajax({
    		type:'DELETE',
    		url:'/cart/'+pno+'/'+cno,
    		success:function(list){
    			getCartList();
    		},
    		error: function(){alert("error");
    		}		
    	});
    	getTotal();
    });
	$(".order").click(function(){
		location = "/order";
	});
	function getTotal(){
		 let total = 0;
	 		$(".sum").each(function(i,e){
		 
		 	total += parseInt($(e).text());
			 
	 		});
		 	$("#total").text(total);
	}
	
</script>
</html>