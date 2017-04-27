<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="collapse navbar-collapse">
	<ul class="nav navbar-nav side-nav">
		<li><a href="<c:url value="/competencies"/>"><i
				class="fa fa-fw fa-university"></i> Competências</a></li>
		<c:if test="${competency.id > 4}">
			<center>
				<a>...</a>
			</center>
		</c:if>
		<c:choose>
			<c:when test="${competency.id > 4}">
				<c:set var="start" value="${competency.id - 4}"/>
			</c:when>
			<c:otherwise>
				<c:set var="start" value="0"/>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${competency.id > 4}">
				<c:set var="finish" value="${competency.id + 2}"/>
			</c:when>
			<c:otherwise>
				<c:set var="finish" value="8"/>
			</c:otherwise>
		</c:choose>
		<c:set var="end" value="8"/>
		<c:forEach items="${competencies}" begin="${start}" end="${finish}"
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
		<c:if
			test="${fn:length(competencies) > 8 && fn:length(competencies) > competency.id + 2}">
			<center>
				<a>...</a>
			</center>
		</c:if>
	</ul>
</div>