<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BookingSystem.login" %>

<!DOCTYPE html>
<html dir="ltr" lang="en" class="no-outlines">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- ==== Document Title ==== -->
    <title>login - booking system</title>
    
    <!-- ==== Document Meta ==== -->
    <meta name="author" content="">
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- ==== Favicon ==== -->
    <link rel="icon" href="favicon.png" type="image/png">

    <!-- ==== Google Font ==== -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700%7CMontserrat:400,500">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/jquery-ui.min.css">
    <link rel="stylesheet" href="assets/css/perfect-scrollbar.min.css">
    <link rel="stylesheet" href="assets/css/morris.min.css">
    <link rel="stylesheet" href="assets/css/select2.min.css">
    <link rel="stylesheet" href="assets/css/jquery-jvectormap.min.css">
    <link rel="stylesheet" href="assets/css/horizontal-timeline.min.css">
    <link rel="stylesheet" href="assets/css/weather-icons.min.css">
    <link rel="stylesheet" href="assets/css/dropzone.min.css">
    <link rel="stylesheet" href="assets/css/ion.rangeSlider.min.css">
    <link rel="stylesheet" href="assets/css/ion.rangeSlider.skinFlat.min.css">
    <link rel="stylesheet" href="assets/css/datatables.min.css">
    <link rel="stylesheet" href="assets/css/fullcalendar.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- Page Level Stylesheets -->
</head>
<body>
    <form id="form_login" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <!-- Wrapper Start -->
                    <div class="wrapper">
                        <!-- Login Page Start -->
                        <div class="m-account-w" data-bg-img="assets/img/account/wrapper-bg.jpg">
                            <div class="m-account">
                                <div class="row no-gutters">
                                    <div class="col-md-6">
                                        <!-- Login Content Start -->
                                        <div class="m-account--content-w" data-bg-img="assets/img/account/content-bg.jpg">
                                            <div class="m-account--content">
                                                <h2 class="h2">¿No tienes una cuenta?</h2>
                                                <p>Regístrate ahora y comienza a reservar con nosotros.</p>
                                                <a href="register.aspx" class="btn btn-rounded">Registrarse</a>
                                            </div>
                                        </div>
                                        <!-- Login Content End -->
                                    </div>

                                    <div class="col-md-6">
                                        <!-- Login Form Start -->
                                        <div class="m-account--form-w">
                                            <div class="m-account--form">
                                                <!-- Logo Start -->
                                                <div class="logo">
                                                    <img src="assets/img/logo.png" alt="">
                                                </div>
                                                <!-- Logo End -->

                                                <form action="#" method="post">
                                                    <label class="m-account--title">Inicia sesión con tu cuenta</label>

                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <i class="fas fa-user"></i>
                                                            </div>
                                                            <asp:TextBox ID="tbxEmail" placeholder="Email" autocomplete="on" class="form-control" runat="server" required="true" TextMode="Email"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <i class="fas fa-key"></i>
                                                            </div>
                                                            <asp:TextBox ID="tbxPassword" placeholder="Password" autocomplete="off" class="form-control" runat="server" TextMode="Password" required="true"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="m-account--actions">
                                                        <a href="#" class="btn-link">¿Olvidaste tu contraseña?</a>
                                                        <asp:Button ID="btnLogin" class="btn btn-rounded btn-info" runat="server" Text="Iniciar sesión" OnClick="btnLogin_Click" />
                                                    </div>

                                                    <div class="m-account--footer">
                                                        <p>&copy; 2018 TerraDelValle</p>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- Login Form End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Login Page End -->
                    </div>
                    <!-- Wrapper End -->
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <div id="Background"></div>
                <div id="Progress">
                    <h6>
                        <p style="text-align: center">
                            <b>
                                <br />
                                Iniciando Sesión ...<br />
                            </b>
                        </p>
                    </h6>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery-ui.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/perfect-scrollbar.min.js"></script>
    <script src="assets/js/jquery.sparkline.min.js"></script>
    <script src="assets/js/raphael.min.js"></script>
    <script src="assets/js/morris.min.js"></script>
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/js/jquery-jvectormap.min.js"></script>
    <script src="assets/js/jquery-jvectormap-world-mill.min.js"></script>
    <script src="assets/js/horizontal-timeline.min.js"></script>
    <script src="assets/js/jquery.validate.min.js"></script>
    <script src="assets/js/jquery.steps.min.js"></script>
    <script src="assets/js/dropzone.min.js"></script>
    <script src="assets/js/ion.rangeSlider.min.js"></script>
    <script src="assets/js/datatables.min.js"></script>
    <script src="assets/js/main.js"></script>

    <!-- Page Level Scripts -->

</body>
</html>
