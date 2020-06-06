<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PricingTableForm.ascx.cs" Inherits="BookingSystem.controls.PricingTableForm" %>

<asp:Panel ID="pnlPricingTable" runat="server">

    <% 
        int tipo = 0;
        if (Session["USUARIO"] != null)
        {

            Entitys.UsuarioEntity usuarioEntity = (Entitys.UsuarioEntity)Session["USUARIO"];
            if (usuarioEntity != null)
                tipo = usuarioEntity.Tipo;
        }
    %>

    <div class="row align-items-center">
        <% Business.ClasificacionHabitacionDALC clasificacionHabitacionDALC = new Business.ClasificacionHabitacionDALC(); %>
        <% Business.PreciosClasificacionesDALC preciosClasificacionesDALC = new Business.PreciosClasificacionesDALC(); %>
        <% List<Entitys.ClasificacionHabitacionEntity> lst = clasificacionHabitacionDALC.MostrarClasificionesHabitaciones(true); %>
        <% if (lst != null)
            { %>
        <%foreach (Entitys.ClasificacionHabitacionEntity clasificacion in lst)
            { %>
        <!-- Pricing Item Start -->

        <div class="col-lg-3 col-md-6">
            <div class="pricing--item text-center mb-4 active">
                <span class="pricing--text text-white bg-orange">Hoy</span>

                <div class="pricing--header text-green text-uppercase">
                    <h3 class="h3"><%=clasificacion.Descripcion_clasificacion%></h3>
                </div>



                <div class="pricing--title pricing--title--box text-white bg-green">
                    <% List<Entitys.PrecioClasificacionEntity> lstPrecios = preciosClasificacionesDALC.MostrarPreciosClasificaciones(clasificacion.IdClasificacion.ToString(), 
                           DateTime.Now.DayOfWeek.ToString(), true);%>
                    <% if (lstPrecios.Count > 0)
                        {%>
                    <strong><h1>$<%=lstPrecios[0].PrecioNormal.ToString("0.00") %> USD</h1></strong>
                    <% }%>
                </div>

                <!--<img src="assets/img/gallery/01.jpg" class="img-fluid" alt="Responsive image"> 
                     <br /><br />-->

                <div class="pricing--features">
                    <ul class="list-unstyled">

                        <%lstPrecios = preciosClasificacionesDALC.MostrarPreciosClasificaciones(clasificacion.IdClasificacion.ToString(), DateTime.Now.DayOfWeek.ToString(), false);%>
                        <% foreach (Entitys.PrecioClasificacionEntity precio in lstPrecios)
                            {%>
                        <li><strong>$<% =precio.PrecioNormal.ToString("0.00") %> USD: </strong><%=precio.DiasVigencia.Trim() %></li>
                        <% }%>
                        <li><%=clasificacion.Descripcion_habitacion %></li>
                    </ul>
                </div>

                <hr />
                <div class="pricing--action">
                    <% if (tipo.Equals(1))
                    {%>
                    <a href="clientes?action=reservando&h=<%=clasificacion.IdClasificacion %>" class="btn btn-rounded btn-success">Reservar ahora</a>
                    <% }%>

                    <% if (tipo.Equals(2))
                    {%>
                        <a href="recepcion?action=LstUsuarios&h=<%=clasificacion.IdClasificacion %>&mode=onboocking" class="btn btn-rounded btn-success">Reservar ahora</a>
                    <% }%>

                    <% if (tipo.Equals(3))
                    {%>
                    <a href="admin?action=LstUsuarios&h=<%=clasificacion.IdClasificacion %>&mode=onboocking" class="btn btn-rounded btn-success">Reservar ahora</a>
                    <% }%>
                </div>
            </div>
        </div>
        <!-- Pricing Item End -->
    
    
    <% }
        }%>

        </div>
    
</asp:Panel>
