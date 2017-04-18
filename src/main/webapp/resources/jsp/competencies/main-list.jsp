<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${!empty competencies && empty competency.name}">
	<h3 class="sub-header">Lista de Categorias de Competência</h3>
	<div class="table-responsive">
		<table id="competencies-table"
			class="table table-bordered table-hover table-striped display">
			<thead>
				<tr>
					<th>#</th>
					<th>Nome</th>
					<th>Descrição</th>
					<th>Contrato</th>
					<th>Modificar</th>
					<th>Remover</th>
				</tr>
			<thead>
			<tbody>
				<c:forEach items="${competencies}" var="competency">
					<tr>
						<td>${competency.id}</td>
						<td>${competency.name}</td>
						<td>${competency.description}</td>
						<td><c:choose>
								<c:when test="${!empty competency.contract.name}">${competency.contract.name}</c:when>
								<c:otherwise>Sem contrato associado</c:otherwise>
							</c:choose></td>
						<td><a
							href="<c:url value='/competencies/edit/${competency.id}' />"><i
								class="material-icons" style="font-size: 18px">edit</i></a></td>
						<td><a
							href="<c:url value='/competencies/remove/${competency.id}' />"><i
								class="material-icons" style="font-size: 18px">delete</i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>
