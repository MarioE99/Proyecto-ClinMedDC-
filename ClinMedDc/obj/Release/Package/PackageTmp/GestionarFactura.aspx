<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="GestionarFactura.aspx.cs" Inherits="PaginaWebClinina.GestionarFactura" ClientIDMode="Static"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content-header">
        <h1 style="text-align: center">REGISTRO DE FACTURA&nbsp;
                            </h1>
    </section>
    <section class="content">
        <div Style="width:100%" class="row">
                <div class="box box-primary">
                    <div class="box-body">
                       
                        <div class="form-group">
                            <label>NOMBRE DEL CLIENTE</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtCliente" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="NOMBRE DEL MEDICAMENTO"></asp:Label>
                            <asp:TextBox ID="txtMedicamento" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>  
                         <div class="form-group">
                             <asp:Label ID="Label3" runat="server" Text="FECHA"></asp:Label>
                            <asp:TextBox ID="txtFecha" runat="server" Text="" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div> 
                         <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="TOTAL"></asp:Label>
                            <asp:TextBox ID="txtTotal" runat="server" Text="" CssClass="form-control"></asp:TextBox>
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
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnDetalle" runat="server" CssClass="btn-tumblr disabled active" Width="200px" Text="Detalle" OnClick="btnDetalle_Click" Height="36px"/>
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
                        <h3 class="box-title">Lista de Factura</h3>
                    </div>
                    <div class="box-body table-responsive">
                        <table id="tbl_factura" class="table table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre del cliente</th>
                                    <th>Nombre de el Medicamento</th>
                                    <th>Fecha</th> 
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
     <script src="js/factura.js" type="text/javascript"></script>
</asp:Content>



