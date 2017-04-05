<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Contrato: ${contract.name}</title>
</head>

<body>
	<div id="wrapper">
		<%@include file="/resources/jsp/general-navbar.jsp"%>

		<!-- Sidebar -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li><a href="<c:url value="/contracts"/>">Contratos</a></li>
				<c:forEach items="${contracts}" var="otherContract">
					<c:choose>
						<c:when test="${otherContract.id == contract.id}">
							<li class="active"><a href="#">${contract.name}<span
									class="sr-only">(atual)</span></a>
						</c:when>
						<c:otherwise>
							<li><a
								href="<c:url value="/contracts/edit/${otherContract.id}"/>">${otherContract.name}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>

		<div id="page-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Contrato: ${contract.name}</h1>
						<ol class="breadcrumb">
							<li>Início</li>
							<li>Contratos</li>
							<li class="active">${contract.name}</li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<h3 class="sub-header">Editar Contrato</h3>

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

					</div>

					<div class="col">

						<c:if test="${!empty contract.documents}">
							<h3 class="sub-header">Lista de Documentos do Contrato</h3>
							<div class="table-responsive">
								<table class="table table-striped">
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
												<td><c:if test="${!empty document.fileName}">
														<a href="<c:url value='/documents/show/${document.id}' />"><i
															class="material-icons" style="font-size: 18px">file_download</i></a>
													</c:if></td>
												<td><a
													href="<c:url value='/contracts/edit/${contract.id}/remove/document/${i.index}'/>"><i
														class="material-icons" style="font-size: 18px">delete</i></a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</c:if>

					</div>

					<div class="col">

						<h3 class="sub-header">Adicionar Documento ao Contrato</h3>

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

					<div class="col">

						<c:if test="${!empty contract.competencies}">
							<h3 class="sub-header">Lista de Competências do Contrato</h3>
							<div class="table-responsive">
								<table class="table table-striped">
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
												<td><a
													href="<c:url value='/contracts/edit/${contract.id}/remove/competency/${i.index}' />"><i
														class="material-icons" style="font-size: 18px">remove_circle</i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>

					</div>
					<div class="col">

						<c:if test="${!empty competencies}">
							<h3 class="sub-header">Lista de Competências sem Contrato</h3>
							<div class="table-responsive">
								<table class="table table-striped">
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
												<td><a
													href="<c:url value='/contracts/edit/${contract.id}/add/competency/${competency.id}' />"><i
														class="material-icons" style="font-size: 18px">add_circle</i></a></td>
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

</body>
</html>
