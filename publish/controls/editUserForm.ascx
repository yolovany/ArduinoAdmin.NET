<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="editUserForm.ascx.cs" Inherits="BookingSystem.controls.editUserForm" %>

<asp:Panel ID="pnlEditUserForm" runat="server">

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
                        <a href="recepcion?action=LstUsuarios" class="btn btn-sm btn-outline-info">Ver listado completo</a>
                    <% } %>
                    
                    <% if (tipo.Equals(3)) { %>
                        <a href="admin?action=LstUsuarios" class="btn btn-sm btn-outline-info">Ver listado completo</a>
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
                <h6 class="h6">
                    <asp:Label ID="lblTittleEditUserForm" runat="server" Text="Alta de nuevos usuarios"></asp:Label></h6>
                <!--<asp:Button ID="btnEditarStatus" class="btn btn-rounded btn-danger" runat="server" Text="Dar de baja" /> -->
            </div>

            <!-- Tab Content Start -->
            <div class="tab-content">
                <!-- Tab Pane Start -->
                <div class="tab-pane fade show active">
                    <asp:Panel ID="pnlCorreoPassStatusTipo" runat="server">

                        <div class="form-group row">
                        <asp:Label runat="server" ID="spanCorreo" class="label-text col-md-3 col-form-label" Text="Correo: *"></asp:Label>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtCorreoUsuario" class="form-control" runat="server" TextMode="Email" requered="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Contraseña: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtPassword" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row ">
                        <span class="label-text col-md-3 col-form-label">Tipo: *</span>
                        <div class="col-md-9 nav-link" title="Seleccione dos veces para confirmar">

                            <div class="btn-group btn-group-toggle d-block d-sm-flex" data-toggle="buttons">
                                <asp:Label ID="lblCbxCliente" runat="server" class="btn btn-rounded btn-outline-info btn-sm">
                                    <asp:RadioButton Text="Cliente" ID="cbxCliente" runat="server" OnCheckedChanged="cbxCliente_CheckedChanged" />
                                </asp:Label>

                                <asp:Label ID="lblCbxRecepcionista" runat="server" class="btn btn-rounded btn-outline-info btn-sm">
                                    <asp:RadioButton Text="Recepcionista" ID="cbxRecepcionista" runat="server" OnCheckedChanged="cbxRecepcionista_CheckedChanged" />
                                </asp:Label>

                                <asp:Label ID="lblCbxAdministrador" runat="server" class="btn btn-rounded btn-outline-info btn-sm">
                                    <asp:RadioButton Text="Administrador" ID="cbxAdministrador" runat="server" OnCheckedChanged="cbxAdministrador_CheckedChanged" />
                                </asp:Label>
                            </div>

                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Status: *</span>

                        <div class="col-md-9 nav-link" title="Seleccione dos veces para confirmar">
                            <div class="btn-group btn-group-toggle d-block d-sm-flex" data-toggle="buttons">

                                <asp:Label ID="lblCbxActivo" runat="server" class="btn btn-rounded btn-outline-info btn-sm">
                                    <asp:RadioButton Text="Activo" ID="cbxActivo" runat="server" AutoPostBack="True" OnCheckedChanged="cbxActivo_CheckedChanged" />
                                </asp:Label>

                                <asp:Label ID="lblCbxInactivo" runat="server" class="btn btn-rounded btn-outline-info btn-sm">
                                    <asp:RadioButton Text="Inactivo" ID="cbxInactivo" runat="server" AutoPostBack="True" OnCheckedChanged="cbxInactivo_CheckedChanged" />
                                </asp:Label>

                            </div>
                        </div>
                    </div>

                    </asp:Panel>
                     <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Nombre: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtNombre" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Fecha de nacimiento: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtFechaNacimiento" class="form-control" runat="server" required="true" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Teléfono: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtTelefono" class="form-control" runat="server" TextMode="Phone"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Estado: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtEstado" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Pais: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtPais" class="form-control" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <!-- Tab Pane End -->
            </div>
            <!-- Tab Content End -->
            <br />
            <!-- Tab Content Start -->
            <div class="tab-content">
                <!-- Tab Pane Start -->
                <div class="tab-pane fade show active" id="tab01">
                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Razón social: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtRazonSocialFac" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">RFC: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtRfcFac" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Calle: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtCalleFac" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Número exterior: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtNoExteriorFac" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Número interior: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtNoInteriorFac" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Colonia: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtColoniaFac" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Ciudad: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtCiudadFac" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Código postal: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtCpFac" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Estado: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtEstadoFac" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Código postal: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtPaisFac" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <span class="label-text col-md-3 col-form-label">Correo: *</span>

                        <div class="col-md-9">
                            <asp:TextBox ID="edtCorreoFac" class="form-control" runat="server" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <!-- Tab Pane End -->
            </div>
            <!-- Tab Content End -->
            <br />
            <asp:Button ID="btnGuardar" class="btn btn-rounded btn-success" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />

        </div>
        <!-- Edit Product End -->
    </div>

</asp:Panel>
