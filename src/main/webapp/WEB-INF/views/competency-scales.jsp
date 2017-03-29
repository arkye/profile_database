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
					<li><a href="<c:url value="/competencies"/>">Competências</a>
					<li><a href="<c:url value="/competency-categories"/>">Categorias
							de Competência</a></li>
					<li class="active"><a href="#">Escalas de Competência<span
							class="sr-only">(atual)</span></a></li>
					<li><a href="<c:url value="/scale-options"/>">Opções de
							Escala</a></li>
				</ul>
			</div>
		</div>

		<!-- Content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Escalas de Competência</h1>

			<!-- Add New ScaleOption -->
			<c:choose>
				<c:when test="${empty competencyScale.name}">
					<h3 class="sub-header">Nova Escala de Competência</h3>
				</c:when>
				<c:otherwise>
					<h3 class="sub-header">Editar Escala de Competência</h3>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${!empty scaleOptions}">
					<!-- Action -->
					<c:url var="addAction" value="/competency-scales/add"></c:url>

					<!--  Form -->
					<form:form action="${addAction}" commandName="competencyScale"
						class="form">
						<c:if test="${!empty competencyScale.name}">
							<div class="form-group">
								<label for="id">Número Identificador</label>
								<form:input path="id" readonly="true" class="form-control" />
							</div>
						</c:if>
						<div class="form-group">
							<label for="name">Nome</label>
							<form:input path="name" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<label for="description">Descrição</label>
							<form:input path="description" class="form-control" required="required"/>
						</div>
						<label for="scaleOptions">Opções de Escala</label>
						<div class="form-group">
							<form:select path="scaleOptions" class="form-control"
								multiple="true" items="${scaleOptions}" itemLabel="name"
								itemValue="id" required="required"/>
						</div>

						<div class="form-group"></div>
						<c:choose>
							<c:when test="${empty competencyScale.name}">
								<button type="submit" class="btn btn-default">Adicionar</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-default">Editar</button>
							</c:otherwise>
						</c:choose>
					</form:form>

					<c:if
						test="${!empty competencyScales && empty competencyScale.name}">
						<h3 class="sub-header">Lista de Escalas de Competência</h3>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Nome</th>
										<th>Descrição</th>
										<th>Opções de Escala</th>
										<th>Modificar</th>
										<th>Remover</th>
									</tr>
								<thead>
								<tbody>
									<c:forEach items="${competencyScales}" var="competencyScale">
										<tr>
											<td>${competencyScale.id}</td>
											<td>${competencyScale.name}</td>
											<td>${competencyScale.description}</td>
											<td><c:forEach items="${competencyScale.scaleOptions}"
													var="scaleOption">
											${scaleOption.name}
										</c:forEach></td>
											<td><a
												href="<c:url value='/competency-scales/edit/${competencyScale.id}' />"><i
													class="material-icons" style="font-size: 18px">edit</i></a></td>
											<td><a
												href="<c:url value='/competency-scales/remove/${competencyScale.id}' />"><i
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
						<strong>Dica</strong>: Para criar uma nova escala de competência é
						necessário, antes, definir opções de escala. Para definir opções
						de escala, <a href="<c:url value="scale-options"/>">clique
							aqui</a>.
					</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<%@include file="/resources/jsp/general-scripts.jsp"%>

</body>
</html>
