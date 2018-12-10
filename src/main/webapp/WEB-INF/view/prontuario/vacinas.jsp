<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<vetweb:layout title="Vacinas">
    <jsp:attribute name="jsHead">
        <script>
            $(document).ready(function(){
               $('#vacinas').dataTable({
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
                    <h3 class="text-primary">Vacinas</h3> 
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
							href="<c:url value="/"></c:url>">Home</a></li>
                        <li class="breadcrumb-item active"><a
							href="<c:url value="/prontuario/vacinas"></c:url>">Vacinas</a></li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->
	    <div class="">
                    <div class="col-8">
                        <div class="card">          
                            <div class="card-body">
                                <h4 class="card-title">Cadastre novas vacinas</h4>
                                
                                <button type="button"
								class="btn btn-success btn-flat btn-addon m-b-10 m-l-5"
								onclick="location.href='<c:url value="/prontuario/cadastroVacina"> </c:url>'">
                                <i class="ti-save"></i> Cadastrar</button>
                                <div class="table-responsive m-t-40 col-8">
                                    <table id="vacinas"
									class="display nowrap table table-hover table-striped table-bordered"
									cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                                <th>Grupo</th>
                                                <th>Status</th>
                                                <th>Laborat�rio</th>
                                                <th>Custo</th>
                                            </tr>
                                        </thead>             
            <tbody>
                <c:forEach items="${vacinas}" var="vacina">
                    <tr>
                        <td>
                            ${vacina.nome}
							<a href="<c:url value="/prontuario/atualizarVacina/${vacina.vacinaId}"></c:url>">
                                <i class="fa fa-pencil-square-o fa-2x"></i>
                            </a>
                            <a href="<c:url value="/prontuario/removerVacina/${vacina.vacinaId}"></c:url>">
                                <i class="fa fa-trash-o fa-2x"></i>
                            </a>
                        </td>
                        <td>
                            ${vacina.grupo}
                        </td>
                            <c:if test="${vacina.status == true}">
								<td>Ativo</td>
							</c:if>
							<c:if test="${vacina.status == false}">
								<td>Inativo</td>
							</c:if>
                        <td>
                            ${vacina.laboratorio}
                        </td>
                        <td>
                            ${vacina.preco}
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
    </div>    
    </jsp:body>
</vetweb:layout>