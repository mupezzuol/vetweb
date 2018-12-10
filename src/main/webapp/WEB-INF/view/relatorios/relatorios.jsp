<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<vetweb:layout title="Relatórios">
   <jsp:attribute name="jsFooter">
      <script type="text/javascript"
      src="
      <c:url value="/resources/js/app/relatorios.js"></c:url>
      "></script>
   </jsp:attribute>
   <jsp:body>
      <div class="page-wrapper">
         <!-- INICIO MENU DE CONSULTA DE NAVEGAÇÃO -->
         <div class="row page-titles">
            <div class="col-md-5 align-self-center">
               <h3 class="text-primary">Relatórios</h3>
            </div>
            <div class="col-md-7 align-self-center">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a
                     href="<c:url value="/"></c:url>">Home</a></li>
                  <li class="breadcrumb-item active">
                     <a
                     href="
                     <c:url value="/clientes/listar"></c:url>
                     ">Relatórios</a>
                  </li>
               </ol>
            </div>
         </div>
         <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->
         <!-- INICIO CORPO DA PÁGINA  -->
         <div class="">
            <div class="col-8">
               <div class="card">
                  <div class="card-title">
                     <h1>Relatórios</h1>
                  </div>
                  <div class="card-body">
                     <div class="basic-form">
                        <div class="card-title">
                           <caption>
                              <spring:message code="selecioneRelatorio" />
                           </caption>
                        </div>
                        <form:form
                           servletRelativeAction="/relatorios" method="POST"
                           id="formRelatorio">
                           <div class="table-responsive m-t-40">
                              <table
                                 id="proprietarios"
                                 class="display nowrap table table-hover table-striped table-bordered"
                                 cellspacing="0" width="100%">
                                 <tbody
                                    id="form">
                                    <tr>
                                       <th>
                                          <spring:message
                                             code="relatoriosDisponiveis" />
                                          : 
                                       </th>
                                       <td>
                                          <select name="tipoRelatorio" id="tipoRelatorio">
                                             <option value="Ocorrencia">
                                                <spring:message code="ocorrenciasPorTipo" />
                                             </option>
                                             <option value="Clientes_por_ano">
                                                <spring:message code="clientesPorAno" />
                                             </option>
                                             <option value="Inadimplentes"><spring:message code="clientesDevedores"	/></option>
                                          </select>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                           <button type="submit" value="Print"
                              class="btn btn-success btn-flat btn-addon m-b-10 m-l-5">
                           <i class="ti-save"></i>Imprimir</button>
                           <button type="reset" value="Reset"
                              class="btn btn-inverse btn-flat btn-addon m-b-10 m-l-5">
                           <i class="ti-close"></i>Limpar</button>  
                        </form:form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- FIM CORPO DA PÁGINA  -->
      </div>
   </jsp:body>
</vetweb:layout>