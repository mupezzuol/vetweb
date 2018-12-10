<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Modal -->
    <div class="modal" id="modalOcorrenciaProntuario">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="labelModalOcorrencia"><strong><spring:message code="ocorrencia" /></strong></h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          
          <div class="modal-body">
				<dl class="dl-horizontal">
					<dt><spring:message code="codigoEvento" /></dt>
					<dd id="id"></dd>
					<dt><spring:message code="tipoEvento" /></dt>
					<dd id="type"></dd>
					<dt><spring:message code="tituloEvento" /></dt>
					<dd id="title"></dd>
					<dt><spring:message code="dataOcorrencia" /></dt>
					<dd id="start"></dd>
					<dt><spring:message code="irParaProntuario" /></dt>
					<dd id="promptuary">
						<a id="irParaOProntuario" href="">
							<button id="btnProntuario">
								<i class="fa fa-stethoscope fa-3x" aria-hidden="true"></i>
							</button>
						</a>
					</dd>
				</dl>          
          </div>
          
        </div>
      </div>
    </div>