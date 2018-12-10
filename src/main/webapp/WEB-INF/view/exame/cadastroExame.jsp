<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="security"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<vetweb:layout title="Cadastro Exame">
   <jsp:attribute name="jsHead">
      <script
         src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=2i80p03koooieys6i5h5yz1n9d4uaxrwt1iaoy9938bmcahs"></script>
      <script>
         tinymce.init({
         	selector : 'textarea'
         });
      </script>
   </jsp:attribute>
   <jsp:body>
      <div class="page-wrapper">
         <!-- INICIO MENU DE CONSULTA DE NAVEGAÃ‡ÃƒO -->
         <div class="row page-titles">
            <div class="col-md-5 align-self-center">
               <h3 class="text-primary">Exames</h3>
            </div>
            <div class="col-md-7 align-self-center">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a
                     href="<c:url value="/"></c:url>">Home</a></li>
                  <li class="breadcrumb-item"><a
                     href="<c:url value="/exames"></c:url>">Exames</a></li>
                  <li class="breadcrumb-item active">
                     <a
                     href="
                     <c:url value="/exames/form"> </c:url>
                     ">Cadastro de Exames</a>
                  </li>
               </ol>
            </div>
         </div>
         <!-- FIM MENU DE CONSULTA DE NAVEGAÃ‡ÃƒO -->
         <div class="">
            <div class="col-8">
               <div class="card">
                  <div class="card-title">
                     <h1>Cadastro de Exames</h1>
                  </div>
                  <form:form servletRelativeAction="/exames/submitForm" method="POST" modelAttribute="exame">
                     
                           <form:hidden path="exameId" id="exameId"></form:hidden>
                           <div class="form-group">
                              <label for="descricao">Descrição:</label>
                              <form:input
                                 class="form-control input-default col-sm-4" path="descricao"
                                 id="descricao" maxlength="100"></form:input>
                              <form:errors path="descricao" cssClass="errors"></form:errors>
                           </div>
                           
                           
                           
                           <div class="form-group">
		                    <tr>
		                        <th><label for="apresentacao"><spring:message code="apresentacao"/>:</label></th>
		                        <td><form:textarea class="form-control input-default col-sm-4" cols="3" rows="15" path="apresentacao" id="apresentacao"></form:textarea></td>
		                    </tr>                    
		                    </div>
		                    
		                    <div class="form-group">
		                    <tr>
		                        <th><label for="encerramento"><spring:message code="encerramento"/>:</label></th>
		                        <td><form:textarea class="form-control input-default col-sm-4" cols="3" rows="15" path="encerramento" id="encerramento"></form:textarea></td>
		                    </tr>                    
		                    </div>
		                    
							<div class="form-group">
								<label for="ativo">Ativo:</label>
								<form:radiobutton path="ativo" id="ativo" value="true" />
								Sim
								<form:radiobutton path="ativo" id="ativo" value="false" />
								Não
							</div>
                           
                           
                           <div class="form-group">
                              <tr>
                                 <th><label for="preco"><spring:message code="custo"/></label></th>
                                 <td><form:input class="form-control input-default col-sm-3" path="preco" id="preco"></form:input></td>
                              </tr>
                           </div>
                           <div class="form-group">
                              <tr>
                                 <th><label for="duracao"><spring:message code="duracao"/></label></th>
                                 <td>
                                 	<select name="duracao" class="form-control input-default col-sm-3">
			                        	<c:forEach items="${duracoes}" var="duracao">
			                        		<option>${duracao}</option>
			                        	</c:forEach>
			                       	</select>
                                 </td>
                              </tr>
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