<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArduinoAdmin.aspx.cs" Inherits="ArduinoAdmin.ArduinoAdmin" %>

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

    <form runat="server">
        <div>
            <!-- Main Content Start -->
            <section class="main--content">
                <div class="row gutter-20">

                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                    <script type="text/javascript">

                        // Guardar estado de estilos al hacer postback.
                        function SaveState(sender, args) {
                            // code to save state of update panel controls
                        }

                        function ReapplyState(sender, args) {

                            // code to reapply state of update panel controls
                        }

                        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(SaveState);
                        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(ReapplyState);

                        // Mantener la posición de scrooll al hacer postback
                        var prm = Sys.WebForms.PageRequestManager.getInstance();
                        prm.add_beginRequest(beginRequest);
                        function beginRequest() {
                            prm._scrollPosition = null;
                        }
                    </script>

                    <div class="col-md-4">

                        <!-- Mini Stats Panel Start -->
                        <asp:Timer runat="server" ID="UpdateTimer" Interval="10000" OnTick="UpdateTimer_Tick" />
                        <asp:UpdatePanel class="panel" ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="UpdateTimer" EventName="Tick" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="miniStats--panel text-white bg-blue">
                                    <div class="miniStats--body">
                                        <i class="miniStats--icon fa text-white"></i>

                                        <p class="miniStats--caption"><%=DateTime.Now.ToString() %></p>
                                        <h3 class="miniStats--title h4 text-white">Humedad ambiente</h3>
                                        <p class="miniStats--num">
                                            <asp:Label ID="lblHumedad" runat="server" Text=""></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <!-- Mini Stats Panel End -->
                    </div>

                    <div class="col-md-4">
                        <!-- Mini Stats Panel Start -->
                        <asp:UpdatePanel class="panel" ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="UpdateTimer" EventName="Tick" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="miniStats--panel text-white bg-orange">
                                    <div class="miniStats--body">
                                        <i class="miniStats--icon fa text-white"></i>

                                        <p class="miniStats--caption"><%=DateTime.Now.ToString() %></p>
                                        <h3 class="miniStats--title h4 text-white">Temperatura ambiente</h3>
                                        <p class="miniStats--num">
                                            <asp:Label ID="lblTemperatura" runat="server" Text=""></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <!-- Mini Stats Panel End -->
                    </div>

                    <div class="col-md-4">
                        <!-- Mini Stats Panel Start -->
                        <asp:UpdatePanel class="panel" ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="UpdateTimer" EventName="Tick" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="miniStats--panel text-white bg-blue">

                                    <div class="miniStats--body">
                                        <i class="miniStats--icon fa text-white"></i>

                                        <p class="miniStats--caption"><%=DateTime.Now.ToString() %></p>
                                        <h3 class="miniStats--title h4 text-white">Humedad en suelo</h3>
                                        <p class="miniStats--num">
                                            <asp:Label ID="lblHumedadSuelo" runat="server" Text=""></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <!-- Mini Stats Panel End -->
                    </div>

                </div>

                <% Negocios.LecturasDALC lecturasDALC = new Negocios.LecturasDALC(); %>
                <% List<Entidades.LecturaEntity> lstLecturas = lecturasDALC.MostrarLecturas("humedad", DateTime.Now.ToString("yyyy-MM-dd")); %>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">Humedad ambiente (%)</h3>

                        <div class="dropdown">
                            <button type="button" class="btn-link dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-ellipsis-v"></i>
                            </button>

                            <ul class="dropdown-menu">
                                <li><a href="#">This Week</a></li>
                                <li><a href="#">Last Week</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel-chart">
                        <!-- Morris Area Chart 02 Start -->
                        <div id="humedad" class="chart--body area--chart style--1"></div>
                        <!-- Morris Area Chart 02 End -->

                        <div class="chart--stats style--2">
                            <ul class="nav">
                                <li>
                                    <p class="amount"><%=lstLecturas.Count %></p>
                                    <p data-overlay="1 blue"><span class="label">TOTAL LECTURAS</span></p>
                                </li>
                                <li>
                                    <p class="amount"><%=DateTime.Now.ToString().ToUpper()%></p>
                                    <p data-overlay="1 red"><span class="label">ULTIMA ACTUALIZACIÓN</span></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <% lstLecturas = lecturasDALC.MostrarLecturas("temperatura", DateTime.Now.ToString("yyyy-MM-dd")); %>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">Temperatura ambiente (C°)</h3>

                        <div class="dropdown">
                            <button type="button" class="btn-link dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-ellipsis-v"></i>
                            </button>

                            <ul class="dropdown-menu">
                                <li><a href="#">This Week</a></li>
                                <li><a href="#">Last Week</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel-chart">
                        <!-- Morris Area Chart 02 Start -->
                        <div id="temperatura" class="chart--body area--chart style--1"></div>
                        <!-- Morris Area Chart 02 End -->

                        <div class="chart--stats style--2">
                            <ul class="nav">
                                <li>
                                    <p class="amount"><%=lstLecturas.Count %></p>
                                    <p data-overlay="1 red"><span class="label">TOTAL LECTURAS</span></p>
                                </li>
                                <li>
                                    <p class="amount"><%=DateTime.Now.ToString().ToUpper()%></p>
                                    <p data-overlay="1 red"><span class="label">ULTIMA ACTUALIZACIÓN</span></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <% lstLecturas = lecturasDALC.MostrarLecturas("humedad suelo", DateTime.Now.ToString("yyyy-MM-dd")); %>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">Humedad en el suelo</h3>

                        <div class="dropdown">
                            <button type="button" class="btn-link dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-ellipsis-v"></i>
                            </button>

                            <ul class="dropdown-menu">
                                <li><a href="#">This Week</a></li>
                                <li><a href="#">Last Week</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel-chart">
                        <!-- Morris Line Chart 01 Start -->
                        <div id="humedadSuelo" class="chart--body line--chart style--1"></div>
                        <!-- Morris Line Chart 01 End -->
                         <div class="chart--stats style--2">
                            <ul class="nav">
                                <li>
                                    <p class="amount"><%=lstLecturas.Count %></p>
                                    <p data-overlay="1 blue"><span class="label">TOTAL LECTURAS</span></p>
                                </li>
                                <li>
                                    <p class="amount"><%=DateTime.Now.ToString().ToUpper()%></p>
                                    <p data-overlay="1 red"><span class="label">ULTIMA ACTUALIZACIÓN</span></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="panel" >
                    <!-- Records List Start -->
                    <div class="records--list" data-title="Historial de lecturas">
                        <table id="recordsListView">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                    <th>Descripción</th>
                                    <th>Valor</th>
                                    <th>Unidad</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% lecturasDALC = new Negocios.LecturasDALC(); %>
                                <% lstLecturas = lecturasDALC.MostrarLecturas(); %>
                                <% if (lstLecturas != null)
                                    {%>
                                <%foreach (Entidades.LecturaEntity lectura in lstLecturas)
                                    {%>
                                <tr>
                                    <td>
                                        <a class="btn-link"><%=lectura.id_parametro %></a>
                                    </td>
                                    <td>
                                        <a class="btn-link"><%=lectura.fecha %></a>
                                    </td>
                                    <td>
                                        <a class="btn-link"><%=lectura.hora %></a>
                                    </td>
                                    <td>
                                        <a class="btn-link"><%=lectura.descripcion %></a>
                                    </td>
                                    <td>
                                        <a class="btn-link"><%=lectura.valor %></a>
                                    </td>
                                    <td>
                                        <a class="btn-link"><%=lectura.unidad %></a>
                                    </td>
                                </tr>
                                <% }%>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                    <!-- Records List End -->
                </div>
            </section>
            <!-- Main Content End -->
        </div>
    </form>

    <!-- Main Footer Start -->
    <footer class="main--footer main--footer-light">
        <p>Copyright &copy; <a href="#">DAdmin</a>. All Rights Reserved.</p>
    </footer>
    <!-- Main Footer End -->
    <!-- Main Container End -->

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
    <!--<script src="assets/js/main.js"></script>-->

    <script type="text/javascript">

/*Project     : DAdmin - Responsive Bootstrap HTML Admin Dashboard
Version     : 1.1
Author      : ThemeLooks
Author URI  : https://themeforest.net/user/themelooks

*/

(function ($) {
    "use strict";
    
    /* ------------------------------------------------------------------------- *
     * COMMON VARIABLES
     * ------------------------------------------------------------------------- */
    var $wn = $(window),
        $document = $(document),
        $body = $('body');

    $(function () {
        /* ------------------------------------------------------------------------- *
         * BACKGROUND IMAGE
         * ------------------------------------------------------------------------- */
        var $bgImg = $('[data-bg-img]');

        $bgImg.css('background-image', function () {
            return 'url("' + $(this).data('bg-img') + '")';
        }).addClass('bg--img').removeAttr('data-bg-img');

        /* ------------------------------------------------------------------------- *
         * TOOLTIP
         * ------------------------------------------------------------------------- */
        var $tooltip = $('[data-toggle="tooltip"]');

        if ( $tooltip.length ) {
            $tooltip.tooltip();
        }

        /* ------------------------------------------------------------------------- *
         * SELECTMENU
         * ------------------------------------------------------------------------- */
        var $selectmenu = $('[data-trigger="selectmenu"]');

        if ( $selectmenu.length ) {
            $selectmenu.select2();
        }

        /* ------------------------------------------------------------------------- *
         * FILE INPUT
         * ------------------------------------------------------------------------- */
        $document.on('change', 'input[type="file"]', function (e) {
            e.$el = $(this);
            e.$txt = e.target.files.length === 0 ? 'Choose File' : e.target.files[0].name;

            if ( e.$el.hasClass('custom-file-input') ) {
                e.$el.next('span').text( e.$txt );
            }
        });

        /* ------------------------------------------------------------------------- *
         * SCROLLBAR
         * ------------------------------------------------------------------------- */
        var $scrollBar = $('[data-trigger="scrollbar"]');

        $scrollBar.each(function () {
            var $ps, $pos;

            $ps = new PerfectScrollbar(this);

            $pos = localStorage.getItem( 'ps.' + this.classList[0] );

            if ( $pos !== null ) {
                $ps.element.scrollTop = $pos;
            }
        });

        $scrollBar.on('ps-scroll-y', function () {
            localStorage.setItem( 'ps.' + this.classList[0], this.scrollTop );
        });

        /* ------------------------------------------------------------------------- *
         * RANGE SLIDER
         * ------------------------------------------------------------------------- */
        var $rangeSlider = $('[data-trigger="range-slider"]');

        if ( $rangeSlider.length ) {
            $rangeSlider.ionRangeSlider();
        }

        /* ------------------------------------------------------------------------- *
         * SPARKLINE
         * ------------------------------------------------------------------------- */
        var $sparkline = $('[data-trigger="sparkline"]');

        $sparkline.each(function () {
            var $t = $(this);

            $t.sparkline('html', {
                type: $t.data('type'),
                barColor: $t.data('color'),
                barWidth: $t.data('width'),
                height: $t.data('height'),
                values: $t.data('value')
            });
        });

        var $sparklineChart01 = $('[data-trigger="sparklineChart01"]');

        if ( $sparklineChart01.length ) {
            $sparklineChart01.sparkline('html', {
                width: '100%',
                height: '100px',
                lineColor: '#ebebea',
                fillColor: '#ebebea',
                spotColor: '#2bb3c0',
                minSpotColor: '#2bb3c0',
                maxSpotColor: '#2bb3c0',
                spotRadius: '3'
            });
        }

        /* ------------------------------------------------------------------------- *
         * GRÁFICAS
         * ------------------------------------------------------------------------- */

         /* GRÁFICA TEMPERATURA*/
        var $temperatura = document.getElementById('temperatura');
        if ( $temperatura ) {
            new Morris.Area({
                element: $temperatura.id,
                data: [    
                    <% Negocios.LecturasDALC lecturasDALC = new Negocios.LecturasDALC(); %>
                    <% List<Entidades.LecturaEntity> lstLecturas = lecturasDALC.MostrarLecturas("temperatura", DateTime.Now.ToString("yyyy-MM-dd")); %>
                    <%if (lstLecturas != null) {
                        bool isFirst = true;
                        foreach(Entidades.LecturaEntity lectura in lstLecturas){
                            if(isFirst){
                                isFirst=false; %>
                                { hour: '<%=lectura.hora%>', lectura: <%=lectura.valor%> } 
                          <%}
                            else {%>
                                ,{ hour: '<%=lectura.hora%>', lectura: <%=lectura.valor%> } 
                            <%}%>
                               
                        <%}%>
                    <%}%>
                    
                ],
                xkey: 'hour',
                ykeys: ['lectura'],
                labels: ['Temperatura'],
                lineColors: ['#ff4040'],
                preUnits: '',
                parseTime: false,
                pointSize: 2,
                lineWidth: 0,
                gridLineColor: '#eee',
                resize: true,
                hideHover: true,
            });
        }

        /* GRÁFICA HUMEDAD */
        var $humedad = document.getElementById('humedad');

        if ( $humedad ) {
            new Morris.Area({
                element: $humedad.id,
                data: [
                    <% lstLecturas = lecturasDALC.MostrarLecturas("humedad", DateTime.Now.ToString("yyyy-MM-dd")); %>
                    <% lstLecturas = lecturasDALC.MostrarLecturas("humedad", DateTime.Now.ToString("yyyy-MM-dd")); %>
                    <%if (lstLecturas != null) {
                        bool isFirst = true;
                        foreach(Entidades.LecturaEntity lectura in lstLecturas){
                        if(isFirst){
                                isFirst=false; %>
                                { hour: '<%=lectura.hora%>', lectura: <%=lectura.valor%> } 
                            <%}
                            else {%>
                                ,{ hour: '<%=lectura.hora%>', lectura: <%=lectura.valor%> } 
                            <%}%>
                               
                        <%}%>
                    <%}%>
                ],
                xkey: 'hour',
                ykeys: ['lectura'],
                labels: ['Humedad'],
                lineColors: ['#2bb3c0'],
                preUnits: '',
                parseTime: false,
                pointSize: 2,
                lineWidth: 0,
                gridLineColor: '#eee',
                resize: true,
                hideHover: true,
            });
        }

        /* GRÁFICA HUMEDAD EN EL SUELO */
        var $humedadSuelo = document.getElementById('humedadSuelo');

        if ( $humedadSuelo ) {
            new Morris.Line({
                element: $humedadSuelo.id,
                data: [
                    <% lstLecturas = lecturasDALC.MostrarLecturas("humedad suelo", DateTime.Now.ToString("yyyy-MM-dd")); %>
                    <% lstLecturas = lecturasDALC.MostrarLecturas("humedad suelo", DateTime.Now.ToString("yyyy-MM-dd")); %>
                    <%if (lstLecturas != null) {
                        bool isFirst = true;
                        foreach(Entidades.LecturaEntity lectura in lstLecturas){
                        if(isFirst){
                                isFirst=false; %>
                                { hour: '<%=lectura.hora%>', lectura: <%=lectura.valor%> } 
                            <%}
                            else {%>
                                ,{ hour: '<%=lectura.hora%>', lectura: <%=lectura.valor%> } 
                            <%}%>
                               
                        <%}%>
                    <%}%>

                ],
                xkey: 'hour',
                ykeys: ['lectura'],
                labels: ['Humedad'],
                lineColors: ['#009378'],
                postUnits: '%',
                parseTime: false,
                pointSize: 3,
                lineWidth: 3,
                gridLineColor: '#eee',
                resize: true,
                hideHover: true
            });
        }

        var $morrisLineChart02 = document.getElementById('morrisLineChart02');

        if ( $morrisLineChart02 ) {
            new Morris.Line({
                element: $morrisLineChart02.id,
                data: [
                    { month: 'Feb', a: 270, b: 250 },
                    { month: 'Mar', a: 275, b: 260 },
                    { month: 'Apr', a: 225, b: 240 },
                    { month: 'May', a: 230, b: 230 },
                    { month: 'Jun', a: 335, b: 220 }
                ],
                xkey: 'month',
                ykeys: ['a', 'b'],
                labels: ['Visitors', 'Sales'],
                lineColors: ['#e16123', '#2bb3c0'],
                parseTime: false,
                pointSize: 2,
                lineWidth: 2,
                gridLineColor: '#eee',
                resize: true,
                hideHover: true,
                axes: 'x'
            });
        }

        /* MORRIS AREA CHART 03 */
        var $morrisLineChart03 = document.getElementById('morrisLineChart03');

        if ( $morrisLineChart03 ) {
            new Morris.Line({
                element: $morrisLineChart03.id,
                data: [
                    { day: 'S', a: 20 },
                    { day: 'M', a: 30 },
                    { day: 'T', a: 40 },
                    { day: 'W', a: 20 },
                    { day: 'T', a: 10 },
                    { day: 'F', a: 10 },
                    { day: 'S', a: 5 }
                ],
                xkey: 'day',
                ykeys: ['a'],
                labels: ['Overdue'],
                lineColors: ['#e16123'],
                preUnits: '$',
                parseTime: false,
                pointSize: 4,
                gridLineColor: '#eee',
                resize: true,
                hideHover: true
            });
        }

        /* MORRIS AREA CHART 01 */
        var $morrisAreaChart01 = document.getElementById('morrisAreaChart01');

        if ( $morrisAreaChart01 ) {
            new Morris.Area({
                element: $morrisAreaChart01.id,
                data: [
                    { month: 'Jan', a: 0, b: 0, c: 500, d: 0 },
                    { month: 'Feb', a: 2000, b: 1500, c: 500, d: 1000 },
                    { month: 'Mar', a: 2000, b: 2000, c: 1500, d: 1500 },
                    { month: 'Apr', a: 2000, b: 2000, c: 1500, d: 1500 },
                    { month: 'May', a: 2000, b: 2000, c: 1500, d: 1500 },
                    { month: 'Jun', a: 1500, b: 1200, c: 2000, d: 2000 },
                    { month: 'Jul', a: 300, b: 2000, c: 2500, d: 1200 },
                    { month: 'Aug', a: 2500, b: 3000, c: 1500, d: 2000 },
                    { month: 'Sep', a: 1000, b: 1000, c: 1500, d: 1000 },
                    { month: 'Oct', a: 3500, b: 1800, c: 3000, d: 1500 },
                    { month: 'Nov', a: 3500, b: 2000, c: 2000, d: 3500 },
                    { month: 'Dec', a: 5000, b: 1200, c: 4500, d: 4500 }
                ],
                xkey: 'month',
                ykeys: ['a', 'b', 'c', 'd'],
                labels: ['Order', 'Shipment', 'Tax', 'Revenue'],
                lineColors: ['#e16123', '#ff4040', '#2bb3c0', '#009378'],
                preUnits: '$',
                parseTime: false,
                pointSize: 0,
                lineWidth: 0,
                gridLineColor: '#eee',
                resize: true,
                hideHover: true,
                behaveLikeLine: true
            });
        }

        /* MORRIS AREA CHART 03 */
        var $morrisAreaChart03 = document.getElementById('morrisAreaChart03');

        if ( $morrisAreaChart03 ) {
            new Morris.Area({
                element: $morrisAreaChart03.id,
                data: [
                    { month: 'Jan', a: 0, b: 0, c: 0, d: 0 },
                    { month: 'Feb', a: 1200, b: 0, c: 0, d: 0 },
                    { month: 'Mar', a: 0, b: 700, c: 0, d: 0 },
                    { month: 'Apr', a: 0, b: 0, c: 1800, d: 0 },
                    { month: 'May', a: 0, b: 0, c: 0, d: 1200 },
                    { month: 'Jun', a: 0, b: 700, c: 0, d: 0 },
                    { month: 'Jul', a: 0, b: 0, c: 0, d: 0 },
                    { month: 'Aug', a: 0, b: 0, c: 1200, d: 0 },
                    { month: 'Sep', a: 0, b: 0, c: 0, d: 0 },
                    { month: 'Oct', a: 0, b: 1200, c: 0, d: 0 },
                    { month: 'Nov', a: 0, b: 0, c: 0, d: 2400 },
                    { month: 'Dec', a: 0, b: 0, c: 0, d: 0 }
                ],
                xkey: 'month',
                ykeys: ['a', 'b', 'c', 'd'],
                labels: ['Product 1', 'Product 2', 'Product 3', 'Product 4'],
                lineColors: ['#e16123', '#ff4040', '#2bb3c0', '#009378'],
                preUnits: '$',
                parseTime: false,
                pointSize: 0,
                lineWidth: 0,
                gridLineColor: '#eee',
                resize: true,
                hideHover: true,
                behaveLikeLine: true
            });
        }

        /* ------------------------------------------------------------------------- *
         * VECTOR MAP
         * ------------------------------------------------------------------------- */
        var $jvectorMap = $('[data-trigger="jvectorMap"]');

        if ( $jvectorMap.length ) {
            $jvectorMap
        }

        $jvectorMap.each(function () {
            var $t = $(this);

            $t.vectorMap({
                map: 'world_mill',
                backgroundColor: 'transparent',
                regionStyle: {
                    initial: { fill: '#494f50' },
                    selected: { fill: '#e16123' }
                },
                selectedRegions: $t.data('map-selected')
            });
        });

        /* ------------------------------------------------------------------------- *
         * FORM WIZARD
         * ------------------------------------------------------------------------- */
        var $formWizard = $('#formWizard');

        if ( $formWizard.length ) {
            $formWizard.validate({
                errorPlacement: function () {
                    return false;
                },
                rules: {
                    cpassword: {
                        equalTo: '#password'
                    }
                }
            });

            $formWizard.steps({
                headerTag: 'h3',
                bodyTag: 'section',
                titleTemplate: '<span class="number">#index#</span> #title#',
                onStepChanging: function () {
                    $formWizard.validate().settings.ignore = ':disabled,:hidden';
                    return $formWizard.valid();
                },
                onFinishing: function () {
                    $formWizard.validate().settings.ignore = ":disabled";
                    return $formWizard.valid();
                }
            });
        }
        
        /* ------------------------------------------------------------------------- *
         * RECORDS LIST
         * ------------------------------------------------------------------------- */
        var $recordsList = $('.records--list'),
            $recordsListView = $('#recordsListView');

        if ( $recordsListView.length ) {
            $recordsListView.DataTable({
                responsive: true,
                language: {
                    "lengthMenu": "View _MENU_ records"
                },
                dom: '<"topbar"<"toolbar"><"right"li>><"table-responsive"t>p',
                order: [],
                columnDefs: [
                    {
                        targets: 'not-sortable',
                        orderable: false
                    }
                ]
            });

            $recordsList.find('.toolbar').text( $recordsList.data('title') );
        }

        /* ------------------------------------------------------------------------- *
         * SIDEBAR NAVIGATION
         * ------------------------------------------------------------------------- */
        var $sidebarNav = $('.sidebar--nav');

        $.each( $sidebarNav.find('li'), function () {
            var $li = $(this);

            if ( $li.children('a').length && $li.children('ul').length ) {
                $li.addClass('is-dropdown');
            }
        });

        $sidebarNav.on('click', '.is-dropdown > a', function (e) {
            e.preventDefault();

            var $el = $(this),
                $es = $el.siblings('ul'),
                $ep = $el.parent(),
                $ps = $ep.siblings('.open');

            if ( $ep.parent().parent('.sidebar--nav').length ) {
                $es.slideToggle();
                $ep.toggleClass('open');

                return;
            }

            $es.add( $ps.children('ul') ).slideToggle();
            $ep.add( $ps ).toggleClass('open');
        });

        /* ------------------------------------------------------------------------- *
         * TOGGLE SIDEBAR
         * ------------------------------------------------------------------------- */
        var $toggleSidebar = $('[data-toggle="sidebar"]');

        $toggleSidebar.on('click', function (e) {
            e.preventDefault();

            $body.toggleClass('sidebar-mini');
        });

        /* ------------------------------------------------------------------------- *
         * TODO PANEL
         * ------------------------------------------------------------------------- */
        var $todoPanel = $('.todo--panel');

        $todoPanel
            .on('submit', 'form', function (e) {
                e.preventDefault();

                var $t = $(this),
                    $input = $t.find('.form-control');

                $('<li class="list-group-item" style="display: none;"><label class="todo--label"><input type="checkbox" name="" value="1" class="todo--input"><span class="todo--text">'+ $input.val() +'</span></label><a href="#" class="todo--remove">&times;</a></li>')
                    .appendTo( $t.children('.list-group') )
                    .slideDown('slow');

                $input.val('');
            })
            .on('click', '.todo--remove', function (e) {
                e.preventDefault();

                var $parent = $(this).parent('li');

                $parent.slideUp('slow', function () {
                    $parent.remove();
                });
            });
    });

}(jQuery));

</script>


    <!-- Page Level Scripts -->

</body>
</html>


