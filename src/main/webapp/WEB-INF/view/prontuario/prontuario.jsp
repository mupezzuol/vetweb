<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
                    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

                        <vetweb:layout title="Prontuario do Animal">
                            <jsp:attribute name="jsFooter">
                                <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=2i80p03koooieys6i5h5yz1n9d4uaxrwt1iaoy9938bmcahs"></script>
                                <script>
                                    tinymce.init({
                                        selector: '#preenchimentoModeloAtendimento'
                                    });
                                </script>
                            </jsp:attribute>

                            <jsp:body>
                                <div class="page-wrapper">
                                    <!-- INICIO MENU DE CONSULTA DE NAVEGAÇÃO -->
                                    <div class="row page-titles">
                                        <div class="col-md-5 align-self-center">
                                            <h3 class="text-primary">Prontuário</h3>
                                        </div>
                                        <div class="col-md-7 align-self-center">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="<c:url value="/"></c:url>">Home</a></li>
                                                <li class="breadcrumb-item"><a href="<c:url value="/clientes/listar"></c:url>">Animais</a></li>
                                                <li class="breadcrumb-item active">Detalhes do Animal</li>
                                                <li class="breadcrumb-item active">Prontuário do Animal</li>
                                            </ol>
                                        </div>
                                    </div>
                                    <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->

                                    <!-- INICIO CORPO DA PÁGINA  -->

                                    <div class="">
                                        <div class="col-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h2 class="card-title">Prontuário do Animal ${prontuario.animal.nome}</h2>
                                                    <div class="col-md-12">
                                                        <button type="button" data-toggle="modal" data-target="#modalAtendimento" onclick="ajaxService.buscarModeloPorTipoDeAtendimento()" class="btn btn-info col-2">
                                                            <i class="fa fa-medkit fa-5x" aria-hidden="true"></i>
                                                        </button>
                                                        <button type="button" data-toggle="modal" data-target="#modalVacina" class="btn btn-warning col-2">
                                                            <i class="fa fa-eyedropper fa-5x"></i>
                                                        </button>
                                                        <button type="button" data-toggle="modal" data-target="#modalPatologia" class="btn btn-danger col-2">
                                                            <i class="fa  fa-plus-square fa-5x" aria-hidden="true"></i>
                                                        </button>
                                                        <button type="button" data-toggle="modal" data-target="#modalExame" class="btn btn-primary col-2">
                                                            <i class="fa fa-stethoscope fa-5x" aria-hidden="true"></i>
                                                        </button>
														<c:choose>
														    <c:when test="${agendaOcupada!=''}">
							                                    <div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
							                                        <span class="badge badge-pill badge-danger">Agenda Ocupada</span>
							                                        ${agendaOcupada}
							                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							                                            <span aria-hidden="true">&times;</span>
							                                        </button>
							                                    </div>
														    </c:when>
														</c:choose>
                                                    </div>
												</div>

                                                    <div class="table-responsive m-t-40">
														
														<!-- INICIO LINHA DO TEMPO -->
                                                        <h3 class="card-title">Linha do tempo</h3>
                                                        <div class="tab-content">
                                                            <div class="tab-pane active" id="home" role="tabpanel">
                                                                <div class="card-body">
                                                                    <div class="profiletimeline">
																		
																		<!-- INICIO DO FOR -->
                                                                        <c:forEach items="${historico}" var="elementoHistorico">

                                                                            <c:if test="${elementoHistorico.tipo == 'ATENDIMENTO'}">
                                                                                <div class="sl-item">
                                                                                    <div class="sl-left"> <img src="<c:url value="/resources/images/img-vetweb/p_medkit.png "></c:url>" class="img-circle"> </div>
                                                                                    <div class="sl-right">
                                                                                        <div><a href="#" class="link">${elementoHistorico.tipo}</a>
                                                                                            <span class="sl-date">
					                                                            				<fmt:parseDate value="${elementoHistorico.data}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					                                                            				<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${parsedDateTime}" />
					                                                            			</span>
                                                                                            <div class="row">
                                                                                                <div class="col-md-9 col-xs-12">
                                                                                                    <p><b>Descrição:</b> ${elementoHistorico.descricao}</p>
                                                                                                	<!-- INICIO AGENDAMENTO -->
	                                                                                                <h6><b>AGENDAMENTOS:</b></h6>
	                                                                                                <c:forEach items="${elementoHistorico.agendamentos}" var="ag">
	                                                                                                	<!-- Hora Inicial formatada -->
	                                                                                                	<fmt:parseDate value="${ag.dataHoraInicial}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTimeInicial" type="both"/>
	                                                                                                	<b>Data Inicial:</b> <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${parsedDateTimeInicial}"/></br>
	                                                                                                	
	                                                                                                	<!-- Hora Final formatada -->
	                                                                                                	<fmt:parseDate value="${ag.dataHoraFinal}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTimeFinal" type="both"/>
	                                                                                                	<b>Data Final:</b> <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${parsedDateTimeFinal}"/>
	                                                                                                </c:forEach>
                                                                                                	<!-- FIM AGENDAMENTO -->
                                                                                                </div>
                                                                                                </br>
                                                                                                <div class="col-md-9 col-xs-12">
                                                                                                    <button data-toggle="modal" data-target="#modalAtendimento" onclick="ajaxService.editarAtendimento(${elementoHistorico.ocorrenciaId})" class="btn btn-warning btn-sm m-b-10 m-l-5"><i class="ti-pencil"></i> Editar</button>

                                                                                                    <a href="<c:url value="/prontuario/remover/${prontuario.prontuarioId}/${elementoHistorico.ocorrenciaId}"></c:url>">
                                                                                                        <button class="btn btn-danger btn-sm m-b-10 m-l-5"><i class="ti-trash"></i> Excluir</button>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <hr>
                                                                            </c:if>

                                                                            <c:if test="${elementoHistorico.tipo == 'VACINA'}">
                                                                                <div class="sl-item">
                                                                                    <div class="sl-left"> <img src="<c:url value="/resources/images/img-vetweb/p_eyedropper.png "></c:url>" alt="user" class="img-circle"> </div>
                                                                                    <div class="sl-right">
                                                                                        <div> <a href="#" class="link">${elementoHistorico.tipo}</a>
                                                                                        	<span class="sl-date">
                                                            									<fmt:parseDate value="${elementoHistorico.data}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					                                                							<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${parsedDateTime}" />
                                                            								</span>
                                                                                            <div class="row">
                                                                                                <div class="col-md-9 col-xs-12">
                                                                                                    <p><b>Descrição:</b> ${elementoHistorico.descricao}</p>
                                                                                                    <!-- INICIO AGENDAMENTO -->
	                                                                                                <h6><b>AGENDAMENTOS:</b></h6>
	                                                                                                <c:forEach items="${elementoHistorico.agendamentos}" var="ag">
	                                                                                                	<!-- Hora Inicial formatada -->
	                                                                                                	<fmt:parseDate value="${ag.dataHoraInicial}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTimeInicial" type="both"/>
	                                                                                                	<b>Data Inicial:</b> <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${parsedDateTimeInicial}"/></br>
	                                                                                                	
	                                                                                                	<!-- Hora Final formatada -->
	                                                                                                	<fmt:parseDate value="${ag.dataHoraFinal}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTimeFinal" type="both"/>
	                                                                                                	<b>Data Final:</b> <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${parsedDateTimeFinal}"/>
	                                                                                                </c:forEach>
                                                                                                	<!-- FIM AGENDAMENTO -->
                                                                                                </div>
                                                                                                </br>
                                                                                                <div class="col-md-9 col-xs-12">
                                                                                                    <button data-toggle="modal" data-target="#modalVacina" onclick="ajaxService.editarVacina(${elementoHistorico.ocorrenciaId})" class="btn btn-warning btn-sm m-b-10 m-l-5"><i class="ti-pencil"></i> Editar</button>

                                                                                                    <a href="<c:url value="/prontuario/remover/${prontuario.prontuarioId}/${elementoHistorico.ocorrenciaId}?inclusaoOcorrenciaVacina=${elementoHistorico.data}"></c:url>">
                                                                                                        <button class="btn btn-danger btn-sm m-b-10 m-l-5"><i class="ti-trash"></i> Excluir</button>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <hr size=”10″>
                                                                            </c:if>

                                                                            <c:if test="${elementoHistorico.tipo == 'PATOLOGIA'}">
                                                                                <div class="sl-item">
                                                                                    <div class="sl-left"> <img src="<c:url value="/resources/images/img-vetweb/p_plus-square.png "></c:url>" alt="user" class="img-circle"> </div>
                                                                                    <div class="sl-right">
                                                                                        <div><a href="#" class="link">${elementoHistorico.tipo}</a> 
                                                                                        	<span class="sl-date">
                                                            									<fmt:parseDate value="${elementoHistorico.data}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					                                            								<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${parsedDateTime}" />
                                                           									</span>
                                                                                            <div class="row">
                                                                                                <div class="col-md-9 col-xs-12">
                                                                                                    <p><b>Descrição:</b> ${elementoHistorico.descricao}</p>
                                                                                                </div>
                                                                                                </br>
                                                                                                <div class="col-md-9 col-xs-12">
                                                                                                    <button data-toggle="modal" data-target="#modalPatologia" onclick="ajaxService.editarPatologia(${elementoHistorico.ocorrenciaId})" class="btn btn-warning btn-sm m-b-10 m-l-5"><i class="ti-pencil"></i> Editar</button>

                                                                                                    <a href="<c:url value="/prontuario/remover/${prontuario.prontuarioId}/${elementoHistorico.ocorrenciaId}"></c:url>">
                                                                                                        <button class="btn btn-danger btn-sm m-b-10 m-l-5"><i class="ti-trash"></i> Excluir</button>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <hr>
                                                                            </c:if>

                                                                            <c:if test="${elementoHistorico.tipo == 'EXAME'}">
                                                                                <div class="sl-item">
                                                                                    <div class="sl-left"> <img src="<c:url value="/resources/images/img-vetweb/p_stethoscope.png "></c:url>" alt="user" class="img-circle"> </div>
                                                                                    <div class="sl-right">
                                                                                        <div><a href="#" class="link">${elementoHistorico.tipo}</a> 
                                                                                        	<span class="sl-date">
                                                            									<fmt:parseDate value="${elementoHistorico.data}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					                                        									<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${parsedDateTime}" />
                                                            								</span>
                                                                                            <div class="row">
                                                                                                <div class="col-md-9 col-xs-12">
                                                                                                    <p><b>Descrição:</b> ${elementoHistorico.descricao}</p>
                                                                                                    <!-- INICIO AGENDAMENTO -->
	                                                                                                <h6><b>AGENDAMENTOS:</b></h6>
	                                                                                                <c:forEach items="${elementoHistorico.agendamentos}" var="ag">
	                                                                                                	<!-- Hora Inicial formatada -->
	                                                                                                	<fmt:parseDate value="${ag.dataHoraInicial}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTimeInicial" type="both"/>
	                                                                                                	<b>Data Inicial:</b> <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${parsedDateTimeInicial}"/></br>
	                                                                                                	
	                                                                                                	<!-- Hora Final formatada -->
	                                                                                                	<fmt:parseDate value="${ag.dataHoraFinal}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTimeFinal" type="both"/>
	                                                                                                	<b>Data Final:</b> <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${parsedDateTimeFinal}"/>
	                                                                                                </c:forEach>
                                                                                                	<!-- FIM AGENDAMENTO -->
                                                                                                </div>
                                                                                                </br>
                                                                                                <div class="col-md-9 col-xs-12">
                                                                                                    <button data-toggle="modal" data-target="#modalExame" onclick="ajaxService.editarExame(${elementoHistorico.ocorrenciaId})" class="btn btn-warning btn-sm m-b-10 m-l-5"><i class="ti-pencil"></i> Editar</button>

                                                                                                    <a href="<c:url value="/prontuario/remover/${prontuario.prontuarioId}/${elementoHistorico.ocorrenciaId}"></c:url>">
                                                                                                        <button class="btn btn-danger btn-sm m-b-10 m-l-5"><i class="ti-trash"></i> Excluir</button>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <hr>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        <!-- FIM DO FOR -->
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- FIM LINHA DO TEMPO -->
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- FIM CORPO DA PÁGINA  -->
                                </div>
								<div id="possuiDebitoVacina" style="display: none;">${possuiDebitoVacina}</div>
								<div id="possuiDebitoAtendimento" style="display: none;">${possuiDebitoAtendimento}</div>
								<div id="possuiDebitoExame" style="display: none;">${possuiDebitoExame}</div>
                                <!-- INICIO DAS MODAIS  -->
                                <vetweb:modalAtendimento prontuario="${prontuario}" tiposDeAtendimento="${tiposDeAtendimento}"></vetweb:modalAtendimento>
                                <vetweb:modalPatologia prontuario="${prontuario}" patologias="${patologia}"></vetweb:modalPatologia>
                                <vetweb:modalVacina prontuario="${prontuario}" vacinas="${vacinas}"></vetweb:modalVacina>
                                <vetweb:modalExame prontuario="${prontuario}" exames="${exames}"></vetweb:modalExame>
                                <!-- INICIO DAS MODAIS  -->
                            </jsp:body>
                        </vetweb:layout>