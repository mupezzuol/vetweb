<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%><!--   Form c/ utilidades do spring    -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %><!--   Adc. token p/ proteção contra csrf -->
<vetweb:layout title="Cadastro de Cliente">
    <jsp:attribute name="jsHead">
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/app/ajaxService.js"></script>
<%--         <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/app/validacaoInputs.js"></script> --%>
    </jsp:attribute>
    
    <jsp:attribute name="mascaras">   
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/app/mascaras.js"></script>
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
                        <li class="breadcrumb-item"><a href="<c:url value="/"></c:url>">Home</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value="/clientes/listar"></c:url>">Clientes</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value="/clientes/cadastro"> </c:url>">Cadastro de Clientes</a></li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->

            <!-- INICIO CORPO DA PÁGINA  -->


            <div class="">
                <div class="col-6">
                    <div class="card">
                        <div class="card-title">
                            <h1>Cadastro de Clientes</h1>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <div class="card-title">
                                    <h3>Dados Pessoais</h3>
                                </div>
                                <form:form servletRelativeAction="/clientes/cadastrar" method="POST" modelAttribute="proprietario">
                                    <div class="form-group">
                                        <form:hidden path="pessoaId" id="pessoaId"></form:hidden>
                                        <label for="nome">Nome:</label>
                                        <form:input class="form-control input-default col-sm-8" path="nome" id="nome" maxlength="100"></form:input>
                                        <form:errors path="nome" cssClass="errors"></form:errors>
                                        </div>


                                        <div class="form-group">
                                            <label for="rg">RG:</label>
                                        <form:input class="form-control input-default col-sm-4" path="rg" id="rg"></form:input>
                                        <form:errors path="rg" cssClass="errors"></form:errors>
                                        </div>

                                        <div class="form-group">
                                        	<label for="cpf">CPF:</label>
                                        <form:input class="form-control input-default col-sm-4" path="cpf" id="cpf"></form:input>
                                        <form:errors path="cpf" cssClass="errors"></form:errors>
                                        </div>    

                                        <div class="form-group">
                                            <label for="sexo">Sexo:</label>
                                        <form:radiobutton class="" path="sexo" id="sexo" value="M"/>Masculino
                                        <form:radiobutton class="" path="sexo" id="sexo" value="F"/>Feminino
                                        <form:errors path="sexo" cssClass="errors"></form:errors>
                                    </div>  


                                    <div class="form-group">
                                        <label for="tipoPessoa">Tipo de Pessoa: </label>
                                        <form:radiobutton class="" path="tipoPessoa" id="tipoPessoa" value="FISICA"/> Física
                                        <form:radiobutton class="" path="tipoPessoa" id="tipoPessoa" value="JURIDICA"/> Juridica
                                        <form:errors path="tipoPessoa" cssClass="errors"></form:errors>
                                    </div>    

                                    <div class="form-group">
                                        <label for="nascimento">Data de Nascimento:</label>
                                        <form:input class="form-control input-default col-sm-4" path="nascimento" id="nascimento" type="date" ></form:input>
                                        <form:errors path="nascimento" cssClass="errors"></form:errors>
                                        </div>

                                        <div class="form-group">
                                            <label for="inclusao">Data de Cadastro:</label>
                                        <form:input class="form-control input-default col-sm-4" path="inclusao" id="inclusao" type="date"></form:input>
                                        <form:errors path="inclusao" cssClass="errors"></form:errors>
                                        </div>   

                                        <div class="form-group">
                                            <label for="nacionalidade">Nacionalidade</label>
                                        <form:select class="form-control input-default col-sm-7" path="nacionalidade" items="${paises}"></form:select>
                                        <form:errors path="nacionalidade" cssClass="errors"></form:errors>
                                        </div>   


                                        <div class="card-title">
                                            <h3>Dados do Endereço</h3>
                                        </div>    

                                        <div class="form-group">
                                            <label for="endereco.cep">Cep:</label>
                                        <form:input class="form-control input-default col-sm-3" path="endereco.cep" id="cep" onblur="ajaxService.carregarEnderecoPeloCEP()"></form:input>
                                        <form:errors path="endereco.cep" cssClass="errors"></form:errors>
                                        </div>

                                        <div class="form-group">
                                            <label for="endereco.rua">Rua:</label>
                                        <form:input class="form-control input-default col-sm-8" path="endereco.rua" id="rua"></form:input>
                                        <form:errors path="endereco.rua" cssClass="errors"></form:errors>
                                        </div>

                                        <div class="form-group">
                                            <label for="endereco.bairro">Bairro:</label>
                                        <form:input class="form-control input-default col-sm-8" path="endereco.bairro" id="bairro"></form:input>
                                        <form:errors path="endereco.bairro" cssClass="errors"></form:errors>
                                        </div>


                                        <div class="form-group">
                                            <label for="endereco.cidade">Cidade:</label>
                                        <form:input class="form-control input-default col-sm-8" path="endereco.cidade" id="cidade"></form:input>
                                        <form:errors path="endereco.cidade" cssClass="errors"></form:errors>
                                        </div>


                                        <div class="form-group">
                                            <label for="endereco.estado">Estado:</label>
                                        <form:input class="form-control input-default col-sm-8" path="endereco.estado" id="estado"></form:input>
                                        <form:errors path="endereco.estado" cssClass="errors"></form:errors>
                                        </div>


                                        <div class="form-group">
                                            <label for="endereco.numero">Número:</label>
                                        <form:input class="form-control input-default col-sm-2" path="endereco.numero" id="numero"></form:input>
                                        <form:errors path="endereco.numero" cssClass="errors"></form:errors>
                                        </div>

                                        <div class="form-group">
                                            <label for="endereco.complemento">Complemento:</label>
                                        <form:input class="form-control input-default col-sm-8" path="endereco.complemento" id="complemento"></form:input>
                                        <form:errors path="endereco.complemento" cssClass="errors"></form:errors>
                                        </div>


                                        <div class="card-title">
                                            <h3>Dados de Contato</h3>
                                        </div>          

                                        <div class="form-group">
                                            <label for="contato.telefone">Telefone:</label>
                                        <form:input class="form-control input-default col-sm-3"  path="contato.telefone" id="telefone"></form:input>
                                        <form:errors path="contato.telefone" cssClass="errors"></form:errors>
                                        </div>  

                                        <div class="form-group">
                                            <label for="contato.celular">Celular:</label>
                                        <form:input class="form-control input-default col-sm-3" path="contato.celular" id="celular"></form:input>
                                        <form:errors path="contato.celular" cssClass="errors"></form:errors>
                                        </div>  

                                        <div class="form-group">
                                            <label for="contato.email">E-mail:</label>
                                        <form:input class="form-control input-default col-sm-8" path="contato.email" id="email"></form:input>
                                        <form:errors path="contato.email" cssClass="errors"></form:errors>
                                        </div>  


                                        <div class="card-title">
                                            <h3>Dados Adicionais</h3>
                                        </div> 


                                        <div class="form-group">
                                            <label for="profissao">Profissão</label>
                                        <form:select class="form-control input-default col-sm-9" path="profissao" items="${profissoes}"></form:select>
                                        <form:errors path="profissao" cssClass="errors"></form:errors>
                                        </div>

                                        <div class="form-group">
                                            <label for="comoNosConheceu">Como nos conheçeu</label>
                                        <form:input class="form-control input-default col-sm-9" path="comoNosConheceu" id="comoNosConheceu"></form:input>
                                        <form:errors path="comoNosConheceu" cssClass="errors"></form:errors>
                                        </div>

                                        <div class="form-group">
                                            <label for="aceitaNotificacoes">Aceita notificações?</label>
                                        <form:radiobutton class="" path="aceitaNotificacoes" id="aceitaNotificacoes" value="true"    />Sim
                                        <form:radiobutton class="" path="aceitaNotificacoes" id="aceitaNotificacoes" value="false"   />Não                            
                                    </div>

                                    <div class="form-group">
                                        <label for="observacoes">Observações</label>
                                        <form:textarea class="form-control input-default col-12 col-md-9" path="observacoes" id="observacoes"></form:textarea>
                                        <form:errors path="observacoes" cssClass="errors"></form:errors>
                                    </div>                                        
                                        <button type="submit" class="btn btn-success btn-flat btn-addon m-b-10 m-l-5"><i class="ti-save"></i> Cadastrar</button>
                                        <button type="reset" class="btn btn-danger btn-flat btn-addon m-b-10 m-l-5"><i class="ti-close"></i> Limpar</button>
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