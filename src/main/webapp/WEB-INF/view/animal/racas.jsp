<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<vetweb:layout title="Ra�as">
    <jsp:attribute name="jsHead">
        <script>
            $(document).ready(function(){
               $('#racas').dataTable({
	           	    language: {
	        			"sEmptyTable": "Nenhum registro encontrado",
	        			"sInfo": "Mostrando de _START_ at� _END_ de _TOTAL_ registros",
	        			"sInfoEmpty": "Mostrando 0 at� 0 de 0 registros",
	        			"sInfoFiltered": "(Filtrados de _MAX_ registros)",
	        			"sInfoPostFix": "",
	        			"sInfoThousands": ".",
	        			"sLengthMenu": "_MENU_ resultados por p�gina",
	        			"sLoadingRecords": "Carregando...",
	        			"sProcessing": "Processando...",
	        			"sZeroRecords": "Nenhum registro encontrado",
	        			"sSearch": "Pesquisar",
	        			"oPaginate": {
	        				"sNext": "Pr�ximo",
	        				"sPrevious": "Anterior",
	        				"sFirst": "Primeiro",
	        				"sLast": "�ltimo"
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
            <!-- INICIO MENU DE CONSULTA DE NAVEGA��O -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Ra�as</h3> 
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
							href="<c:url value="/"></c:url>">Home</a></li>
                        <li class="breadcrumb-item active"><a
							href="<c:url value="/animais/racas"></c:url>">Ra�as</a></li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGA��O -->
    	
         <div class="">
                    <div class="col-8">
                        <div class="card">          
                            <div class="card-body">
                                <h4 class="card-title">Cadastre novas ra�as</h4>
                                
                                <button type="button"
								class="btn btn-success btn-flat btn-addon m-b-10 m-l-5"
								onclick="location.href='<c:url value="/animais/cadastroRaca"> </c:url>'">
                                <i class="ti-save"></i> Cadastrar</button>
                                <div class="table-responsive m-t-40 col-8">
         
        <table id="pelagens"class="display nowrap table table-hover table-striped table-bordered"cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Ra�a</th>
                    <th>Esp�cie</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${racas}" var="raca">
                    <tr>
                        <td>
                            ${raca.descricao}
                            <a href="<c:url value="/animais/atualizarRaca/${raca.racaId}"></c:url>">
                                <i class="fa fa-pencil-square-o fa-2x"></i>
                            </a>     
                            <a href="<c:url value="/animais/removerRaca/${raca.racaId}"></c:url>">
                                <i class="fa fa-trash-o fa-2x"></i>
                            </a>                            
                        </td>
                        <td>
                            ${raca.especie.descricao}
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
            <!-- FIM CORPO DA P�GINA  -->
        </div> 
    </jsp:body>
</vetweb:layout>