<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ attribute name="title" required="true"%><!--    Informa que recebe um atributo obrigatório title    -->
<%@ attribute name="jsHead" fragment="true"%>
<%@ attribute name="jsBody" fragment="true"%>
<%@ attribute name="jsFooter" fragment="true"%><!--   Informa que pode receber fragmento de página. No caso usado p/ script-->
<%@ attribute name="mascaras" fragment="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!--    Importação JSTL -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>${title}</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value="/resources/images/img-vetweb/favicon.ico"></c:url>">

<link
	href="<c:url value="/resources/css/lib/chartist/chartist.min.css"></c:url>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/css/lib/owl.carousel.min.css"></c:url>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/css/lib/owl.theme.default.min.css"></c:url>"
	rel="stylesheet" type="text/css" />

<link
	href="<c:url value="/resources/css/lib/sweetalert/sweetalert.css"></c:url>"
	rel="stylesheet" type="text/css" />

<link
	href="<c:url value="/resources/css/lib/calendar2/semantic.ui.min.css"></c:url>"
	rel="stylesheet" type="text/css" />

<link
	href="<c:url value="/resources/css/lib/calendar2/pignose.calendar.min.css"></c:url>"
	rel="stylesheet" type="text/css" />

<!-- Bootstrap Core CSS -->

<link
	href="<c:url value="/resources/css/lib/bootstrap/bootstrap.css"></c:url>"
	rel="stylesheet" type="text/css" />
<!-- Custom CSS -->
<link href="<c:url value="/resources/css/helper.css"></c:url>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/style.css"></c:url>"
	rel="stylesheet" type="text/css" />

<link
	href="<c:url value="/resources/css/fullcalendar/fullcalendar.css"></c:url>"
	rel="stylesheet" type="text/css" />

<link
	href="<c:url value="/resources/css/font-awesome/font-awesome.min.css"></c:url>"
	rel="stylesheet" type="text/css" />

<jsp:invoke fragment="jsHead"></jsp:invoke>
<jsp:invoke fragment="mascaras"></jsp:invoke>
<script
	src="<c:url value="/resources/js/jquery/jquery.mask.js"></c:url>"
	type="text/javascrpit"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
</head>

