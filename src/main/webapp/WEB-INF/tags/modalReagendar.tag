<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Modal -->
<div class="modal" id="modalReagendar">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="labelModalReagendar">
					<strong><spring:message code="reagendar" /></strong>
				</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<div class="modal-body">

				<input type='text' class="form-control" id='dataRemarcacao' /> <input
					type="submit" id='btnRemarcacao' class="btn button btn-success"
					value="REAGENDAR" />
			</div>

		</div>
	</div>

</div>