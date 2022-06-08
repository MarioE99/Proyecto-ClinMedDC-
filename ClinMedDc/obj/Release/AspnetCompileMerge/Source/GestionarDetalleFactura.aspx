<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="GestionarDetalleFactura.aspx.cs" Inherits="PaginaWebClinina.GestionarDetalleFactura" ClientIDMode="Static"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content-header">
        <h1 style="text-align: center">DETALLE DE FACTURA</h1>
    </section>
    <section class="content">
        <div Style="width:100%" class="row">
                <div class="box box-primary">
                    <div class="box-body">
                       
                        <div class="form-group">
                            <label>NOMBRE DEL CLIENTE</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlCliente" runat="server" Height="63px" Width="217px">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="labelprecio" runat="server" Text="PRECIO"></asp:Label>
                            <asp:TextBox ID="txtPrecioUnidad" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div> 
                          <div class="form-group">
                            <asp:Label ID="label1" runat="server" Text="CANTIDAD"></asp:Label>
                            <asp:TextBox ID="txtCantidad" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                              <asp:Label ID="Label2" runat="server" Text="Medicamento"></asp:Label>
                              <div>
                              </div>
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
                        <h3 class="box-title">Lista de Laboratorios</h3>
                    </div>
                    <div class="box-body table-responsive">
                        <table id="tbl_detalle" class="table table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>IdFactura</th>
                                    <th>Precio Unidad</th>  
                                    <th>Cantidad</th> 
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
                        <label>Nombre de laboratorio</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtNameLab" runat="server" Text="" CssClass="form-control"> </asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Descripcion</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtModalDescripcion" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                     </div>
                    <div class="form-group">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnactualizar">Actualizar</button>
                </div>
            </div>
        </div>
    </div>
 </div> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <script src="js/detalle.js" type="text/javascript"></script>
</asp:Content>



