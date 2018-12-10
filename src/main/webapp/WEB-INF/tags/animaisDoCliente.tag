<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@attribute name="proprietario" required="true" type="java.lang.Object" %><!--    Informa que recebe um atributo obrigatório title    -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><!--  tags úteis do spring framework   -->
<!--Por padrão o tipo dos atributos é String, necessário alterar p/ Object p/ reconhecer atributos-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!--    Importação JSTL -->

<!-- INICIO template padrão para adicionar animais -->
<c:if test="${proprietario.animais.size() >= 0 && proprietario.ativo == true}">
    <c:forEach items="${proprietario.animais}" var="animal">
        <ul>
            <li>
            <button type="button" class="btn btn-outline-info btn-sm m-b-10 m-l-5" onclick="location.href='<c:url value="/animais/detalhesAnimal/${animal.nome}"></c:url>'">
				${animal.nome}
			</button>
            </li>
        </ul>
    </c:forEach>                           
<c:if test="${proprietario.animais.size() < 0}">Sem animal cadastrado</c:if>
<button type="button" class="btn btn-warning btn-sm m-b-10 m-l-5" onclick="location.href='<c:url value="/clientes/addAnimal/${proprietario.pessoaId}"></c:url>'"><i class="ti-plus"></i> Adicionar Animal</button>
</c:if>
<!-- FIM template padrão para adicionar animais -->


<!-- INICIO template padrão para clientes desabilitados -->
<c:if test="${proprietario.ativo == false}">
	<c:forEach items="${proprietario.animais}" var="animal">
		<ul>
			<li>
				<button type="button" class="btn btn-outline-info btn-sm m-b-10 m-l-5" onclick="location.href='<c:url value="/animais/detalhesAnimal/${animal.nome}"></c:url>'" disabled>
					${animal.nome}
				</button>
           	</li>
        </ul>
    </c:forEach>                           
<c:if test="${proprietario.animais.size() < 0}">Sem animal cadastrado</c:if>
<button type="button" class="btn btn-warning btn-sm m-b-10 m-l-5" onclick="location.href='<c:url value="/clientes/addAnimal/${proprietario.pessoaId}"></c:url>'" disabled><i class="ti-plus"></i> Adicionar Animal</button>
</c:if>                                    
<!-- INICIO template padrão para clientes desabilitados -->