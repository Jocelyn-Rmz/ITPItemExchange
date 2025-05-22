<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpPrestamo.aspx.cs" Inherits="ITPItemExchange.wpPrestamo" MasterPageFile="~/mpPrincipal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2>Registrar Préstamo</h2>
        <div class="row g-3">
            <div class="col-md-4">
                <asp:TextBox ID="txtItemId" runat="server" CssClass="form-control" Placeholder="ID del ítem" />
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtLugar" runat="server" CssClass="form-control" Placeholder="Lugar de entrega" />
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblUsuario" runat="server" CssClass="form-text text-muted" />
            </div>
            <div class="col-12">
                <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-success" Text="Registrar Préstamo" OnClick="btnRegistrar_Click" />
            </div>
            <div class="col-12 mt-3">
                <asp:Label ID="lblMensaje" runat="server" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>
