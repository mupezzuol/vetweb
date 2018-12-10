<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<vetweb:layout title="Espécies">
    <jsp:attribute name="jsHead">
        <script>
            $(document).ready(function(){
               $('#especies').dataTable({
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
                    <h3 class="text-primary">Espécies</h3> 
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
							href="<c:url value="/"></c:url>">Home</a></li>
                        <li class="breadcrumb-item active"><a
							href="<c:url value="/animais/especies"></c:url>">Espécies</a></li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->
    	
         <div class="">
                    <div class="col-6">
                        <div class="card">          
                            <div class="card-body">
                                <h4 class="card-title">Cadastre novas Espécies</h4>
                                
                                <button type="button"
								class="btn btn-success btn-flat btn-addon m-b-10 m-l-5"
								onclick="location.href='<c:url value="/animais/cadastroEspecie"> </c:url>'">
                                <i class="ti-save"></i> Cadastrar</button>
                                <div class="table-responsive m-t-40 col-6">
        
        <table id="especies"class="display nowrap table table-hover table-striped table-bordered"cellspacing="0" width="100%">
        	<caption><span class="badge badge-danger">${existeRaca}</span></caption>
            <thead>
                <tr>
                    <th>Espécie</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${especies}" var="especie">
                    <tr>
                        <td>
                            ${especie.descricao}
                            <a href="<c:url value="/animais/atualizarEspecie/${especie.especieId}"></c:url>">
                                <i class="fa fa-pencil-square-o fa-2x"></i>
                            </a>     
                            <a href="<c:url value="/animais/removerEspecie/${especie.especieId}"></c:url>">
                                <i class="fa fa-trash-o fa-2x"></i>
                            </a> 
                                                
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