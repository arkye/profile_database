<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<link rel="stylesheet"
	href="<c:url value="/resources/css/dataTables.bootstrap.min.css"/>">
<title>Compet�ncias</title>
</head>

<body>
	<div id="wrapper">
		<%@include file="/resources/jsp/general-navbar.jsp"%>

		<!-- Sidebar -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<c:choose>
					<c:when test="${!empty competencies}">
						<c:choose>
							<c:when test="${!empty competency.name}">
								<li><a href="<c:url value="/competencies"/>">Compet�ncias</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="#">Compet�ncias</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach items="${competencies}" begin="0" end="19"
							var="otherCompetency">
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
						<li><a>Sem compet�ncias definidas</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

		<div id="page-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Compet�ncias</h1>
						<ol class="breadcrumb">
							<li><a href="<c:url value="/"/>">In�cio</a></li>
							<c:choose>
								<c:when test="${!empty competency.name}">
									<li><a href="<c:url value="/competencies"/>">Compet�ncias</a></li>
									<li class="active">${competency.name}</li>
								</c:when>
								<c:otherwise>
									<li class="active">Compet�ncias</li>
									<li><a href="javascript:;" data-toggle="collapse"
										data-target="#new">(Registrar Nova Compet�ncia)</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</div>
				</div>

				<div class="row">
					<!-- Action -->
					<c:url var="addAction" value="/competencies/add"></c:url>
					<!-- Add New ScaleOption -->
					<c:choose>
						<c:when test="${empty competency.name}">
							<div class="col collapse" id="new">
								<h3 class="sub-header">Registrar Nova Compet�ncia</h3>

								<!--  Form -->
								<form:form action="${addAction}" commandName="competency"
									class="form">
									<div class="form-group">
										<label for="name">Nome</label>
										<form:input path="name" class="form-control"
											required="required" />
									</div>
									<div class="form-group">
										<label for="description">Descri��o</label>
										<form:input path="description" class="form-control"
											required="required" />
									</div>

									<div class="form-group"></div>
									<button type="submit" class="btn btn-primary">Adicionar</button>
								</form:form>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col">
								<h3 class="sub-header">Editar Compet�ncia</h3>

								<!--  Form -->
								<form:form action="${addAction}" commandName="competency"
									class="form">
									<div class="form-group">
										<label for="id">N�mero Identificador</label>
										<form:input path="id" readonly="true" class="form-control" />
									</div>
									<div class="form-group">
										<label for="name">Nome</label>
										<form:input path="name" class="form-control"
											required="required" />
									</div>
									<div class="form-group">
										<label for="description">Descri��o</label>
										<form:input path="description" class="form-control"
											required="required" />
									</div>

									<div class="form-group"></div>
									<button type="submit" class="btn btn-primary">Editar</button>
								</form:form>
							</div>
						</c:otherwise>
					</c:choose>

					<div class="col">
						<c:if test="${!empty competencies && empty competency.name}">
							<h3 class="sub-header">Lista de Categorias de Compet�ncia</h3>
							<div class="table-responsive">
								<table id="competencies-table" class="table table-bordered table-hover table-striped display">
									<thead>
										<tr>
											<th>#</th>
											<th>Nome</th>
											<th>Descri��o</th>
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
			</div>
		</div>
	</div>
	<%@include file="/resources/jsp/general-scripts.jsp"%>
	<script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/dataTables.bootstrap.min.js"/>"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#competencies-table')
									.DataTable(
											{
												language : {
													"sEmptyTable" : "Nenhuma compet�ncia encontrada",
													"sInfo" : "Mostrando de _START_ at� _END_ de _TOTAL_ compet�ncias",
													"sInfoEmpty" : "",
													"sInfoFiltered" : "(Filtrados de _MAX_ compet�ncias)",
													"sInfoPostFix" : "",
													"sInfoThousands" : ".",
													"sLengthMenu" : "_MENU_ compet�ncias por p�gina",
													"sLoadingRecords" : "Carregando...",
													"sProcessing" : "Processando...",
													"sZeroRecords" : "Nenhuma compet�ncia encontrada",
													"sSearch" : "Pesquisar ",
													"oPaginate" : {
														"sNext" : "Pr�ximo",
														"sPrevious" : "Anterior",
														"sFirst" : "Primeiro",
														"sLast" : "�ltimo"
													},
													"oAria" : {
														"sSortAscending" : ": Ordenar colunas de forma crescente",
														"sSortDescending" : ": Ordenar colunas de forma decrescente"
													}
												},
												columnDefs : [ {
													"orderable" : false,
													"targets" : [ 4, 5 ]
												} ]
											});
						});
	</script>
</body>
</html>
