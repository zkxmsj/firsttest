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
    #result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
    
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
						<button class="address_btn address_btn_3" onclick="getRegistForm(3)">상품 등록</button>
						<button class="address_btn address_btn_4" onclick="getRegistCategory(4)">카테고리 등록</button>
						<button class="address_btn address_btn_5" onclick="getProductList(5)">상품 목록</button>
						<button class="address_btn address_btn_6" onclick="getChart(6)">상품 판매 현황</button>
					</div>
					<div class="addressInfo_input_div_wrap container">
						<div class="addressInfo_input_div addressInfo_input_div_1 container" style="display: block" id="adminPage">
							
							
						</div>

					</div>
				</div>
			</div>

<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
function getRegistForm(className){
	var str ='<form action="/admin/registProduct" method="post" id="enrollForm">';
	str +='  <div class=" row col-lg-6 container pt-5">';
	str +='<div class="d-inline-flex align-items-center">';
	str +='<label class="form-label" style="min-width: 100px">상품명</label>';
	str += '<input type="text" name="productName" class="form-control">';
	str += '</div>'; 
	str +='</div>';
	str +='  <div class=" row col-lg-6 container pt-5">';
	str +='<div class="d-inline-flex align-items-center">';
	str +='<label class="form-label" style="min-width: 100px">상품번호</label>';
	str += '<input type="text" name="pno" class="form-control">';
	str += '</div>'; 
	str +='</div>';
	str +='  <div class=" row  col-lg-6 container pt-5">';
	str +='<div class="d-inline-flex align-items-center">';
	str +='<label class="form-label" style="min-width: 100px">가격</label>';
	str += '<input type="text" name="productPrice" class="form-control">';
	str += '</div>'; 
	str +='</div>';
	str +='  <div class="row col-lg-6 container pt-5">';
	str +='<div class="d-inline-flex align-items-center">';
	str +='<label class="form-label" style="min-width: 100px">재고</label>';
	str += '<input type="text" name="productStock" class="form-control">';
	str += '</div>'; 
	str +='</div>';
	str +='  <div class=" row col-lg-6 container pt-5">';
	str +='<div class="d-inline-flex align-items-center">';
	str +='<label class="form-label" style="min-width: 100px">카테고리</label>';
	str += '<select style="btn-info" id="category" name="category">';
	str += '<option value="none">==선택==</option>';
	str += '</select>';
	str += '</div>'; 
	str +='</div>';
	str +='  <div class="row col-lg-6 container pt-5">';
	str +='<div class="d-inline-flex align-items-center">';
	str +='<label class="form-label" style="min-width: 100px">상품소개</label>';
	str +='<textarea class="form-control" rows="10" name="productIntro" id="intro"></textarea>';
	str += '</div>'; 
	str +='</div>';
	str +='  <div class="row col-lg-6 container pt-5">';
	str +='<div class="d-inline-flex align-items-center">';
	str +='<label class="form-label" style="min-width: 100px">이미지</label>';
	str += '<input type="file" id="fileitem" class="form-control" name="productImg" style="height : 30px;">'; 
	str += '<div id="uploadResult">';
	str += '</div>';
	str +='</div>';
	str +='  <div class="col-lg-8 container pt-5">';
	str +='<button type="button" class="btn btn-primary " id="regist">등록</button>&nbsp&nbsp';
	str +='<button type="button" class="btn btn-danger " id="cancel">취소</button>';
	str +='</div>';
	str += '</form>;'
	
		
		$("#adminPage").html(str);
	$(".address_btn").css('backgroundColor', '#555');
	/* 지정 색상 변경 */
		$(".address_btn_"+className).css('backgroundColor', '#3c3838');
}
$(document).on("click","#regist",function(){
	
	let enrollForm = $("#enrollForm");

	alert("상품 등록 완료");
	enrollForm.submit();
	
	
});
$(document).on("click","#registCategory",function(){
	
	let enrollForm = $("#categoryForm");

	alert("카테고리 등록 완료");
	enrollForm.submit();
	
	
});
$(document).on("click","#cancel",function(){
	deleteFile();
	location.href= "/admin/adminPage";
	
});
$(document).on("click","#esc",function(){
	
	location.href= "/admin/adminPage";
	
});
$(document).on("change","input[type='file']", function(e){
	
	/* 이미지 존재시 삭제 */
	if($(".imgDeleteBtn").length > 0){
		deleteFile();
	}
	let formData = new FormData();
	let fileInput = $('input[name="productImg"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		$("#fileitem").val('');
		return false;
	}	
	alert("통과");
	formData.append("uploadFile", fileObj);
	$.ajax({
		url: '/admin/uploadAjaxAction',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json',
    	success : function(result){
    		console.log(result);
    		showUploadImage(result);
    	},
    	error : function(result){
    		alert("이미지 파일이 아닙니다.");
    	}


	});
});

let regex = new RegExp("(.*?)\.(jpg|png)$");
let maxSize = 1048576; //1MB	

