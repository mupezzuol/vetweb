<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<vetweb:layout title="Cadastro Tipo Atendimento">

    <jsp:attribute name="jsHead">
        <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=2i80p03koooieys6i5h5yz1n9d4uaxrwt1iaoy9938bmcahs"></script>          
        <script>tinymce.init({ selector:'textarea' });</script>        
    </jsp:attribute>
    
    <jsp:body>
    
    <div class="page-wrapper">
            <!-- INICIO MENU DE CONSULTA DE NAVEGAÃ‡ÃƒO -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Tipos de Atendimento</h3> 
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
							href="<c:url value="/"></c:url>">Home</a></li>
                        <li class="breadcrumb-item"><a
							href="<c:url value="/prontuario/tiposDeAtendimento"></c:url>">Tipos de Atendimento</a></li>
                        <li class="breadcrumb-item active"><a
							href="<c:url value="/prontuario/cadastroTipoAtendimento"> </c:url>">Cadastro de Tipos de Atendimento</a></li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGAÃ‡ÃƒO -->
            
            <div class="">
                <div class="col-8">
                    <div class="card">
                        <div class="card-title">
                            <h1>Cadastro de Tipos de Atendimento</h1>
                        </div>
        <form:form servletRelativeAction="/prontuario/addTipoAtendimento" method="POST" modelAttribute="tipoDeAtendimento">
                   
                    <form:hidden path="tipoDeAtendimentoId" id="tipoDeAtendimentoId"></form:hidden>
                    
                    <div class="form-group">
                		<label for="nome">Nome:</label>
                    	<form:input class="form-control input-default col-sm-4" path="nome" id="nome" maxlength="100"></form:input>
						<form:errors path="nome" cssClass="errors"></form:errors>
            		</div>                    
                    <div class="form-group">
                		<label for="duracao">Duração:</label>
                    	<form:select class="form-control input-default col-sm-4" path="duracao" items="${duracoesValidas}"></form:select>
						<form:errors path="duracao" cssClass="errors"></form:errors>
            		</div>                    
                    <div class="form-group">
                		<label for="frequencia">Frequência:</label>
                    	<form:select class="form-control input-default col-sm-4" path="frequencia" items="${frequenciasValidas}"></form:select>
						<form:errors path="frequencia" cssClass="errors"></form:errors>
            		</div>                    
                    
                    <div class="form-group">
                    	<label for="esteril">Ativo:</label>
                    	<form:radiobutton path="status" id="status" value="true"></form:radiobutton>Sim
                    	<form:radiobutton path="status" id="status" value="false"></form:radiobutton>Não
                    </div> 
                    <div class="form-group">
                    <tr>
                        <th><label for="modeloAtendimento"><spring:message code="modeloAtendimento"/>:</label></th>
                        <td><form:textarea class="form-control input-default col-sm-4" cols="3" rows="15" path="modeloAtendimento" id="modeloAtendimento"></form:textarea></td>
                    </tr>                    
                    </div> 
                    <div class="form-group">
                		<label for="custo">Custo:</label>
                    	<form:input class="form-control input-default col-sm-3" path="custo" id="custo"></form:input>
						<form:errors path="custo" cssClass="errors"></form:errors>
            		</div>
            
            
            <button type="submit"
								class="btn btn-success btn-flat btn-addon m-b-10 m-l-5">
								<i class="ti-save"></i> Cadastrar</button>
        	<button type="reset"
								class="btn btn-inverse btn-flat btn-addon m-b-10 m-l-5">
								<i class="ti-close"></i> Limpar</button>               
        </form:form>
        </div>
        </div>
        </div>
        </div>
    </jsp:body>
</vetweb:layout>
