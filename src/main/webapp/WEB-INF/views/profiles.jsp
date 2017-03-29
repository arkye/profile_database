<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Perfis</title>
</head>

<body>

	<%@include file="/resources/jsp/general-navbar.jsp"%>

	<!-- Container -->
	<div class="container-fluid">

		<!-- Sidebar -->
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="<c:url value="#"/>">Perfis<span
							class="sr-only">(atual)</span></a></li>
					<li><a href="<c:url value="/contracts"/>">Contratos</a></li>
					<li><a href="<c:url value="/collaborators"/>">Colaboradores</a>
				</ul>
			</div>
		</div>

		<!-- Content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Perfis</h1>

			<c:choose>
				<c:when test="${!empty contracts}">
					<!-- Action -->
					<c:url var="addAction" value="/profiles/add"></c:url>

					<h3 class="sub-header">Registrar Novo Perfil</h3>

					<!--  Form -->
					<form:form action="${addAction}" commandName="profile" class="form">
						<div class="form-group">
							<label for="name">Nome</label>
							<form:input path="name" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<label for="description">Descrição</label>
							<form:input path="description" class="form-control" required="required"/>
						</div>
						<label for="competencyScale">Contrato</label>
						<div class="form-group">
							<form:select path="contract" class="form-control"
								multiple="false" items="${contracts}" itemLabel="name"
								itemValue="id" required="required"/>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-default">Adicionar</button>
						</div>
					</form:form>

					<c:if test="${!empty profiles}">
						<h3 class="sub-header">Lista de Contratos Registrados</h3>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Nome</th>
										<th>Descrição</th>
										<th>Contrato</th>
										<th>Visualizar</th>
										<th>Remover</th>
									</tr>
								<thead>
								<tbody>
									<c:forEach items="${profiles}" var="profile">
										<tr>
											<td>${profile.id}</td>
											<td>${profile.name}</td>
											<td>${profile.description}</td>
											<td>${profile.contract.name}</td>
											<td><a
												href="<c:url value='/profiles/edit/${profile.id}' />"><i
													class="material-icons" style="font-size: 18px">launch</i></a></td>
											<td><a
												href="<c:url value='/profiles/remove/${profile.id}' />"><i
													class="material-icons" style="font-size: 18px">delete</i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<p>
						<strong>Dica</strong>: Para criar um novo perfil é necessário,
						antes, definir um contrato. Para definir um contrato, <a
							href="<c:url value="/contracts"/>">clique aqui</a>.
					</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<%@include file="/resources/jsp/general-scripts.jsp"%>

</body>
</html>
