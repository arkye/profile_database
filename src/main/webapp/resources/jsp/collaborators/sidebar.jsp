<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="collapse navbar-collapse">
	<ul class="nav navbar-nav side-nav">
		<c:choose>
			<c:when test="${!empty collaborators}">
				<li class="active"><a href="#"><i class="fa fa-fw fa-users"></i>
						Colaboradores</a></li>
				<c:forEach items="${collaborators}" begin="0" end="19"
					var="otherCollaborator">
					<li><a
						href="<c:url value="/collaborators/edit/${otherCollaborator.id}"/>"><i
							class="fa fa-fw fa-user"></i> ${otherCollaborator.firstName}
							${otherCollaborator.lastName}</a></li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<li><a>Sem colaboradores definidos</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>