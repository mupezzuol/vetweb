<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>

<vetweb:exception tipoException="404" title="NOT_FOUND">
    <jsp:body>
        ${mensagemErro}
    </jsp:body>
</vetweb:exception>