<body class="fix-header fix-sidebar">
	<jsp:invoke fragment="jsBody"></jsp:invoke>
	<!-- Preloader - style you can find in spinners.css -->
	<div class="preloader">
		<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
				stroke-width="2" stroke-miterlimit="10" /> </svg>
	</div>
	<!-- Main wrapper  -->
	<div id="main-wrapper">
		<!-- header header  -->
		<div class="header">
			<nav class="navbar top-navbar navbar-expand-md navbar-light">
				<!-- Logo -->
				<div class="navbar-header">
					<a class="navbar-brand" href="<c:url value="/"></c:url>"> <!-- Logo icon -->
						<b><img
							src="<c:url value="/resources/images/logo.png"></c:url>"
							alt="homepage" class="dark-logo" /></b> <!--End Logo icon --> <!-- Logo text -->
						<span><img
							src="<c:url value="/resources/images/logo-text.png"></c:url>"
							alt="homepage" class="dark-logo" /></span>
					</a>
				</div>

				<!-- End Logo -->
				<div class="navbar-collapse">
					<!-- toggle and nav items -->
					<ul class="navbar-nav mr-auto mt-md-0">
						<!-- This is  -->
						<li class="nav-item"><a
							class="nav-link nav-toggler hidden-md-up text-muted  "
							href="javascript:void(0)"><i class="mdi mdi-menu"></i></a></li>
						<li class="nav-item m-l-10"><a
							class="nav-link sidebartoggler hidden-sm-down text-muted  "
							href="javascript:void(0)"><i class="ti-menu"></i></a></li>
						<!-- Messages -->
						<li class="nav-item dropdown mega-dropdown"><a
							class="nav-link dropdown-toggle text-muted  " href="#"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
								class="fa fa-th-large"></i></a>
							<div class="dropdown-menu animated zoomIn">
								<ul class="mega-dropdown-menu row">
									<li class="col-lg-3  m-b-30">
										<h4 class="m-b-20"><spring:message code="EntreEmContato" /></h4> <!-- Contact -->
										<form>
											<div class="form-group">
												<input type="text" class="form-control"
													id="exampleInputname1" placeholder="Seu nome">
											</div>
											<div class="form-group">
												<input type="email" class="form-control"
													placeholder="Seu e-mail">
											</div>
											<div class="form-group">
												<textarea class="form-control" id="exampleTextarea" rows="3"
													placeholder="Mensagem"></textarea>
											</div>
											<button type="submit" class="btn btn-info"><spring:message code="enviar" /></button>
										</form>
									</li>
									<li class="col-lg-3 col-xlg-3 m-b-30">
										<h4 class="m-b-20">VETWEB</h4>
										<h6 class="m-b-20"><spring:message code="solucao" /></h6> <!-- List style -->
										<ul class="list-style-none">
											<li><a href="javascript:void(0)"><i
													class="fa fa-check text-success"></i> <spring:message code="rapida" /></a></li>
											<li><a href="javascript:void(0)"><i
													class="fa fa-check text-success"></i> <spring:message code="assertiva" /></a></li>
											<li><a href="javascript:void(0)"><i
													class="fa fa-check text-success"></i> <spring:message code="relatorios" /></a></li>
											<li><a href="javascript:void(0)"><i
													class="fa fa-check text-success"></i> <spring:message code="seguranca" /></a></li>
											<li><a href="javascript:void(0)"><i
													class="fa fa-check text-success"></i> <spring:message code="credibilidade" /></a></li>
										</ul>
									</li>
									<li class="col-lg-3 col-xlg-3 m-b-30">
										<h4 class="m-b-20"><spring:message code="sobreNos" /></h4>
										<h6 class="m-b-20"><spring:message code="sobrehistoria" /></h6>
										<!-- List style -->
										<ul class="list-style-none">
											<li><a href="javascript:void(0)"><i
													class="fa fa-info text-success"></i> Sobre a gente Sobre a
													gente Sobre a gente Sobre a gente Sobre a gente Sobre a
													gente Sobre a gente Sobre a gente Sobre a gente Sobre a
													gente Sobre a gente Sobre a gente </a></li>
											<li><a href="javascript:void(0)"><i
													class="fa fa-info text-success"></i> Sobre a gente Sobre a
													gente Sobre a gente Sobre a gente Sobre a gente Sobre a
													gente Sobre a gente Sobre a gente Sobre a gente Sobre a
													gente Sobre a gente Sobre a gente </a></li>
										</ul>
									</li>
								</ul>
							</div></li>
						<!-- End Messages -->
					</ul>

					<!-- INICIO Icone Traduções -->
					<div>
						<a href="<c:url value="?locale=pt_BR"></c:url>"><img
							src="<c:url value="/resources/images/brazil.png"></c:url>"
							style="width: 30px !important; height: 30px !important;"
							alt="Brazil" /></a> <a href="<c:url value="?locale=en_US"></c:url>"><img
							src="<c:url value="/resources/images/eua.png"></c:url>"
							style="width: 30px !important; height: 30px !important;"
							alt="EUA" /></a>
					</div>
					<!-- FIM Icone Traduções -->

					<!-- User profile and search -->
					<ul class="navbar-nav my-lg-0">

						<!-- Search -->
						<li class="nav-item hidden-sm-down search-box"><a
							class="nav-link hidden-sm-down text-muted  "
							href="javascript:void(0)"><i class="ti-search"></i></a>
							<form class="app-search">
								<input type="text" class="form-control"
									placeholder="Pesquise aqui, é rápido!"> <a
									class="srh-btn"><i class="ti-close"></i></a>
							</form></li>
						<!-- Comment -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-muted text-muted  " href="#"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-bell"></i>
								<div class="notify">
									<span class="heartbit"></span> <span class="point"></span>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-right mailbox animated zoomIn">
								<ul>
									<li>
										<div class="drop-title"><spring:message code="notificacoes" /></div>
									</li>
									<li>
										<div class="message-center">
											<!-- Message -->
											<a href="#">
												<div class="btn btn-danger btn-circle m-r-10">
													<i class="fa fa-link"></i>
												</div>
												<div class="mail-contnet">
													<h5><spring:message code="animalMorto" /></h5>
													<span class="mail-desc"><spring:message code="alertaTesteDoAnimal" /></span> <span
														class="time">09:30</span>
												</div>
											</a>
											<!-- Message -->
											<!-- Message -->
											<a href="#">
												<div class="btn btn-info btn-circle m-r-10">
													<i class="fa fa-link"></i>
												</div>
												<div class="mail-contnet">
													<h5><spring:message code="animalVivo" /></h5>
													<span class="mail-desc"><spring:message code="alertaTesteDoAnimal" /></span> <span
														class="time">13:00</span>
												</div>
											</a>
											<!-- Message -->
										</div>
									</li>
									<li><a class="nav-link text-center"
										href="javascript:void(0);"> <spring:message code="todasNotificacoes" /></strong> <i class="fa fa-angle-right"></i>
									</a></li>
								</ul>
							</div></li>
						<!-- End Comment -->

						<!-- INICO Perfil- Foto/Menu -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-muted  " href="#"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
								src="<c:url value="/resources/images/users/3.jpg"></c:url>"
								alt="user" class="profile-pic" /></a>
							<div class="dropdown-menu dropdown-menu-right animated zoomIn">
								<ul class="dropdown-user">
									<li><a href="#"><i class="ti-user"></i><spring:message code="perfil" /> </a></li>
									<li><a href="#"><i class="ti-settings"></i><spring:message code="configuracoes" /></a></li>
									<li><a href="<c:url value="/logout"></c:url>" /><i class="fa fa-power-off"></i><spring:message code="sair" /></a></li>
								</ul>
							</div></li>
						<!-- FIM Perfil- Foto/Menu -->
					</ul>
				</div>
			</nav>
		</div>
		<!-- End header header -->
		<!-- Left Sidebar  -->
		<div class="left-sidebar">
			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">

				<!-- INICIO Sidebar navigation - MENU-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav">
						<li class="nav-devider"></li>
						<li class="nav-label">Home</li>
						<li><a class="has-default" href="<c:url value="/"></c:url>"
							aria-expanded="false"><i class="fa fa-home"></i><span
								class="hide-menu"><spring:message code="PainelDeControle" /></a></li>

						<li class="nav-label">Apps</li>
						<li><a class="has-default"
							href="<c:url value="/clientes/listar"></c:url>"
							aria-expanded="false"><i class="fa fa-user-circle-o"></i><span
								class="hide-menu"><spring:message code="clientes" /></span></a></li>
						<li><a class="has-default"
							href="<c:url value="/agendamento"></c:url>" aria-expanded="false"><i
								class="fa fa-calendar"></i><span class="hide-menu"><spring:message code="agendamento" /></span></a></li>

						<li><a class="has-default"
							href="<c:url value="/relatorios"></c:url>" aria-expanded="false"><i
								class="fa fa-bar-chart"></i><span class="hide-menu"><spring:message code="relatorios" /></span></a></li>
								
						<li class="nav-label"><spring:message code="cadastros" /></li>
						<li><a class="has-arrow" href="#" aria-expanded="false"><i
								class="fa fa-folder-open"></i><span class="hide-menu"><spring:message code="cadastros" /><span
									class="label label-rouded label-light-info pull-right">7</span></span></a>
							<ul aria-expanded="false" class="collapse">
								<li><a href="<c:url value="/animais/especies"></c:url>"><spring:message code="especies" /></a></li>
								<li><a href="<c:url value="/animais/racas"></c:url>"><spring:message code="racas" /></a></li>
								<li><a href="<c:url value="/animais/pelagens"></c:url>"><spring:message code="pelagens" /></a></li>
								<li><a href="<c:url value="/animais/patologias"></c:url>"><spring:message code="patologias" /></a></li>
								<li><a
									href="<c:url value="/prontuario/tiposDeAtendimento"></c:url>"><spring:message code="tiposDeAtendimento" /></a></li>
								<li><a href="<c:url value="/prontuario/vacinas"></c:url>"><spring:message code="vacinas" /></a></li>
								<li><a href="<c:url value="/exames"></c:url>"><spring:message code="exames" /></a></li>
							</ul></li>


						<li class="nav-label">Extras</li>
						<li>
						<a class="has-default" href="<c:url value="${urlClinica}"></c:url>" aria-expanded="false">
							<i class="fa fa-institution"></i>
							<span class="hide-menu"><spring:message code="clinica" /></span></a>
						<li>
							<a class="has-default" href="/vetweb-auth/index.xhtml" target="_blank" aria-expanded="false">
							<i class="fa fa-lock"></i><span class="hide-menu"><spring:message code="usuariosPermissoes" /></span></a>
						</li>
						
						<li>
							<a class="has-default" href="<c:url value="/logout"></c:url>" aria-expanded="false">
							<i class="fa fa-power-off"></i><span class="hide-menu"><spring:message code="sair" /></span></a>
						</li>
					</ul>
				</nav>
				<!-- FIM Sidebar navigation - MENU-->
			</div>
			<!-- End Sidebar scroll-->
		</div>
		<!-- End Left Sidebar  -->

		<!-- INICIO CORPO DA PÁGINA  -->
		<jsp:doBody></jsp:doBody>
		<!-- FIM CORPO DA PÁGINA  -->
		<!-- INICIO RODAPE -->
		<footer class="footer">&copy; 2018 - Desenvolvido pela AMR Tecnologia.</footer>
		<!-- FIM RODAPE -->
	</div>

	<!-- End Wrapper -->
	<!-- All Jquery -->
	<script
		src="<c:url value="/resources/js/lib/jquery/jquery.min.js"></c:url>"
		type="text/javascript"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="<c:url value="/resources/js/lib/bootstrap/js/popper.min.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/bootstrap/js/bootstrap.min.js"></c:url>"
		type="text/javascript"></script>

	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="<c:url value="/resources/js/jquery.slimscroll.js"></c:url>"
		type="text/javascript"></script>
	<!--Menu sidebar -->
	<script src="<c:url value="/resources/js/sidebarmenu.js"></c:url>"
		type="text/javascript"></script>
	<!--stickey kit -->
	<script
		src="<c:url value="/resources/js/lib/sticky-kit-master/dist/sticky-kit.min.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/datamap/d3.min.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/datamap/topojson.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/datamap/datamaps.world.min.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/datamap/datamap-init.js"></c:url>"
		type="text/javascript"></script>

	<script
		src="<c:url value="/resources/js/lib/weather/jquery.simpleWeather.min.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/weather/weather-init.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/owl-carousel/owl.carousel.min.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/owl-carousel/owl.carousel-init.js"></c:url>"
		type="text/javascript"></script>

	<script
		src="<c:url value="/resources/js/lib/chartist/chartist.min.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/chartist/chartist-plugin-tooltip.min.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/chartist/chartist-init.js"></c:url>"
		type="text/javascript"></script>
	<!--Custom JavaScript -->
	<script src="<c:url value="/resources/js/custom.min.js"></c:url>"
		type="text/javascript"></script>
	<script src="<c:url value="/resources/js/app/ajaxService.js"></c:url>"
		type="text/javascript"></script>


	<script src="<c:url value="/resources/js/viacep.js"></c:url>"
		type="text/javascript"></script>


	<script src="<c:url value="/resources/js/app/mascaras.js"></c:url>"
		type="text/javascript"></script>
	<script src="<c:url value="/resources/js/app/websocket.js"></c:url>"
		type="text/javascript"></script>


	<script
		src="<c:url value="/resources/js/jquery/jquery.maskedinput.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/sweetalert/sweetalert.min.js"></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/resources/js/lib/sweetalert/sweetalert.init.js"></c:url>"
		type="text/javascript"></script>

	<jsp:invoke fragment="jsFooter"></jsp:invoke>
</body>
</html>