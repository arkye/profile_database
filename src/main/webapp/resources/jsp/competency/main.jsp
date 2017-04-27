<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${!empty competency.name}">
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row col-lg-12">
				<%@include file="/resources/jsp/competency/main-header.jsp"%>
			</div>
			<div class="row col-lg-12">
				<%@include file="/resources/jsp/competency/main-form.jsp"%>
			</div>
		</div>
	</div>
</c:if>
