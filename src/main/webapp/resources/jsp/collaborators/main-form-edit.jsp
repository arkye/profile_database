<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="editAction" value="/collaborators/add"></c:url>

<h3 class="sub-header"><i class="fa fa-pencil-square"></i> Editar Colaborador</h3>

<form method="POST" action="${editAction}" enctype="multipart/form-data"
	class="form">
	<input type="number" name="id" class="form-control"
		value="${collaborator.id}" readonly />
	<div class="form-group">
		<label for="firstName">Nome</label> <input type="text"
			name="firstName" class="form-control"
			value="${collaborator.firstName}" required>
	</div>
	<div class="form-group">
		<label for="lastName">Sobrenome</label> <input type="text"
			name="lastName" class="form-control" value="${collaborator.lastName}"
			required>
	</div>
	<div class="form-group">
		<label for="file">Currículo</label> <input type="file" name="file"
			class="form-control" />
	</div>
	<div class="form-group">
		<input type="submit" class="btn btn-primary" value="Editar">
	</div>
</form>