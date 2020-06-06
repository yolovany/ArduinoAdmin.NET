<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="editPayMethodForm.ascx.cs" Inherits="BookingSystem.controls.editPayMethodForm" %>

<asp:panel runat="server" id="pnlEditPayMethodForm">

     <!-- Edit Product Start -->
    <div class="panel">
        <!-- Records Header Start -->
        <div class="records--header">
            <% 
                int tipo = 0;
                if (Session["USUARIO"] != null)
                {
                    Entitys.UsuarioEntity usuarioEntity = (Entitys.UsuarioEntity)Session["USUARIO"];
                    if (usuarioEntity != null)
                        tipo = usuarioEntity.Tipo;
                }
            %>
            <div class="title fa-th">
                <h3 class="h3">

                    <asp:Label ID="lblTitle" runat="server" Text="Métodos de pago"></asp:Label>
                    <% if (tipo.Equals(1)) { %>
                        <a href="clientes?action=paymethod" class="btn btn-sm btn-outline-info">Ver mis métodos de pago</a>
                    <% } %>
                    
                    <% if(!string.IsNullOrEmpty(Request.QueryString["u"]) && !string.IsNullOrEmpty(Request.QueryString["h"]) 
                            && !string.IsNullOrEmpty(Request.QueryString["onbooking"]) && Request.QueryString["onbooking"].Equals("1")) {%>
                    <% if (tipo.Equals(2)) { %>
                        <a href="recepcion?action=paymethod&u=<% =Request.QueryString["u"]%>&h=<% =Request.QueryString["h"]%>&onbooking=1" class="btn btn-sm btn-outline-info">Ver listado completo</a>
                    <% } %>

                    <% if (tipo.Equals(3)) { %>
                        <a href="admin?action=paymethod&u=<% =Request.QueryString["u"]%>&h=<% =Request.QueryString["h"]%>&onbooking=1" class="btn btn-sm btn-outline-info">Ver listado completo</a>
                    <% } %>

                    <% } %>
                </h3>
            </div>
        </div>
        <!-- Records Header End -->
    </div>

    <div class="panel">
        <!-- Edit Product Start -->
        <div class="records--body">
            <div class="title">
                <h6 class="h6">Agrega una nuevo método de pago</h6>
                <!--<asp:Button ID="btnEliminarMetodoDePago" class="btn btn-rounded btn-danger" runat="server" Text="Eliminar método" OnClick="btnEliminarMetodoDePago_Click" />-->
            </div>

            <!-- Tab Content Start -->
            <div class="tab-content">
                <!-- Tab Pane Start -->
                <div class="tab-pane fade show active" id="tab01">
                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Nombre(s) del titular: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="tbxNombre" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Apellido(s) del titular: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="tbxApellidos" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>

                     <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Número de tarjeta: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="tbxNumeroTarjeta" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>

                     <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Tipo: *</span>

                        <div class="col-md-9">
                            <asp:DropDownList ID="ddlTipoTarjeta" class="btn btn-rounded btn-info dropdown-toggle dropdown-toggle-split" runat="server"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Fecha de expiración: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="tbxFechaExpiracion" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-9 offset-md-3">
                            <asp:Button ID="btnGuardar" class="btn btn-rounded btn-success" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                        </div>
                    </div>
                </div>
                <!-- Tab Pane End -->
            </div>
            <%--<!-- Tab Content End -->--%>
        </div>
        <!-- Edit Product End -->
    </div>
</asp:panel>
