<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 class="page-header">
	<i class="fa fa-graduation-cap"></i> Competência
</h1>

<ol class="breadcrumb">
	<li><a href="<c:url value="/"/>"><i class="fa fa-home"></i>
			Início</a></li>
	<li><a href="<c:url value="/competencies"/>"><i
			class="fa fa-university"></i> Competências</a></li>
	<li class="active"><i class="fa fa-graduation-cap"></i> ${competency.name} <i
		class="fa fa-pencil-square"></i></li>
</ol>
