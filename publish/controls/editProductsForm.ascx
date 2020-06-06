<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="editProductsForm.ascx.cs" Inherits="BookingSystem.editProductsForm" %>

<asp:Panel ID="pnlEditProductsForm" runat="server">

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

                    <asp:Label ID="lblTitle" runat="server" Text="Título de actividad"></asp:Label>
                    <% if (tipo.Equals(2)) { %>
                        <a href="recepcion?action=LstHabitaciones" class="btn btn-sm btn-outline-info">Ver listado completo</a>
                    <% } %>
                    
                    <% if (tipo.Equals(3)) { %>
                        <a href="admin?action=LstHabitaciones" class="btn btn-sm btn-outline-info">Ver listado completo</a>
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
                <h6 class="h6">Agregar una nueva clasificación</h6>
                <% if (tipo.Equals(3))
                    {
                        string id = Request.QueryString["id"];
                        if (!string.IsNullOrEmpty(id))
                        { %>
                            <asp:Button ID="btnEliminarClasificacion" class="btn btn-rounded btn-danger" runat="server" Text="Eliminar esta clasificación" OnClick="btnEliminarClasificacion_Click"/>
                     <% }
                    } %>
            </div>

            <!-- Tab Content Start -->
            <div class="tab-content">
                <!-- Tab Pane Start -->
                <div class="tab-pane fade show active" id="tab01">
                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Nombre: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtNombre" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Descripción:</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtDescripcion" class="form-control" runat="server" TextMode="MultiLine" required="true"></asp:TextBox>
                        </div>
                    </div>

                     <div class="form-group row">

                        <span class="label-text col-md-3 col-form-label">Cantidad de habitaciones: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtCantdHabitaciones" class="form-control" runat="server" min="0" required="true" TextMode="Number" step="any"></asp:TextBox>
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

</asp:Panel>
