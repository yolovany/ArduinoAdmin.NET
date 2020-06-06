<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="editPriceRoomsForm.ascx.cs" Inherits="BookingSystem.controls.editPriceRoomsForm" %>

<asp:panel runat="server" id="pnlEditPriceRoomsForm">

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
                    <asp:Label ID="lblTitle" runat="server" Text="Administrador de precios de clasificaciones"></asp:Label>
                    <% if (tipo.Equals(3)) { %>
                        <a href="admin?action=pricerooms" class="btn btn-sm btn-outline-info">Ver listado completo</a>
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
                <h6 class="h6">Agrega una nuevo precio</h6>
                <asp:Button ID="btnEliminarPrecio" class="btn btn-rounded btn-danger" runat="server" Text="Eliminar precio" OnClick="btnEliminarPrecio_Click" />
            </div>

            <!-- Tab Content Start -->
            <div class="tab-content">
                <!-- Tab Pane Start -->
                <div class="tab-pane fade show active" id="tab01">

                     <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Clasificación: *</span>

                        <div class="col-md-9">
                            <asp:DropDownList ID="ddlClasificacion" class="btn btn-rounded btn-info dropdown-toggle dropdown-toggle-split" runat="server"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Precio normal: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="tbxPrecioNormal" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-2 col-form-label text-md-right py-0">Sólo los días: </span>

                        <div class="col-md-10 form-inline">

                            <label class="form-check mr-3">
                                <input type="checkbox" class="form-check-input" runat="server" id="cbxLunes">
                                <span class="form-check-label">Lunes</span>
                            </label>

                            <label class="form-check mr-3">
                                <input type="checkbox" class="form-check-input" runat="server" id="cbxMartes">
                                <span class="form-check-label">Martes</span>
                            </label>

                            <label class="form-check mr-3">
                                <input type="checkbox" class="form-check-input" runat="server" id="cbxMiercoles">
                                <span class="form-check-label">Miércoles</span>
                                </label>

                            <label class="form-check mr-3">
                                <input type="checkbox" class="form-check-input" runat="server" id="cbxJueves">
                                <span class="form-check-label">Jueves</span>
                                </label>

                            <label class="form-check mr-3">
                                <input type="checkbox" class="form-check-input" runat="server" id="cbxViernes">
                                <span class="form-check-label">Viernes</span>
                                </label>

                            <label class="form-check mr-3">
                                <input type="checkbox" class="form-check-input" runat="server" id="cbxSabado">
                                <span class="form-check-label">Sábado</span>
                                </label>

                            <label class="form-check mr-3">
                                <input type="checkbox" class="form-check-input" runat="server" id="cbxDomingo">
                                <span class="form-check-label">Domingo</span>
                                </label>


                        </div>

                        <br />

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Máximo huéspedes por reservación: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="tbxMaximoHuespedes" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">monto extra (se le añadirá al cobro de la reservación si excede el máximo de huéspedes): *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="tbxMontoExtra" class="form-control" runat="server" required="true"></asp:TextBox>
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