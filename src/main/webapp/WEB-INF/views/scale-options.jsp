<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html lang="en">
<head>
	<%@include file="/resources/jsp/general-head.jsp" %>
	<title>Op��es de Escala</title>
</head>

<body>

<%@include file="/resources/jsp/general-navbar.jsp" %>

<!-- Container -->
<div class="container-fluid">

	<!-- Sidebar -->
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><a href="#">Compet�ncias</a>
				<li><a href="#">Categorias de Compet�ncia</a></li>
				<li><a href="#">Escalas de Compet�ncia</a></li>
				<li class="active"><a href="#">Op��es de Escala <span class="sr-only">(atual)</span></a></li>
			</ul>
		</div>
	</div>
	
	<!-- Content -->
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">Op��es de Escala</h1>
		
		<!-- Add New ScaleOption -->
		<c:choose>
			<c:when test="${empty scaleOption.name}">
				<h3 class="sub-header">Nova Op��o de Escala</h3>
			</c:when>
			<c:otherwise>
				<h3 class="sub-header">Editar Op��o de Escala</h3>
			</c:otherwise>
		</c:choose>
		
		<!-- Action -->
		<c:url var="addAction" value="/scale-options/add" ></c:url>

		<!--  Form -->
		<form:form action="${addAction}" commandName="scaleOption">
			<c:if test="${!empty scaleOption.name}">
				<div class="form-group">
					<label for="id">N�mero Identificador</label>
					<form:input path="id" readonly="true" class="form-control"/>
				</div>
			</c:if>
			<div class="form-group">
				<label for="name">Nome</label>
				<form:input path="name" class="form-control"/>
			</div>
			<c:choose>
				<c:when test="${empty scaleOption.name}">
					<button type="submit" class="btn btn-default">Adicionar</button>
				</c:when>
				<c:otherwise>
					<button type="submit" class="btn btn-default">Editar</button>
				</c:otherwise>
			</c:choose>
		</form:form>
		
		<c:if test="${!empty scaleOptions}">
			<h3 class="sub-header">Lista de Op��es de Escala</h3>
			<div class="table-responsive">
				<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Nome</th>
						<th>Modificar</th>
						<th>Remover</th>
					</tr>
				<thead>
				<tbody>
					<c:forEach items="${scaleOptions}" var="scaleOption">
						<tr>
							<td>${scaleOption.id}</td>
							<td>${scaleOption.name}</td>
							<td><a href="<c:url value='/scale-options/edit/${scaleOption.id}' />" ><i class="material-icons" style="font-size:18px">edit</i></a></td>
							<td><a href="<c:url value='/scale-options/remove/${scaleOption.id}' />" ><i class="material-icons" style="font-size:18px">delete</i></a></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>
		</c:if>
	</div>
</div>

<%@include file="/resources/jsp/general-scripts.jsp" %>

</body>
</html>
