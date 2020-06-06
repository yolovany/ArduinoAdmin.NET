<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiderarProfileForm.ascx.cs" Inherits="BookingSystem.SiderarProfileForm" %>

    <!-- Sidebar Profile Start -->
    <div class="sidebar--profile">

        <div class="profile--name">
            <span>
                <asp:Label ID="lblNombreUsuario2" class="btn-link" runat="server" Text="Nombre usuario"></asp:Label></span>
        </div>

        <div class="profile--nav">
            <ul class="nav">
                <% 
                    string id = string.Empty;
                    if (Session["USUARIO"] != null)
                    { %>

                            <%Entitys.UsuarioEntity usuario = (Entitys.UsuarioEntity)Session["USUARIO"]; %> 
                            <% if (usuario.Tipo.Equals(1))
                                {%>

                <li class="nav-item">
                    <a href="clientes?action=miperfil" class="nav-link" title="Mi perfil">
                        <i class="fa fa-user"></i>
                    </a>
                </li>
                            <% }%>
                     <% }%>
                
                <li class="nav-item">
                    <a href="admin?action=logout" class="nav-link" title="Salir">
                        <i class="fa fa-sign-out-alt"></i>
                    </a>

                </li>
            </ul>
        </div>
    </div>
