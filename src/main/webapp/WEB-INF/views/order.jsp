<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta name="theme-color" content="#7952b3">

<link href="https://getbootstrap.kr/docs/5.1/examples/carousel/carousel.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/order.css">
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
      .address{
      	width:200px;
      	height:25px;
      }
      .addressee_input{
      	width:100px;
      	height:25px;
      }
    </style>
	<meta charset="UTF-8">
    <title>쇼핑몰</title>    
</head>
<body>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<jsp:include page="header.jsp"/>
<div class="container py-5">
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
            <div class="col-sm-2 hidden-xs"><img src="/resources/img/${list.uploadPath}/${list.uuid}_${list.fileName}" alt="..." class="img-responsive" width="100" height="100" /></div>
            <div class="col-sm-12 ">
              <h4 class="nomargin pName">${list.productName }</h4>
            </div>
          </div>
        </td>
        <td data-th="productPrice" class="price">${list.productPrice }</td>
        <td data-th="Quantity">
          <input type="number" class="form-control text-center amount" value="${list.amount}"  min="0" max="100" readonly>
        </td>
        <td data-th="Subtotal" class="text-center sum">${list.sum }</td>
        <td class="actions" data-th="" data-cno=${list.cno } data-pno="${list.pno }">
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
        <td class="hidden-xs text-center" id="total"><strong>총액 : ${total}</strong></td>
      </tr>
    </tfoot>
  </table>
</div>
			<div class="container" margin:0	 auto;>
				<!-- 회원 정보 -->
				<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<th style="width: 25%;">주문자</th>
								<td style="width: *">${user.userId} | ${user.userEmail}</td>
							</tr>
						</tbody>
					</table>
				</div>				
				
				<!-- 배송지 정보 -->
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #3c3838;">사용자 정보 주소록</button>
						<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1 text-center container" style="display: block">
							<table>
								<tbody>
									<tr>
										<th>이름 : 
										
											${user.userName}
										</th>
									</tr>
									<tr>
										
										<td>주소 : 
											${user.userAddr1} ${user.userAddr2}<br>${user.userAddr3}
											<input class="selectAddress" value="T" type="hidden">
											<input class="addressee_input" value="${user.userName}" type="hidden">
											<input class="address1_input" type="hidden" value="${user.userAddr1}">
											<input class="address2_input" type="hidden" value="${user.userAddr2}">
											<input class="address3_input" type="hidden" value="${user.userAddr3}">																					
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="addressInfo_input_div addressInfo_input_div_2 container text-center">
							<table class="mt-5 mb-5">
								<tbody>
									<tr>
										<th>이름 : <input class="addressee_input"></th>
										
									</tr>
									<tr>
									</tr>
									<tr>
										<th>주소 : 
											<input class="selectAddress" value="F" type="hidden">
											<input class="address address1_input" readonly="readonly">
											<input class="address address2_input" readonly="readonly">
											<input class="address address3_input" readonly="readonly">&nbsp;&nbsp;<button class="btn btn-primary btn-sm" onclick="execution_daum_address()">주소 찾기</button>
										</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="total_info_btn_div">
						<button type="button" class="btn btn-success" onclick="requestPay()"  >결제하기</button>
					</div>
			

	
<jsp:include page="footer.jsp"/>
<form class="order_form" action="/order" method="post">
			<!-- 주문자 회원번호 -->
			<input name="userId" value="${user.userId}" type="hidden">
			<input name="userName" value="${user.userName}" type="hidden">
			<!-- 주소록 & 받는이-->
			<input name="orderName" value="" type="hidden">
			<input name="orderAddr1" type="hidden">
			<input name="orderAddr2" type="hidden">
			<input name="orderAddr3" type="hidden">
			<!-- 상품 정보 -->
		</form>

</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
$(document).ready(function(){
	
});
function showAdress(className){
	/* 컨텐츠 동작 */
	/* 모두 숨기기 */
	$(".addressInfo_input_div").css('display', 'none');
	/* 컨텐츠 보이기 */
	$(".addressInfo_input_div_" + className).css('display', 'block');		
/* 버튼 색상 변경 */
	/* 모든 색상 동일 */
		$(".address_btn").css('backgroundColor', '#555');
	/* 지정 색상 변경 */
		$(".address_btn_"+className).css('backgroundColor', '#3c3838');	
/* selectAddress T/F */
	/* 모든 selectAddress F만들기 */
		$(".addressInfo_input_div").each(function(i, obj){
			$(obj).find(".selectAddress").val("F");
		});
	/* 선택한 selectAdress T만들기 */
		$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");			
}
function requestPay() {
	let product = "";
	var count=0;
	$("#cart").find("tr").each(function(index,obj){
		var pno = $(this).find(".actions").attr("data-pno");
		var amount = $(this).find(".amount").val();
		var price = $(this).find(".price").html();
		var pName = $(this).find(".pName").text();
		product = pName;
		count++;
		
		
	});
	  IMP.init('iamport'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
	  IMP.request_pay({
	    pg: "inicis",
	    pay_method: "card",
	    merchant_uid : 'merchant_'+new Date().getTime(),
	    name : product+" 등 "+count+"종",
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	  }, function (rsp) { // callback
	      if (rsp.success) {
	       	alert("성공");
	       	order();
	      } else {
	    	  alert("실패");
	        
	      }
	  });
	}
function order(){
	/* 주소 정보 & 받는이*/
	$(".addressInfo_input_div").each(function(i, obj){
		if($(obj).find(".selectAddress").val() === 'T'){
			$("input[name='orderName']").val($(obj).find(".addressee_input").val());
			$("input[name='orderAddr1']").val($(obj).find(".address1_input").val());
			$("input[name='orderAddr2']").val($(obj).find(".address2_input").val());
			$("input[name='orderAddr3']").val($(obj).find(".address3_input").val());
		}
	});
	let form_contents='';
	$("#cart").find("tr").each(function(index,obj){
		var pno = $(this).find(".actions").attr("data-pno");
		var amount = $(this).find(".amount").val();
		var price = $(this).find(".price").html().trim();
		var pName = $(this).find(".pName").text();
		
		
		
		let pno_input = "<input name='orders[" + index + "].pno' type='hidden' value='" + pno + "'>";
		form_contents += pno_input;
		let amount_input = "<input name='orders[" + index + "].amount' type='hidden' value='" + amount + "'>";
		form_contents += amount_input;
		let price_input = "<input name='orders[" + index + "].productPrice' type='hidden' value='" + price + "'>";
		form_contents += price_input;
		let totalprice_input = "<input name='orders[" + index + "].totalPrice' type='hidden' value='" + amount*price + "'>";
		form_contents += totalprice_input;
		let pName_input = "<input name='orders[" + index + "].productName' type='hidden' value='" + pName + "'>";
		form_contents += pName_input;
			
		});	
		$(".order_form").append(form_contents);	
	
		/* 서버 전송 */
		$(".order_form").submit();
	
}
/* 다음 주소 연동 */
function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();
	   
	   
	
}
	
</script>
</html>