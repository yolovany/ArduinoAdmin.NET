<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiderarNavigationForm.ascx.cs" Inherits="BookingSystem.controls.SiderarNavigationForm" %>
<div class="sidebar--nav">
    <ul>
        <asp:Panel ID="pnlSectionClasificaciones" runat="server">
            <li>
                <a href="#">
                    <i class="fa fa-home"></i>
                    <span>Clasificaciones</span>
                </a>

                <ul>
                    <li>
                        <asp:LinkButton ID="lbtVerListaClasificaciones" runat="server" OnClick="lbtVerListaClasificaciones_Click">
                            Ver lista de clasificaciones</asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="lbtAltaClasificaciones" runat="server" OnClick="lbtAltaClasificaciones_Click">
                            Dar de alta nueva clasificación</asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="lbtPreciosClasificaciones" runat="server" OnClick="lbtPreciosClasificaciones_Click" >
                            Precios de clasificaciones</asp:LinkButton>
                    </li>
                </ul>
            </li>
        </asp:Panel>

        <asp:Panel ID="pnlSectionReservaciones" runat="server">

            <li>
                <a href="#">
                    <i class="far fa-address-book"></i>
                    <span>Reservaciones</span>
                </a>

                <ul>
                    <asp:LinkButton ID="lbtReservar" runat="server" OnClick="btnReservar_Click">Nueva reservación</asp:LinkButton>
                    <asp:LinkButton ID="lbtTimelineBook" runat="server" OnClick="lbtTimelineBook_Click">Linea del tiempo</asp:LinkButton>
                    <asp:LinkButton ID="lbtReservaciones" runat="server" OnClick="lbtReservaciones_Click">Historial de reservaciones</asp:LinkButton>
                </ul>
            </li>

        </asp:Panel>

        <asp:Panel ID="pnlSectionMiCuenta" runat="server">

            <li>
                <a href="#">
                    <i class="far fa-address-book"></i>
                    <span>Mi cuenta</span>
                </a>

                <ul>
                    <asp:LinkButton ID="lbtMetodosDePago" runat="server" OnClick="lbtMetodosDePago_Click">Métodos de pago</asp:LinkButton>
                    <asp:LinkButton ID="lbtAgregarMetodoPago" runat="server" OnClick="lbtAgregarMetodoPago_Click" >Agregar nuevo método de pago</asp:LinkButton>
                </ul>
            </li>

        </asp:Panel>

        <asp:Panel ID="pnlSectionUsuarios" runat="server">

            <li>
                <a href="#">
                    <i class="far fa-address-book"></i>
                    <span>Usuarios</span>
                </a>

                <ul>
                    <asp:LinkButton ID="lbtVerListaUsuarios" runat="server" OnClick="lbtVerListaUsuarios_Click">Ver lista de usuarios</asp:LinkButton>
                    <asp:LinkButton ID="lbtCrearUsuario" runat="server" OnClick="lbtCrearUsuario_Click">Crear nuevo usuario</asp:LinkButton>
                </ul>
            </li>

        </asp:Panel>

    </ul>
</div>
