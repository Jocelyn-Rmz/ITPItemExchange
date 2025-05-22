<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpLogin.aspx.cs" MasterPageFile="~/mpPrincipal.Master" Inherits="ITPItemExchange.wpLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2>Iniciar Sesión</h2>
        <div class="row g-3">
            <div class="col-md-6">
                <asp:TextBox ID="txtNoControl" runat="server" CssClass="form-control" Placeholder="No. Control" />
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" Placeholder="Correo electrónico" />
            </div>
            <div class="col-12">
                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Iniciar sesión" OnClick="btnLogin_Click" />
            </div>
            <div class="col-12 mt-3">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>