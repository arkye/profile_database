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
<title>Colaboradores</title>
</head>

<body>
	<div id="wrapper">
		<%@include file="/resources/jsp/general-navbar.jsp"%>

		<!-- Sidebar -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<c:choose>
					<c:when test="${!empty collaborators}">
						<c:if test="${!empty collaborator.firstName}">
							<li><a href="<c:url value="/collaborators"/>">Colaboradores</a></li>
						</c:if>
						<c:forEach items="${collaborators}" var="otherCollaborator">
							<c:choose>
								<c:when test="${otherCollaborator.id == collaborator.id}">
									<li class="active"><a href="#">${collaborator.firstName}
											${collaborator.lastName}<span class="sr-only">(atual)</span>
									</a>
								</c:when>
								<c:otherwise>
									<li><a
										href="<c:url value="/collaborators/edit/${otherCollaborator.id}"/>">${otherCollaborator.firstName}
											${otherCollaborator.lastName}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li><a>Sem colaboradores definidos</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

		<div id="page-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Colaboradores</h1>
						<ol class="breadcrumb">
							<li>Início</li>
							<li class="active">Colaboradores</li>
						</ol>
					</div>
				</div>

				<div class="row">
					<!-- Action -->
					<c:url var="addAction" value="/collaborators/add"></c:url>

					<div class="col">
						<c:choose>
							<c:when test="${empty collaborator.firstName}">
								<h3 class="sub-header">Registrar Novo Colaborador</h3>

								<!--  Form -->
								<form method="POST" action="${addAction}"
									enctype="multipart/form-data" class="form">
									<div class="form-group">
										<label for="firstName">Nome</label> <input type="text"
											name="firstName" class="form-control" required>
									</div>
									<div class="form-group">
										<label for="lastName">Sobrenome</label> <input type="text"
											name="lastName" class="form-control" required>
									</div>
									<div class="form-group">
										<label for="file">Currículo</label> <input type="file"
											name="file" class="form-control" />
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-primary" value="Adicionar">
									</div>
									<input type="hidden" name="id" class="form-control" value="0" />
								</form>
							</c:when>
							<c:otherwise>
								<h3 class="sub-header">Editar Colaborador</h3>

								<!--  Form -->
								<form method="POST" action="${addAction}"
									enctype="multipart/form-data" class="form">
									<input type="number" name="id" class="form-control"
										value="${collaborator.id}" readonly />
									<div class="form-group">
										<label for="firstName">Nome</label> <input type="text"
											name="firstName" class="form-control"
											value="${collaborator.firstName}" required>
									</div>
									<div class="form-group">
										<label for="lastName">Sobrenome</label> <input type="text"
											name="lastName" class="form-control"
											value="${collaborator.lastName}" required>
									</div>
									<div class="form-group">
										<label for="file">Currículo</label> <input type="file"
											name="file" class="form-control" />
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-primary" value="Editar">
									</div>
								</form>
							</c:otherwise>
						</c:choose>

					</div>

					<div class="col">
						<c:if
							test="${!empty collaborators && empty collaborator.firstName}">
							<h3 class="sub-header">Lista de Colaboradores Registrados</h3>
							<div class="table-responsive">
								<table id="collaborators-table"
									class="table table-striped display">
									<thead>
										<tr>
											<th>#</th>
											<th>Nome</th>
											<th>Sobrenome</th>
											<th>Currículo</th>
											<th>Modificar</th>
											<th>Remover</th>
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
													href="<c:url value='/collaborators/edit/${collaborator.id}' />"><i
														class="material-icons" style="font-size: 18px">edit</i></a></td>
												<td><a
													href="<c:url value='/collaborators/remove/${collaborator.id}' />"><i
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
	<script src="<c:url value="/resources/js/dataTables.bootstrap.min.js"/>"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#collaborators-table')
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
												}
											});
						});
	</script>
</body>
</html>
