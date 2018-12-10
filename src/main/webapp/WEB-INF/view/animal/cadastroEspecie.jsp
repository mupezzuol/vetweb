
<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<vetweb:layout title="Cadastro Especie">

	<div class="page-wrapper">
		<!-- INICIO MENU DE CONSULTA DE NAVEGA��O -->
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h3 class="text-primary">Esp�cies</h3>
			</div>
			<div class="col-md-7 align-self-center">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="<c:url value="/"></c:url>">Home</a></li>
					<li class="breadcrumb-item"><a
						href="<c:url value="/animais/especies"></c:url>">Esp�cies</a></li>
					<li class="breadcrumb-item active"><a
						href="<c:url value="/animais/cadastroEspecie"> </c:url>">Cadastro
							de Esp�cies</a></li>
				</ol>
			</div>
		</div>
		<!-- FIM MENU DE CONSULTA DE NAVEGA��O -->

		<div class="">
			<div class="col-6">
				<div class="card">
					<div class="card-title">
						<h1>Cadastro de Esp�cies</h1>
					</div>

					<form:form servletRelativeAction="/animais/addEspecie"
						method="POST" modelAttribute="especie">

						<form:hidden path="especieId" id="especieId"></form:hidden>

						<div class="form-group">
							<label for="descricao">Descri��o:</label>
							<form:input class="form-control input-default col-sm-4"
								path="descricao" id="descricao" maxlength="100"></form:input>
							<form:errors path="descricao" cssClass="errors"></form:errors>
						</div>
						<button type="submit"
							class="btn btn-success btn-flat btn-addon m-b-10 m-l-5">
							<i class="ti-save"></i> Cadastrar
						</button>
						<button type="reset"
							class="btn btn-inverse btn-flat btn-addon m-b-10 m-l-5">
							<i class="ti-close"></i> Limpar
						</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</vetweb:layout>

