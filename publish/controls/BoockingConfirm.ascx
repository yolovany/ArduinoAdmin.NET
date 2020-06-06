<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BoockingConfirm.ascx.cs" Inherits="BookingSystem.controls.BoockingConfirm" %>

<asp:Panel ID="pnlBoockingConfirm" class="panel" runat="server">

    <% string id_pedido = Request.QueryString["p"]; %>
    <% if (!string.IsNullOrEmpty(id_pedido))
        { %>
    <% Business.ReservacionesDALC reservacionesDALC = new Business.ReservacionesDALC(); %>
    <% Business.ClientesDALC clientesDALC = new Business.ClientesDALC(); %>

    <% List<Entitys.ReservacionEntity> lst = reservacionesDALC.MostrarReservacionesByIDPedido(Convert.ToUInt32(id_pedido));%>
    <%if (lst != null)
        { %>
            <% if (lst.Count > 0) {%>
    <% Entitys.ClienteEntity cliente = clientesDALC.MostrarClienteById(lst[0].Id_cliente.ToString()); %>
    <% if (cliente != null)
        {%>

    <!-- Invoice Start -->
    <div class="invoice">
        <div class="invoice--header">
            <div class="invoice--logo">
                <img src="assets/img/invoice/logo.png" alt="">
            </div>

            <div class="invoice--address">
                <h5 class="h5">Terra del valle</h5>

                <p>Camino a San José de la zorra, Ejido el Porvenir</p>
                <p>Valle de Guadalupe Ensenada BC México</p>
                <p>Teléfono: (646) 117-3645)</p>
                <p>US: (011 52 1) 646 117-3645</p>
            </div>

        </div>

        <div class="invoice--billing">
            <div class="invoice--address">
                <h3 class="h3"><span>Para:</span></h3>

                <h5 class="h5"><%=cliente.Nombre %></h5>

                <% if (!string.IsNullOrEmpty(cliente.Estado)) { %>
                <p>De <% =cliente.Estado%></p>
                <% } %>

                <% if (!string.IsNullOrEmpty(cliente.Telefono)) { %>
                <p>Teléfono <% =cliente.Telefono%></p>
                <% } %>
                
            </div>

            <div class="invoice--info">
                <h5 class="h5"><span>Folio de pedido:</span><% =lst[0].Id_pedido%></h5>
                <p>Fecha de llegada: <strong><% =lst[0].Fecha_inicial %></strong></p>
                <p>Fecha de salida: <strong><% =lst[0].Fecha_final %></strong></p>
            </div>
        </div>

        <div class="invoice--order">
            <table class="table">
                <thead>
                    <tr>
                        <th>Concepto</th>
                        <th></th>
                        <th>Dia</th>
                        <th>Periodo estancia</th>
                        <th>Precio unitario</th>
                    </tr>
                </thead>
                <tbody>

                    <% Business.HabitacionesDALC habitacionesDALC = new Business.HabitacionesDALC(); %>
                    <% Business.ClasificacionHabitacionDALC clasificacionHabitacionDALC = new Business.ClasificacionHabitacionDALC(); %>
                    <% Business.PreciosClasificacionesDALC preciosClasificacionesDALC = new Business.PreciosClasificacionesDALC(); %>
                    <% decimal total = 0.00m; %>

                    <% Entitys.ClasificacionHabitacionEntity clasificacion = null; %>
                    <% Entitys.HabitacionEntity habitacion = habitacionesDALC.MostrarHabitaciones(lst[0].Id_habitacion.ToString()); %>

                    <% if (habitacion != null) { %>
                    <% clasificacion = clasificacionHabitacionDALC.MostrarClasificionesHabitaciones(habitacion.Id_clasificacion.ToString()); %>
                    <%} %>

                    <% foreach (Entitys.ReservacionEntity reservacion in lst) { %>
                        <% DateTime fechaInicial = Convert.ToDateTime(reservacion.Fecha_inicial); %>
                        <% DateTime fechaFinal = Convert.ToDateTime(reservacion.Fecha_final); %>
                        <% TimeSpan timeSpan = fechaFinal - fechaInicial; %>

                        <% for (int i = 0; i < timeSpan.Days; i++){%>
                        <% if (clasificacion != null) { %>
                             <tr>
                               <% habitacion = habitacionesDALC.MostrarHabitaciones(reservacion.Id_habitacion.ToString());%>
                        <% if (habitacion != null) { %>
                             <td><%=habitacion.No_nombre_habitacion%></td>
                        <% } %>
                             <td><% = clasificacion.Descripcion_clasificacion%></td>
                             <td><% = fechaInicial.AddDays(i).DayOfWeek %></td>
                             <td><% =fechaInicial.AddDays(i).ToString("yyyy/MM/dd")%> - <% =fechaInicial.AddDays(i + 1).ToString("yyyy/MM/dd") %></td>
                             <% Entitys.PrecioClasificacionEntity precio = 
                                     preciosClasificacionesDALC.MostrarPreciosClasificacionesPorDia(fechaInicial.AddDays(i).DayOfWeek.ToString(), clasificacion.IdClasificacion.ToString()); %>
                             <% if (precio != null && !string.IsNullOrEmpty(precio.DiasVigencia)) {%>
                                <td>$<% =precio.PrecioNormal %></td>
                                <% total += precio.PrecioNormal; %>
                             <% } %>
                             </tr>
                            
                            <% if (reservacion.Numero_huespedes > clasificacion.NumeroMaximoHuespedes){%>
                                <tr>
                                <td>Cobro por huesped adicional (<% =reservacion.Numero_huespedes%> de <%=clasificacion.NumeroMaximoHuespedes %> de huespedes permitidos)</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>$<% =clasificacion.MontoExtra %></td>
                                </tr>
                                <% total += clasificacion.MontoExtra; %>
                            <% }%>
                        <% } %>
                       <% }%>

                    <% } %>

                    <tr>
                        
                        <td colspan="4"><strong>Total:</strong></td>
                        <td><strong>$<% =total %></strong></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <% if (clasificacion != null) { %>
                        <br />
                         <p><% =clasificacion.Descripcion_clasificacion %>: <% =clasificacion.Descripcion_habitacion %></p>
                    <% } %>

        <div class="invoice--footer">
            <div class="invoice--payment">
                <p><strong>Método de pago: </strong>Tarjeta</p>
                <br />
                <% if (lst[0].Estado_reservacion.Equals("PENDIENTE"))
                    { %>
                 <!-- Input Group Start -->
                <div class="input-group">
                    <div class="input-group-prepend">
                        
                    <asp:DropDownList class="btn btn-rounded btn-info dropdown-toggle" ID="ddlTarjetas" runat="server"></asp:DropDownList>
                    </div>
                    <asp:TextBox ID="tbxCCV" textmode="Number" min="0" max="999" runat="server" class="form-control" placeholder="CCV" required></asp:TextBox>
                </div>
                <!-- Input Group End -->
                <%}%>
               

            </div>

            <div class="invoice--actions">
                <% if (lst[0].Estado_reservacion.Equals("PENDIENTE"))
                    { %>
                <asp:Button ID="btnConfirmar" class="btn btn-rounded btn-info" runat="server" Text="Pagar ahora" OnClick="btnConfirmar_Click" />
                <%} %>

                <% if (lst[0].Estado_reservacion.Equals("RESERVADO"))
                    { %>
                <% Entitys.UsuarioEntity usuarioEntity = new Entitys.UsuarioEntity(); %>
                <% if (usuarioEntity != null)
                    {%>
                <% if (usuarioEntity.Tipo.Equals(1))
                    {%>
                <a href="clientes?action=history" class="btn btn-rounded btn-info">VOLVER</a>
                <%} %>
                <% if (usuarioEntity.Tipo.Equals(2))
                    {%>
                <a href="recepcion?action=history" class="btn btn-rounded btn-info">VOLVER</a>
                <%} %>
                <% if (usuarioEntity.Tipo.Equals(3))
                    {%>
                <a href="admin?action=history" class="btn btn-rounded btn-info">VOLVER</a>
                <%} %>
                <%} %>
                <%} %>
            </div>
        </div>
    </div>
    <!-- Invoice End -->

    <% } %>
    <% } %>
    <% } %>

    <% } %>
</asp:Panel>
