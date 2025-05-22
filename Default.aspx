<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/mpPrincipal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ITPItemExchange.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .banner-imagen {
            max-width: 600px;
            width: 100%;
            margin-top: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .logo-itp {
            max-width: 120px;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center mt-5">
        <img src="imagenes/logo.png" alt="Logo ITP" class="logo-itp" />
        <h1 class="display-4">Bienvenido a ITP Item Exchange</h1>
        <p class="lead">Comparte y consulta recursos académicos con otros estudiantes del ITP.</p>
        <img src="imagenes/banner1.png" alt="Banner principal" class="banner-imagen" />
    </div>
</asp:Content>
