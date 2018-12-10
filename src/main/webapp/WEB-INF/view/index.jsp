<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!--    Importação JSTL -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<vetweb:layout title="Painel de Controle">
   <jsp:attribute name="jsFooter">
      <script
      src="
      <c:url value="/resources/js/lib/calendar-2/moment.latest.min.js"></c:url>
      "
      type="text/javascript"></script>
      <script
      src="
      <c:url value="/resources/js/lib/calendar-2/semantic.ui.min.js"></c:url>
      "
      type="text/javascript"></script>
      <script
      src="
      <c:url value="/resources/js/lib/calendar-2/prism.min.js"></c:url>
      "
      type="text/javascript"></script>
      <script
      src="
      <c:url value="/resources/js/lib/calendar-2/pignose.calendar.min.js"></c:url>
      "
      type="text/javascript"></script>
      <script
      src="
      <c:url value="/resources/js/lib/calendar-2/pignose.init.js"></c:url>
      "
      type="text/javascript"></script>     
   </jsp:attribute>
   <jsp:body>
      <div class="page-wrapper">
         <!-- INICIO MENU DE CONSULTA DE NAVEGAÇÃO -->
         <div class="row page-titles">
            <div class="col-md-5 align-self-center">
               <h3 class="text-primary"><spring:message code="PainelDeControle" /></h3>
            </div>
            <div class="col-md-7 align-self-center">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="<c:url value="/"></c:url>">Home</a></li>
               </ol>
            </div>
         </div>
         <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->
         <!-- INICIO CORPO DA PÁGINA  -->
         <div class="container-fluid">
            <!-- Start Page Content -->
            <div class="row">
               <div class="col-md-3">
                  <div class="card p-30">
                     <div class="media">
                        <div class="media-left meida media-middle">
                           <span><i class="fa fa-group f-s-40 color-primary"></i></span>
                        </div>
                        <div class="media-body media-text-right">
                           <h2>${quantidadeClientes}</h2>
                           <p class="m-b-0"><spring:message code="TotalDeClientes" /></p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-md-3">
                  <div class="card p-30">
                     <div class="media">
                        <div class="media-left meida media-middle">
                           <span><i class="fa fa-paw f-s-40 color-success"></i></span>
                        </div>
                        <div class="media-body media-text-right">
                           <h2>${quantidadeAnimais}</h2>
                           <p class="m-b-0"><spring:message code="TotalDeAnimais" /></p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-md-3">
                  <div class="card p-30">
                     <div class="media">
                        <div class="media-left meida media-middle">
                           <span><i class="fa fa-code-fork f-s-40 color-warning"></i></span>
                        </div>
                        <div class="media-body media-text-right">
                           <h2>R$ ${totalPendente}</h2>
                           <p class="m-b-0"><spring:message code="TotalDeCreditoPendente" /></p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-md-3">
                  <div class="card p-30">
                     <div class="media">
                        <div class="media-left meida media-middle">
                           <span><i class="fa fa-user f-s-40 color-danger"></i></span>
                        </div>
                        <div class="media-body media-text-right">
                           <h2>${clientesDevedores} </h2>
                           <p class="m-b-0"><spring:message code="ClientesDevedores" /></p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- FIM CORPO DA PÁGINA  -->
            <!-- column -->
            <div class="row">
            <div class="col-md-3">
                  <div class="card p-30">
                     <div class="media">
                        <div class="media-left meida media-middle">
                           <span><i class="fa fa-paw f-s-40 color-warning"></i></span>
                        </div>
                        <div class="media-body media-text-right">
                           <h2>${quantidadeAnimais/quantidadeClientes}</h2>
                           <p class="m-b-0"><spring:message code="MediaDeAnimaisPorCliente" /></p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-md-3">
                  <div class="card">
                     <div class="card-title">
                        <h4><spring:message code="BarrasAnaliticas" /></h4>
                     </div>
                     <div class="card-body browser">
                        <p class="f-w-600"><spring:message code="ClientesDevedores" /><span class="pull-right">${clientesDevedores*100/quantidadeClientes}%</span></p>
                        <div class="progress ">
                           <div role="progressbar" style="width: ${clientesDevedores*100/quantidadeClientes}%; height:8px;" class="progress-bar bg-danger wow animated progress-animated"> <span class="sr-only"></span> </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-3">
                  <div class="card">
                     <div class="card-body browser">
                        <a class="weatherwidget-io" href="https://forecast7.com/pt/n23d55n46d63/sao-paulo/" data-label_1="São Paulo" data-label_2="Tempo" data-theme="pure" ><spring:message code="SaoPauloTempo" /></a>
                        <script>
                           !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
                        </script>	
                     </div>
                  </div>
               </div>
               <!-- column -->
               <div class="col-md-3">
                  <div class="card">
                     <div class="card-body">
                        <div class="year-calendar">
                           <div class="pignose-calendar pignose-calendar-blue pignose-calendar-default">
                              <div class="pignose-calendar-top">
                                 <a href="#" class="pignose-calendar-top-nav pignose-calendar-top-prev">
                                 <span class="icon-arrow-left pignose-calendar-top-icon"></span>
                                 </a>
                                 <div class="pignose-calendar-top-date">
                                    <span class="pignose-calendar-top-month">September</span>
                                    <span class="pignose-calendar-top-year">2018</span>
                                 </div>
                                 <a href="#" class="pignose-calendar-top-nav pignose-calendar-top-next">
                                 <span class="icon-arrow-right pignose-calendar-top-icon"></span>
                                 </a>												
                              </div>
                              <div class="pignose-calendar-header">
                                 <div class="pignose-calendar-week pignose-calendar-week-sun">Dom</div>
                                 <div class="pignose-calendar-week pignose-calendar-week-mon">Seg</div>
                                 <div class="pignose-calendar-week pignose-calendar-week-tue">Ter</div>
                                 <div class="pignose-calendar-week pignose-calendar-week-wed">Qua</div>
                                 <div class="pignose-calendar-week pignose-calendar-week-thu">Qui</div>
                                 <div class="pignose-calendar-week pignose-calendar-week-fri">Sex</div>
                                 <div class="pignose-calendar-week pignose-calendar-week-sat">Sab</div>
                              </div>
                              <div class="pignose-calendar-body">
                                 <div class="pignose-calendar-row">
                                    <div class="pignose-calendar-unit pignose-calendar-unit-sun"></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-mon"></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-tue"></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-wed"></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-thu"></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-fri"></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat" data-date="2018-09-01"><a href="#">1</a></div>
                                 </div>
                                 <div class="pignose-calendar-row">
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun" data-date="2018-09-02"><a href="#">2</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon" data-date="2018-09-03"><a href="#">3</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue" data-date="2018-09-04"><a href="#">4</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed" data-date="2018-09-05"><a href="#">5</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu" data-date="2018-09-06"><a href="#">6</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri" data-date="2018-09-07"><a href="#">7</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat" data-date="2018-09-08"><a href="#">8</a></div>
                                 </div>
                                 <div class="pignose-calendar-row">
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun" data-date="2018-09-09"><a href="#">9</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon" data-date="2018-09-10"><a href="#">10</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue" data-date="2018-09-11"><a href="#">11</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed" data-date="2018-09-12"><a href="#">12</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu" data-date="2018-09-13"><a href="#">13</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri" data-date="2018-09-14"><a href="#">14</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat" data-date="2018-09-15"><a href="#">15</a></div>
                                 </div>
                                 <div class="pignose-calendar-row">
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun" data-date="2018-09-16"><a href="#">16</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon" data-date="2018-09-17"><a href="#">17</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue" data-date="2018-09-18"><a href="#">18</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed" data-date="2018-09-19"><a href="#">19</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu" data-date="2018-09-20"><a href="#">20</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri" data-date="2018-09-21"><a href="#">21</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat" data-date="2018-09-22"><a href="#">22</a></div>
                                 </div>
                                 <div class="pignose-calendar-row">
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun" data-date="2018-09-23"><a href="#">23</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon pignose-calendar-unit-active pignose-calendar-unit-first-active" data-date="2018-09-24"><a href="#">24</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue" data-date="2018-09-25"><a href="#">25</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed" data-date="2018-09-26"><a href="#">26</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu" data-date="2018-09-27"><a href="#">27</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri" data-date="2018-09-28"><a href="#">28</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat" data-date="2018-09-29"><a href="#">29</a></div>
                                    <div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun" data-date="2018-09-30"><a href="#">30</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </jsp:body>
</vetweb:layout>