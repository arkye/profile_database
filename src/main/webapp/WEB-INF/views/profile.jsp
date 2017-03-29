<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Perfil: ${profile.name}</title>
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
					<li class="active"><a href="#">Perfil: ${profile.name}<span
							class="sr-only">(atual)</span>
					</a></li>
					<li><a href="<c:url value="/contracts"/>">Contratos</a></li>
					<li><a href="<c:url value="/collaborators"/>">Colaboradores</a>
				</ul>
			</div>
		</div>

		<!-- Content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Perfil: ${profile.name}</h1>

			<h3 class="sub-header">Editar Perfil</h3>

			<c:url var="editProfileAction" value="/profiles/edit"></c:url>

			<!--  Form -->
			<form:form action="${editProfileAction}" commandName="profile"
				class="form">
				<div class="form-group">
					<label for="id">Número Identificador</label>
					<form:input path="id" class="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<label for="name">Nome</label>
					<form:input path="name" class="form-control" />
				</div>
				<div class="form-group">
					<label for="description">Descrição</label>
					<form:input path="description" class="form-control" />
				</div>
				<label for="competencyScale">Contrato</label>
				<div class="form-group">
					<form:select path="contract" class="form-control" multiple="false"
						items="${contracts}" itemLabel="name" itemValue="id" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-default">Editar</button>
				</div>
			</form:form>

			<c:if test="${!empty profile.competencies}">
				<h3 class="sub-header">Lista de Competências do Perfil</h3>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Nome</th>
								<th>Descrição</th>
								<th>Categoria de Competência</th>
								<th>Remover do Perfil</th>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${profile.competencies}" var="competency" varStatus="i">
								<tr>
									<td>${competency.id}</td>
									<td>${competency.name}</td>
									<td>${competency.description}</td>
									<td>${competency.competencyCategory.name}</td>
									<td><a
										href="<c:url value='/profiles/edit/${profile.id}/remove/competency/${i.index}' />"><i
											class="material-icons" style="font-size: 18px">remove_circle</i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>

			<c:if test="${!empty competencies}">
				<h3 class="sub-header">Lista de Competências do Contrato não
					associados à este Perfil</h3>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Nome</th>
								<th>Descrição</th>
								<th>Categoria de Competência</th>
								<th>Adicionar ao Perfil</th>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${competencies}" var="competency">
								<tr>
									<td>${competency.id}</td>
									<td>${competency.name}</td>
									<td>${competency.description}</td>
									<td>${competency.competencyCategory.name}</td>
									<td><a
										href="<c:url value='/profiles/edit/${profile.id}/add/competency/${competency.id}' />"><i
											class="material-icons" style="font-size: 18px">add_circle</i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>

			<c:if test="${!empty profile.collaborators}">
				<h3 class="sub-header">Lista de Colaboradores com este Perfil</h3>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Nome</th>
								<th>Sobrenome</th>
								<th>Currículo</th>
								<th>Remover do Perfil</th>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${profile.collaborators}" var="collaborator"
								varStatus="i">
								<tr>
									<td>${collaborator.id}</td>
									<td>${collaborator.firstName}</td>
									<td>${collaborator.lastName}</td>
									<td><a
										href="<c:url value='/collaborators/${collaborator.id}/resume' />"><i
											class="material-icons" style="font-size: 18px">file_download</i></a></td>
									<td><a
										href="<c:url value='/profiles/edit/${profile.id}/remove/collaborator/${i.index}' />"><i
											class="material-icons" style="font-size: 18px">remove_circle</i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>

			<c:if test="${!empty collaborators}">
				<h3 class="sub-header">Lista de Colaboradores não associados à
					este Perfil</h3>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Nome</th>
								<th>Sobrenome</th>
								<th>Currículo</th>
								<th>Adicionar ao Perfil</th>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${collaborators}" var="collaborator">
								<tr>
									<td>${collaborator.id}</td>
									<td>${collaborator.firstName}</td>
									<td>${collaborator.lastName}</td>
									<td><a
										href="<c:url value='/collaborators/${collaborator.id}/resume' />"><i
											class="material-icons" style="font-size: 18px">file_download</i></a></td>
									<td><a
										href="<c:url value='/profiles/edit/${profile.id}/add/collaborator/${collaborator.id}' />"><i
											class="material-icons" style="font-size: 18px">add_circle</i></a></td>
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
