<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>P�gina N�o Encontrada</title>
</head>

<body>

	<%@include file="/resources/jsp/guest-navbar.jsp"%>

	<!-- Container -->
	<div class="container-fluid">

		<img class="logo-signin center-block"
			src="<c:url value="/resources/img/logo_no_text.png"/>" height="50">
			
		<p>A p�gina que tentou acessar n�o existe ou voc� n�o possui as devidas permiss�es para acessar.</p>
	</div>

	<%@include file="/resources/jsp/general-scripts.jsp"%>

</body>
</html>
