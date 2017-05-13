<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 class="page-header">
	<i class="fa fa-users"></i> Colaboradores
</h1>

<ol class="breadcrumb">
	<li><a href="<c:url value="/"/>"><i class="fa fa-home"></i>
			Início</a></li>
	<li class="active"><i class="fa fa-users"></i> Colaboradores</li>
	<li><a href="javascript:;" data-toggle="collapse"
		data-target="#new"><i class="fa fa-plus-circle"></i> (Registrar
			Novo Colaborador)</a></li>
</ol>

<c:if test="${!empty removed.firstName}">
	<div class="alert alert-success alert-dismissable fade in">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		Colaborador(a)
		<code>${removed.firstName} ${removed.lastName} (${removed.id})</code>
		removido(a) com sucesso!
	</div>
</c:if>

<c:if test="${!empty removal.firstName}">
	<div class="alert alert-warning">
		<div class="big">
			<i class="fa fa-exclamation-triangle"></i> Alerta!
		</div>
		<c:choose>
			<c:when test="${!empty removal.profiles}">
				<br>A operação de remover o(a) colaborador(a) <code>
					<a href="<c:url value="/collaborators/edit/${removal.id}"/>">${removal.firstName} ${removal.lastName}
						(${removal.id})</a>
				</code> afetará os respectivos perfis associados à este colaborador(a).
			</c:when>
			<c:otherwise>
				<br>A remoção do(a) colaborador(a) <code>
					<a href="<c:url value="/collaborators/edit/${removal.id}"/>">${removal.firstName} ${removal.lastName}
						(${removal.id})</a>
				</code> será permanente.
			</c:otherwise>
		</c:choose>
		<br> <strong>Deseja continuar a operação?</strong> <br> <br>
		<a href="<c:url value="/collaborators/remove/${removal.id}/confirm"/>"
			class="btn btn-sm btn-danger"> <i class="fa fa-trash-o"></i>
			Continuar e Remover
		</a> <a href="<c:url value="/collaborators"/>"
			class="btn btn-sm btn-default"> <i class="fa fa-times"></i>
			Cancelar
		</a>
	</div>
</c:if>