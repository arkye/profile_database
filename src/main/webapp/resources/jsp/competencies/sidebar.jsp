<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="collapse navbar-collapse">
	<ul class="nav navbar-nav side-nav">
		<c:choose>
			<c:when test="${!empty competencies}">
				<c:choose>
					<c:when test="${!empty competency.name}">
						<li><a href="<c:url value="/competencies"/>">Competências</a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><a href="#">Competências</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach items="${competencies}" begin="0" end="19"
					var="otherCompetency">
					<c:choose>
						<c:when test="${otherCompetency.id == competency.id}">
							<li class="active"><a href="#">${competency.name}<span
									class="sr-only">(atual)</span></a>
						</c:when>
						<c:otherwise>
							<li><a
								href="<c:url value="/competencies/edit/${otherCompetency.id}"/>">${otherCompetency.name}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<li><a>Sem competências definidas</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>