<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">
<style>
.ui-datepicker {
	font-size: 16px;
	width: 220px;
}
</style>

<div class="content-wrap">
	<div id="wrap">
		<div id="wrap_">
			<div id="title">
				<p class="title">
					<b>가격&emsp;&emsp;&emsp;&emsp; </b>
				</p>
			</div>
			<div id="content">
				<input type="text" name="price" size="10" style="text-align: right;"> 
				<font size="4em"> 원 </font>
			</div>
		</div>
		<div id="wrap_">
			<div id="title">
				<p class="title">
					<b> 날짜 및 시간&emsp; </b>
				</p>
			</div>
			<div id="dateAdd"> 
				<div id="rowList" class="list">
					<div id="content_1" class="c1">
						<input type="text" id="datepicker1" name="datepicker1" size="20" readonly>&emsp;
						<select id="startHour" name="startHour1"></select> 
						<select id="startMin" name="startMin1"></select>
						<font size="4em">&nbsp;~&nbsp;</font> 
						<select id="endHour" name="endHour1"></select>
						<select id="endMin" name="endMin1"></select>&emsp; 
						<input type="button" id="delete1" style="display: none;" value="삭제">
						<input type="button" id="add" value="추가">
					</div>	
				</div>
			</div>
		</div>
		<div class="c1" style="margin-bottom: 10px;"> </div>
		<div id="title" style="height: 160px;">
			<p class="title">
				<b> 진행 장소 &emsp;&emsp; </b>
			</p>
		</div>
		<div id="content">
			<input type="text" id="postcode" name="zip_code" size="7" placeholder="우편번호">&emsp;
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		</div>
		<div id="content">
			<input type="text" id="address" name="address" placeholder="주소" size="63"><br>
		</div>
		<div id="content">
			<input type="text" id="detailAddress" name="detailAddress" size="30" placeholder="상세주소">
			<input type="text" id="extraAddress" size="30" placeholder="참고항목">
		</div>
		<div id="button">
			<input type="button" value="저장"> 
			<input type="button" value="취소">
		</div>
	</div>
</div>


<script>

//달력
function calendar(this_) {
	$('#' + this_).datepicker({
		showOn : "both",
		buttonImage: "/resources/images/calendar.png",
		buttonImageOnly: true,
		dateFormat: "yy-mm-dd"
	})
};




//시간 선택
function timeSelecter() {
	var nnum = $('#rowList').children("div").length;
	var len = document.getElementsByName("startHour" + nnum).length;
	var len2 = document.getElementsByName("startMin" + nnum).length;
	
	for(var j = 0; j < len; j++){
		var timeSelect = document.getElementsByName("startHour" + nnum)[j];
		var docfrag = document.createDocumentFragment();
		var hour = "";
		for(var i = 0; i <24; i++){
			hour = i < 10 ? "0" + i : i;
			
			var option = document.createElement("option");
			var optionElement = i == 0 ? 
					"<option value ='" + hour + "' selected>" + hour + "</option>" 
					: "<option value ='" + hour + "'>" + hour + "</option>";
					
			option.innerHTML = optionElement;
			docfrag.appendChild(option);
		}
		timeSelect.appendChild(docfrag);
	}
	
	for(var j = 0; j < len; j++){
		var timeSelect = document.getElementsByName("endHour" + nnum)[j];
		var docfrag = document.createDocumentFragment();
		var hour = "";
		for(var i = 0; i <24; i++){
			hour = i < 10 ? "0" + i : i;
			
			var option = document.createElement("option");
			var optionElement = i == 0 ? 
					"<option value ='" + hour + "' selected>" + hour + "</option>" 
					: "<option value ='" + hour + "'>" + hour + "</option>";
					
			option.innerHTML = optionElement;
			docfrag.appendChild(option);
		}
		timeSelect.appendChild(docfrag);
	}
	
	for(var j = 0; j < len2; j++){
		var timeSelect = document.getElementsByName("startMin" + nnum)[j];
		var docfrag = document.createDocumentFragment();
		var min = "";
		for(var i = 0; i <6; i++){
			min = i + "0";
			
			var option = document.createElement("option");
			var optionElement = i == 0 ? 
					"<option value ='" + min + "' selected>" + min + "</option>" 
					: "<option value ='" + min + "'>" + min + "</option>";
					
			option.innerHTML = optionElement;
			docfrag.appendChild(option);
		}
		timeSelect.appendChild(docfrag);
	}
	
	for(var j = 0; j < len2; j++){
		var timeSelect = document.getElementsByName("endMin" + nnum)[j];
		var docfrag = document.createDocumentFragment();
		var min = "";
		for(var i = 0; i <6; i++){
			min = i + "0";
			
			var option = document.createElement("option");
			var optionElement = i == 0 ? 
					"<option value ='" + min + "' selected>" + min + "</option>" 
					: "<option value ='" + min + "'>" + min + "</option>";
					
			option.innerHTML = optionElement;
			docfrag.appendChild(option);
		}
		timeSelect.appendChild(docfrag);
	}
};

