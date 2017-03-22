<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Opções de Escala</title>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- Optional Theme CSS -->
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<!-- Local CSS -->
	<link rel="stylesheet"
	href="<c:url value="/resources/css/ie10-viewport-bug-workaround.css"/>">
	<link rel="stylesheet"
	href="<c:url value="/resources/css/general.css"/>">
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button"
				class="navbar-toggle collapsed"
				data-toggle="collapse"
				data-target="#navbar"
				aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Ativar navegação</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Banco de Talentos</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Início</a></li>
				<li><a href="#">Pessoas</a></li>
				<li><a href="#">Competências</a></li>
				<li><a href="#">Ajuda</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- Container -->
<div class="container-fluid">

	<!-- Sidebar -->
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><a href="#">Competências</a>
				<li><a href="#">Categorias de Competência</a></li>
				<li><a href="#">Escalas de Competência</a></li>
				<li class="active"><a href="#">Opções de Escala <span class="sr-only">(atual)</span></a></li>
			</ul>
		</div>
	</div>
	
	<!-- Content -->
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">Opções de Escala</h1>
		
		<!-- Add New ScaleOption -->
		<h3 class="sub-header">Nova Opção de Escala</h3>

		<!-- Action -->
		<c:url var="addAction" value="/scale-options/add" ></c:url>

		<!--  Form -->
		<form:form action="${addAction}" commandName="scaleOption">
			<div class="form-group">
				<label for="name">Nome</label>
				<form:input path="name" class="form-control"/>
			</div>
			<button type="submit" class="btn btn-default">Adicionar</button>
		</form:form>
		
		<!-- Add New ScaleOption -->
		<h3 class="sub-header">Lista de Opções de Escala</h3>
		
		<c:if test="${!empty scaleOptions}">
			<div class="table-responsive">
				<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Nome</th>
						<th></th>
						<th></th>
					</tr>
				<thead>
				<tbody>
					<c:forEach items="${scaleOptions}" var="scaleOption">
						<tr>
							<td>${scaleOption.id}</td>
							<td>${scaleOption.name}</td>
							<td><a href="<c:url value='/scale-options/edit/${scaleOption.id}' />" >Editar</a></td>
							<td><a href="<c:url value='/scale-options/remove/${scaleOption.id}' />" >Remover</a></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>
		</c:if>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
