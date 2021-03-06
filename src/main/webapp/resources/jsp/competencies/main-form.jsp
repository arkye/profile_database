<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:url var="addAction" value="/competencies/add"></c:url>
<h3 class="sub-header">
	<i class="fa fa-plus-circle"></i> Registrar Nova Competência
</h3>

<form:form action="${addAction}" commandName="competency" class="form">
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