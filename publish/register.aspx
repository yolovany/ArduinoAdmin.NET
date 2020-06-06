<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="BookingSystem.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- ==== Document Title ==== -->
    <title>register - booking system</title>
    
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
    <form id="form1" runat="server">
        <div>
            <!-- Wrapper Start -->
    <div class="wrapper">
        <!-- Register Page Start -->
        <div class="m-account-w" data-bg-img="assets/img/account/wrapper-bg.jpg">
            <div class="m-account">
                <div class="row no-gutters flex-row-reverse">
                    <div class="col-md-6">
                        <!-- Register Content Start -->
                        <div class="m-account--content-w" data-bg-img="assets/img/account/content-bg.jpg">
                            <div class="m-account--content">
                                <h2 class="h2">¿Ya tienes una cuenta?</h2>
                                <a href="login.aspx" class="btn btn-rounded">Iniciar sesión</a>
                            </div>
                        </div>
                        <!-- Register Content End -->
                    </div>

                    <div class="col-md-6">
                        <!-- Register Form Start -->
                        <div class="m-account--form-w">
                            <div class="m-account--form">
                                <form action="#" method="post">
                                    <label class="m-account--title">Crear una cuenta</label>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="tbxNombre" placeholder="Username" class="form-control" autocomplete="off" runat="server" required="true"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="tbxPais" placeholder="País" class="form-control" autocomplete="off" runat="server" required="true" ></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="tbxEstado" placeholder="Estado" class="form-control" autocomplete="off" runat="server" required="true"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="tbxFechaNacimiento" placeholder="Fecha de nacimiento" class="form-control" autocomplete="off" runat="server" required="true" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="tbxTelefono" placeholder="Teléfono" class="form-control" autocomplete="off" runat="server" required="false" TextMode="Phone"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="tbxCorreo" placeholder="Correo electrónicio" class="form-control" autocomplete="off" runat="server" required="true" TextMode="Email"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="tbxPassword" placeholder="Contraseña" class="form-control" autocomplete="off" runat="server" TextMode="Password" required="true"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="m-account--actions">
                                        <asp:Button ID="btnRegistrar" class="btn btn-block btn-rounded btn-info" runat="server" Text="Registrarse" OnClick="btnRegistrar_Click" />
                                    </div>

                                    <div class="m-account--footer">
                                        <p>&copy; 2018 TerraDelValle</p>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Register Form End -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Register Page End -->
    </div>
    <!-- Wrapper End -->
        </div>
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
