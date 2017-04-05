<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<link rel="stylesheet" href="<c:url value="resources/css/signin.css"/>">
<title>Banco de Perfis</title>
</head>

<body>

	<%@include file="/resources/jsp/guest-navbar.jsp"%>

	<!-- Container -->
	<div class="container-fluid">

		<img class="logo-signin center-block"
			src="<c:url value="/resources/img/logo_no_text.png"/>" height="50">

		<c:url var="signInAction" value="/sign_in/attempt" />

		<form action="${signInAction}" class="form-signin" method="POST"
			enctype="multipart/form-data">
			<h3 class="form-signin-heading">Entrar no Banco de Perfis</h3>
			<label for="username" class="sr-only">Usuário</label> <input
				type="text" name="username" class="form-control"
				placeholder="Usuário" required autofocus /> <label for="password"
				class="sr-only">Senha</label> <input type="password" name="password"
				class="form-control" placeholder="Senha" required /> <input
				class="btn btn-lg btn-primary btn-block" type="submit"
				value="Entrar">
		</form>
	</div>

	<%@include file="/resources/jsp/general-scripts.jsp"%>

</body>
</html>
