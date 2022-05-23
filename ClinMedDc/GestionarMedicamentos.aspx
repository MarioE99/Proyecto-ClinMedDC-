<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="GestionarMedicamentos.aspx.cs" Inherits="PaginaWebClinina.GestionarMedicamento" ClientIDMode="Static"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section class="content-header">
        <h1 style="text-align: center">REGISTRO DE MEDICOS</h1>
    </section>
    <section class="content">
        <div Style="width:100%" class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                       
                        <div class="form-group">
                            <label>NOMBRE DE MEDICAMENTO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombreMedicamento" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>FECHA DE VENCIMIENTO</label>
                        </div>
                        <div class="form-group">
                            <asp:Calendar ID="calendarVencimiento" runat="server" Height="147px" Width="172px"></asp:Calendar>
                        </div>
                        <div class="form-group">
                            <label>FECHA DE ENTRADA</label>
                        </div>
                        <div class="form-group">
                            <asp:Calendar ID="calendarEntrada" runat="server" Height="99px" Width="159px"></asp:Calendar>
                        </div>
                        <div class="form-group">
                            <label>CANTIDAD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtCantidad" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>PRECIO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtPrecio" runat="server" Text="" CssClass="form-control" MaxLength="8"></asp:TextBox>
                        </div>

                         <div class="form-group">
                          <label>ESPECIALIDAD</label>
                          <asp:DropDownList ID="ddlLaboratorio" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <img src="img/medico-de-familia.jpg"/>
                        </div>
                       
                        <div class="form-group">
                            <label>Tipo Empleado</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTipoEmpleado" runat="server" Text="Medico" Enabled="false" CssClass="form-control"></asp:TextBox>
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
                        <h3 class="box-title">Lista de Médicos</h3>
                    </div>
                    <div class="box-body table-responsive">
                        <table id="tbl_medicamentos" class="table table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre laboratorio</th>
                                    <th>Nombre Medicamento</th>
                                    <th>Fecha de vencimiento</th>
                                    <th>Fecha de entrada</th>
                                    <th>Cantidad</th>
                                    <th>Precio</th>
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
                        <label>NOMBRES</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtName" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>AP_PATERNO</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPaterno" runat="server" Text="" CssClass="form-control" Enabled="false" ></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>AP_MATERNO</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtMaterno" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>DNI</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtDNI" runat="server" Text="" CssClass="form-control" ></asp:TextBox>
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



