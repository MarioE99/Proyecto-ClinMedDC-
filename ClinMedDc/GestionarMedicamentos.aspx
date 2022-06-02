<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="GestionarMedicamentos.aspx.cs" Inherits="PaginaWebClinina.GestionarMedicamento" ClientIDMode="Static"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="content-header">
        <h1 style="text-align: center">REGISTRO DE MEDICAMENTOS&nbsp;&nbsp;
            <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl="~/img/medicamentos.png" Width="75px" />
                        </h1>
    </section>
    <section class="content">
        <div Style="width:100%" class="row">
                <div class="box box-primary">
                    <div class="box-body">
                       
                        <div class="form-group">
                            <label>NOMBRE DE MEDICAMENTO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombreMedicamento" runat="server" Text="" CssClass="form-control" Width="400px"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>FECHA DE VENCIMIENTO</label>
                        </div>
                        <div class="form-group" >
                            <asp:Label ID="Fecha" runat="server" Text="Fecha"></asp:Label>
                            <asp:TextBox ID="txtVencimiento" runat="server" TextMode="Date" Width="215px" ></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>FECHA DE ENTRADA</label>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Fecha"></asp:Label>
                            <asp:TextBox ID="txtEntrada" runat="server" TextMode="Date" Width="215px"  ></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>CANTIDAD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtCantidad" runat="server" Text="" CssClass="form-control" Width="100px"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>PRECIO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtPrecio" runat="server" Text="" CssClass="form-control" MaxLength="8" Width="100px"></asp:TextBox>
                        </div>

                         <div class="form-group">
                          <label>LABORATORIO</label>
                          <asp:DropDownList ID="ddlLaboratorio" CssClass="form-control" runat="server" Width="400px"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

        <div align="center">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Width="200px" Text="Registrar" OnClick="btnRegistrar_Click" />
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger" Width="200px" Text="Cancelar" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <!-- Datatable Part -->

        <div class="row" style="width:100%">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Lista de Médicamentos</h3>
                    </div>
                    <div class="box-body table-responsive">
                        <table id="tbl_medicamentos" class="table table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre laboratorio</th>
                                    <th>Nombre Medicamento</th>
                                     <th>Fecha Vencimiento</th>
                                     <th>Fecha Entrada</th>
                                    <th>Cantidad</th>
                                    <th>Total</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Datatable -->
    </section>


     <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Actualizar registro</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>NOMBRE DE MEDICAMENTO</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtName" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <!--div class="form-group">
                        <label>FECHA DE VENCIMIENTO</label>
                    </!--div>
                    <div class="form-group">
                        <asp:TextBox ID="txtVencimientoModal"  runat="server" Text="" CssClass="form-control" Enabled="true" TextMode="Date" ></asp:TextBox>
                    </div-->
                     <!--div class="form-group">
                        <label>FECHA DE ENTRADA</label>
                    </!--div>
                    <div class="form-group">
                        <asp:TextBox ID="txtEntradaModal" runat="server" Text="" CssClass="form-control" Enabled="true" Font-Underline="True" TextMode="Date"></asp:TextBox>
                    </div-->
                    <div class="form-group">
                        <label>CANTIDAD</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtCantidadModal" runat="server" Text="" CssClass="form-control" Enabled="true" ></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>PRECIO</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPrecioModal" runat="server" Text="" CssClass="form-control" Enabled="true"></asp:TextBox>
                    </div>
                  </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnactualizar">Actualizar</button>
                </div>
            </div>
         </div>
     </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <script src="js/medicamento.js" type="text/javascript"></script>
</asp:Content>



