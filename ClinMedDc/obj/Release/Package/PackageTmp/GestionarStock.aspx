<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="GestionarStock.aspx.cs" Inherits="PaginaWebClinina.GestionarStock" ClientIDMode="Static"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="content-header">
        <h1 style="text-align: center">REGISTRO DE MEDICAMENTOS STOCK&nbsp;&nbsp;
            <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl="~/img/medicamentos.png" Width="75px" />
                        </h1>
    </section>
    <section class="content">
        <div Style="width:100%" class="row">
                <div class="box box-primary" style="align-content:center">
                    <div class="box-body">
                        <div class="form-group" align="center">
                            <label>APARTADO DE STOCK, AQUI SE MUESTRA LOS MEDICAMENTOS QUE ESTAN POR ACABARSE</label></div>
                    </div>
                </div>
            </div>

        <div align="center">
            <table>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        &nbsp;</td>
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
                        <table id="tbl_stock" class="table table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre laboratorio</th>
                                    <th>Nombre Medicamento</th>
                                    <th>Fecha Vencimiento</th>
                                    <th>Fecha Entrada</th>
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

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <script src="js/stock.js" type="text/javascript"></script>
</asp:Content>



