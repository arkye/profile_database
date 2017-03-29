<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Colaboradores</title>
</head>

<body>

	<%@include file="/resources/jsp/general-navbar.jsp"%>

	<!-- Container -->
	<div class="container-fluid">

		<!-- Sidebar -->
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<c:url value="/profiles"/>">Perfis</a></li>
					<li><a href="<c:url value="/contracts"/>">Contratos</a></li>
					<li class="active"><a href="#">Colaboradores<span
							class="sr-only">(atual)</span></a>
				</ul>
			</div>
		</div>

		<!-- Content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Colaboradores</h1>

			<!-- Action -->
			<c:url var="addAction" value="/collaborators/add"></c:url>

			<c:choose>
				<c:when test="${empty collaborator.firstName}">
					<h3 class="sub-header">Registrar Novo Colaborador</h3>

					<!--  Form -->
					<form method="POST" action="${addAction}"
						enctype="multipart/form-data" class="form">
						<input type="number" name="id" class="form-control" value=0
							style="visibility: hidden" />
						<div class="form-group">
							<label for="firstName">Nome</label> <input type="text"
								name="firstName" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="lastName">Sobrenome</label> <input type="text"
								name="lastName" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="file">Currículo</label> <input type="file"
								name="file" class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-default" value="Adicionar">
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<h3 class="sub-header">Editar Colaborador</h3>

					<!--  Form -->
					<form method="POST" action="${addAction}"
						enctype="multipart/form-data" class="form">
						<input type="number" name="id" class="form-control"
							value="${collaborator.id}" readonly />
						<div class="form-group">
							<label for="firstName">Nome</label> <input type="text"
								name="firstName" class="form-control"
								value="${collaborator.firstName}" required>
						</div>
						<div class="form-group">
							<label for="lastName">Sobrenome</label> <input type="text"
								name="lastName" class="form-control"
								value="${collaborator.lastName}" required>
						</div>
						<div class="form-group">
							<label for="file">Currículo</label> <input type="file"
								name="file" class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-default" value="Editar">
						</div>
					</form>
				</c:otherwise>
			</c:choose>

			<c:if test="${!empty collaborators && empty collaborator.firstName}">
				<h3 class="sub-header">Lista de Pessoas Registradas</h3>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Nome</th>
								<th>Sobrenome</th>
								<th>Currículo</th>
								<th>Modificar</th>
								<th>Remover</th>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${collaborators}" var="collaborator">
								<tr>
									<td>${collaborator.id}</td>
									<td>${collaborator.firstName}</td>
									<td>${collaborator.lastName}</td>
									<td><c:if test="${!empty collaborator.resume.fileName}">
											<a
												href="<c:url value='/collaborators/${collaborator.id}/resume' />"><i
												class="material-icons" style="font-size: 18px">file_download</i></a>
										</c:if></td>
									<td><a
										href="<c:url value='/collaborators/edit/${collaborator.id}' />"><i
											class="material-icons" style="font-size: 18px">edit</i></a></td>
									<td><a
										href="<c:url value='/collaborators/remove/${collaborator.id}' />"><i
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
