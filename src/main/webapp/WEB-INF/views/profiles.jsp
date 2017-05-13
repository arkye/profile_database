<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<%@include file="/resources/jsp/general-tinymce.jsp"%>
<link rel="stylesheet"
	href="<c:url value="/resources/css/dataTables.bootstrap.min.css"/>">
<title>Perfis</title>
</head>

<body>
	<div id="wrapper">

		<%@include file="/resources/jsp/general-navbar.jsp"%>

		<!-- Sidebar -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li class="active"><a href="#"><i
						class="fa fa-address-book"></i> Perfis</a></li>
				<c:choose>
					<c:when test="${!empty profiles}">
						<c:forEach items="${profiles}" begin="0" end="9"
							var="otherProfile">
							<li><a
								href="<c:url value="/profiles/edit/${otherProfile.id}"/>"><i
									class="fa fa-address-card"></i> ${otherProfile.name}</a></li>
						</c:forEach>
						<c:if test="${fn:length(profiles) > 10}">
							<center>
								<a>...</a>
							</center>
						</c:if>
					</c:when>
					<c:otherwise>
						<li><a>Sem perfis definidos</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

		<div id="page-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							<i class="fa fa-address-book"></i> Perfis
						</h1>
						<ol class="breadcrumb">
							<li><a href="<c:url value="/"/>"><i class="fa fa-home"></i>
									Início</a></li>
							<li class="active"><i class="fa fa-address-book"></i> Perfis</li>
							<li><a href="javascript:;" data-toggle="collapse"
								data-target="#new"><i class="fa fa-plus-circle"></i>
									(Registrar Novo Perfil)</a></li>
						</ol>

						<c:if test="${!empty removed.name}">
							<div class="alert alert-success alert-dismissable fade in">
								<a href="#" class="close" data-dismiss="alert"
									aria-label="close">&times;</a> Perfil
								<code>${removed.name} (${removed.id})</code>
								removido com sucesso!
							</div>
						</c:if>

						<c:if test="${!empty removal.name}">
							<div class="alert alert-warning">
								<div class="big">
									<i class="fa fa-exclamation-triangle"></i> Alerta!
								</div>
								<c:choose>
									<c:when test="${!empty removal.contract}">
										<br>A operação de remover o perfil <code>
											<a href="<c:url value="/profiles/edit/${removal.id}"/>">${removal.name}
												(${removal.id})</a>
										</code> afetará o contrato <code><a href="<c:url value="/contracts/edit/${removal.contract.id}"/>">${removal.contract.name}
												(${removal.contract.id})</a></code> e às competências associadas à este perfil.
			</c:when>
									<c:otherwise>
										<br>A remoção do perfil <code>
											<a href="<c:url value="/profiles/edit/${removal.id}"/>">${removal.name}
												(${removal.id})</a>
										</code> será permanente.
			</c:otherwise>
								</c:choose>
								<br> <strong>Deseja continuar a operação?</strong> <br>
								<br> <a
									href="<c:url value="/profiles/remove/${removal.id}/confirm"/>"
									class="btn btn-sm btn-danger"> <i class="fa fa-trash-o"></i>
									Continuar e Remover
								</a> <a href="<c:url value="/profiles"/>"
									class="btn btn-sm btn-default"> <i class="fa fa-times"></i>
									Cancelar
								</a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<c:choose>
				<c:when test="${!empty contracts}">

					<!-- Action -->
					<c:url var="addAction" value="/profiles/add"></c:url>

					<div id="new" class="col collapse">
						<h3 class="sub-header">
							<i class="fa fa-plus-circle"></i> Registrar Novo Perfil
						</h3>

						<!--  Form -->
						<form:form action="${addAction}" commandName="profile"
							class="form" method="POST">
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
								<button type="submit" class="btn btn-primary">Adicionar</button>
							</div>
						</form:form>

					</div>
					<div class="col-lg-12">
						<c:if test="${!empty profiles}">
							<h3 class="sub-header">
								<i class="fa fa-list"></i> Lista de Perfis Registrados
							</h3>
							<div class="table-responsive">
								<table id="profiles-table"
									class="table table-bordered table-hover table-striped display">
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
												<td class="big center-table"><a
													href="<c:url value='/profiles/edit/${profile.id}' />"><i
														class="fa fa-external-link"></i></a></td>
												<td class="big center-table"><a
													href="<c:url value='/profiles/remove/${profile.id}' />"><i
														class="fa fa-trash-o"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
					</div>
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
							$('#profiles-table')
									.DataTable(
											{
												language : {
													"sEmptyTable" : "Nenhum perfil encontrado",
													"sInfo" : "Mostrando de _START_ até _END_ de _TOTAL_ perfis",
													"sInfoEmpty" : "",
													"sInfoFiltered" : "(Filtrados de _MAX_ perfis)",
													"sInfoPostFix" : "",
													"sInfoThousands" : ".",
													"sLengthMenu" : "_MENU_ perfis por página",
													"sLoadingRecords" : "Carregando...",
													"sProcessing" : "Processando...",
													"sZeroRecords" : "Nenhum perfil encontrado",
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
													"targets" : [ 4, 5 ]
												} ]
											});
						});
	</script>
	< /body>
</html>
