<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="collapse navbar-collapse">
	<ul class="nav navbar-nav side-nav">
		<c:choose>
			<c:when test="${!empty competencies}">
				<li class="active"><a href="#"><i class="fa fa-fw fa-university"></i>
						Competências</a></li>
				<c:forEach items="${competencies}" begin="0" end="19"
					var="otherCompetency">
					<li><a
						href="<c:url value="/competencies/edit/${otherCompetency.id}"/>"><i
							class="fa fa-fw fa-graduation-cap"></i> ${otherCompetency.name}</a></li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<li><a>Sem competências definidas</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>