<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<%@include file="/resources/jsp/general-tinymce.jsp"%>
<title>Perfis</title>

</head>

<body>
	<div id="wrapper">

		<%@include file="/resources/jsp/general-navbar.jsp"%>

		<!-- Sidebar -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<c:choose>
					<c:when test="${!empty profiles}">
						<c:forEach items="${profiles}" var="otherProfile">
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
							<li>In�cio</li>
							<li class="active">Perfis</li>
						</ol>
					</div>
				</div>

				<div class="row">
					<c:choose>
						<c:when test="${!empty contracts}">

							<!-- Action -->
							<c:url var="addAction" value="/profiles/add"></c:url>

							<div class="col">
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
										<label for="description">Descri��o</label>
										<form:input path="description" class="form-control"
											required="required" />
									</div>
									<div>
										<label for="technicalQualifications">Qualifica��es
											T�cnicas</label>
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
										<table class="table table-striped">
											<thead>
												<tr>
													<th>#</th>
													<th>Nome</th>
													<th>Descri��o</th>
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
								<strong>Dica</strong>: Para criar um novo perfil � necess�rio,
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
</body>
</html>
