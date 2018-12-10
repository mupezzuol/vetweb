<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<vetweb:layout title="Balanço Financeiro">
   <jsp:attribute name="jsHead">
      <script
      src="
      <c:url value="/resources/js/app/ajaxService.js"></c:url>
      "
      type="text/javascript"></script>
      <script>
         $(document).ready(function(){
            $('#balancoFinanceiro').dataTable();
         });
      </script>        
   </jsp:attribute>
   <jsp:body>
      <div class="page-wrapper">
         <!-- INICIO MENU DE CONSULTA DE NAVEGAÇÃO -->
         <div class="row page-titles">
            <div class="col-md-5 align-self-center">
               <h3 class="text-primary">Balanço Financeiro</h3>
            </div>
            <div class="col-md-7 align-self-center">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a
                     href="<c:url value="/"></c:url>">Home</a></li>
                  <li class="breadcrumb-item">
                     <a
                     href="
                     <c:url value="/clientes/listar"></c:url>
                     ">Clientes</a>
                  </li>
                  <li class="breadcrumb-item active">Débitos do Cliente</li>
               </ol>
            </div>
         </div>
         <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->
         <!-- INICIO CORPO DA PÁGINA  -->
         <div class="col-md-8">
            <div class="card">
               <div class="card-body p-b-0">
                  <h4 class="card-title">Cliente: ${proprietario.nome}</h4>
                  <p>Total pendente: ${totalPendente}</p>
                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs customtab"
                     role="tablist">
                     <li class="nav-item"> <a
                        class="nav-link active" data-toggle="tab" href="#atendimento"
                        role="tab"><span class="hidden-sm-up"><i
                        class="ti-home"></i></span> <span class="hidden-xs-down">Atendimentos</span></a> </li>
                     <li class="nav-item"> <a
                        class="nav-link" data-toggle="tab" href="#vacina" role="tab"><span
                        class="hidden-sm-up"><i class="ti-user"></i></span> <span
                        class="hidden-xs-down">Vacinas</span></a> </li>
                     <li class="nav-item"> <a class="nav-link"
                        data-toggle="tab" href="#exame" role="tab"><span
                        class="hidden-sm-up"><i class="ti-user"></i></span> <span
                        class="hidden-xs-down">Exames</span></a> </li>
                  </ul>
                  
                  <!-- Tab panes -->
                  <div class="tab-content">
                     <div class="tab-pane active "
                        id="atendimento" role="tabpanel">
                        <div class="p-20 ">
                           <table
                              class="table table-responsive" id="detalhesProprietario">
                           <table id="atendimento"
                              class="table table-responsive">
                              <thead>
                                 <tr>
                                    <th>Tipo de Atendimento</th>
                                    <th>Custo</th>
                                    <th>Pago</th>
                                    <th>Data do Atendimento</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <c:forEach
                                    items="${atendimentosFeitos}" var="atendimento">
                                    <tr>
                                       <td>
                                          ${atendimento.tipoDeAtendimento.nome}
                                       </td>
                                       <td>
                                          ${atendimento.tipoDeAtendimento.custo}
                                       </td>
                                       <td>
                                          <input
                                          type="checkbox" class="flagPago"
                                          ${atendimento.pago? 'checked' : ''}
                                          onclick="ajaxService.alterarStatusPagamentoOcorrencia('${atendimento.tipo}',${atendimento.ocorrenciaId})" />
                                       </td>
                                       <td>
                                          ${atendimento.data}
                                       </td>
                                    </tr>
                                 </c:forEach>
                              </tbody>
                           </table>
                        </div>
                     </div>
                     
                     <div class="tab-pane  p-20" id="vacina"
                        role="tabpanel">
                        <table id="vacina"
                           class="table table-responsive">
                           <thead>
                              <tr>
                                 <th>Nome</th>
                                 <th>Preço</th>
                                 <th>Inclusão da Vacina</th>
                                 <th>Pago</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach
                                 items="${vacinasAplicadas}" var="vacina">
                                 <tr>
                                    <td>${vacina.vacina.nome}</td>
                                    <td>${vacina.vacina.preco}</td>
                                    <td>${vacina.data}</td>
                                    <td>
                                       <input
                                       type="checkbox" class="flagPago"
                                       ${vacina.pago? 'checked' : ''}
                                       onclick="ajaxService.alterarStatusPagamentoOcorrencia('${vacina.tipo}',${vacina.ocorrenciaId})" />
                                    </td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                     
                     <div class="tab-pane  p-20" id="exame"
                        role="tabpanel">
                        <table id="exame"
                           class="table table-responsive">
                           <thead>
                              <tr>
                                 <th>Nome</th>
                                 <th>Preço</th>
                                 <th>Inclusão do Exame</th>
                                 <th>Pago</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach
                                 items="${examesRealizados}" var="exame">
                                 <tr>
                                    <td>${exame.exame.descricao}</td>
                                    <td>${exame.exame.preco}</td>
                                    <td>${exame.data}</td>
                                    <td>
                                       <input type="checkbox" class="flagPago" 
                                       ${exame.pago? 'checked' : ''} 
                                       onclick="ajaxService.alterarStatusPagamentoOcorrencia('${exame.tipo}',${exame.ocorrenciaId})"	/>
                                    </td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                     
                  </div>
               </div>
            </div>
         </div>
         <!-- FIM CORPO DA PÁGINA  -->
      </div>
   </jsp:body>
</vetweb:layout>