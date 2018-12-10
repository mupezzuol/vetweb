<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!--    Importação JSTL -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><!--  tags úteis do spring framework   -->

<vetweb:layout title="Proprietários">
	<jsp:attribute name="jsHead">
        <script>
                                    $(document).ready(function() {
                                        $('#proprietarios').dataTable();
                                    });
                                </script>          
                                <script>
            $(document).ready(function(){
               $('#proprietarios').dataTable({
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
                    <h3 class="text-primary">Clientes</h3> 
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
							href="<c:url value="/"></c:url>">Home</a></li>
                        <li class="breadcrumb-item active"><a
							href="<c:url value="/clientes/listar"></c:url>">Clientes</a></li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->

            <!-- INICIO CORPO DA PÁGINA  -->
            
                <div class="">
                    <div class="col-8">
                        <div class="card">          
                            <div class="card-body">
                                <h4 class="card-title">Cadastre novos clientes</h4>
                                
                                <button type="button"
								class="btn btn-success btn-flat btn-addon m-b-10 m-l-5"
								onclick="location.href='<c:url value="/clientes/cadastro"> </c:url>'">
                                <i class="ti-save"></i> Cadastrar</button>
                                <div class="table-responsive m-t-40 col-8">
                                    <table id="proprietarios"
									class="display nowrap table table-hover table-striped table-bordered"
									cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Clientes</th>
                                                <th>Animais</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach
											items="${proprietarios}" var="proprietario">
                                            <tr>
                                                <c:choose>
                                                    <c:when
														test="${proprietario.ativo == true}">
                                                        <td>
															<button type="button" class="btn btn-outline-info btn-sm m-b-10 m-l-5" onclick="location.href='<c:url value="/clientes/detalhesCliente/${proprietario.pessoaId}"></c:url>'">
																${proprietario.nome}
															</button> 
															
															
															<button type="button" class="btn btn-outline-warning btn-sm m-b-10 m-l-5" onclick="location.href='<c:url value="/clientes/financeiro/${proprietario.pessoaId}"></c:url>'">
															<i class="ti-money"></i></button>   
                                                        </td>
                                                        <td>
                                                            <vetweb:animaisDoCliente
																proprietario="${proprietario}"></vetweb:animaisDoCliente>                
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>
                                                            <a href="<c:url value="/clientes/detalhesCliente/${proprietario.pessoaId}"></c:url>">Cliente ${proprietario.nome} está desativado por conter débitos.</a>
                                                            <a><i
																class="fa fa-warning"></i></a>
                                                        </td>
                                                        <td>
                                                            <vetweb:animaisDoCliente
																proprietario="${proprietario}"></vetweb:animaisDoCliente>                
                                                        </td>
                                                    </c:otherwise>
                                                </c:choose>
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