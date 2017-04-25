<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:url var="editAction" value="/competencies/edit/save"></c:url>
<h3 class="sub-header">
	<i class="fa fa-pencil-square"></i> Editar Competência
</h3>

<form:form action="${editAction}" commandName="competency" class="form">
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
