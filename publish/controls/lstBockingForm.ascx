<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="lstBockingForm.ascx.cs" Inherits="BookingSystem.controls.lstBockingForm" %>

<asp:Panel ID="pnlLstBockingForm" runat="server">

    <div class="panel">
        <% 
            int tipo = 0;
            Entitys.ClienteEntity cliente = null;
            Entitys.UsuarioEntity usuario = null;
            if (Session["USUARIO"] != null)
            {

                usuario = (Entitys.UsuarioEntity)Session["USUARIO"];
                if (usuario != null)
                    tipo = usuario.Tipo;
            }

            Business.ClientesDALC clientesDALC = new Business.ClientesDALC();
            cliente = clientesDALC.MostrarClienteById(usuario.Id_cliente.ToString());
        %>

        <!-- Records Header Start -->
        <div class="records--header">

            <div class="title fa-th">
                <h3 class="h3">
                    <asp:Label ID="lblTitle" runat="server" Text="Historial de reservaciones"></asp:Label>
                </h3
            </div>
        </div>
        <!-- Records Header End -->
    </div>

    <div class="panel">
        <!-- Records List Start -->
        <div class="records--list" data-title="Listado de reservaciones">
            <table id="recordsListView">
                <thead>
                    <tr>
                        <th>Descripción</th>
                        <th>Status</th>
                        <th>Llegada</th>
                        <th>Salida</th>
                        <th class="not-sortable"></th>
                        <th class="not-sortable"></th>
                    </tr>
                </thead>

                <tbody>

                    <% 

                        Business.ReservacionesDALC reservacionesDALC = new Business.ReservacionesDALC();
                        Business.ClasificacionHabitacionDALC clasificacionHabitacionDALC = new Business.ClasificacionHabitacionDALC();
                        Business.HabitacionesDALC habitacionesDALC = new Business.HabitacionesDALC();

                        List<Entitys.ReservacionEntity> lst = null;
                        if (usuario.Tipo.Equals(1))
                            if (cliente != null)
                                lst = reservacionesDALC.MostrarReservacionesByIDCliente(cliente.Id_cliente);
                        if (usuario.Tipo.Equals(2) || usuario.Tipo.Equals(3))
                            lst = reservacionesDALC.MostrarReservaciones();

                        if (lst != null)
                        {
                            UInt32 id_pedido = 0;
                            bool esPrimerRegistro = true;
                            foreach (Entitys.ReservacionEntity reservacion in lst)
                            {
                                Entitys.HabitacionEntity habitacionEntity = null;
                                Entitys.ClasificacionHabitacionEntity clasificacion = null;

                                cliente = clientesDALC.MostrarClienteById(reservacion.Id_cliente.ToString());

                                habitacionEntity = habitacionesDALC.MostrarHabitaciones(reservacion.Id_habitacion.ToString());
                                if (habitacionEntity != null)
                                    clasificacion = clasificacionHabitacionDALC.MostrarClasificionesHabitaciones(habitacionEntity.Id_clasificacion.ToString());
                    %>

                    <% if (id_pedido != reservacion.Id_pedido || esPrimerRegistro)
                        {%>
                    <% id_pedido = reservacion.Id_pedido; %>
                    <% esPrimerRegistro = false;%>
                    <tr>
                        <td>
                            <%if (clasificacion != null && !string.IsNullOrEmpty(clasificacion.Descripcion_clasificacion) &&
                                cliente != null && !string.IsNullOrEmpty(cliente.Nombre))
                                { %>
                            <a href="#" class="btn-link"><% =clasificacion.Descripcion_clasificacion%>(s) a nombre de <% =cliente.Nombre %></a>
                            <%} %>
                        </td>

                        <th><%=reservacion.Estado_reservacion %></th>

                        <td>
                            <a href="#" class="btn-link"><% =reservacion.Fecha_inicial %></a>
                        </td>

                        <td>
                            <a href="#" class="btn-link"><% =reservacion.Fecha_final %></a>
                        </td>

                        <% if (usuario.Tipo.Equals(1))
                            { %>

                        <td>
                            <a href="clientes?action=confirm&p=<%=reservacion.Id_pedido%>" class="addProduct btn btn-lg btn-rounded btn-warning">Ver</a>
                        <td>
                            <% if (reservacion.Estado_reservacion.Equals("PENDIENTE")) {%>
                                <a href="#" class="addProduct btn btn-lg btn-rounded btn-warning">Editar</a>
                            <% }%>
                        </td>
                        <% } %>

                        <% if (usuario.Tipo.Equals(2))
                            { %>

                         <td>
                            <a href="recepcion?action=confirm&p=<%=reservacion.Id_pedido%>" class="addProduct btn btn-lg btn-rounded btn-warning">Ver</a>
                        <td>
                            <% if (reservacion.Estado_reservacion.Equals("PENDIENTE")) {%>
                                <a href="#" class="addProduct btn btn-lg btn-rounded btn-warning">Editar</a>
                            <% }%>
                        </td>
                        <% } %>

                        <% if (usuario.Tipo.Equals(3))
                            { %>
                        
                         <td>
                            <a href="admin?action=confirm&p=<%=reservacion.Id_pedido%>" class="addProduct btn btn-lg btn-rounded btn-warning">Ver</a>
                        <td>
                            <% if (reservacion.Estado_reservacion.Equals("PENDIENTE")) {%>
                                <a href="#" class="addProduct btn btn-lg btn-rounded btn-warning">Editar</a>
                            <% }%>
                        </td>
                        <% } %>
                    </tr>

                    <%} %>

                    <%  } %>

                    <% } %>
                </tbody>
            </table>
        </div>
        <!-- Records List End -->
    </div>

</asp:Panel>