<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${!empty collaborator.firstName}">
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row col">
				<%@include file="/resources/jsp/collaborator/main-header.jsp"%>
			</div>
			<div class="row col">
				<%@include file="/resources/jsp/collaborator/main-form.jsp"%>
			</div>
		</div>
	</div>
</c:if>
