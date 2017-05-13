<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 class="page-header">
	<i class="fa fa-university"></i> Competências
</h1>
<ol class="breadcrumb">
	<li><a href="<c:url value="/"/>"><i class="fa fa-home"></i>
			Início</a></li>
	<li class="active"><i class="fa fa-university"></i> Competências</li>
	<li><a href="javascript:;" data-toggle="collapse"
		data-target="#new"><i class="fa fa-plus-circle"></i> (Registrar
			Nova Competência)</a></li>
</ol>

<c:if test="${!empty removed.name}">
	<div class="alert alert-success alert-dismissable fade in">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		Competência
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
				<br>A operação de remover a competência <code>
					<a href="<c:url value="/competencies/edit/${removal.id}"/>">${removal.name}
						(${removal.id})</a>
				</code> afetará o contrato <code>
					<a href="<c:url value="/contracts/edit/${removal.contract.id}"/>">${removal.contract.name}
						(${removal.contract.id})</a>
				</code> e os respectivos perfis deste contrato associados à competência.
			</c:when>
			<c:otherwise>
				<br>A remoção da competência <code>
					<a href="<c:url value="/competencies/edit/${removal.id}"/>">${removal.name}
						(${removal.id})</a>
				</code> será permanente.
			</c:otherwise>
		</c:choose>
		<br> <strong>Deseja continuar a operação?</strong> <br> <br>
		<a href="<c:url value="/competencies/remove/${removal.id}/confirm"/>"
			class="btn btn-sm btn-danger"> <i class="fa fa-trash-o"></i>
			Continuar e Remover
		</a> <a href="<c:url value="/competencies"/>"
			class="btn btn-sm btn-default"> <i class="fa fa-times"></i>
			Cancelar
		</a>
	</div>
</c:if>