$(document).ready(function(){
	calendar('datepicker1');
	timeSelecter();

	// Event Delegation
	var items = document.querySelector('.list');

	items.addEventListener('click', function(e) { 
		var target = $("#" + e.target.id).parent();
		var targetId = target.attr("id"); 
		var targetElem = $("#" + targetId).next().attr("id");
		var eventTarget = e.target.id;
		
		if(e.target.id === 'add') {
			addDate();
			$('#' + targetId + ' > input[id^=delete]').show();
		}
		if(e.target.id.includes('delete')) {
			
			changeRowId(eventTarget, target); 
			
		}
			
	});
});




//날짜 추가
var num = 1;

function addDate() {
	if($('#rowList').children("div").length < 3) {
		num = $('#rowList').children("div").length + 1;
		var dateSelect = document.getElementById("rowList");
		var docfrag = document.createDocumentFragment();
		var div = document.createElement("div");
		div.id = "content_" + num;
		document.body.appendChild(div);

		var div_ = "<input type='text' id='datepicker"+ num +"' name='datepicker"+ num +"' size='20' readonly> &emsp;"
		div_ += "<select id='startHour' name='startHour"+ num +"'></select> "
		div_ += "<select id='startMin' name='startMin"+ num +"'></select> "
		div_ += "<font size='4em'>&nbsp;~&nbsp;</font> "
		div_ += "<select id='endHour' name='endHour"+ num +"'></select> "
		div_ += "<select id='endMin' name='endMin"+ num +"'></select>&emsp; "
		div_ += "<input type='button' id='delete"+ num +"' value='삭제'> "
		div_ +=	"<input type='button' id='add' style='display: none;' value='추가'>"
		
		div.innerHTML = div_;
		docfrag.appendChild(div);
		dateSelect.appendChild(docfrag);
		
		calendar('datepicker' + num);
		timeSelecter();
		
		$('#rowList > div:last').attr('class', 'c1');
	} else {
		alert('최대 3개까지 선택가능 합니다.');
	}
};


function changeRowId(elementId, target) {
	var cnum = elementId.substr(elementId.length -1); 
	var lastElem = $('#rowList > div:last').attr('id');
	var lastnum = lastElem.substr(lastElem.length -1);  

	target.remove();
	
	if(cnum != lastnum){
		$('#rowList > div:first').attr('id', 'content_1');
		$('#rowList > div:first > input[id^=datepicker]').attr('id','datepicker1');
		$('#rowList > div:first > input[id^=datepicker]').attr('name','datepicker1');
		$('#rowList > div:first > select[id^=startHour]').attr('name','startHour1');
		$('#rowList > div:first > select[id^=startMin]').attr('name','startMin1');
		$('#rowList > div:first > select[id^=endHour]').attr('name','endHour1');
		$('#rowList > div:first > select[id^=endMin]').attr('name','endMin1');
		$('#rowList > div:first > input[id^=delete]').attr('id','delete1');
		
		if(lastnum - cnum != 1 || (lastnum - cnum == 1 && lastnum == 3)){ 
			$('#rowList > div:last').attr('id', 'content_2');
			$('#rowList > div:last > input[id^=datepicker]').attr('id','datepicker2');
			$('#rowList > div:last > input[id^=datepicker]').attr('name','datepicker2');
			$('#rowList > div:last > select[id^=startHour]').attr('name','startHour2');
			$('#rowList > div:last > select[id^=startMin]').attr('name','startMin2');
			$('#rowList > div:last > select[id^=endHour]').attr('name','endHour2');
			$('#rowList > div:last > select[id^=endMin]').attr('name','endMin2');
			$('#rowList > div:last > input[id^=delete]').attr('id','delete2');
			$('#rowList > div:last > input[id^=add]').hide();
		}
			
	}
	
	if(lastnum - 1 != 1){
		$('#content_1 > input[id^=delete]').show();
	} else {
		$('#content_1 > input[id^=delete]').hide();
	}
	$('#content_1 > input[id^=add]').show();
	
}





//주소
 function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("extraAddress").value = extraAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }

            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
 
</script>
