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
<title>Contrato: ${contract.name}</title>
</head>

<body>
	<div id="wrapper">
		<%@include file="/resources/jsp/general-navbar.jsp"%>

		<!-- Sidebar -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li><a href="<c:url value="/contracts"/>"><i
						class="fa fa-files-o"></i> Contratos</a></li>
				<c:forEach items="${contracts}" begin="0" end="19"
					var="otherContract">
					<c:choose>
						<c:when test="${otherContract.id == contract.id}">
							<li class="active"><a href="#"><i class="fa fa-file-o"></i>
									${contract.name}<span class="sr-only">(atual)</span></a>
						</c:when>
						<c:otherwise>
							<li><a
								href="<c:url value="/contracts/edit/${otherContract.id}"/>"><i
									class="fa fa-file-o"></i> ${otherContract.name}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>

		<div id="page-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							<i class="fa fa-file-o"></i> Contrato
						</h1>
						<ol class="breadcrumb">
							<li><a href="<c:url value="/"/>"><i class="fa fa-home"></i>
									Início</a></li>
							<li><a href="<c:url value="/contracts"/>"><i
									class="fa fa-files-o"></i> Contratos</a></li>
							<li class="active"><a href="javascript:;"
								data-toggle="collapse" data-target="#edit"><i
									class="fa fa-file-o"></i> ${contract.name} (Editar Contrato) <i
									class="fa fa-pencil-square"></i> </a></li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div id="edit" class="col-lg-12 collapse">
						<h3 class="sub-header">
							<i class="fa fa-pencil-square"></i> Editar Contrato
						</h3>

						<c:url var="editContractAction" value="/contracts/edit"></c:url>

						<!--  Form -->
						<form:form action="${editContractAction}" commandName="contract"
							class="form">
							<div class="form-group">
								<label for="id">Número Identificador</label>
								<form:input path="id" class="form-control" readonly="true" />
							</div>
							<div class="form-group">
								<label for="name">Nome</label>
								<form:input path="name" class="form-control" required="required" />
							</div>
							<div class="form-group">
								<label for="description">Descrição</label>
								<form:input path="description" class="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="supervisorName">Nome do Fiscal do Contrato</label>
								<form:input path="supervisorName" class="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary">Editar</button>
							</div>
						</form:form>

						<h3 class="sub-header">
							<i class="fa fa-plus-circle"></i> Adicionar Documento ao Contrato
						</h3>

						<c:url var="addDocumentAction"
							value="/contracts/edit/${contract.id}/add/document"></c:url>

						<!--  Form -->
						<form method="POST" action="${addDocumentAction}"
							enctype="multipart/form-data" class="form">
							<div class="form-group">
								<label for="name">Nome</label> <input type="text" name="name"
									class="form-control" required />
							</div>
							<div class="form-group">
								<label for="file">Arquivo</label> <input type="file" name="file"
									class="form-control" required />
							</div>
							<div class="form-group">
								<input type="submit" class="btn btn-primary" value="Adicionar">
							</div>
						</form>
					</div>

					<div class="col-lg-12">

						<c:if test="${!empty contract.documents}">
							<h3 class="sub-header">
								<i class="fa fa-list"></i> <i class="fa fa-file-text"></i> Lista
								de Documentos do Contrato
							</h3>
							<div class="table-responsive">
								<table id="documents-table"
									class="table table-bordered table-hover table-striped display">
									<thead>
										<tr>
											<th>#</th>
											<th>Nome</th>
											<th>Documento</th>
											<th>Remover</th>
										</tr>
									<thead>
									<tbody>

										<c:forEach items="${contract.documents}" var="document"
											varStatus="i">
											<tr>
												<td>${document.id}</td>
												<td>${document.name}</td>
												<td class="big center-table"><c:if
														test="${!empty document.fileName}">
														<a href="<c:url value='/documents/show/${document.id}' />"><i
															class="fa fa-download"></i></a>
													</c:if></td>
												<td class="big center-table"><a
													href="<c:url value='/contracts/edit/${contract.id}/remove/document/${i.index}'/>"><i
														class="fa fa-trash-o"></i></a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</c:if>

					</div>

					<div class="col-lg-12">

						<c:if test="${!empty contract.competencies}">
							<h3 class="sub-header">
								<i class="fa fa-list"></i> <i class="fa fa-graduation-cap"></i>
								Lista de Competências do Contrato
							</h3>
							<div class="table-responsive">
								<table id="self-competencies-table"
									class="table table-bordered table-hover table-striped display">
									<thead>
										<tr>
											<th>#</th>
											<th>Nome</th>
											<th>Descrição</th>
											<th>Remover do Contrato</th>
										</tr>
									<thead>
									<tbody>
										<c:forEach items="${contract.competencies}" var="competency"
											varStatus="i">
											<tr>
												<td>${competency.id}</td>
												<td>${competency.name}</td>
												<td>${competency.description}</td>
												<td class="big center-table"><a
													href="<c:url value='/contracts/edit/${contract.id}/remove/competency/${i.index}' />"><i
														class="fa fa-minus-square"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>

					</div>
					<div class="col-lg-12">

						<c:if test="${!empty competencies}">
							<h3 class="sub-header">
								<i class="fa fa-list-alt"></i> <i class="fa fa-graduation-cap"></i>
								Lista de Competências sem Contrato
							</h3>
							<div class="table-responsive">
								<table id="other-competencies-table"
									class="table table-bordered table-hover table-striped display">
									<thead>
										<tr>
											<th>#</th>
											<th>Nome</th>
											<th>Descrição</th>
											<th>Adicionar ao Contrato</th>
										</tr>
									<thead>
									<tbody>
										<c:forEach items="${competencies}" var="competency">
											<tr>
												<td>${competency.id}</td>
												<td>${competency.name}</td>
												<td>${competency.description}</td>
												<td class="big center-table"><a
													href="<c:url value='/contracts/edit/${contract.id}/add/competency/${competency.id}' />"><i
														class="fa fa-plus-square"></i></a></td>
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
							$('#documents-table')
									.DataTable(
											{
												language : {
													"sEmptyTable" : "Nenhum documento encontrado",
													"sInfo" : "Mostrando de _START_ até _END_ de _TOTAL_ documentos",
													"sInfoEmpty" : "",
													"sInfoFiltered" : "(Filtrados de _MAX_ documentos)",
													"sInfoPostFix" : "",
													"sInfoThousands" : ".",
													"sLengthMenu" : "_MENU_ documentos por página",
													"sLoadingRecords" : "Carregando...",
													"sProcessing" : "Processando...",
													"sZeroRecords" : "Nenhum documento encontrado",
													"sSearch" : "Pesquisar ",
													"oPaginate" : {
														"sNext" : "Próximo",
														"sPrevious" : "Anterior",
														"sFirst" : "Primeiro",
														"sLast" : "Último"
													},
													"oAria" : {
														"sSortAscending" : ": Ordenar colunas de forma crescente",
														"sSortDescending" : ": Ordenar colunas de forma decrescente"
													}
												},
												columnDefs : [ {
													"orderable" : false,
													"targets" : [ 2, 3 ]
												} ]
											});
							selfCompetenciesTable = $(
									'#self-competencies-table')
									.DataTable(
											{
												language : {
													"sEmptyTable" : "Nenhuma competência encontrada",
													"sInfo" : "Mostrando de _START_ até _END_ de _TOTAL_ competências",
													"sInfoEmpty" : "",
													"sInfoFiltered" : "(Filtrados de _MAX_ competências)",
													"sInfoPostFix" : "",
													"sInfoThousands" : ".",
													"sLengthMenu" : "_MENU_ competências por página",
													"sLoadingRecords" : "Carregando...",
													"sProcessing" : "Processando...",
													"sZeroRecords" : "Nenhuma competência encontrada",
													"sSearch" : "Pesquisar ",
													"oPaginate" : {
														"sNext" : "Próximo",
														"sPrevious" : "Anterior",
														"sFirst" : "Primeiro",
														"sLast" : "Último"
													},
													"oAria" : {
														"sSortAscending" : ": Ordenar colunas de forma crescente",
														"sSortDescending" : ": Ordenar colunas de forma decrescente"
													}
												},
												columnDefs : [ {
													"orderable" : false,
													"targets" : 3
												} ]
											});
							$('#other-competencies-table')
									.DataTable(
											{
												language : {
													"sEmptyTable" : "Nenhuma competência encontrada",
													"sInfo" : "Mostrando de _START_ até _END_ de _TOTAL_ competências",
													"sInfoEmpty" : "",
													"sInfoFiltered" : "(Filtrados de _MAX_ competências)",
													"sInfoPostFix" : "",
													"sInfoThousands" : ".",
													"sLengthMenu" : "_MENU_ competências por página",
													"sLoadingRecords" : "Carregando...",
													"sProcessing" : "Processando...",
													"sZeroRecords" : "Nenhuma competência encontrada",
													"sSearch" : "Pesquisar ",
													"oPaginate" : {
														"sNext" : "Próximo",
														"sPrevious" : "Anterior",
														"sFirst" : "Primeiro",
														"sLast" : "Último"
													},
													"oAria" : {
														"sSortAscending" : ": Ordenar colunas de forma crescente",
														"sSortDescending" : ": Ordenar colunas de forma decrescente"
													}
												},
												columnDefs : [ {
													"orderable" : false,
													"targets" : 3
												} ]
											});
						});
	</script>
</body>
</html>
