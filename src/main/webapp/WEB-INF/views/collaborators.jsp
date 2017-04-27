<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html lang="en">
<head>
<%@include file="/resources/jsp/collaborators/head.jsp"%>
</head>
<body>
	<div id="wrapper">
		<%@include file="/resources/jsp/general-navbar.jsp"%>
		<%@include file="/resources/jsp/collaborators/sidebar.jsp"%>
		<%@include file="/resources/jsp/collaborators/main.jsp"%>
		<img class="fix-right"
			src="<c:url value="/resources/img/mctic-40.png"/>">
	</div>
	<%@include file="/resources/jsp/collaborators/scripts.jsp"%>
</body>
</html>
