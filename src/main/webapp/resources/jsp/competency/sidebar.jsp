<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="collapse navbar-collapse">
	<ul class="nav navbar-nav side-nav">
		<li><a href="<c:url value="/competencies"/>"><i
				class="fa fa-fw fa-university"></i> Competências</a></li>
		<c:forEach items="${competencies}" begin="0" end="19"
			var="otherCompetency">
			<c:choose>
				<c:when test="${otherCompetency.id == competency.id}">
					<li class="active"><a href="#"><i
							class="fa fa-fw fa-graduation-cap"></i> ${competency.name}<span
							class="sr-only">(atual)</span></a>
				</c:when>
				<c:otherwise>
					<li><a
						href="<c:url value="/competencies/edit/${otherCompetency.id}"/>"><i
							class="fa fa-fw fa-graduation-cap"></i> ${otherCompetency.name}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
</div>