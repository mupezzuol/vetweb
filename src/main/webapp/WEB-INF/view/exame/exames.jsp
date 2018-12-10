<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<vetweb:layout title="Exames">
   <jsp:attribute name="jsHead">
      <script>
         $(document).ready(function(){
            $('#exames').dataTable({
         	    language: {
         "sEmptyTable": "Nenhum registro encontrado",
         "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
         "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
         "sInfoFiltered": "(Filtrados de _MAX_ registros)",
         "sInfoPostFix": "",
         "sInfoThousands": ".",
         "sLengthMenu": "_MENU_ resultados por página",
         "sLoadingRecords": "Carregando...",
         "sProcessing": "Processando...",
         "sZeroRecords": "Nenhum registro encontrado",
         "sSearch": "Pesquisar",
         "oPaginate": {
         	"sNext": "Próximo",
         	"sPrevious": "Anterior",
         	"sFirst": "Primeiro",
         	"sLast": "Último"
         },
         "oAria": {
         	"sSortAscending": ": Ordenar colunas de forma ascendente",
         	"sSortDescending": ": Ordenar colunas de forma descendente"
         }
           }             	   
            });
         });
      </script>         
   </jsp:attribute>
   <jsp:body>
      <div class="page-wrapper">
         <!-- INICIO MENU DE CONSULTA DE NAVEGAÇÃO -->
         <div class="row page-titles">
            <div class="col-md-5 align-self-center">
               <h3 class="text-primary">Exames</h3>
            </div>
            <div class="col-md-7 align-self-center">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a
                     href="<c:url value="/"></c:url>">Home</a></li>
                  <li class="breadcrumb-item active"><a
                     href="<c:url value="/exames"></c:url>">Exames</a></li>
               </ol>
            </div>
         </div>
         <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->
         <!-- INICIO CORPO DA PÁGINA  -->
         <div class="">
            <div class="col-8">
               <div class="card">
                  <div class="card-body">
                     <h4 class="card-title">Cadastre novos exames</h4>
                     
                     <button type="button" class="btn btn-success btn-flat btn-addon m-b-10 m-l-5" onclick="location.href='<c:url value="/exames/form"> </c:url>'">
                     	<i class="ti-save"></i> Cadastrar
                     </button>
                     
                     <div class="table-responsive m-t-40 col-12">
                        <table id="exames"
                           class="display nowrap table table-hover table-striped table-bordered"
                           cellspacing="0" width="100%">
                           <thead>
                              <tr>
                                 	<th><spring:message code="descricao"></spring:message></th>
				                    <th><spring:message code="apresentacao"></spring:message></th>
				                    <th><spring:message code="encerramento"></spring:message></th>
				                    <th><spring:message code="custo"></spring:message></th>
				                    <th><spring:message code="duracao"></spring:message></th>
				                    <th>Status</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach items="${exames}" var="exame">
                                 <tr>
                                    <td>${exame.descricao}
                                       <a href="<c:url value="/exames/atualizar/${exame.exameId}"></c:url> ">
                                       		<i class="fa fa-pencil-square-o fa-2x"></i>
                                       </a>
                                       <a href="
                                       <c:url value="/exames/remover/${exame.exameId}"></c:url>
                                       ">
                                       <i class="fa fa-trash-o fa-2x"></i>
                                       </a>
                                    </td>
                                    <td>
                                       ${exame.apresentacao}
                                    </td>
                                    <td>
                                       ${exame.encerramento}
                                    </td>
                                    <td>
                                       ${exame.preco}
                                    </td>
                                    <td>
                                       ${exame.duracao}
                                    </td>
			                        <c:if test="${exame.ativo == true}">
										<td>Ativo</td>
									</c:if>
									<c:if test="${exame.ativo == false}">
										<td>Inativo</td>
									</c:if>                                    
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