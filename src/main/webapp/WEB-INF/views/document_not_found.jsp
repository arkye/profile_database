<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html lang="en">
<head>
<%@include file="/resources/jsp/errors/head.jsp"%>
</head>
<body>
	<div id="wrapper">
		<%@include file="/resources/jsp/general-navbar.jsp"%>
		<%@include file="/resources/jsp/errors/sidebar.jsp"%>
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="error-template">
						<h1>
							<i class="fa fa-exclamation-triangle fa-2x"></i>
						</h1>
						<h2>Ops!</h2>
						<%@include
							file="/resources/jsp/errors/main-document_not_found.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/resources/jsp/errors/scripts.jsp"%>
</body>
</html>