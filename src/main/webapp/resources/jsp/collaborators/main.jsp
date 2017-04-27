<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row col-lg-12">
			<%@include file="/resources/jsp/collaborators/main-header.jsp"%>
		</div>
		<div class="row col-lg-12 collapse" id="new">
			<%@include file="/resources/jsp/collaborators/main-form.jsp" %>
		</div>
		<div class="row col-lg-12">
			<%@include file="/resources/jsp/collaborators/main-list.jsp" %>
		</div>
	</div>
</div>