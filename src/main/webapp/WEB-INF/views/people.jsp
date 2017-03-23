<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Escalas de Competência</title>
</head>

<body>

	<%@include file="/resources/jsp/general-navbar.jsp"%>

	<!-- Container -->
	<div class="container-fluid">

		<!-- Sidebar -->
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">Pessoas<span
							class="sr-only">(atual)</span></a>
					<li><a href="<c:url value="#"/>">Pessoas em Competência</a></li>
					<li><a href="<c:url value="#"/>">Competências em Pessoa</a></li>
					<li><a href="<c:url value="#"/>">Preencher Competências</a></li>
				</ul>
			</div>
		</div>

		<!-- Content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Pessoas</h1>

			<!-- Add New ScaleOption -->
			<c:choose>
				<c:when test="${empty person.firstName}">
					<h3 class="sub-header">Registrar Nova Pessoa</h3>
				</c:when>
				<c:otherwise>
					<h3 class="sub-header">Editar Pessoa</h3>
				</c:otherwise>
			</c:choose>

			<!-- Action -->
			<c:url var="addAction" value="/people/add"></c:url>

			<!--  Form -->
			<form:form action="${addAction}" commandName="person" class="form">
				<c:if test="${!empty person.firstName}">
					<div class="form-group">
						<label for="id">Número Identificador</label>
						<form:input path="id" readonly="true" class="form-control" />
					</div>
				</c:if>
				<div class="form-group">
					<label for="firstName">Nome</label>
					<form:input path="firstName" class="form-control" />
				</div>
				<div class="form-group">
					<label for="lastName">Sobrenome</label>
					<form:input path="lastName" class="form-control" />
				</div>
				<div class="form-group">
					<label for="position">Cargo</label>
					<form:input path="position" class="form-control" />
				</div>
				<div class="form-group">
					<label for="company">Empresa</label>
					<form:input path="company" class="form-control" />
				</div>
				<div class="form-group">
					<label for="phoneNumber">Ramal</label>
					<form:input path="phoneNumber" class="form-control" />
				</div>
				<div class="form-group">
					<label for="email">E-Mail</label>
					<form:input path="email" class="form-control" />
				</div>
				<div class="form-group">
					<label for="resumeLink">Link do Currículo/Portifólio</label>
					<form:input path="resumeLink" class="form-control" />
				</div>

				<div class="form-group"></div>
				<c:choose>
					<c:when test="${empty person.firstName}">
						<button type="submit" class="btn btn-default">Adicionar</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn btn-default">Editar</button>
					</c:otherwise>
				</c:choose>
			</form:form>

			<c:if test="${!empty people}">
				<h3 class="sub-header">Lista de Pessoas Registradas</h3>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Nome</th>
								<th>Sobrenome</th>
								<th>Cargo</th>
								<th>Empresa</th>
								<th>Modificar</th>
								<th>Remover</th>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${people}" var="person">
								<tr>
									<td>${person.id}</td>
									<td>${person.firstName}</td>
									<td>${person.lastName}</td>
									<td>${person.position}</td>
									<td>${person.company}</td>
									<td><a href="<c:url value='/people/edit/${person.id}' />"><i
											class="material-icons" style="font-size: 18px">edit</i></a></td>
									<td><a
										href="<c:url value='/people/remove/${person.id}' />"><i
											class="material-icons" style="font-size: 18px">delete</i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
		</div>
	</div>

	<%@include file="/resources/jsp/general-scripts.jsp"%>

</body>
</html>
