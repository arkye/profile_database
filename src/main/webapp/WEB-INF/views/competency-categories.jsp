<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Escalas de Compet�ncia</title>
</head>

<body>

	<%@include file="/resources/jsp/general-navbar.jsp"%>

	<!-- Container -->
	<div class="container-fluid">

		<!-- Sidebar -->
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<c:url value="/competencies"/>">Compet�ncias</a>
					<li class="active"><a href="#">Categorias de Compet�ncia<span
							class="sr-only">(atual)</span></a></li>
					<li><a href="<c:url value="/competency-scales"/>">Escalas
							de Compet�ncia</a></li>
					<li><a href="<c:url value="/scale-options"/>">Op��es de
							Escala</a></li>
				</ul>
			</div>
		</div>

		<!-- Content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Categorias de Compet�ncia</h1>

			<!-- Add New ScaleOption -->
			<c:choose>
				<c:when test="${empty competencyCategory.name}">
					<h3 class="sub-header">Nova Categoria de Compet�ncia</h3>
				</c:when>
				<c:otherwise>
					<h3 class="sub-header">Editar Categoria de Compet�ncia</h3>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${!empty competencyScales}">
					<!-- Action -->
					<c:url var="addAction" value="/competency-categories/add"></c:url>

					<!--  Form -->
					<form:form action="${addAction}" commandName="competencyCategory"
						class="form">
						<c:if test="${!empty competencyCategory.name}">
							<div class="form-group">
								<label for="id">N�mero Identificador</label>
								<form:input path="id" readonly="true" class="form-control" />
							</div>
						</c:if>
						<div class="form-group">
							<label for="name">Nome</label>
							<form:input path="name" class="form-control" />
						</div>
						<div class="form-group">
							<label for="description">Descri��o</label>
							<form:input path="description" class="form-control" />
						</div>
						<label for="competencyScale">Escalas de Compet�ncia</label>
						<div class="form-group">
							<form:select path="competencyScale" class="form-control"
								multiple="false" items="${competencyScales}" itemLabel="name"
								itemValue="id" />
						</div>

						<div class="form-group"></div>
						<c:choose>
							<c:when test="${empty competencyCategory.name}">
								<button type="submit" class="btn btn-default">Adicionar</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-default">Editar</button>
							</c:otherwise>
						</c:choose>
					</form:form>

					<c:if test="${!empty competencyCategories && empty competencyCategory.name}">
						<h3 class="sub-header">Lista de Categorias de Compet�ncia</h3>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Nome</th>
										<th>Descri��o</th>
										<th>Escala de Compet�ncia</th>
										<th>Modificar</th>
										<th>Remover</th>
									</tr>
								<thead>
								<tbody>
									<c:forEach items="${competencyCategories}"
										var="competencyCategory">
										<tr>
											<td>${competencyCategory.id}</td>
											<td>${competencyCategory.name}</td>
											<td>${competencyCategory.description}</td>
											<td>${competencyCategory.competencyScale.name}</td>
											<td><a
												href="<c:url value='/competency-categories/edit/${competencyCategory.id}' />"><i
													class="material-icons" style="font-size: 18px">edit</i></a></td>
											<td><a
												href="<c:url value='/competency-categories/remove/${competencyCategory.id}' />"><i
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
						<strong>Dica</strong>: Para criar uma nova categoria de
						compet�ncia � necess�rio, antes, definir uma escala de
						compet�ncia. Para definir uma escala de compet�ncia, <a
							href="<c:url value="competency-scales"/>">clique aqui</a>.
					</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<%@include file="/resources/jsp/general-scripts.jsp"%>

</body>
</html>
