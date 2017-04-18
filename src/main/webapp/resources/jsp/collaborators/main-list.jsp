<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col">
	<c:if test="${!empty collaborators}">
		<h3 class="sub-header"><i class="fa fa-fw fa-list"></i> Lista de Colaboradores Registrados</h3>
		<div class="table-responsive">
			<table id="collaborators-table"
				class="table table-bordered table-hover table-striped display">
				<thead>
					<tr>
						<th>#</th>
						<th>Nome</th>
						<th>Sobrenome</th>
						<th>Currículo</th>
						<th>Modificar</th>
						<th>Remover</th>
					</tr>
				<thead>
				<tbody>

					<c:forEach items="${collaborators}" var="collaborator">
						<tr>
							<td>${collaborator.id}</td>
							<td>${collaborator.firstName}</td>
							<td>${collaborator.lastName}</td>
							<td><c:choose>
								<c:when test="${!empty collaborator.resume.fileName}">
									<a
										href="<c:url value='/collaborators/${collaborator.id}/resume' />"><i
										class="material-icons" style="font-size: 18px">file_download</i></a>
								</c:when>
								<c:otherwise>
									<font color="gray"><em>Sem currículo</em></font>
								</c:otherwise>
								</c:choose></td>
							<td><a
								href="<c:url value='/collaborators/edit/${collaborator.id}' />"><i
									class="material-icons" style="font-size: 18px">edit</i></a></td>
							<td><a
								href="<c:url value='/collaborators/remove/${collaborator.id}' />"><i
									class="material-icons" style="font-size: 18px">delete</i></a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</c:if>
</div>