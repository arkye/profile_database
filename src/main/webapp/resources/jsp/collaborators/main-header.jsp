<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			<c:choose>
				<c:when test="${!empty collaborator.firstName}">
					<i class="fa fa-user"></i> Colaborador
				</c:when>
				<c:otherwise>
					<i class="fa fa-users"></i> Colaboradores
				</c:otherwise>
			</c:choose>
			
		</h1>

		<ol class="breadcrumb">
			<li><a href="<c:url value="/"/>"><i class="fa fa-home"></i>
					Início</a></li>
			<c:choose>
				<c:when test="${!empty collaborator.firstName}">
					<li><a href="<c:url value="/collaborators"/>"><i
							class="fa fa-users"></i> Colaboradores</a></li>
					<li class="active"><i class="fa fa-user"></i>
						${collaborator.firstName} ${collaborator.lastName} <i
						class="fa fa-pencil-square"></i></li>
				</c:when>
				<c:otherwise>
					<li class="active"><i class="fa fa-users"></i> Colaboradores</li>
					<li><a href="javascript:;" data-toggle="collapse"
						data-target="#new"><i class="fa fa-plus-circle"></i>
							(Registrar Novo Colaborador)</a></li>
				</c:otherwise>
			</c:choose>
		</ol>
	</div>
</div>