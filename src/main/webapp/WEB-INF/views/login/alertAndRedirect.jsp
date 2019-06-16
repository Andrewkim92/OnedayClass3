<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script type="text/javascript">
		var message = '${message}';
		var returnUrl = '${returnUrl}';
		alert(message);
		document.location.href = returnUrl;
	</script>
