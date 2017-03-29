<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Competências</title>
</head>

<body>

	<%@include file="/resources/jsp/general-navbar.jsp"%>

	<!-- Container -->
	<div class="container-fluid">

		<!-- Sidebar -->
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<c:choose>
						<c:when test="${!empty competencies}">
							<c:if test="${!empty competency.name}">
								<li><a href="<c:url value="/competencies"/>">Competências</a></li>
							</c:if>
							<c:forEach items="${competencies}" var="otherCompetency">
								<c:choose>
									<c:when test="${otherCompetency.id == competency.id}">
										<li class="active"><a href="#">${competency.name}<span
												class="sr-only">(atual)</span></a>
									</c:when>
									<c:otherwise>
										<li><a
											href="<c:url value="/competencies/edit/${otherCompetency.id}"/>">${otherCompetency.name}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li><a>Sem competências definidas</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>

		<!-- Content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Competências</h1>

			<!-- Add New ScaleOption -->
			<c:choose>
				<c:when test="${empty competency.name}">
					<h3 class="sub-header">Nova Competência</h3>
				</c:when>
				<c:otherwise>
					<h3 class="sub-header">Editar Competência</h3>
				</c:otherwise>
			</c:choose>

			<!-- Action -->
			<c:url var="addAction" value="/competencies/add"></c:url>

			<!--  Form -->
			<form:form action="${addAction}" commandName="competency"
				class="form">
				<c:if test="${!empty competency.name}">
					<div class="form-group">
						<label for="id">Número Identificador</label>
						<form:input path="id" readonly="true" class="form-control" />
					</div>
				</c:if>
				<div class="form-group">
					<label for="name">Nome</label>
					<form:input path="name" class="form-control" required="required" />
				</div>
				<div class="form-group">
					<label for="description">Descrição</label>
					<form:input path="description" class="form-control"
						required="required" />
				</div>

				<div class="form-group"></div>
				<c:choose>
					<c:when test="${empty competency.name}">
						<button type="submit" class="btn btn-default">Adicionar</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn btn-default">Editar</button>
					</c:otherwise>
				</c:choose>
			</form:form>

			<c:if test="${!empty competencies && empty competency.name}">
				<h3 class="sub-header">Lista de Categorias de Competência</h3>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Nome</th>
								<th>Descrição</th>
								<th>Contrato</th>
								<th>Modificar</th>
								<th>Remover</th>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${competencies}" var="competency">
								<tr>
									<td>${competency.id}</td>
									<td>${competency.name}</td>
									<td>${competency.description}</td>
									<td><c:choose>
											<c:when test="${!empty competency.contract.name}">${competency.contract.name}</c:when>
											<c:otherwise>Sem contrato associado</c:otherwise>
										</c:choose></td>
									<td><a
										href="<c:url value='/competencies/edit/${competency.id}' />"><i
											class="material-icons" style="font-size: 18px">edit</i></a></td>
									<td><a
										href="<c:url value='/competencies/remove/${competency.id}' />"><i
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
