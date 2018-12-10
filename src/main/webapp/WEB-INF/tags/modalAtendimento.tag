<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@attribute name="prontuario" required="true" type="java.lang.Object" %>
<%@attribute name="tiposDeAtendimento" required="true" type="java.util.List" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

       <!-- Modal -->
       <div class="modal" id="modalAtendimento">
         <div class="modal-dialog" role="document">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title">Animal: ${prontuario.animal.nome}</h5>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
             </div>
             <div class="modal-body">
             <form:form servletRelativeAction="/prontuario/adicionarAtendimento?prontuarioId=${prontuario.prontuarioId}"
					method="POST" modelAttribute="atendimento" id="formAtendimento">
                   <tbody>
                   	<form:hidden path="ocorrenciaId" id="ocorrenciaId"	/>
                       <tr>
                           <th><spring:message code="tipoDeAtendimento"/>: </th>
                           <td>
                               <form:select id="tipoDeAtendimento" path="tipoDeAtendimento" items="${tiposDeAtendimento}" onchange="ajaxService.buscarModeloPorTipoDeAtendimento()">
                               </form:select>
                           </td>
                       </tr>
                       
                       <br	/>
                       
                       <tr>
                           <th><spring:message code="modeloAtendimento"/>: </th>
                           <td id="modelo"><form:textarea path="preenchimentoModeloAtendimento" name="preenchimentoModeloAtendimento" id="preenchimentoModeloAtendimento"></form:textarea></td>
                       </tr>
                       <tr>
                       	<th><spring:message code="dataAtendimento"/>:	</th>
                       	<td id="campoDataAtendimento"><input type="datetime-local" name="data" id="dataAtendimento"></input></td>
                       </tr>
                   </tbody>
                   
                   <div class="modal-footer">
                       <button type="submit" class="btn btn-success btn-flat btn-addon m-b-10 m-l-5" id="btnIncluirAtendimento"><i class="ti-save"></i> Cadastrar</button>
                       <button type="reset" class="btn btn-danger btn-flat btn-addon m-b-10 m-l-5"><i class="ti-close"></i> Limpar</button>
                   </div>
               </form:form>
             </div>
           </div>
         </div>
       </div>