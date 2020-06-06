<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SistemaClientes.aspx.cs" Inherits="BookingSystem.SistemaClientes" %>

<%@ Register Src="~/controls/NavigationBarForm.ascx" TagPrefix="uc1" TagName="NavigationBarForm" %>
<%@ Register Src="~/controls/SiderarProfileForm.ascx" TagPrefix="uc1" TagName="SiderarProfileForm" %>
<%@ Register Src="~/controls/SiderarNavigationForm.ascx" TagPrefix="uc1" TagName="SiderarNavigationForm" %>
<%@ Register Src="~/controls/PricingTableForm.ascx" TagPrefix="uc1" TagName="PricingTableForm" %>
<%@ Register Src="~/controls/FormWizardBooking.ascx" TagPrefix="uc1" TagName="FormWizardBooking" %>
<%@ Register Src="~/controls/ProfileForm.ascx" TagPrefix="uc1" TagName="ProfileForm" %>
<%@ Register Src="~/controls/BoockingConfirm.ascx" TagPrefix="uc1" TagName="BoockingConfirm" %>
<%@ Register Src="~/controls/lstBockingForm.ascx" TagPrefix="uc1" TagName="lstBockingForm" %>
<%@ Register Src="~/controls/editPayMethodForm.ascx" TagPrefix="uc1" TagName="editPayMethodForm" %>
<%@ Register Src="~/controls/lstPayMethodForm.ascx" TagPrefix="uc1" TagName="lstPayMethodForm" %>




<!DOCTYPE html>
<html dir="ltr" lang="en" class="no-outlines">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- ==== Document Title ==== -->
    <title>Dashboard - DAdmin</title>

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
    <link rel="stylesheet" href="assets/css/horizontal-timeline.min.css">

    <!-- Page Level Stylesheets -->

</head>
<body>
    <form runat="server">
        <!-- Wrapper Start -->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="wrapper">
                    <!-- Navbar Start -->
                    <uc1:NavigationBarForm runat="server" ID="NavigationBarForm" />
                    <!-- Navbar End -->

                    <!-- Sidebar Start -->
                    <aside class="sidebar" data-trigger="scrollbar">
                        <!-- Sidebar Profile Start -->
                        <uc1:SiderarProfileForm runat="server" ID="SiderarProfileForm" />
                        <!-- Sidebar Profile End -->

                        <!-- Sidebar Navigation Start -->
                        <uc1:SiderarNavigationForm runat="server" ID="SiderarNavigationForm" />
                        <!-- Sidebar Navigation End -->

                        <!-- Sidebar Widgets Start -->
                        <!-- Sidebar Widgets End -->
                    </aside>
                    <!-- Sidebar End -->

                    <!-- Main Container Start -->
                    <main class="main--container">
                        <!-- Page Header Start -->
                        <!-- Page Header End -->

                        <!-- Main Content Start -->
                        <section class="main--content">
                            <uc1:PricingTableForm runat="server" ID="PricingTableForm" />
                            <uc1:FormWizardBooking runat="server" ID="FormWizardBooking" />
                            <uc1:ProfileForm runat="server" ID="ProfileForm" />
                            <uc1:BoockingConfirm runat="server" ID="BoockingConfirm" />
                            <uc1:lstBockingForm runat="server" ID="lstBockingForm" />
                            <uc1:editPayMethodForm runat="server" ID="editPayMethodForm" />
                            <uc1:lstPayMethodForm runat="server" ID="lstPayMethodForm" />
                        </section>
                        <!-- Main Content End -->

                        <!-- Main Footer Start -->
                        <footer class="main--footer main--footer-light">
                            <p>Copyright &copy; <a href="#">DAdmin</a>. All Rights Reserved.</p>
                        </footer>
                        <!-- Main Footer End -->
                    </main>
                    <!-- Main Container End -->
                </div>
                <!-- Wrapper End -->
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <div id="Background"></div>
                <div id="Progress">
                    <h6>
                        <p style="text-align: center">
                            <b>
                                <br />Cargando, por favor espere...<br />
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
    <script src="assets/js/horizontal-timeline.min.js"></script>

     <!-- Page Level Scripts -->
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/fullcalendar.min.js"></script>
    <script src="assets/js/page/calendar.js"></script>

</body>
</html>
