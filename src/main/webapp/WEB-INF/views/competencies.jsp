<!DOCTYPE html>
<%@ page session="false"%>

<html lang="en">
<head>
<%@include file="/resources/jsp/competencies/head.jsp"%>
</head>
<body>
	<div id="wrapper">
		<%@include file="/resources/jsp/general-navbar.jsp"%>
		<%@include file="/resources/jsp/competencies/sidebar.jsp"%>
		<%@include file="/resources/jsp/competencies/main.jsp"%>
		<img class="fix-right"
			src="<c:url value="/resources/img/mctic-40.png"/>">
	</div>
	<%@include file="/resources/jsp/competencies/scripts.jsp"%>
</body>
</html>