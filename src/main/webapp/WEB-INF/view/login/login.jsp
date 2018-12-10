<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon icon -->
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/resources/images/img-vetweb/favicon.ico"></c:url>">
            <title>Login</title>
            <!-- Bootstrap Core CSS -->
            <link href="<c:url value="/resources/css/lib/bootstrap/bootstrap.css"></c:url>" rel="stylesheet" type="text/css"/>
            <!-- Custom CSS -->
            <link href="<c:url value="/resources/css/helper.css"></c:url>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/css/style.css"></c:url>" rel="stylesheet" type="text/css"/>
        </head>

        <body class="fix-header fix-sidebar">
            <!-- Preloader - style you can find in spinners.css -->
            <div class="preloader">
                <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
            </div>
            <!-- Main wrapper  -->
            <div id="main-wrapper">

                <div class="unix-login">
                    <div class="container-fluid">
                        <div class="row justify-content-center">
                            <div class="col-lg-4">
                                <div class="login-content card">
                                    <div class="login-form">
                                        <h1 align="center">Login</h1>
                                        <form:form servletRelativeAction="login" role="login"> 
                                            <div class="form-group">
                                                <label>Usuário</label>
                                                <input type="text" name="username" id="username" class="form-control" placeholder="usuário">
                                            </div>
                                            <div class="form-group">
                                                <label>Senha</label>
                                                <input type="password" name="password" id="password" class="form-control" placeholder="senha">
                                            </div>
                                            <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">Entrar</button>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- End Wrapper -->
            <!-- All Jquery -->
            <script src="<c:url value="/resources/js/lib/jquery/jquery.min.js"></c:url>" type="text/javascript"></script>    
            <!-- Bootstrap tether Core JavaScript -->
            <script src="<c:url value="/resources/js/lib/bootstrap/js/popper.min.js"></c:url>" type="text/javascript"></script>
        	<script src="<c:url value="/resources/js/lib/bootstrap/js/bootstrap.min.js"></c:url>" type="text/javascript"></script>
            <!-- slimscrollbar scrollbar JavaScript -->
            <script src="<c:url value="/resources/js/jquery.slimscroll.js"></c:url>" type="text/javascript"></script>
            <!--Menu sidebar -->
            <script src="<c:url value="/resources/js/sidebarmenu.js"></c:url>" type="text/javascript"></script>
            <!--stickey kit -->
            <script src="<c:url value="/resources/js/lib/sticky-kit-master/dist/sticky-kit.min.js"></c:url>" type="text/javascript"></script>
            <!--Custom JavaScript -->
            <script src="<c:url value="/resources/js/custom.min.js"></c:url>" type="text/javascript"></script>  
    </body>
</html>