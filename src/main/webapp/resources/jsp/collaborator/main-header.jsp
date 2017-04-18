<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 class="page-header">
	<i class="fa fa-user"></i> Colaborador
</h1>

<ol class="breadcrumb">
	<li><a href="<c:url value="/"/>"><i class="fa fa-home"></i>
			Início</a></li>
	<li><a href="<c:url value="/collaborators"/>"><i
			class="fa fa-users"></i> Colaboradores</a></li>
	<li class="active"><i class="fa fa-user"></i>
		${collaborator.firstName} ${collaborator.lastName} <i
		class="fa fa-pencil-square"></i></li>
</ol>
