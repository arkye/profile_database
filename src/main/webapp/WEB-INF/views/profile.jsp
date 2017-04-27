<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<%@include file="/resources/jsp/general-tinymce.jsp"%>
<link rel="stylesheet"
	href="<c:url value="/resources/css/dataTables.bootstrap.min.css"/>">
<title>Perfil: ${profile.name}</title>
</head>

<body>
	<div id="wrapper">

		<%@include file="/resources/jsp/general-navbar.jsp"%>

		<!-- Sidebar -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li><a href="<c:url value="/profiles"/>"><i
						class="fa fa-address-book"></i> Perfis</a></li>
				<c:if test="${profile.id > 4}">
					<center>
						<a>...</a>
					</center>
				</c:if>
				<c:choose>
					<c:when test="${profile.id > 5}">
						<c:set var="start" value="${profile.id - 5}" />
					</c:when>
					<c:otherwise>
						<c:set var="start" value="0" />
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${profile.id > 5}">
						<c:set var="finish" value="${profile.id + 1}" />
					</c:when>
					<c:otherwise>
						<c:set var="finish" value="8" />
					</c:otherwise>
				</c:choose>
				<c:forEach items="${profiles}" begin="${start}" end="${finish}"
					var="otherProfile">
					<c:choose>
						<c:when test="${otherProfile.id == profile.id}">
							<li class="active"><a href="#"><i
									class="fa fa-address-card"></i> ${profile.name}<span
									class="sr-only">(atual)</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="<c:url value="/profiles/edit/${otherProfile.id}"/>"><i
									class="fa fa-address-card"></i> ${otherProfile.name}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if
					test="${fn:length(profiles) > 8 && fn:length(profiles) > profile.id + 2}">
					<center>
						<a>...</a>
					</center>
				</c:if>
			</ul>
		</div>

		<div id="page-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							<i class="fa fa-address-card"></i> Perfil
						</h1>
						<p>
							<strong>Descrição:</strong> ${profile.description}
						</p>
						<ol class="breadcrumb">
							<li><a href="<c:url value="/"/>"><i class="fa fa-home"></i>
									Início</a></li>
							<li><a href="<c:url value="/profiles"/>"><i
									class="fa fa-address-book"></i> Perfis</a></li>
							<li class="active"><a href="javascript:;"
								data-toggle="collapse" data-target="#edit"><i
									class="fa fa-address-card"></i> ${profile.name} (Editar Perfil)
									<i class="fa fa-pencil-square"></i></a></li>
						</ol>
					</div>
				</div>

				<div class="col-lg-12 row collapse" id="edit">
					<h3 class="sub-header">
						<i class="fa fa-pencil-square"></i> Editar Perfil
					</h3>
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
							<form:input path="name" class="form-control" required="required" />
						</div>
						<div class="form-group">
							<label for="description">Descrição</label>
							<form:input path="description" class="form-control"
								required="required" />
						</div>
						<div>
							<label for="technicalQualifications">Qualificações
								Técnicas</label>
							<form:textarea path="technicalQualifications"
								class="tinymce form-control" />
						</div>
						<label for="contract">Contrato</label>
						<div class="form-group">
							<form:select path="contract" class="form-control"
								multiple="false" items="${contracts}" itemLabel="name"
								itemValue="id" required="required" />
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">Editar</button>
						</div>
					</form:form>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="material-icons" style="font-size: 60px">assignment</i>
									</div>
									<div class="col-xs-9 text-right">
										<div>${profile.contract.name}</div>
										<div>${profile.contract.description}</div>
									</div>
								</div>
							</div>
							<a href="<c:url value="/contracts/edit/${profile.contract.id}"/>">
								<div class="panel-footer">
									<span class="pull-left">Ver Contrato</span> <span
										class="pull-right"><i class="material-icons">chevron_right</i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="material-icons" style="font-size: 60px">school</i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">${fn:length(profile.competencies)}</div>
										<div>Competências Cadastradas neste Perfil</div>
									</div>
								</div>
							</div>
							<a href="<c:url value="/competencies"/>">
								<div class="panel-footer">
									<span class="pull-left">Ver Competências</span> <span
										class="pull-right"><i class="material-icons">chevron_right</i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="material-icons" style="font-size: 60px">people</i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">${fn:length(profile.collaborators)}</div>
										<div>Colaboradores Cadastrados neste Perfil</div>
									</div>
								</div>
							</div>
							<a href="<c:url value="/collaborators"/>">
								<div class="panel-footer">
									<span class="pull-left">Ver Colaboradores</span> <span
										class="pull-right"><i class="material-icons">chevron_right</i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="sub-header">
									<i class="fa fa-star"></i> Qualificações Técnicas
								</h3>
							</div>
							<div class="panel-body">
								<c:choose>
									<c:when test="${!empty profile.technicalQualifications}">
										${profile.technicalQualifications}
									</c:when>
									<c:otherwise>
										Este perfil não possui descrição das qualificações técnicas.
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>

					<c:if test="${!empty profile.collaborators}">
						<div class="col-lg-6">
							<h3 class="sub-header">
								<i class="fa fa-list"></i> <i class="fa fa-user"></i> Lista de
								Colaboradores com este Perfil
							</h3>
							<div class="table-responsive">
								<table id="self-collaborators-table"
									class="table table-bordered table-hover table-striped display">
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
						</div>
					</c:if>
				</div>

				<div class="row">
					<c:if test="${!empty profile.competencies}">
						<div class="col-lg-12">
							<h3 class="sub-header">
								<i class="fa fa-list"></i> <i class="fa fa-graduation-cap"></i>
								Lista de Competências do Perfil
							</h3>
							<div class="table-responsive">
								<table id="self-competencies-table"
									class="table table-bordered table-hover table-striped display">
									<thead>
										<tr>
											<th>#</th>
											<th>Nome</th>
											<th>Descrição</th>
											<th>Remover do Perfil</th>
										</tr>
									<thead>
									<tbody>
										<c:forEach items="${profile.competencies}" var="competency"
											varStatus="i">
											<tr>
												<td>${competency.id}</td>
												<td>${competency.name}</td>
												<td>${competency.description}</td>
												<td><a
													href="<c:url value='/profiles/edit/${profile.id}/remove/competency/${i.index}' />"><i
														class="material-icons" style="font-size: 18px">remove_circle</i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</c:if>
				</div>

				<div class="row">

					<c:if test="${!empty competencies}">
						<div class="col-lg-12">
							<h3 class="sub-header">
								<i class="fa fa-list-alt"></i> <i class="fa fa-graduation-cap"></i>
								Lista de Competências do Contrato não associados à este Perfil
							</h3>
							<div class="table-responsive">
								<table id="other-competencies-table"
									class="table table-bordered table-hover table-striped display">
									<thead>
										<tr>
											<th>#</th>
											<th>Nome</th>
											<th>Descrição</th>
											<th>Adicionar ao Perfil</th>
										</tr>
									<thead>
									<tbody>
										<c:forEach items="${competencies}" var="competency">
											<tr>
												<td>${competency.id}</td>
												<td>${competency.name}</td>
												<td>${competency.description}</td>
												<td><a
													href="<c:url value='/profiles/edit/${profile.id}/add/competency/${competency.id}' />"><i
														class="material-icons" style="font-size: 18px">add_circle</i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</c:if>
				</div>

				<div class="row">
					<c:if test="${!empty collaborators}">
						<div class="col-lg-12">
							<h3 class="sub-header">
								<i class="fa fa-list-alt"></i> <i class="fa fa-user"></i> Lista
								de Colaboradores não associados à este Perfil
							</h3>
							<div class="table-responsive">
								<table id="other-collaborators-table"
									class="table table-bordered table-hover table-striped display">
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
												<td><c:if test="${!empty collaborator.resume.fileName}">
														<a
															href="<c:url value='/collaborators/${collaborator.id}/resume' />"><i
															class="material-icons" style="font-size: 18px">file_download</i></a>
													</c:if></td>
												<td><a
													href="<c:url value='/profiles/edit/${profile.id}/add/collaborator/${collaborator.id}' />"><i
														class="material-icons" style="font-size: 18px">add_circle</i></a></td>
											</tr>
										</c:forEach>


									</tbody>
								</table>
							</div>
						</div>
					</c:if>
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
							$('#self-collaborators-table')
									.DataTable(
											{
												language : {
													"sEmptyTable" : "Nenhum colaborador encontrado",
													"sInfo" : "Mostrando de _START_ até _END_ de _TOTAL_ colaboradores",
													"sInfoEmpty" : "",
													"sInfoFiltered" : "(Filtrados de _MAX_ colaboradores)",
													"sInfoPostFix" : "",
													"sInfoThousands" : ".",
													"sLengthMenu" : "_MENU_ colaboradores por página",
													"sLoadingRecords" : "Carregando...",
													"sProcessing" : "Processando...",
													"sZeroRecords" : "Nenhum colaborador encontrado",
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
													"targets" : [ 3, 4 ]
												} ]
											});
							$('#other-collaborators-table')
									.DataTable(
											{
												language : {
													"sEmptyTable" : "Nenhum colaborador encontrado",
													"sInfo" : "Mostrando de _START_ até _END_ de _TOTAL_ colaboradores",
													"sInfoEmpty" : "",
													"sInfoFiltered" : "(Filtrados de _MAX_ colaboradores)",
													"sInfoPostFix" : "",
													"sInfoThousands" : ".",
													"sLengthMenu" : "_MENU_ colaboradores por página",
													"sLoadingRecords" : "Carregando...",
													"sProcessing" : "Processando...",
													"sZeroRecords" : "Nenhum colaborador encontrado",
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
													"targets" : [ 3, 4 ]
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
