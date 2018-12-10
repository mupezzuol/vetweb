<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<vetweb:layout title="Cadastro Pelagem">

<div class="page-wrapper">
            <!-- INICIO MENU DE CONSULTA DE NAVEGAÇÃO -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Pelagens</h3> 
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value="/"></c:url>">Home</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value="/animais/pelagens"></c:url>">Pelagens</a></li>
                        <li class="breadcrumb-item active"><a href="<c:url value="/animais/cadastroPelagem"> </c:url>">Cadastro de Pelagens</a></li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->

			<div class="">
                <div class="col-6">
                    <div class="card">
                        <div class="card-title">
                            <h1>Cadastro de Pelagens</h1>
                        </div>

    <form:form servletRelativeAction="/animais/addPelagem" method="POST" modelAttribute="pelagem">
            <form:hidden path="pelagemId" id="pelagemId"></form:hidden>
                       
			<div class="form-group">
                <label for="descricao">Descrição:</label>
                    <form:input class="form-control input-default col-sm-4" path="descricao" id="descricao" maxlength="100"></form:input>
					<form:errors path="descricao" cssClass="errors"></form:errors>
            </div>
			<div class="form-group">
                <label for="cor">Cor:</label>
                    <form:input type="color" class="form-control input-default col-sm-4" path="cor" id="cor" maxlength="100"></form:input>
					<form:errors path="cor" cssClass="errors"></form:errors>
            </div>
            
        <button type="submit" class="btn btn-success btn-flat btn-addon m-b-10 m-l-5"><i class="ti-save"></i> Cadastrar</button>
        <button type="reset" class="btn btn-inverse btn-flat btn-addon m-b-10 m-l-5"><i class="ti-close"></i> Limpar</button>                
    </form:form>
    </div>
    </div>
    </div>
    </div>
</vetweb:layout>
