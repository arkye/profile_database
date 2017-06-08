<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/resources/jsp/general-scripts.jsp"%>
<script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/resources/js/dataTables.bootstrap.min.js"/>"></script>
<script
	src="<c:url value="/resources/js/collaborators/tableConfig.js"/>"></script>
<c:if test="${!empty collapse}">
	<script>
		window.onload = function() {
			$('#new').collapse({
				show : true
			})
		}
	</script>
</c:if>