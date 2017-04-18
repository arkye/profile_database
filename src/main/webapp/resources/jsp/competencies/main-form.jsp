<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:url var="addAction" value="/competencies/add"></c:url>
<c:choose>
	<c:when test="${empty competency.name}">
		<div class="col collapse" id="new">
			<h3 class="sub-header">Registrar Nova Competência</h3>

			<!--  Form -->
			<form:form action="${addAction}" commandName="competency"
				class="form">
				<div class="form-group">
					<label for="name">Nome</label>
					<form:input path="name" class="form-control" required="required" />
				</div>
				<div class="form-group">
					<label for="description">Descrição</label>
					<form:input path="description" class="form-control"
						required="required" />
				</div>

				<div class="form-group"></div>
				<button type="submit" class="btn btn-primary">Adicionar</button>
			</form:form>
		</div>
	</c:when>
	<c:otherwise>
		<div class="col">
			<h3 class="sub-header">Editar Competência</h3>

			<!--  Form -->
			<form:form action="${addAction}" commandName="competency"
				class="form">
				<div class="form-group">
					<label for="id">Número Identificador</label>
					<form:input path="id" readonly="true" class="form-control" />
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

				<div class="form-group"></div>
				<button type="submit" class="btn btn-primary">Editar</button>
			</form:form>
		</div>
	</c:otherwise>
</c:choose>