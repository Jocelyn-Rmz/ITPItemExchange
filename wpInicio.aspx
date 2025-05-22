<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpInicio.aspx.cs" Inherits="ITPItemExchange.wpInicio" MasterPageFile="~/mpPrincipal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="text-center">
            <h1 class="display-5">Bienvenido, <asp:Label ID="lblNombre" runat="server" Text="Usuario" /> 👋</h1>
            <p class="lead mt-3">Gracias por ser parte de la comunidad ITP Item Exchange.</p>
        </div>

        <div class="row mt-5">
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">¿Qué es ITP Item Exchange?</h5>
                        <p class="card-text">Es una plataforma pensada para estudiantes del ITP que desean compartir o solicitar recursos académicos de forma rápida y segura.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">¿Qué puedes hacer?</h5>
                        <ul>
                            <li>Registrar ítems que tengas disponibles para préstamo.</li>
                            <li>Consultar ítems compartidos por otros alumnos.</li>
                            <li>Registrar préstamos con fecha y lugar de entrega.</li>
                            <li>Consultar tu historial de intercambios.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <img src="imagenes/logo.png" alt="Logo" style="width: 120px;" />
        </div>
    </div>
</asp:Content>
