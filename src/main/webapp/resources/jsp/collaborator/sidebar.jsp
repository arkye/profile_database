<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="collapse navbar-collapse">
	<ul class="nav navbar-nav side-nav">
		<li><a href="<c:url value="/collaborators"/>"><i
				class="fa fa-fw fa-users"></i> Colaboradores</a></li>
		<c:if test="${collaborator.id > 4}">
			<center>
				<a>...</a>
			</center>
		</c:if>
		<c:choose>
			<c:when test="${collaborator.id > 4}">
				<c:set var="start" value="${collaborator.id - 4}" />
			</c:when>
			<c:otherwise>
				<c:set var="start" value="0" />
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${collaborator.id > 4}">
				<c:set var="finish" value="${collaborator.id + 2}" />
			</c:when>
			<c:otherwise>
				<c:set var="finish" value="8" />
			</c:otherwise>
		</c:choose>
		<c:forEach items="${collaborators}" begin="${start}" end="${finish}"
			var="otherCollaborator">
			<c:choose>
				<c:when test="${otherCollaborator.id == collaborator.id}">
					<li class="active"><a href="#"><i class="fa fa-fw fa-user"></i>
							${collaborator.firstName} ${collaborator.lastName} <span
							class="sr-only">(atual)</span> </a>
				</c:when>
				<c:otherwise>
					<li><a
						href="<c:url value="/collaborators/edit/${otherCollaborator.id}"/>"><i
							class="fa fa-fw fa-user"></i> ${otherCollaborator.firstName}
							${otherCollaborator.lastName}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when
				test="${fn:length(collaborators) > 8 && fn:length(collaborators) > collaborator.id + 2}">
				<center>
					<a>...</a>
				</center>
			</c:when>
			<c:otherwise>
				<li><a href="<c:url value="/collaborators/new"/>"><i
						class="fa fa-plus-circle"></i> (Criar novo colaborador)</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>