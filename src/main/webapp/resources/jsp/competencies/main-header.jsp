<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 class="page-header">
	<i class="fa fa-university"></i> Compet�ncias
</h1>
<ol class="breadcrumb">
	<li><a href="<c:url value="/"/>"><i class="fa fa-home"></i>
			In�cio</a></li>
	<li class="active"><i class="fa fa-university"></i> Compet�ncias</li>
	<li><a href="javascript:;" data-toggle="collapse"
		data-target="#new"><i class="fa fa-plus-circle"></i> (Registrar
			Nova Compet�ncia)</a></li>
</ol>

<c:if test="${!empty removed.name}">
	<div class="alert alert-success alert-dismissable fade in">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		Compet�ncia
		<code>${removed.name} (${removed.id})</code>
		removida com sucesso!
	</div>
</c:if>

<c:if test="${!empty removal.name}">
	<div class="alert alert-warning">
		<div class="big">
			<i class="fa fa-exclamation-triangle"></i> Alerta!
		</div>
		<c:choose>
			<c:when test="${!empty removal.contract}">
				<br>A opera��o de remover a compet�ncia <code>
					<a href="<c:url value="/competencies/edit/${removal.id}"/>">${removal.name}
						(${removal.id})</a>
				</code> afetar� o contrato <code>
					<a href="<c:url value="/contracts/edit/${removal.contract.id}"/>">${removal.contract.name}
						(${removal.contract.id})</a>
				</code> e os respectivos perfis deste contrato associados � compet�ncia.
			</c:when>
			<c:otherwise>
				<br>A remo��o da compet�ncia <code>
					<a href="<c:url value="/competencies/edit/${removal.id}"/>">${removal.name}
						(${removal.id})</a>
				</code> ser� permanente.
			</c:otherwise>
		</c:choose>
		<br> <strong>Deseja continuar a opera��o?</strong> <br> <br>
		<a href="<c:url value="/competencies/remove/${removal.id}/confirm"/>"
			class="btn btn-sm btn-danger"> <i class="fa fa-trash-o"></i>
			Continuar e Remover
		</a> <a href="<c:url value="/competencies"/>"
			class="btn btn-sm btn-default"> <i class="fa fa-times"></i>
			Cancelar
		</a>
	</div>
</c:if>