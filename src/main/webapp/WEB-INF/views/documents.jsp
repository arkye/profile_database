<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Documentos</title>
</head>

<body>

	<%@include file="/resources/jsp/general-navbar.jsp"%>

	<!-- Container -->
	<div class="container-fluid">

		<!-- Sidebar -->
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">Documentos<span
							class="sr-only">(atual)</span></a></li>
				</ul>
			</div>
		</div>

		<!-- Content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Documentos</h1>

			<!-- Action -->
			<c:url var="addAction" value="/documents/add"></c:url>

			<!-- Add New ScaleOption -->
			<c:choose>
				<c:when test="${empty document.name}">
					<h3 class="sub-header">Novo Documento</h3>

					<!--  Form -->
					<form method="POST" action="${addAction}"
						enctype="multipart/form-data" class="form">
						<input type="number" name="id" class="form-control" value=0
							style="visibility: hidden" />
						<div class="form-group">
							<label for="name">Nome</label> <input type="text" name="name"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label for="file">Arquivo</label> <input type="file" name="file"
								class="form-control" required/>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-default" value="Adicionar">
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<h3 class="sub-header">Editar Documento</h3>

					<!--  Form -->
					<form method="POST" action="${addAction}"
						enctype="multipart/form-data" class="form">
						<div class="form-group">
							<label for="id">Número Identificador</label> <input type="number"
								name="id" class="form-control" value="${document.id}" readonly />
						</div>
						<div class="form-group">
							<label for="name">Nome</label> <input type="text" name="name"
								class="form-control" value="${document.name}" required/>
						</div>
						<div class="form-group">
							<label for="file">Arquivo</label> <input type="file" name="file"
								class="form-control" required/>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-default" value="Editar">
						</div>
					</form>
				</c:otherwise>
			</c:choose>

			<c:if test="${!empty documents && empty document.name}">
				<h3 class="sub-header">Lista de Documentos</h3>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Nome</th>
								<th>Documento</th>
								<th>Modificar</th>
								<th>Remover</th>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${documents}" var="document">
								<tr>
									<td>${document.id}</td>
									<td>${document.name}</td>
									<td><a
										href="<c:url value='/documents/show/${document.id}' />"><i
											class="material-icons" style="font-size: 18px">file_download</i></a></td>
									<td><a
										href="<c:url value='/documents/edit/${document.id}' />"><i
											class="material-icons" style="font-size: 18px">edit</i></a></td>
									<td><a
										href="<c:url value='/documents/remove/${document.id}' />"><i
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
