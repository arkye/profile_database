<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 class="page-header">Competências</h1>
<ol class="breadcrumb">
	<li><a href="<c:url value="/"/>">Início</a></li>
	<c:choose>
		<c:when test="${!empty competency.name}">
			<li><a href="<c:url value="/competencies"/>">Competências</a></li>
			<li class="active">${competency.name}</li>
		</c:when>
		<c:otherwise>
			<li class="active">Competências</li>
			<li><a href="javascript:;" data-toggle="collapse"
				data-target="#new">(Registrar Nova Competência)</a></li>
		</c:otherwise>
	</c:choose>
</ol>
