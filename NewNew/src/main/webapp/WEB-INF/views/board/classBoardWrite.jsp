<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>

<script>
$(function () {

	$('imgreg1').click(function (e) {
		e.preventDefault();
		alert('1');
		$('#file').click();
		});
	});

</script>

<style>
#file {
	display: none;
}

#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table {
	border: 3px solid white
}

td {
	border: 1px solid white
}

#title {
	background-color: skyblue
}
</style>

<form id="file_up">
	<input type="file" id="file">
</form>

 <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">클래스 등록</font></b>
        <br><br><br>
        
        <form>
            <table>
                <tr>
                    <td id="title">제목</td>
                    <td>
                        <input type="text" size="50" name="id" maxlength="20">
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">부제목</td>
                    <td>
                        <input type="password" size="50" name="password" maxlength="15">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">가격</td>
                    <td>
                        <input type="password" size="50" name="password" maxlength="15">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">프립소개</td>
                    <td>
                        <input type="text" size="50" name="name" maxlength="40">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birth_yy" maxlength="4"  size="50">
                        <select name="birth_mm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" size="50" name="birth_dd" maxlength="2">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" size="50" name="email_1" maxlength="30">@
                        <select name="email_2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" size="50" name="phone" />
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" size="50" name="address"/>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입"/>  <input type="button" value="취소">
        </form>
    </div>






