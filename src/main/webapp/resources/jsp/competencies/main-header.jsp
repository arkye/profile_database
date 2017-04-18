<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 class="page-header">Compet�ncias</h1>
<ol class="breadcrumb">
	<li><a href="<c:url value="/"/>">In�cio</a></li>
	<c:choose>
		<c:when test="${!empty competency.name}">
			<li><a href="<c:url value="/competencies"/>">Compet�ncias</a></li>
			<li class="active">${competency.name}</li>
		</c:when>
		<c:otherwise>
			<li class="active">Compet�ncias</li>
			<li><a href="javascript:;" data-toggle="collapse"
				data-target="#new">(Registrar Nova Compet�ncia)</a></li>
		</c:otherwise>
	</c:choose>
</ol>
