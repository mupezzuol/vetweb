<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>

<vetweb:exception tipoException="401" title="Unauthorized">
    <jsp:body>
        ${mensagemErro}
    </jsp:body>
</vetweb:exception>

