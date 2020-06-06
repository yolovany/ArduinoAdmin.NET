<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationBarForm.ascx.cs" Inherits="BookingSystem.controls.NavigationBarForm" %>
<header class="navbar navbar-fixed">
    <!-- Navbar Header Start -->
    <div class="navbar--header">
        <!-- Logo Start -->
        <a href="index.html" class="logo">
            <img src="assets/img/logo.png" alt="">
        </a>
        <!-- Logo End -->

        <!-- Sidebar Toggle Button Start -->
        <a href="#" class="navbar--btn" data-toggle="sidebar" title="Toggle Sidebar">
            <i class="fa fa-bars"></i>
        </a>
        <!-- Sidebar Toggle Button End -->
    </div>
    <!-- Navbar Header End -->

    <!-- Sidebar Toggle Button Start -->
    <a href="#" class="navbar--btn" data-toggle="sidebar" title="Toggle Sidebar">
        <i class="fa fa-bars"></i>
    </a>
    <!-- Sidebar Toggle Button End -->

    <!-- Navbar Search Start -->
    <!-- Navbar Search End -->

    <div class="navbar--nav ml-auto">
            <ul class="nav">

                <!-- Nav Language Start -->

                <%if (Session["USUARIO"] != null)
                    { %>
                <% Entitys.UsuarioEntity usuarioEntity = (Entitys.UsuarioEntity)Session["USUARIO"]; %>
                <% if (usuarioEntity.Tipo.Equals(1)){%>
                <% Business.UsuariosDALC usuariosDALC = new Business.UsuariosDALC();%>
                <li class="nav-item dropdown nav-language">
                    <a class="nav-link" data-toggle="dropdown">
                        <div id="google_translate_element"></div>
                        <script type="text/javascript">
                            function googleTranslateElementInit() {
                                new google.translate.TranslateElement({ pageLanguage: 'es', includedLanguages: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE }, 'google_translate_element');
                            }
                        </script>
                        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
                    </a>
                </li>

                <% }
                    } %>
                <!-- Nav Language End -->

                <!-- Nav User Start -->
                

                <li class="nav-item dropdown nav--user online">
                    <a href="#" class="nav-link" data-toggle="dropdown">
                        <img src="assets/img/avatars/01_80x80.png" alt="" class="rounded-circle">

                        <span>
                            <asp:Label ID="lblNombreUsuario1" runat="server" Text="Nombre usuario"></asp:Label></span>
                        <i class="fa fa-angle-down"></i>
                    </a>

                    <ul class="dropdown-menu">
                        <li>
                            <asp:LinkButton ID="lbtMiPerfil" runat="server" OnClick="lbtMiPerfil_Click"><i class="far fa-user"></i>Mi perfil</asp:LinkButton>
                        </li>

                        <li>
                            <asp:LinkButton ID="lbtSalir" runat="server" OnClick="lbtSalir_Click"><i class="fa fa-power-off"></i>Salir</asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <!-- Nav User End -->

            </ul>
    </div>
</header>
