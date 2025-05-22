<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpAbout.aspx.cs" Inherits="ITPItemExchange.wpAbout" MasterPageFile="~/mpPrincipal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .equipo-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2 class="text-center">Acerca del equipo</h2>
        <p class="text-center">Conoce a las personas detrás del desarrollo de esta plataforma.</p>

        <div class="row text-center mt-5">
            <div class="col-md-6">
                <img src="imagenes/Luz.jpg" alt="Luz María" class="equipo-img mb-2" />
                <h5>Luz María Cruz</h5>
                <p><strong>No. Control:</strong> 21200647</p>
                 <p><strong>Correo:</strong>l21200647@pachuca.tecnm.mx</p>
                <p class="text-muted">Backend y Conexión API</p>
            </div>

            <div class="col-md-6">
                <img src="imagenes/Jocelyn.jpg" alt="Jocelyn" class="equipo-img mb-2" />
                <h5>Jocelyn Ramírez</h5>
                <p><strong>No. Control:</strong> 21200663</p>
                <p><strong>Correo:</strong>l21200663@pachuca.tecnm.mx</p>
                <p class="text-muted">Diseño Web y UX</p>
            </div>

            
        </div>

        <div class="text-center mt-4">
            <img src="imagenes/logo.png" alt="Logo" style="width: 100px;" />
            <p class="mt-2">ITP Item Exchange - Innovación estudiantil</p>
        </div>
    </div>
</asp:Content>
