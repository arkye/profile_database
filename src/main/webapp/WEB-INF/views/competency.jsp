<!DOCTYPE html>
<%@ page session="false"%>

<html lang="en">
<head>
<%@include file="/resources/jsp/competency/head.jsp"%>
</head>
<body>
	<div id="wrapper">
		<%@include file="/resources/jsp/general-navbar.jsp"%>
		<%@include file="/resources/jsp/competency/sidebar.jsp"%>
		<%@include file="/resources/jsp/competency/main.jsp"%>
		<img class="fix-right"
			src="<c:url value="/resources/img/mctic-40.png"/>">
	</div>
	<%@include file="/resources/jsp/competency/scripts.jsp"%>
</body>
</html>