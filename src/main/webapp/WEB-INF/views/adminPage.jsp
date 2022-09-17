<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>관리자페이지</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <link rel="stylesheet" href="/resources/css/adminPage.css"> 
    <style>
    
   td a{
   	text-decoration:none;
   	color:black;
   }
    </style>
    
</head>
<body>
<jsp:include page="header.jsp"/>
<div class = "container mt-5 py-5" style="text-align:center">
	<div class="row">
		<h2><Strong>관리자페이지</Strong></h2>
	</div>
</div>
<div class="container mt-5 py-5">
		<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="address_btn address_btn_1" onclick="getUserList(1)" >유저리스트</button>
						<button class="address_btn address_btn_2" onclick="getOrderList(2)">주문 내역</button>
						<button class="address_btn address_btn_3" onclick="getUserOrder(3)">상품 등록</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block" id="adminPage">
							
							
						</div>

					</div>
				</div>
			</div>

<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function getOrderList(className){
	
	$.ajax({
		type:'GET',
		url:'/admin/orderList',
		success:function(data){
			var str = '<table class="table table-hover table-condensed mt-5">';
			str+= '<tr>';
			str+='<th>주문자</th>';
			str+='<th>상품명</th>';	
	        str+='<th>수량</th>';
	        str+='<th>금액</th>';
	        str+='<th>주문 날짜</th>';
	        str+='<th>배송상태</th>';
	        str+='</tr>';
			$(data).each(function(){
			str+='<tr>';
			str+='<td>';
			str+=this.userId;
			str+='</td>';
			str+='<td>';
			str+=this.productName;
			str+='</td>';
			str+='<td>';
			str+=this.amount;
			str+='</td>';
			str+='<td>';
			str+=this.totalPrice;
			str+='</td>';
			str+='<td>';
			var time= new Date(this.reg_date);
			var date=time.toLocaleDateString(); 
			str+=date;
			str+='</td>';
			str+='<td>';
			str+=this.state;
			str+='</td>';
			if(this.state=='배송 준비중'){
			str+='<td data-orderno ="'+this.orderno+'">';
			str+='<button type="button" class="btn btn-danger" id="shipping">배송</button>';
			str+='</td>';
			str+='</tr>';
			}

			});
			str+='</table>';
			$("#adminPage").html(str);
		},
		error: function(){alert("error");}
	});
	/* 모든 색상 동일 */
	$(".address_btn").css('backgroundColor', '#555');
/* 지정 색상 변경 */
	$(".address_btn_"+className).css('backgroundColor', '#3c3838');
}


function getUserList(className){
	$.ajax({
		type:'GET',
		url:'/admin/userList',
		success:function(data){
			var str = '<table class="table table-hover table-condensed mt-5">';
			str+= '<tr>';
			str+='<th>아이디</th>';
			str+='<th>이름</th>';	
	        str+='<th>이메일</th>';
	        str+='<th>우편번호</th>';
	        str+='<th>주소</th>';
	        str+='<th>상세주소</th>';
	        str+='</tr>';
			
	        $(data).each(function(){
				str+='<tr>';
				str+='<td>';
				str+=this.userId;
				str+='</td>';
				str+='<td>';
				str+=this.userName;
				str+='</td>';
				str+='<td>';
				str+=this.userEmail;
				str+='</td>';
				str+='<td>';
				str+=this.userAddr1;
				str+='</td>';
				str+='<td>';
				str+=this.userAddr2;
				str+='</td>';
				str+='<td>';
				str+=this.userAddr3;
				str+='</td>';
				str+='<td>';
				str+='<button type="button" class="btn btn-danger" id="delBtn">회원탈퇴처리</button>';
				str+='</td>';
				str+='</tr>';
				
			});
			str+='</table>';
			$("#adminPage").html(str);
		},
		error: function(){alert("error");}
	});
	/* 모든 색상 동일 */
	$(".address_btn").css('backgroundColor', '#555');
/* 지정 색상 변경 */
	$(".address_btn_"+className).css('backgroundColor', '#3c3838');
}
$(document).on("click","#shipping",function(){
	
	
	let orderno = $(this).parent().attr("data-orderno");
	
	$.ajax({
		type:'PUT',
		url:'/admin/shipping/'+orderno,
		success:function(list){
			alert("배송 완료");
			getOrderList(2);
		},
		error: function(){alert("error");
		}
		
	});
	
});
</script>
</body>
</html>