<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TimelineBookForm.ascx.cs" Inherits="BookingSystem.controls.TimelineBookForm" %>

<asp:Panel ID="pnlTimelineBoockingForm" runat="server">

    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">Timeline</h3>
        </div>

        <div class="panel-content">
            <!-- Vertical Timeline Start -->
            <div class="vertical-timeline">
                <ul class="list-unstyled">

                    <% Business.ReservacionesDALC reservacionesDALC = new Business.ReservacionesDALC(); %>
                    <% Business.ClientesDALC clientesDALC = new Business.ClientesDALC(); %>
                    <% Business.HabitacionesDALC habitacionesDALC = new Business.HabitacionesDALC(); %>

                    <% Entitys.UsuarioEntity usuario = (Entitys.UsuarioEntity)Session["USUARIO"]; %>
                    <% List<Entitys.ReservacionEntity> lst = reservacionesDALC.MostrarReservacionesVigentes(7); %>

                    <% if (lst != null) { %>
                    <%string fecha_inicial = string.Empty; %>
                    <% foreach(Entitys.ReservacionEntity reservacion in lst) { %>
                         <% if (reservacion.Fecha_inicial != fecha_inicial) { fecha_inicial = reservacion.Fecha_inicial; %>
                        <li class="title">  <% =reservacion.Fecha_inicial %>  </li>
                        <% } %>
                        <li>
                            <span class="time">Al <% =reservacion.Fecha_final %></span>
                            <span class="dot bg-success"></span>
                            <div class="content">
                                <% Entitys.ClienteEntity cliente = clientesDALC.MostrarClienteById(reservacion.Id_cliente.ToString()); %>
                                <% Entitys.HabitacionEntity habitacion = habitacionesDALC.MostrarHabitaciones(reservacion.Id_habitacion.ToString()); %>
                                <% if(usuario.Tipo.Equals(2)) {%>
                                    <h3 class="subtitle"><a class="btn-link" href="recepcion?action=perfil&id=<% =cliente.Id_cliente %>"><% =cliente.Nombre %></a> - <% =habitacion.No_nombre_habitacion %></h3>
                                <%} %>
                                <% if(usuario.Tipo.Equals(3)) {%>
                                    <h3 class="subtitle"><a class="btn-link" href="admin?action=perfil&id=<% =cliente.Id_cliente %>"><% =cliente.Nombre %></a> - <% =habitacion.No_nombre_habitacion %></h3>
                                <%} %>
                                <p><% =reservacion.Comentarios%></p>
                            </div>
                        </li> 
                    <% } } %>
                </ul>
            </div>
            <!-- Vertical Timeline End -->
        </div>
    </div>

</asp:Panel>
