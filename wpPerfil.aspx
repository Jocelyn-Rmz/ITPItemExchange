<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpPerfil.aspx.cs" Inherits="ITPItemExchange.wpPerfil" MasterPageFile="~/mpPrincipal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .icono-perfil {
            width: 120px;
            height: 120px;
            margin: 0 auto 20px;
            display: block;
            border-radius: 50%;
            background-color: #e9ecef;
            padding: 20px;
        }

        .icono-perfil img {
            width: 100%;
            height: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <!-- Ícono de perfil -->
        <div class="text-center">
            <div class="icono-perfil">
                <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" alt="Perfil" />
            </div>
            <h2>Mi Perfil</h2>
        </div>

        <div class="row g-3 mt-4">
            <div class="col-md-6">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Nombre completo" />
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
                <asp:TextBox ID="txtHorario" runat="server" CssClass="form-control" Placeholder="Horario disponible" />
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="txtNoControl" runat="server" CssClass="form-control" ReadOnly="true" Placeholder="Número de control" />
            </div>

            <div class="col-12">
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Datos" CssClass="btn btn-primary" OnClick="btnActualizar_Click" />
            </div>
            <div class="col-12">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-success mt-2" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>
