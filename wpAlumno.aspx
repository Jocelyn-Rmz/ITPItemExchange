<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpAlumno.aspx.cs" Inherits="ITPItemExchange.wpAlumno" MasterPageFile="~/mpPrincipal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2>Registrar Alumno</h2>
        <div class="row g-3">
            <div class="col-md-6">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Nombre completo" />
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="txtNoControl" runat="server" CssClass="form-control" Placeholder="No. Control" />
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" Placeholder="Correo electrónico" />
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="txtCarrera" runat="server" CssClass="form-control" Placeholder="Carrera" />
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="txtUbicacion" runat="server" CssClass="form-control" Placeholder="Ubicación" />
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="txtHorario" runat="server" CssClass="form-control" Placeholder="Horario Disponible" />
            </div>
            <div class="col-12">
                <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Text="Registrar Alumno" OnClick="btnRegistrar_Click" />
            </div>
            <div class="col-12 mt-3">
                <asp:Label ID="lblMensaje" runat="server" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>
