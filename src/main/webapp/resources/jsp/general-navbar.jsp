<!-- Navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Ativar navegação</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value="/"/>"><img
				src="<c:url value="/resources/img/logo_white.png"/>" height="25"></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="/profiles"/>">Perfis</a></li>
				<li><a href="<c:url value="/contracts"/>">Contratos</a></li>
				<li><a href="<c:url value="/competencies"/>">Competências</a></li>
				<li><a href="<c:url value="/collaborators"/>">Colaboradores</a></li>
				<li><a href="<c:url value="/sign_out"/>">Sair</a></li>
			</ul>
		</div>
	</div>
</nav>