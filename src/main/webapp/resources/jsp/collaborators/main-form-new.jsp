<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="addAction" value="/collaborators/add"></c:url>

<h3 class="sub-header"><i class="fa fa-plus-circle"></i> Registrar Novo Colaborador</h3>

<form method="POST" action="${addAction}" enctype="multipart/form-data"
	class="form">
	<div class="form-group">
		<label for="firstName">Nome</label> <input type="text"
			name="firstName" class="form-control" required>
	</div>
	<div class="form-group">
		<label for="lastName">Sobrenome</label> <input type="text"
			name="lastName" class="form-control" required>
	</div>
	<div class="form-group">
		<label for="file">Currículo</label> <input type="file" name="file"
			class="form-control" />
	</div>
	<div class="form-group">
		<input type="submit" class="btn btn-primary" value="Adicionar">
	</div>
	<input type="hidden" name="id" class="form-control" value="0" />
</form>