<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!--    Importação JSTL -->

<vetweb:layout title="Cliente ${proprietario.nome}">
    <jsp:body>
        <div class="page-wrapper">
            <!-- INICIO MENU DE CONSULTA DE NAVEGAÇÃO -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Clientes</h3> 
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Clientes</li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->

            <!-- INICIO CORPO DA PÁGINA  -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body p-b-0">
                        
                        
                        <h4 class="card-title">Cadastro de Cliente</h4>
                        
                        <div class="p-10">
                        <button type="button" onclick="location.href='<c:url value="/clientes/financeiro/${proprietario.pessoaId}"></c:url>'" class="btn btn-success col-1">
                                        	<i class="fa fa-money fa-3x" aria-hidden="true"></i>
                                        </button>
                                        
                                        <button type="button" onclick="location.href='<c:url value="/clientes/atualizar/${proprietario.pessoaId}"></c:url>'" class="btn btn-warning col-1">
                                        	<i class="fa fa-pencil fa-3x" aria-hidden="true"></i>
                                        </button>
                                        
										</div>
                        
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs customtab" role="tablist">
                            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#pessoais" role="tab"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Dados Pessoais</span></a> </li>

                            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#endereco" role="tab"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">Endereço</span></a> </li>

                            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#contato" role="tab"><span class="hidden-sm-up"><i class="ti-email"></i></span> <span class="hidden-xs-down">Contato</span></a> </li>

                            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#adicionais" role="tab"><span class="hidden-sm-up"><i class="ti-email"></i></span> <span class="hidden-xs-down">Adicionais</span></a> </li>
                        </ul>
                        <!-- Tab panes -->

                        <div class="tab-content">
                            <div class="tab-pane active " id="pessoais" role="tabpanel">
                                <div class="p-20 ">
                                    <table class="table table-responsive" id="detalhesProprietario">
                                        <tbody>
                                            <tr>
                                                <th>Nome</th>
                                                <td>${proprietario.nome}</td>
                                            </tr>
                                            <tr>
                                                <th>RG</th>
                                                <td>${proprietario.rg}</td>
                                            </tr>
                                            <tr>
                                                <th>CPF</th>
                                                <td>${proprietario.cpf}</td>
                                            </tr>
                                            <tr>
                                                <th>Nacionalidade</th>
                                                <td>${proprietario.nacionalidade}</td>
                                            </tr>
                                            <tr>
                                                <th>Sexo</th>
                                                <c:if test="${proprietario.sexo == 'M'}">
													<td>Masculino</td>
												</c:if>
												<c:if test="${proprietario.sexo == 'F'}">
													<td>Feminino</td>
												</c:if>
                                            </tr>
                                            <tr>
                                                <th>Tipo de pessoa</th>
                                                <td>${proprietario.tipoPessoa}</td>
                                            </tr>
                                            <tr>
                                                <th>Data do cadastro</th>
                                                <td>${proprietario.inclusao}</td>
                                            </tr>
                                            <tr>
                                                <th>Data de nascimento</th>
                                                <td>${proprietario.nascimento}</td>
                                            </tr>
                                            <tr>
                                                <th>Idade</th>
                                                <td>${idadeCliente}</td>
                                            </tr>
                                            <tr>
                                                <th>Animais do Cliente</th>
                                                <td><vetweb:animaisDoCliente proprietario="${proprietario}"> </vetweb:animaisDoCliente></td>
                                            </tr>                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>



                            <div class="tab-pane  p-20" id="endereco" role="tabpanel">
                                <table id="enderecoProprietario" class="table table-responsive">
                                    <tbody>
                                        <tr>
                                            <th>CEP</th>
                                            <td>${proprietario.endereco.cep}</td>
                                        </tr>
                                        <tr>
                                            <th>Logradouro</th>
                                            <td>${proprietario.endereco.rua}</td>
                                        </tr>
                                        <tr>
                                            <th>Bairro</th>
                                            <td>${proprietario.endereco.bairro}</td>
                                        </tr>
                                        <tr>
                                            <th>Cidade</th>
                                            <td>${proprietario.endereco.cidade}</td>
                                        </tr>
                                        <tr>
                                            <th>Estado</th>
                                            <td>${proprietario.endereco.estado}</td>
                                        </tr>
                                        <tr>
                                            <th>Número</th>
                                            <td>${proprietario.endereco.numero}</td>
                                        </tr>
                                        <tr>
                                            <th>Complemento</th>
                                            <td>${proprietario.endereco.complemento}</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>


                            <div class="tab-pane p-20" id="contato" role="tabpanel">
                                <table class="table table-responsive" id="contatoProprietario">
                                    <tbody>
                                        <tr>
                                            <th>Tel. Fixo</th>
                                            <td>${proprietario.contato.telefone}</td>
                                        </tr>
                                        <tr>
                                            <th>Tel. Celular</th>
                                            <td>${proprietario.contato.celular}</td>
                                        </tr>
                                        <tr>
                                            <th>E-mail</th>
                                            <td>${proprietario.contato.email}</td>
                                        </tr>
                                    </tbody>
                                </table>


                            </div>
                            <div class="tab-pane p-20" id="adicionais" role="tabpanel">

                                <table class="table table-responsive" id="adicionalProprietario">
                                    <tbody>
                                        <tr>
                                            <th>Profissão</th>
                                            <td>${proprietario.profissao}</td>
                                        </tr>
                                        <tr>
                                            <th>Como nos conheceu</th>
                                            <td>${proprietario.comoNosConheceu}</td>
                                        </tr>
                                        <tr>
                                            <th>Aceita notificações?</th>
                                            <td>${proprietario.aceitaNotificacoes}</td>
                                        </tr>
                                        <tr>
                                            <th>Observações</th>
                                            <td>${proprietario.observacoes}</td>
                                        </tr>
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