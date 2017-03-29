<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Contratos</title>
</head>

<body>

	<%@include file="/resources/jsp/general-navbar.jsp"%>

	<!-- Container -->
	<div class="container-fluid">

		<!-- Sidebar -->
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<c:choose>
						<c:when test="${!empty contracts}">
							<c:forEach items="${contracts}" var="otherContract">
								<li><a
									href="<c:url value="/contracts/edit/${otherContract.id}"/>">${otherContract.name}</a></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li><a>Sem contratos definidos</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>

		<!-- Content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Contratos</h1>

			<!-- Action -->
			<c:url var="addAction" value="/contracts/add"></c:url>

			<h3 class="sub-header">Registrar Novo Contrato</h3>

			<!--  Form -->
			<form:form action="${addAction}" commandName="contract" class="form">
				<div class="form-group">
					<label for="name">Nome</label>
					<form:input path="name" class="form-control" required="required"/>
				</div>
				<div class="form-group">
					<label for="description">Descrição</label>
					<form:input path="description" class="form-control" required="required"/>
				</div>
				<div class="form-group">
					<label for="supervisorName">Nome do Fiscal do Contrato</label>
					<form:input path="supervisorName" class="form-control" required="required"/>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-default">Adicionar</button>
				</div>
			</form:form>

			<c:if test="${!empty contracts}">
				<h3 class="sub-header">Lista de Contratos Registrados</h3>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Nome</th>
								<th>Descrição</th>
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

	<%@include file="/resources/jsp/general-scripts.jsp"%>

</body>
</html>
