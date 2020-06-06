<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWizardBooking.ascx.cs" Inherits="BookingSystem.controls.FormWizardBooking" %>
<asp:Panel ID="pnlFormWizardBoocking" runat="server">

    <div class="panel-content">
        <!-- Form Wizard Start -->
            <div class="panel">
                <div class="panel-content">
                    <h5>Información de cliente</h5>
                    <hr />
                    <section>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Nombre usuario: *</span>
                                        <asp:TextBox ID="tbxNombreUsuario" runat="server" class="form-control" disabled></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Correo de la cuenta: *</span>
                                        <asp:TextBox ID="tbxCorreoUsuario" runat="server" class="form-control" disabled TextMode="Email"></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Fecha de nacimiento: *</span>
                                        <asp:TextBox ID="tbxFechaNacimientoCliente" runat="server" class="form-control" disabled TextMode="Date"></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Teléfono: *</span>
                                        <asp:TextBox ID="tbxTelefonoCliente" runat="server" class="form-control" disabled TextMode="Phone"></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Estado:</span>
                                        <asp:TextBox ID="tbxEstadoCliente" runat="server" class="form-control" disabled></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">País: *</span>
                                        <asp:TextBox ID="tbxPaisCliente" runat="server" class="form-control" disabled></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                        </div>

                    </section>

                </div>
            </div>

            <div class="panel">
                <div class="panel-content">
                    <h5>Datos de reservación</h5>
                    <hr />
                    <section>
                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Fecha de llegada:</span>
                                        <asp:TextBox ID="tbxFechaInicial" runat="server" class="form-control" required TextMode="Date" AutoPostBack="True" OnTextChanged="tbxFechaInicial_TextChanged"></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Fecha de salida:</span>
                                        <asp:TextBox ID="tbxFechaFinal" runat="server" class="form-control" required TextMode="Date" AutoPostBack="True" OnTextChanged="tbxFechaFinal_TextChanged"></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                             <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <% Business.ClasificacionHabitacionDALC clasificacionHabitacionDALC = new Business.ClasificacionHabitacionDALC();%>
                                        <% Entitys.ClasificacionHabitacionEntity clasificacion = clasificacionHabitacionDALC.MostrarClasificionesHabitacionesPorId(Request.QueryString["h"]); %>
                                        <span class="label-text">Número de huespedes (máximo <%=clasificacion.NumeroMaximoHuespedes %> huespedes por habitación):</span>
                                        <asp:TextBox ID="tbxNoHuespedes" runat="server" class= "form-control" Text="1" required TextMode="Number" min="1" max="4" AutoPostBack="True" OnTextChanged="tbxNoHuespedes_TextChanged" ></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Número de habitaciones:</span>
                                        <asp:TextBox ID="tbxNumeroHabitaciones" runat="server" class="form-control" Text="1" required TextMode="Number" min="1" disabled></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>
                        </div>

                    </section>

                </div>
            </div>
        <!--
            <div class="row gutter-20">
                <div class="col-md-6">

                    <div class="form--wizard">
                        <div class="panel">
                            <div class="panel-content">
                                <h3 class="panel-title">Fecha de llegada    </h3>
                                <section>
                                    <center><asp:Calendar ID="Calendar2" class="panel" runat="server"></asp:Calendar></center>
                                </section>

                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-md-6">

                    <div class="form--wizard">
                        <div class="panel">
                            <div class="panel-content">
                                <h3 class="panel-title">Fecha de llegada    </h3>
                                <section>
                                    <center><asp:Calendar ID="Calendar1" class="panel" runat="server"></asp:Calendar></center>
                                </section>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        -->
    </div>

    <div class="panel">
        <div class="panel-content">
            <section>
                <label>
                    <span class="label-text">Comentarios adicionales:</span>
                    <asp:TextBox ID="tbxComentarios" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                </label>
            </section>
        </div>
    </div>

    <!--
            <div class="panel">
                <div class="panel-content">
                    <h5>Datos de facturación</h5>
                    <hr />
                    <section>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Razón social: *</span>
                                        <asp:TextBox ID="tbxRazonSocialFactura" runat="server" class="form-control" required></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">RFC: *</span>
                                        <asp:TextBox ID="tbxRFCFactura" runat="server" class="form-control" required></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Calle:</span>
                                        <asp:TextBox ID="tbxCalleFactura" runat="server" class="form-control" required></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Número exterior: *</span>
                                        <asp:TextBox ID="tbxNoInteriorFactura" runat="server" class="form-control" required TextMode="Number"></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Número interior: *</span>
                                        <asp:TextBox ID="tbxNoExteriorFactura" runat="server" class="form-control" required TextMode="Number"></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Colonia: *</span>
                                        <asp:TextBox ID="tbxColoniaFactura" runat="server" class="form-control" required></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Ciudad: *</span>
                                        <asp:TextBox ID="tbxCiudadFactura" runat="server" class="form-control" required></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Código postal: *</span>
                                        <asp:TextBox ID="tbxCPFactura" runat="server" class="form-control" required TextMode="Number"></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Estado: *</span>
                                        <asp:TextBox ID="tbxPaisFactura" runat="server" class="form-control" required></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <span class="label-text">Correo: *</span>
                                        <asp:TextBox ID="tbxCorreoFactura" runat="server" class="form-control" required TextMode="Email"></asp:TextBox>
                                    </label>
                                    &nbsp;&nbsp;
                                </div>
                            </div>

                        </div>
                    </section>
                </div>
            </div> -->

    <div class="panel">
        <div class="panel-content">
            <section>
                <div class="jumbotron text-center">
                    <h2 class="h1 fw--600 text-dark mb-2">Completa tu reservación</h2>

                    <p>
                        <asp:Label ID="lblDescHabitacion" runat="server" Text="Label"></asp:Label></p>
                    <asp:Button ID="btnReservar" class="btn btn-rounded btn-info" runat="server" Text="Reservar ahora" OnClick="btnReservar_Click" />
                </div>
            </section>
        </div>
    </div>
    <!-- Form Wizard End -->
</asp:Panel>
