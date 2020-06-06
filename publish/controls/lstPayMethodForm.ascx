<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="lstPayMethodForm.ascx.cs" Inherits="BookingSystem.controls.lstPayMethodForm" %>

<asp:Panel ID="pnlLstPayMethodForm" runat="server">

    <div class="panel">
        <% 
            int tipo = 0;
            Entitys.UsuarioEntity usuarioEntity = null;
            if (Session["USUARIO"] != null)
            {
                if(string.IsNullOrEmpty(Request.QueryString["u"]))
                    usuarioEntity = (Entitys.UsuarioEntity)Session["USUARIO"];
                else
                {
                    Business.UsuariosDALC usuariosDALC = new Business.UsuariosDALC();
                    usuarioEntity = usuariosDALC.MostrarUsuarioPorID(Request.QueryString["u"]);
                }

                if (usuarioEntity != null)
                    tipo = usuarioEntity.Tipo;
            }
        %>

        <!-- Records Header Start -->
        <div class="records--header">

            <div class="title fa-th">
                <h3 class="h3">
                    <asp:Label ID="lblTitle" runat="server" Text="Métodos de pago"></asp:Label>

                    <% if(!string.IsNullOrEmpty(Request.QueryString["u"]) && !string.IsNullOrEmpty(Request.QueryString["h"]) 
                            && !string.IsNullOrEmpty(Request.QueryString["onbooking"]) && Request.QueryString["onbooking"].Equals("1")) {%>

                    <% if (tipo.Equals(1)){ %>
                        <a href="clientes?action=editpaymethod&u=<% =Request.QueryString["u"]%>&h=<% =Request.QueryString["h"]%>&onbooking=1" class="btn btn-sm btn-outline-info">Agregar nuevo método de pago</a>
                    <% } %>

                    <% if (tipo.Equals(2)){ %>
                        <a href="recepcion?action=editpaymethod&u=<% =Request.QueryString["u"]%>&h=<% =Request.QueryString["h"]%>&onbooking=1" class="btn btn-sm btn-outline-info">Agregar nuevo método de pago</a>
                    <% } %>

                    <% if (tipo.Equals(3)){ %>
                        <a href="admin?action=editpaymethod&u=<% =Request.QueryString["u"]%>&h=<% =Request.QueryString["h"]%>&onbooking=1" class="btn btn-sm btn-outline-info">Agregar nuevo método de pago</a>
                    <% } %>

                    <% }else{%>

                    <% if (tipo.Equals(1)){ %>
                        <a href="clientes?action=editpaymethod" class="btn btn-sm btn-outline-info">Agregar nuevo método de pago</a>
                    <% } %>
                    <% } %>
                </h3>
            </div>
        </div>
        <!-- Records Header End -->
    </div>

    <div class="panel">

        <!-- Records List Start -->
        <% if (string.IsNullOrEmpty(Request.QueryString["u"]))
            {%>
                <div class="records--list" data-title="Mis métodos de pago">
            <%}
            else
            {%>
                <div class="records--list" data-title="Métodos de pago de <% =usuarioEntity.Nombre%>">
            <% }%>
            <table id="recordsListView">
                <thead>
                    <tr>
                        <th class="not-sortable"></th>
                        <th>Titular</th>
                        <th>Número tarjeta</th>
                        <th>Fecha expiración</th>
                        <th class="not-sortable"></th>
                    </tr>
                </thead>

                <tbody>

                    <% 
                        Business.TarjetasDALC clasificacionesDALC = new Business.TarjetasDALC();
                        List<Entitys.TarjetaEntity> lst = clasificacionesDALC.MostrarTarjetas(usuarioEntity.Id_cliente);
                        foreach (Entitys.TarjetaEntity tarjeta in lst)
                        {

                    %>

                    <tr>
                        <td>
                            <%if (tarjeta.Tipo_tarjeta.Equals("VISA")) { %>
                            <a href="#" class="btn-link">
                                <img src="assets/img/products/pay_method_visa.png" alt="">
                            </a>
                            <% } %>

                            <%if (tarjeta.Tipo_tarjeta.Equals("MASTERCARD")) { %>
                            <a href="#" class="btn-link">
                                <img src="assets/img/products/pay_method_master_card.png" alt="">
                            </a>
                            <% } %>

                            <%if (tarjeta.Tipo_tarjeta.Equals("AMERICAN EXPRESS")) { %>
                            <a href="#" class="btn-link">
                                <img src="assets/img/products/pay_method_american_express.png" alt="">
                            </a>
                            <% } %>
                        </td>

                        <td>
                            <a href="#" class="btn-link"><% =string.Format("{0} {1}", tarjeta.Nombre, tarjeta.Apellido).Trim()%></a>
                        </td>

                        <td>
                            <a href="#" class="btn-link"><% =tarjeta.Numero_tarjeta %></a>
                        </td>

                        <td>
                            <a href="#" class="btn-link"><% =tarjeta.Fecha_expiracion %></a>
                        </td>

                        <% if (!string.IsNullOrEmpty(Request.QueryString["onbooking"])) { %>
                                <td> 
                                    <a href="clientes?action=reservando&i=<%=tarjeta.Id_tarjeta%>&onbooking=1&u=<% =usuarioEntity.Id_usuario%>" class="addProduct btn btn-lg btn-rounded btn-warning">Elegir</a>
                                </td>
                        <% } else{%>
                        <td>
                            <a href="clientes?action=editpaymethod&i=<%=tarjeta.Id_tarjeta%>" class="addProduct btn btn-lg btn-rounded btn-warning">Editar</a>
                        </td>
                        <%} %>
                    </tr>

                    <%  } %>
                </tbody>
            </table>
        </div>
        <!-- Records List End -->
    </div>

</asp:Panel>
