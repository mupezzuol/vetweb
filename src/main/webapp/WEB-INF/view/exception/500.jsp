<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>

<vetweb:exception tipoException="500" title="INTERNAL SERVER ERROR">
    <jsp:body>
        ${mensagemErro}
    </jsp:body>
</vetweb:exception>
