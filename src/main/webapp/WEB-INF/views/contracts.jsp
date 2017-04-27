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
<title>Contratos</title>
</head>

<body>
	<div id="wrapper">
		<%@include file="/resources/jsp/general-navbar.jsp"%>

		<!-- Sidebar -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<c:choose>
					<c:when test="${!empty contracts}">
						<li class="active"><a href="#"><i class="fa fa-files-o"></i>
								Contratos</a></li>
						<c:forEach items="${contracts}" begin="0" end="19"
							var="otherContract">
							<li><a
								href="<c:url value="/contracts/edit/${otherContract.id}"/>"><i
									class="fa fa-file-o"></i> ${otherContract.name}</a></li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li><a>Sem contratos definidos</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

		<div id="page-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							<i class="fa fa-files-o"></i> Contratos
						</h1>
						<ol class="breadcrumb">
							<li><a href="<c:url value="/"/>"><i class="fa fa-home"></i>
									In�cio</a></li>
							<li class="active"><i class="fa fa-files-o"></i> Contratos</li>
							<li><a href="javascript:;" data-toggle="collapse"
								data-target="#new"><i class="fa fa-plus-circle"></i>
									(Registrar Novo Contrato)</a></li>
						</ol>
					</div>
				</div>

				<div class="row">
					<!-- Action -->
					<c:url var="addAction" value="/contracts/add"></c:url>


					<div class="col collapse" id="new">
						<h3 class="sub-header">
							<i class="fa fa-plus-circle"></i> Registrar Novo Contrato
						</h3>

						<!--  Form -->
						<form:form action="${addAction}" commandName="contract"
							class="form">
							<div class="form-group">
								<label for="name">Nome</label>
								<form:input path="name" class="form-control" required="required" />
							</div>
							<div class="form-group">
								<label for="description">Descri��o</label>
								<form:input path="description" class="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="supervisorName">Nome do Fiscal do Contrato</label>
								<form:input path="supervisorName" class="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary">Adicionar</button>
							</div>
						</form:form>

					</div>

					<div class="col-lg-12">

						<c:if test="${!empty contracts}">
							<h3 class="sub-header"><i class="fa fa-list"></i> Lista de Contratos Registrados</h3>
							<div class="table-responsive">
								<table id="contracts-table"
									class="table table-bordered table-hover table-striped display">
									<thead>
										<tr>
											<th>#</th>
											<th>Nome</th>
											<th>Descri��o</th>
											<th>Fiscal</th>
											<th>Visualizar</th>
											<th>Remover</th>
										</tr>
									<thead>
									<tbody>
										<c:forEach items="${contracts}" var="contract">
											<tr>
												<td>${contract.id}</td>
												<td>${contract.name}</td>
												<td>${contract.description}</td>
												<td>${contract.supervisorName}</td>
												<td><a
													href="<c:url value='/contracts/edit/${contract.id}' />"><i
														class="material-icons" style="font-size: 18px">launch</i></a></td>
												<td><a
													href="<c:url value='/contracts/remove/${contract.id}' />"><i
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
		<img class="fix-right"
			src="<c:url value="/resources/img/mctic-40.png"/>">
	</div>
	<%@include file="/resources/jsp/general-scripts.jsp"%>
	<script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/dataTables.bootstrap.min.js"/>"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#contracts-table')
									.DataTable(
											{
												language : {
													"sEmptyTable" : "Nenhum contrato encontrado",
													"sInfo" : "Mostrando de _START_ at� _END_ de _TOTAL_ contratos",
													"sInfoEmpty" : "",
													"sInfoFiltered" : "(Filtrados de _MAX_ contratos)",
													"sInfoPostFix" : "",
													"sInfoThousands" : ".",
													"sLengthMenu" : "_MENU_ contratos por p�gina",
													"sLoadingRecords" : "Carregando...",
													"sProcessing" : "Processando...",
													"sZeroRecords" : "Nenhum contrato encontrado",
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
	< /body>
</html>
