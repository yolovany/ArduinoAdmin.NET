<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="lstUsersAdmin.ascx.cs" Inherits="BookingSystem.controls.lstUsersAdmin" %>

<asp:Panel ID="pnlLstUsersForm" runat="server">

    <div class="panel">
        <% 
            int tipo = 0;
            Entitys.UsuarioEntity usuarioEntity = new Entitys.UsuarioEntity();
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
                    <asp:Label ID="lblTitle" runat="server" Text="Título de actividad"></asp:Label>
                    <% if (tipo.Equals(3)){ %>
                        <a href="admin?action=AUsuarios" class="btn btn-sm btn-outline-info">Nuevo usuario</a>
                    <% } %>

                     <% if (tipo.Equals(2)){ %>
                        <a href="recepcion?action=AUsuarios" class="btn btn-sm btn-outline-info">Nuevo usuario</a>
                    <% } %>
                </h3>
            </div>
        </div>
        <!-- Records Header End -->
    </div>

    <div class="panel">
        <!-- Records List Start -->
        <div class="records--list" data-title="Listado de usuarios registrados">
            <table id="recordsListView">
                <thead>
                    <tr>
                        <th class="not-sortable"></th>
                        <th>Correo</th>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Status</th>
                        <th class="not-sortable">Actions</th>
                    </tr>
                </thead>

                <tbody>

                    <% 
                        Business.UsuariosDALC usuariosDALC = new Business.UsuariosDALC();
                        List<Entitys.UsuarioEntity> lst = usuariosDALC.MostrarUsuarios();
                        foreach (Entitys.UsuarioEntity usuario in lst)
                        {
                    %>

                    <tr>

                        <td>
                            <a class="btn-link">
                                <img src="assets/img/products/thumb-80x60.jpg" alt="">
                            </a>
                        </td>

                        <td>
                            <a class="btn-link"><% =usuario.Correo %></a>
                        </td>

                        <td>
                            <a class="btn-link"><% = usuario.Nombre %></a>
                        </td>

                        <td>
                            <center>
                    <% if (usuario.Tipo.Equals(1))
                        { %>
                    <span class="label label-info">CLIENTE</span>
                    <% } %>

                    <% if (usuario.Tipo.Equals(2))
                        { %>
                    <span class="label label-info">RECEPCIÓN</span>
                    <% } %>

                    <% if (usuario.Tipo.Equals(3))
                        { %>
                    <span class="label label-info">ADMIN</span>
                    <% } %>
                    </center>
                        </td>

                        <td>
                            <center>
                    <% if (usuario.Activo)
                        {%>
                        <span class="label label-success">ACTIVO</span>
                    <% }
                        else
                        { %>
                    <span class="label label-warning">INACTIVO</span>
                    <% }  %> 
                        </center>
                        </td>

                        <%if (usuarioEntity != null)
                        {%>
                        <% if (string.IsNullOrEmpty(Request.QueryString["mode"]))
                            {%>
                        <% if (usuarioEntity.Tipo.Equals(2))
                            {%>
                        <td><a href="recepcion?action=AUsuarios&id=<% =usuario.Id_usuario %>" class="addProduct btn btn-lg btn-rounded btn-warning">EDITAR</a></td>
                        <td><a href="recepcion?action=perfil&id=<% =usuario.Id_cliente %>" class="addProduct btn btn-lg btn-rounded btn-warning">VER PERFIL</a></td>

                        <% }%>

                        <% if (usuarioEntity.Tipo.Equals(3))
                            {%>
                        <td><a href="admin?action=AUsuarios&id=<%=usuario.Id_usuario %>" class="addProduct btn btn-lg btn-rounded btn-warning">EDITAR</a></td>
                        <td><a href="admin?action=perfil&id=<%=usuario.Id_cliente %>" class="addProduct btn btn-lg btn-rounded btn-warning">VER PERFIL</a></td>
                        <% }%>
                        <%}
                        else
                        {%>

                        <%if (Request.QueryString["mode"].Equals("onboocking") && !string.IsNullOrEmpty(Request.QueryString["h"]))
                            {%>
                        <td></td>

                        <% if (usuarioEntity.Tipo.Equals(2))
                            {%>
                                <td><a href="recepcion?action=reservando&u=<%=usuario.Id_usuario %>&h=<% =Request.QueryString["h"]%>" class="addProduct btn btn-lg btn-rounded btn-warning">ELEGIR</a></td>

                        <% }%>

                        <% if (usuarioEntity.Tipo.Equals(3))
                            {%>
                                <td><a href="admin?action=reservando&u=<%=usuario.Id_usuario %>&h=<% =Request.QueryString["h"]%>" class="addProduct btn btn-lg btn-rounded btn-warning">ELEGIR</a></td>
                        <% }%>


                        <%} %>
                        <%} %>
                        <%} %>
                    </tr>

                    <%  } %>
                </tbody>
            </table>
        </div>
        <!-- Records List End -->
    </div>

</asp:Panel>
