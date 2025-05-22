<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpItem.aspx.cs" Inherits="ITPItemExchange.wpItem" MasterPageFile="~/mpPrincipal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2>Registrar Ítem</h2>
        <div class="row g-3">
            <div class="col-md-6">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Nombre del Ítem" />
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" Placeholder="Descripción" />
            </div>
            <div class="col-md-6">
                <asp:FileUpload ID="fuImagen" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <asp:Label ID="lblUsuario" runat="server" CssClass="form-text" />
            </div>
            <div class="col-12">
                <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Text="Registrar Ítem" OnClick="btnRegistrar_Click" />
            </div>
            <div class="col-12 mt-3">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-info" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>
