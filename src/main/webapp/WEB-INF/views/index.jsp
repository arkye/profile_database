<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
<head>
<%@include file="/resources/jsp/general-head.jsp"%>
<title>Página Inicial</title>
</head>

<body>
	<div id="wrapper">
		<%@include file="/resources/jsp/general-navbar.jsp"%>

		<!-- Sidebar -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li class="active"><a href="#"><i class="fa fa-home"></i>
						Início</a></li>
				<li><a href="<c:url value="/profiles"/>"><i
						class="fa fa-address-book"></i> Perfis</a></li>
				<li><a href="<c:url value="/contracts"/>"><i
						class="fa fa-files-o"></i> Contratos</a></li>
				<li><a href="<c:url value="/competencies"/>"><i
						class="fa fa-university"></i> Competências</a></li>
				<li><a href="<c:url value="/collaborators"/>"><i
						class="fa fa-users"></i> Colaboradores</a></li>
			</ul>
		</div>

		<div id="page-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Banco de Perfis</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-home"></i> Início</li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="material-icons" style="font-size: 60px">account_box</i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">${quantityOfProfiles}</div>
										<div>Perfis Cadastrados</div>
									</div>
								</div>
							</div>
							<a href="<c:url value="/profiles"/>">
								<div class="panel-footer">
									<span class="pull-left">Ver Perfis</span> <span
										class="pull-right"><i class="material-icons">chevron_right</i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="material-icons" style="font-size: 60px">assignment</i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">${quantityOfContracts}</div>
										<div>Contratos Cadastrados</div>
									</div>
								</div>
							</div>
							<a href="<c:url value="/contracts"/>">
								<div class="panel-footer">
									<span class="pull-left">Ver Contratos</span> <span
										class="pull-right"><i class="material-icons">chevron_right</i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="material-icons" style="font-size: 60px">school</i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">${quantityOfCompetencies}</div>
										<div>Competências Cadastradas</div>
									</div>
								</div>
							</div>
							<a href="<c:url value="/competencies"/>">
								<div class="panel-footer">
									<span class="pull-left">Ver Competências</span> <span
										class="pull-right"><i class="material-icons">chevron_right</i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="material-icons" style="font-size: 60px">people</i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">${quantityOfCollaborators}</div>
										<div>Colaboradores Cadastrados</div>
									</div>
								</div>
							</div>
							<a href="<c:url value="/collaborators"/>">
								<div class="panel-footer">
									<span class="pull-left">Ver Colaboradores</span> <span
										class="pull-right"><i class="material-icons">chevron_right</i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<img class="fix-right"
			src="<c:url value="/resources/img/mctic-40.png"/>">
	</div>
	<%@include file="/resources/jsp/general-scripts.jsp"%>

</body>
</html>
