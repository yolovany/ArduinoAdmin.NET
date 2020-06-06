<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="lstPriceRooms.ascx.cs" Inherits="BookingSystem.controls.lstPriceRooms" %>

<asp:Panel ID="pnlLstPriceRooms" runat="server">

    <div class="panel">
        <% 
            int tipo = 0;
            Entitys.UsuarioEntity usuarioEntity = null;
            if (Session["USUARIO"] != null)
            {
                usuarioEntity = (Entitys.UsuarioEntity)Session["USUARIO"];
                if (usuarioEntity != null)
                    tipo = usuarioEntity.Tipo;
            }
        %>

        <!-- Records Header Start -->
        <div class="records--header">

            <div class="title fa-th">
                <h3 class="h3">
                    <asp:Label ID="lblTitle" runat="server" Text="Precios de clasificaciones"></asp:Label>

                    <% if (tipo.Equals(3)){ %>
                        <a href="admin?action=editPriceRooms" class="btn btn-sm btn-outline-info">Agregar nuevo precio</a>
                    <% } %>
                </h3>
            </div>
        </div>
        <!-- Records Header End -->
    </div>

    <div class="panel">

        <!-- Records List Start -->
        <div class="records--list" data-title="Listado de precios vigentes">
            <table id="recordsListView">
                <thead>
                    <tr>
                        <th>Clasificación</th>
                        <th>Días vigencia</th>
                        <th>Precio normal</th>
                        <th>Máximo huespedes</th>
                        <th>Monto extra</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>

                    <% 
                        Business.PreciosClasificacionesDALC preciosClasificacionesDALC = new Business.PreciosClasificacionesDALC();
                        Business.ClasificacionHabitacionDALC clasificacionHabitacionDALC = new Business.ClasificacionHabitacionDALC();
                        Entitys.ClasificacionHabitacionEntity clasificacion = null;
                        List<Entitys.PrecioClasificacionEntity> lst = preciosClasificacionesDALC.MostrarPreciosClasificaciones(true);
                        foreach (Entitys.PrecioClasificacionEntity precio in lst)
                        {

                    %>

                    <tr>
                        <% clasificacion = clasificacionHabitacionDALC.MostrarClasificionesHabitaciones(precio.IdClasificacion.ToString()); %>
                       
                        <td>
                             <% if (clasificacion != null) { %>
                                <a href="#" class="btn-link"><% =clasificacion.Descripcion_clasificacion %></a>
                            <% } %>
                        </td>
                        <td>
                            <a href="#" class="btn-link"><% =precio.DiasVigencia %></a>
                        </td>
                        <td>
                            <a href="#" class="btn-link"><% =precio.PrecioNormal.ToString("0.00") %></a>
                        </td>
                         <td>
                            <a href="#" class="btn-link"><% =clasificacion.NumeroMaximoHuespedes %></a>
                        </td>
                         <td>
                            <a href="#" class="btn-link"><% =clasificacion.MontoExtra %></a>
                        </td>
                        <td>
                            <a href="admin?action=editPriceRooms&p=<% =precio.IdPrecio%>" class="addProduct btn btn-lg btn-rounded btn-warning">Editar</a>
                        </td>
                    </tr>

                    <%  } %>
                </tbody>
            </table>
        </div>
        <!-- Records List End -->
    </div>

</asp:Panel>