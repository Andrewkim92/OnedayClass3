<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	function clickArea(area) {
		
		var tmp =$('#'+area).css('display');
// 		alert(tmp);
		if(tmp == 'none'){
			$('#'+area).css('display', '');
		}else{
			$('#'+area).css('display', 'none');
		}
	}
</script>

<div id="hostRegisterArea"
	style="width:100%; height:1000px; margin: 100px 0px 100px 0px; text-align: center;">

	<div id="TermArea">
		<h1>*이용약관, 개인정보 취급방침을 꼭 확인해주세요. (자세한 사항은 이용약관을 확인해주시기 바랍니다.)</h1>
		<h2 onclick="clickArea('personInfo');">개인정보 취급방법</h2>
		
		<div id="personInfo" style="display: none;">
			<textarea rows="12" cols="70" readonly="readonly">*이용약관, 개인정보 취급방침을 꼭 확인해주세요. (자세한 사항은 이용약관을 확인해주시기 바랍니다.)</textarea>
		</div>
		<br>
		<div
			style="background: #CECECE; width: 100%; height: 1px; padding: 0; margin: auto;">
		</div>

		<h2 onclick="clickArea('term');">이용약관</h2>
		<div id="term" style="display: none;">
			<textarea rows="12" cols="70" readonly="readonly">*이용약관, 개인정보 취급방침을 꼭 확인해주세요. (자세한 사항은 이용약관을 확인해주시기 바랍니다.)</textarea>
		</div>
		<br>

		<div
			style="background: #CECECE; width: 100%; height: 1px; padding: 0; margin: auto;">
		</div>

		<h2 onclick="clickArea('termBuyer');">이용약관(구매자)</h2>
		<div id="termBuyer" style="display: none;">
			<textarea rows="12" cols="70" readonly="readonly">*이용약관, 개인정보 취급방침을 꼭 확인해주세요. (자세한 사항은 이용약관을 확인해주시기 바랍니다.)</textarea>
		</div>
		<br>

		<div
			style="background: #CECECE; width: 100%; height: 1px; padding: 0; margin: auto;">
		</div>

		<button value="동의하기"></button>
	</div>

</div>

