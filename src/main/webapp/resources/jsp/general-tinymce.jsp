<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="<c:url value="/resources/js/tinymce/tinymce.min.js"/>"></script>
<script type="text/javascript">
	tinymce
			.init({
				selector : '.tinymce',
				language : 'pt_BR',
				plugins : [
						'advlist lists charmap print preview hr anchor pagebreak',
						'searchreplace wordcount visualblocks visualchars insertdatetime nonbreaking',
						'save table contextmenu directionality paste textcolor' ],
				toolbar : 'undo redo | styleselect | bold italic forecolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | preview'
			});
</script>