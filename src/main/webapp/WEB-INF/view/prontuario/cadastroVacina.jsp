<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<vetweb:layout title="Cadastro Vacina">

    <jsp:attribute name="jsHead">
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
                        <li class="breadcrumb-item"><a
							href="<c:url value="vacinas"></c:url>">Vacinas</a></li>
                        <li class="breadcrumb-item active"><a
							href="<c:url value="cadastroVacina"> </c:url>">Cadastro de Vacinas</a></li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->
            
			<div class="">
                <div class="col-6">
                    <div class="card">
                        <div class="card-title">
                            <h1>Cadastro de Vacinas</h1>
                        </div>
        <form:form servletRelativeAction="/prontuario/addVacina"
							method="POST" modelAttribute="vacina">
														
                    <form:hidden path="vacinaId" id="vacinaId"></form:hidden>
                    <div class="form-group">
                		<label for="nome">Nome:</label>
                    	<form:input
							class="form-control input-default col-sm-4" path="nome"
							id="nome" maxlength="100"></form:input>
						<form:errors path="nome" cssClass="errors"></form:errors>
            		</div>
            		<div class="form-group">
                		<label for="grupo">Grupo:</label>
                    	<form:input
							class="form-control input-default col-sm-4" path="grupo"
							id="grupo" maxlength="100"></form:input>
						<form:errors path="grupo" cssClass="errors"></form:errors>
            		</div>            		
            		<div class="form-group">
                        <label for="status">Ativo:</label>
                    	<form:radiobutton path="status" id="status" value="true"/>Sim
                   		<form:radiobutton path="status" id="status" value="false"/>N�o
                	</div>
                    <div class="form-group">
                		<label for="laboratorio">Laborat�rio:</label>
                    	<form:input
							class="form-control input-default col-sm-4" path="laboratorio"
							id="laboratorio" maxlength="100"></form:input>
						<form:errors path="laboratorio" cssClass="errors"></form:errors>
            		</div>
            		<tr>
                        <th><label for="custo"><spring:message code="custo"/>:</label></th>
                        <td><form:input class="form-control input-default col-sm-3" path="preco" 
                        	id="custo"></form:input></td>
                    </tr>
                    </br>
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
