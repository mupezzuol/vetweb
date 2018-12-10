<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%><!--   Form c/ utilidades do spring    -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %><!--   Adc. token p/ proteção contra csrf -->
<vetweb:layout title="Cadastro de Animal">
    <jsp:attribute name="jsFooter">
        <script>
            $(document).ready(ajaxService.buscarRacasPorEspecie());
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
                        <li class="breadcrumb-item"><a href="<c:url value="/"></c:url>">Home</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value="/animais/listar"></c:url>">Animais</a></li>
                        <li class="breadcrumb-item active"><a href="<c:url value="#"> </c:url>">Cadastro de Animais</a></li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->

            <!-- INICIO CORPO DA PÁGINA  -->

            <!-- INICIO VALIDAÇÕES -->
            <c:if test="${animal.animalId == null}">
            <c:url var="action" value="/animais/cadastrar"></c:url>
            </c:if>
            <c:if test="${animal.animalId != null}">
                <c:url var="action" value="/animais/atualizar/${animal.animalId}"></c:url>
            </c:if>
            <!-- FIM VALIDAÇÕES -->

            <div class="">
                <div class="col-8">
                    <div class="card">
                        <div class="card-title">
                            <h1>Cadastro de Animais</h1>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <div class="card-title">
                                    <h3>Dados Pessoais</h3>
                                </div>
                                <form:form servletRelativeAction="/animais/cadastrar" method="POST" modelAttribute="animal" enctype="multipart/form-data">
                                
                                <form:hidden path="animalId" name="animalId"/>
                                    

                                    <div class="form-group">
                                            <label for="imagem">Imagem do Animal</label>
                                            <input type="file" name="imagemFile" required/>
                                    </div>
                                    
                                    <div class="form-group">
                                            <label for="nome">Nome do animal:</label>
                                            <form:input class="form-control input-default col-sm-3" path="nome" id="nome" htmlEscape="true"></form:input>
                                            <form:errors path="nome" cssClass="errors"></form:errors>
                                        </div>


                                        <div class="form-group">
                                            <label for="dtNascimento">Data de nascimento:</label>
                                            <form:input class="form-control input-default col-sm-3" type="date" name="dtNascimento" path="dtNascimento"/>
                                        </div>  

                                        <div class="form-group">
                                            <label for="esteril">Esteril:</label>
                                            <form:radiobutton path="esteril" id="esteril" value="true"></form:radiobutton>Sim
                                            <form:radiobutton path="esteril" id="esteril" value="false"></form:radiobutton>Não
                                        </div>  

                                        <div class="form-group">
                                            <label for="status">Status:</label>
                                            <form:radiobutton path="status" id="status" value="true"></form:radiobutton>Vivo
                                            <form:radiobutton path="status" id="status" value="false"></form:radiobutton>Morto
                                        </div>    

                                        <div class="form-group">
                                            <label for="peso">Peso:</label>
                                            <form:input class="form-control input-default col-sm-3" path="peso" id="peso"></form:input>
                                            <form:errors path="peso" cssClass="errors"></form:errors>
                                        </div>

                                        <div class="form-group">
                                            <label for="pelagem">Pelagem:</label>
                                            <form:select class="form-control input-default col-sm-3" path="pelagem" items="${pelagens}" id="pelagens"></form:select>
                                        </div>   

                                        <div class="form-group">
                                            <label for="especies">Especies:</label>
                                            <select class="form-control input-default col-sm-3" id="especies" onchange="ajaxService.buscarRacasPorEspecie()">
                                                <c:forEach items="${especies}" var="especie">
                                                    <option>${especie}</option>
                                                </c:forEach>
                                            </select>
                                        </div>   
  

                                        <div class="form-group">
                                            <label for="raca">Raças:</label>
                                            <form:select class="form-control input-default col-sm-3" path="raca" items="${racas}" id="racas"></form:select>
                                        </div>

                                        <div class="form-group">
                                            <label for="proprietario">Proprietário:</label>
                                            <form:select class="form-control input-default col-sm-3" path="proprietario" items="${proprietarios}" disabled="${desabilitaTrocaProprietario}">                           
                                            </form:select>
                                        </div>
                                        <form:hidden path="proprietario.pessoaId" id="proprietario"></form:hidden>                                       
                                        <button type="submit" class="btn btn-success btn-flat btn-addon m-b-10 m-l-5"><i class="ti-save"></i> Cadastrar</button>
                                        <button type="reset" class="btn btn-inverse btn-flat btn-addon m-b-10 m-l-5"><i class="ti-save"></i> Limpar</button>
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