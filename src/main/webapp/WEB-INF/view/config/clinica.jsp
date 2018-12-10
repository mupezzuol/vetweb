<%@ taglib prefix="vetweb" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<vetweb:layout title="Clínica">
    <jsp:body>
        <div class="page-wrapper">
            <!-- INICIO MENU DE CONSULTA DE NAVEGAÇÃO -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Clínica</h3> 
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
                            href="<c:url value="/"></c:url>">Home</a></li>
                        <li class="breadcrumb-item active">Detalhes Clínica</li>
                    </ol>
                </div>
            </div>
            <!-- FIM MENU DE CONSULTA DE NAVEGAÇÃO -->

            <!-- INICIO CORPO DA PÁGINA  -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body p-b-0">
                        
                        <h4 class="card-title">Dados da Clínica</h4>
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs customtab"
                            role="tablist">
                            <li class="nav-item"> <a
                                class="nav-link active" data-toggle="tab" href="#dadosclinica"
                                role="tab"><span class="hidden-sm-up"><i
                                        class="ti-home"></i></span> <span class="hidden-xs-down">Detalhes da Clínica</span></a> </li>
                        </ul>
                        <!-- Tab panes -->

                        <div class="tab-content">
                            <div class="tab-pane active "
                                id="dadosclinica" role="tabpanel">
                                <div class="p-20 ">
                                    <table
                                        class="table table-responsive" id="detalhesProprietario">
                                        <tbody>

                                            <tr> 
                                                <th>Razão Social</th> 
                                                <td>${clinica.razaoSocial}</td>
                                            </tr>
                                            <tr> 
                                                <th>Fundada em</th> 
                                                <td>${clinica.fundadaEm}</td>
                                            </tr>
                                            <tr> 
                                                <th>CNPJ</th> 
                                                <td>${clinica.cnpj}</td>
                                            </tr>
                                            <tr> 
                                                <th>Proprietário</th> 
                                                <td>${clinica.proprietario}</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
                <!-- FIM CORPO DA PÁGINA  -->
            </div>
    </jsp:body>
</vetweb:layout>