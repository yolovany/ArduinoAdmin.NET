<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="lstProductsForm.ascx.cs" Inherits="BookingSystem.lstProductsForm" %>

<asp:Panel ID="pnlLstProductsForm" runat="server">

    <div class="panel">
        <% 
            int tipo = 0;
            if (Session["USUARIO"] != null)
            {

                Entitys.UsuarioEntity usuarioEntity = (Entitys.UsuarioEntity)Session["USUARIO"];
                if (usuarioEntity != null)
                    tipo = usuarioEntity.Tipo;
            }
        %>

        <!-- Records Header Start -->
        <div class="records--header">

            <div class="title fa-th">
                <h3 class="h3">
                    <asp:Label ID="lblTitle" runat="server" Text="Título de actividad"></asp:Label>
                    <% if (tipo.Equals(3)){ %>
                        <a href="admin?action=AHabitaciones" class="btn btn-sm btn-outline-info">Nueva clasificación</a></h3>
                    <% } %>
            </div>
        </div>
        <!-- Records Header End -->
    </div>



    <div class="panel">

        <!-- Records List Start -->
        <div class="records--list" data-title="Listado de clasificaciones">
            <table id="recordsListView">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th class="not-sortable">Image</th>
                        <th>Clasificación</th>
                        <th>Descripción</th>
                        <th>Precio predeterminado</th>

                        <% if (tipo.Equals(3)){ %>
                        <th class="not-sortable">Actions</th>
                        <% } %>
                    </tr>
                </thead>

                <tbody>

                    <% 
                        Business.ClasificacionHabitacionDALC clasificacionesDALC = new Business.ClasificacionHabitacionDALC();
                        List<Entitys.ClasificacionHabitacionEntity> lst = clasificacionesDALC.MostrarClasificionesHabitaciones(true);
                        foreach (Entitys.ClasificacionHabitacionEntity clasificacion in lst)
                        {
                    %>

                    <tr>
                        <td>
                            <a href="#" class="btn-link"><% =clasificacion.IdClasificacion %></a>
                        </td>

                        <td>
                            <a href="#" class="btn-link">
                                <img src="assets/img/products/thumb-80x60.jpg" alt="">
                            </a>
                        </td>

                        <td>
                            <a href="#" class="btn-link"><% =clasificacion.Descripcion_clasificacion %></a>
                        </td>

                        <td>
                            <a href="#" class="btn-link"><% =clasificacion.Descripcion_habitacion %></a>
                        </td>

                        <td>
                            <a href="#" class="btn-link"></a>
                        </td>

                        <% if (tipo.Equals(3)){ %>
                        <td>
                            <a href="admin?action=AHabitaciones&id=<% =clasificacion.IdClasificacion%>" class="addProduct btn btn-lg btn-rounded btn-warning">Editar</a>
                        </td>
                        <% } %>
                    </tr>

                    <%  } %>
                </tbody>
            </table>
        </div>
        <!-- Records List End -->
    </div>

</asp:Panel>
