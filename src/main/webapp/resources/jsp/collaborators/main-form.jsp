<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<c:choose>
		<c:when test="${empty collaborator.firstName}">
			<div class="col collapse" id="new">
				<%@include file="/resources/jsp/collaborators/main-form-new.jsp"%>
			</div>
		</c:when>
		<c:otherwise>
			<div class="col">
				<%@include file="/resources/jsp/collaborators/main-form-edit.jsp"%>
			</div>
		</c:otherwise>
	</c:choose>
</div>