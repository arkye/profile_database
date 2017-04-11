<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				<li class="active"><a href="#">Perfis</a></li>
				<c:choose>
					<c:when test="${!empty profiles}">
						<c:forEach items="${profiles}" begin="0" end="19" var="otherProfile">
							<li><a
								href="<c:url value="/profiles/edit/${otherProfile.id}"/>">${otherProfile.name}</a></li>
						</c:forEach>
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
						<h1 class="page-header">Perfis</h1>
						<ol class="breadcrumb">
							<li><a href="<c:url value="/"/>">Início</a></li>
							<li class="active">Perfis</li>
							<li><a href="javascript:;" data-toggle="collapse"
										data-target="#new">(Registrar Novo Perfil)</a></li>
						</ol>
					</div>
				</div>

				<div class="row">
					<c:choose>
						<c:when test="${!empty contracts}">

							<!-- Action -->
							<c:url var="addAction" value="/profiles/add"></c:url>

							<div id="new" class="col collapse">
								<h3 class="sub-header">Registrar Novo Perfil</h3>

								<!--  Form -->
								<form:form action="${addAction}" commandName="profile"
									class="form" method="POST">
									<div class="form-group">
										<label for="name">Nome</label>
										<form:input path="name" class="form-control"
											required="required" />
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
							<div class="col">
								<c:if test="${!empty profiles}">
									<h3 class="sub-header">Lista de Perfis Registrados</h3>
									<div class="table-responsive">
										<table id="profiles-table" class="table table-bordered table-hover table-striped display">
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
</body>
</html>
