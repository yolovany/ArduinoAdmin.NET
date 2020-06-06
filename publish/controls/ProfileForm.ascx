<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileForm.ascx.cs" Inherits="BookingSystem.controls.ProfileForm" %>

<asp:Panel ID="pnlProfileForm" runat="server">
    <div class="row gutter-20">

        <% Entitys.UsuarioEntity usuarioEntity = null;
            if (!string.IsNullOrEmpty(Request.QueryString["c"]))
            {
                Business.UsuariosDALC usuariosDALC = new Business.UsuariosDALC();
                usuarioEntity = (Entitys.UsuarioEntity)Session["USUARIO"];
            }
            else
            {
                usuarioEntity = (Entitys.UsuarioEntity)Session["USUARIO"];
            } %>

        <% if(usuarioEntity!=null) { %>
        <div class="col-lg-8">
            <!-- Panel Start -->
            <div class="panel profile-cover">
                <div class="profile-cover__img">
                    <img src="assets/img/avatars/01_150x150.png" alt="">
                    <h3 class="h3"><%=usuarioEntity.Nombre.Split(' ')[0] %></h3>
                </div>

                <div class="profile-cover__action" data-bg-img="assets/img/covers/01_800x150.jpg" data-overlay="0.3">
                    <br /><br />
                    <!--<button class="btn btn-rounded btn-info">
                        <i class="fa fa-plus"></i>
                        
                    </button>

                    <button class="btn btn-rounded btn-info">
                        <i class="fa fa-comment"></i>
                        <span>Message</span>
                    </button> -->
                </div>

                <div class="profile-cover__info">
                    <ul class="nav">
                        <li><strong>26</strong>Reservaciones</li>
                        <li><strong>33</strong>Visitas</li>
                        <li><strong></strong></li>
                    </ul>
                </div>
            </div>
            <!-- Panel End -->

            <!-- Panel Start -->
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Comentarios de los administradores</h3>
                </div>

               
                <div class="panel-content panel-activity">
                    <% if(usuarioEntity.Tipo.Equals(2) || usuarioEntity.Tipo.Equals(3)) { %>
                    <form action="#" class="panel-activity__status">
                        <asp:TextBox ID="tbxAsunto" class="form-control" placeholder="Asunto del comentario" runat="server"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="tbxComentario" placeholder="¿Qué opina sobre este cliente? agregue una descripción sobre el asunto del comentario." class="form-control" runat="server" TextMode="MultiLine" ></asp:TextBox>
                        <br />
                        <div class="actions">
                            <asp:Button ID="btnAgregarComentario" class="btn btn-sm btn-rounded btn-info" runat="server" Text="Agregar comentario" OnClick="btnAgregarComentario_Click" />
                        </div>
                    </form>
                    <br />
                     <% } %>

                    <% Business.ComentariosDALC comentariosDALC = new Business.ComentariosDALC(); %>
                    <% Business.UsuariosDALC usuariosDALC = new Business.UsuariosDALC(); %>
                    <% List<Entitys.ComentarioEntity> lst = new List<Entitys.ComentarioEntity>(); %>
                    <% if(usuarioEntity.Tipo.Equals(1)) { lst = comentariosDALC.MostrarComentarios(usuarioEntity.Id_cliente); } %>
                    <% else { string id = Request.QueryString["id"]; if (!string.IsNullOrEmpty(id)) { lst = comentariosDALC.MostrarComentarios(Convert.ToUInt32(id)); } }%>
                    <% foreach (Entitys.ComentarioEntity comentario in lst) { %>
                    <ul class="panel-activity__list">

                        <%Entitys.UsuarioEntity quienComenta = usuariosDALC.MostrarUsuarioPorID(comentario.Id_usuario.ToString()); %>
                        <%if (quienComenta != null) { %>
                        <li>
                            <i class="activity__list__icon fas fa-question-circle"></i>

                            <div class="activity__list__header">
                                <img src="assets/img/avatars/01_40x40.png" alt="">
                                <%if (usuarioEntity != null && usuarioEntity.Tipo.Equals(1)){  %>
                                <a href="#"><% =quienComenta.Nombre %></a> Agregó un comentario sobre ti: <a href="#"><% =comentario.Titulo %></a>
                                <%} %>
                                <%if (usuarioEntity != null && (usuarioEntity.Tipo.Equals(2) || usuarioEntity.Tipo.Equals(3))){  %>
                                   <a href="#"><% =quienComenta.Nombre %></a> Agregó un comentario sobre este cliente: <a href="#"><% =comentario.Titulo %></a>
                                <%} %>
                            </div>

                            <div class="activity__list__body entry-content">
                                <p><% =comentario.Comentario %></p>
                            </div>

                            <div class="activity__list__footer">
                                <span><i class="far fa-clock"></i><%=comentario.Fecha %></span>
                            </div>
                        </li>
                    </ul>
                       <% } %>
                    <% } %>
                </div>


                
            </div>
            <!-- Panel End -->
        </div>

        <div class="col-lg-4">
            <!-- Panel Start -->
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Información</h3>
                </div>

                <% Business.ClientesDALC clientesDALC = new Business.ClientesDALC(); %>
                <% Entitys.ClienteEntity cliente = clientesDALC.MostrarClienteById(usuarioEntity.Id_cliente.ToString()); %>
                <% if (cliente != null && !string.IsNullOrEmpty(cliente.Nombre))
                    {%>
                <div class="panel-content panel-about">
                    <table>
                        <tr>
                            <p><%=cliente.Nombre %></p>
                        </tr>
                        <tr>
                            <th><i class="fas fa-birthday-cake"></i>Cumpleaños</th>
                            <% string[] date = cliente.Fecha_nacimiento.Split('-'); %>
                            <% %>
                            <td><%=new DateTime(Convert.ToInt32(date[0]), Convert.ToInt32(date[1]), Convert.ToInt32(date[2])).ToLongDateString() %></td>
                        </tr>
                        <tr>
                            <th><i class="fas fa-map-marker-alt"></i>Estado</th>
                            <td><%=cliente.Estado %>, <%=cliente.Pais %></td>
                        </tr>
                        <tr>
                            <th><i class="fas fa-globe"></i>Correo</th>
                            <td><%=cliente.Correo_usuario %></td>
                        </tr>
                        <tr>
                            <th><i class="fas fa-mobile-alt"></i>Teléfono</th>
                            <td><a class="btn-link"><%=cliente.Telefono %></a></td>
                        </tr>
                    </table>
                </div>

                <!--<div class="panel-social">
                    <ul class="nav">
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                        <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                        <li><a href="#"><i class="fab fa-behance"></i></a></li>
                        <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                    </ul>
                </div> -->

                <%} %>
            </div>
            <!-- Panel End -->

            <% } %>
            <!-- Panel Start
            <div class="panel">
                <div class="weather--panel text-white bg-blue">
                    <div class="weather--title">
                        <i class="fa fa-map-marker-alt"></i>
                        <span>Dhaka, Bangladesh</span>
                    </div>

                    <div class="weather--info">
                        <i class="wi wi-rain-wind"></i>
                        <span>33°C</span>
                    </div>
                </div>
            </div>
            <!-- Panel End -->

            <!-- Panel Start
            <div class="panel">
                <div class="weather--panel text-white bg-orange">
                    <div class="weather--title">
                        <i class="fa fa-map-marker-alt"></i>
                        <span>Melbourne, Autoria</span>
                    </div>

                    <div class="weather--info">
                        <i class="wi wi-hot"></i>
                        <span>35°C</span>
                    </div>
                </div>
            </div>
            <!-- Panel End -->

            <!-- Panel Start
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">To-Do List</h3>

                    <div class="dropdown">
                        <button type="button" class="btn-link dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-ellipsis-v"></i>
                        </button>

                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-sync"></i>Update Data</a></li>
                            <li><a href="#"><i class="fa fa-times"></i>Remove Panel</a></li>
                        </ul>
                    </div>
                </div>

                <div class="todo--panel">
                    <form action="#">
                        <ul class="list-group" data-trigger="scrollbar">
                            <li class="list-group-item">
                                <label class="todo--label">
                                    <input type="checkbox" name="checkbox" value="1" class="todo--input" checked>
                                    <span class="todo--text">Schedule Meeting</span>
                                </label>

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="todo--remove" href="#">×</a>
                            </li>
                            <li class="list-group-item">
                                <label class="todo--label">
                                    <input type="checkbox" name="checkbox" value="2" class="todo--input">
                                    <span class="todo--text">Call Clients To Follow-Up</span>
                                </label>

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="todo--remove" href="#">×</a>
                            </li>
                            <li class="list-group-item">
                                <label class="todo--label">
                                    <input type="checkbox" name="checkbox" value="3" class="todo--input" checked>
                                    <span class="todo--text">Book Flight For Holiday</span>
                                </label>

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="todo--remove" href="#">×</a>
                            </li>
                            <li class="list-group-item">
                                <label class="todo--label">
                                    <input type="checkbox" name="checkbox" value="4" class="todo--input">
                                    <span class="todo--text">Forward Important Tasks</span>
                                </label>

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="todo--remove" href="#">×</a>
                            </li>
                            <li class="list-group-item">
                                <label class="todo--label">
                                    <input type="checkbox" name="checkbox" value="6" class="todo--input">
                                    <span class="todo--text">Important Tasks</span>
                                </label>

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="todo--remove" href="#">×</a>
                            </li>
                        </ul>

                        <div class="input-group">
                            <input type="text" name="todo" placeholder="Add New Task" class="form-control" autocomplete="off" required>

                            <div class="input-group-btn">
                                <button type="submit" class="btn-link">+</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Panel End -->

            <!-- Panel Start
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Feeds &amp; Activities</h3>

                    <div class="dropdown">
                        <button type="button" class="btn-link dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-ellipsis-v"></i>
                        </button>

                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-sync"></i>Update Data</a></li>
                            <li><a href="#"><i class="fa fa-times"></i>Remove Panel</a></li>
                        </ul>
                    </div>
                </div>

                <div class="feeds-panel">
                    <ul class="nav">
                        <li>
                            <span class="time">2 mins</span>
                            <i class="fa fa-shopping-cart text-white bg-blue"></i>
                            <span class="text">New Order Received</span>
                        </li>
                        <li>
                            <span class="time">10 mins</span>
                            <i class="fa fa-user text-white bg-orange"></i>
                            <span class="text">Updated Profile Picture</span>
                        </li>
                        <li>
                            <span class="time">20 mins</span>
                            <i class="fa fa-comment text-white bg-red"></i>
                            <span class="text"><a href="#">John Doe</a> Commented on <a href="#">News #123</a></span>
                        </li>
                        <li>
                            <span class="time">21 mins</span>
                            <i class="fa fa-shopping-cart text-white bg-blue"></i>
                            <span class="text">New Order Received</span>
                        </li>
                        <li>
                            <span class="time">25 mins</span>
                            <i class="fa fa-user text-white bg-green"></i>
                            <span class="text">New User Registered</span>
                        </li>
                        <li>
                            <span class="time">25 mins</span>
                            <i class="fa fa-times text-white bg-dark"></i>
                            <span class="text">Order <a href="#">#24DP01</a> Rejected</span>
                        </li>
                        <li>
                            <span class="time">2 hours</span>
                            <i class="fa fa-comment text-white bg-red"></i>
                            <span class="text"><a href="#">John Doe</a> Commented on <a href="#">News #123</a></span>
                        </li>
                        <li>
                            <span class="time">3 hours</span>
                            <i class="fa fa-user text-white bg-orange"></i>
                            <span class="text">You Uploaded A Image</span>
                        </li>
                        <li>
                            <span class="time">4 hours</span>
                            <i class="fa fa-shopping-cart text-white bg-blue"></i>
                            <span class="text">New Order Received</span>
                        </li>
                        <li>
                            <span class="time">8 hours</span>
                            <i class="fa fa-user text-white bg-green"></i>
                            <span class="text">New User Registered</span>
                        </li>
                        <li>
                            <span class="time">22 hours</span>
                            <i class="fa fa-shopping-cart text-white bg-blue"></i>
                            <span class="text">New Order Received</span>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Panel End -->
        </div>
    </div>
</asp:Panel>
