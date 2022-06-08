<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PaginaWebClinina.login" %>
<!DOCTYPE html>
<html  style="background-image:url(/img/fondologin.jpg)" background-size: cover xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login Clinica</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
   <link rel="icon" href="img/clinica_318-1538.jpg" />
</head>
 
<body style="background-image:url(/img/fondologin.jpg)" background-size: cover;>
    <form id="form1" runat="server">
    <div class="form-box" id="login-box">
      <asp:Login ID="LoginUser" runat="server" EnableViewState="false" OnAuthenticate="LoginUser_Authenticate" Width="88%">
         <LayoutTemplate>
             <div class="header bg-blue">Bienvenido a ClinMed DC </div>
                    <div class="body bg-gray">
                        <div class="form-group">
                              <div style="margin-left: auto; margin-right: auto; text-align: center;">
                                <asp:Image ID="Image1" runat="server" Height="72px" ImageUrl="~/img/loginusuario.png" Width="73px" />
                                <div style="margin-left: auto; margin-right: auto; text-align: center;">
                                <asp:Label ID="label1" runat="server" Text="Usuario:" Font-Bold="True" Font-Size="X-Large" CssClass="StrongText"></asp:Label>
                            <div>
                            <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Usuario" Width="464px"></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <asp:Label ID="label2" runat="server" Text="Contraseña:" Font-Bold="True" Font-Size="X-Large" CssClass="StrongText"></asp:Label>
                            <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnIngresar" CommandName="Login" runat="server" Text="Ingresar" CssClass="btn bg-blue btn-block" BorderStyle="Inset" />
                    </div>
              </LayoutTemplate>
       </asp:Login>

    </div>
    </form>

</body>
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</html>
