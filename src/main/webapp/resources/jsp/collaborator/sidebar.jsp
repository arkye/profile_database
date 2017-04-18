<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="collapse navbar-collapse">
	<ul class="nav navbar-nav side-nav">
		<li><a href="<c:url value="/collaborators"/>"><i
				class="fa fa-fw fa-users"></i> Colaboradores</a></li>
		<c:forEach items="${collaborators}" begin="0" end="19"
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
	</ul>
</div>