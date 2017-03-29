<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Compet�ncias</title>
</head>

<body>

	<%@include file="/resources/jsp/general-navbar.jsp"%>

	<!-- Container -->
	<div class="container-fluid">

		<!-- Sidebar -->
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">Compet�ncias<span
							class="sr-only">(atual)</span></a>
					<li><a href="<c:url value="/competency-categories"/>">Categorias
							de Compet�ncia</a></li>
					<li><a href="<c:url value="/competency-scales"/>">Escalas
							de Compet�ncia</a></li>
					<li><a href="<c:url value="/scale-options"/>">Op��es de
							Escala</a></li>
				</ul>
			</div>
		</div>

		<!-- Content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Compet�ncias</h1>

			<!-- Add New ScaleOption -->
			<c:choose>
				<c:when test="${empty competency.name}">
					<h3 class="sub-header">Nova Compet�ncia</h3>
				</c:when>
				<c:otherwise>
					<h3 class="sub-header">Editar Compet�ncia</h3>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${!empty competencyCategories}">
					<!-- Action -->
					<c:url var="addAction" value="/competencies/add"></c:url>

					<!--  Form -->
					<form:form action="${addAction}" commandName="competency"
						class="form">
						<c:if test="${!empty competency.name}">
							<div class="form-group">
								<label for="id">N�mero Identificador</label>
								<form:input path="id" readonly="true" class="form-control" />
							</div>
						</c:if>
						<div class="form-group">
							<label for="name">Nome</label>
							<form:input path="name" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<label for="description">Descri��o</label>
							<form:input path="description" class="form-control" required="required"/>
						</div>
						<label for="competencyCategory">Categoria de Compet�ncia</label>
						<div class="form-group">
							<form:select path="competencyCategory" class="form-control"
								multiple="false" items="${competencyCategories}"
								itemLabel="name" itemValue="id" required="required"/>
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
						<h3 class="sub-header">Lista de Categorias de Compet�ncia</h3>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Nome</th>
										<th>Descri��o</th>
										<th>Categoria de Compet�ncia</th>
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
											<td>${competency.competencyCategory.name}</td>
											<td><c:choose>
													<c:when test="${!empty competency.contract}">${competency.contract.name}</c:when>
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
				</c:when>
				<c:otherwise>
					<p>
						<strong>Dica</strong>: Para criar uma nova compet�ncia �
						necess�rio, antes, definir uma categoria de compet�ncia. Para
						definir uma categoria de compet�ncia, <a
							href="<c:url value="competency-categories"/>">clique aqui</a>.
					</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<%@include file="/resources/jsp/general-scripts.jsp"%>

</body>
</html>