function fileCheck(fileName, fileSize){

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
		  
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.(JPG,PNG만 허용)");
		return false;
	}
	
	return true;		
	
}
function showUploadImage(uploadResultArr){
	if(!uploadResultArr || uploadResultArr.length == 0){return}
	
	let uploadResult = $("#uploadResult");
	
	let obj = uploadResultArr;
	
	let str = "";
	
	let originalImgPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
	let thumImgPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
	

	
	
	str += "<div id='result_card'>";
	str += "<img src='/display?fileName=" + thumImgPath +"'>";
	str += "<div class='imgDeleteBtn' data-file='" + thumImgPath + "'>x</div>";
	str += "<input type='hidden' name='fileName' value='"+ obj.fileName +"'>";
	str += "<input type='hidden' name='uuid' value='"+ obj.uuid +"'>";
	str += "<input type='hidden' name='uploadPath' value='"+ obj.uploadPath +"'>";
	str += "<input type='hidden' name='thumImgPath' value='"+thumImgPath+"'>";
	str += "<input type='hidden' name='originalImgPath' value='"+originalImgPath+"'>";
	str += "</div>";
	
		uploadResult.append(str);  
}
function deleteFile(){
	
	let targetFile = $(".imgDeleteBtn").data("file");
	
	let targetDiv = $("#result_card");
	
	$.ajax({
		url: '/admin/deleteFile',
		data : {fileName : targetFile},
		dataType : 'text',
		type : 'POST',
		success : function(result){
			console.log(result);
			
			targetDiv.remove();
			$("input[type='file']").val("");
			
		},
		error : function(result){
			console.log(result);
			
			alert("파일을 삭제하지 못하였습니다.")
		}
	});
}
/* 이미지 삭제 버튼 동작 */
$(document).on("click", ".imgDeleteBtn", function(e){
	
	deleteFile();
	
});
$(document).on("click","#category",function(){
	$.ajax({
		url: '/getCategory',
		type : 'GET',
		success : function(list){
			var str = '';
			
			$(list).each(function(){
				
				str += '<option value="'+this.category+'">'+this.category+'</option>';
				
				});
			$("#category").html(str);
			
		},
		error : function(result){
			console.log(result);
			
			alert("파일을 삭제하지 못하였습니다.")
		}
	});
	
});
function getRegistCategory(className){
	var str ='<form action="/admin/registCategory" method="post" id="categoryForm">';
	str +='  <div class=" row col-lg-6 container pt-5">';
	str +='<div class="d-inline-flex align-items-center">';
	str +='<label class="form-label" style="min-width: 100px">카테고리명</label>';
	str += '<input type="text" name="category" class="form-control">';
	str += '</div>'; 
	str +='</div>';
	str +='  <div class="col-lg-8 container pt-5">';
	str +='<button type="button" class="btn btn-primary " id="registCategory">추가</button>&nbsp&nbsp';
	str +='<button type="button" class="btn btn-danger " id="esc">취소</button>';
	str +='</div>';
	str += '</form>;'
	
		
		$("#adminPage").html(str);
	$(".address_btn").css('backgroundColor', '#555');
	/* 지정 색상 변경 */
		$(".address_btn_"+className).css('backgroundColor', '#3c3838');
}
function getProductList(className){
	$.ajax({
		type:'GET',
		url:'/admin/productList',
		success:function(data){
			var str = '<table class="table table-hover table-condensed mt-5">';
			str+= '<tr>';
			str+='<th>상품번호</th>';
			str+='<th>상품명</th>';	
	        str+='<th>상품가격</th>';
	        str+='<th>상품재고</th>';
	        str+='<th>카테고리</th>';
	        str+='</tr>';
			$(data).each(function(){
			str+='<tr>';
			str+='<td>';
			str+=this.pno;
			str+='</td>';
			str+='<td>';
			str+=this.productName;
			str+='</td>';
			str+='<td>';
			str+=this.productPrice;
			str+='</td>';
			str+='<td>';
			str+=this.productStock;
			str+='</td>';
			str+='<td>';
			str+=this.category;
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

function getChart(className){
	topList();
	drawChart();
	/* 모든 색상 동일 */
	$(".address_btn").css('backgroundColor', '#555');
/* 지정 색상 변경 */
	$(".address_btn_"+className).css('backgroundColor', '#3c3838');
}
/*구글 차트*/
var productName = new Array();
var count = new Array(); 
var arrCount = null;

function topList(){

  $.ajax({
	type:'GET',
	url:'/admin/productList',
    dataType:"json",
    success:function(data){
    	$.each(data, function(index, value){	
    		// 차트에 값을 넣어주기 위해 각각 담아줌.
    		productName[index] = value.productName;
    		count[index] = value.sellCount;
    	});
    	//arrCount = JSON.parse("[" + count + "]");

    	google.charts.load('current', {'packages':['corechart']});
    	google.charts.setOnLoadCallback(drawChart);

    },error:function(){
    	//console.log("실패");	
    }
  });
};

function drawChart() {
  var columArray = ['상품명', '판매량']; // 컬럼 및 효과
  var dataArray = [];
  dataArray.push(columArray);

  for(var i=0; i<productName.length; i++){
  	dataArray.push([productName[i],count[i]]);
  }

  var data = new google.visualization.arrayToDataTable(dataArray);
  var options = {'title':'상품별 판매 비율','width':1000, 'height':500};
  var chart = new google.visualization.PieChart(document.getElementById('adminPage'));
  chart.draw(data, options);
};

</script>
</body>
</html>