<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpVerItems.aspx.cs" Inherits="ITPItemExchange.wpVerItems" MasterPageFile="~/mpPrincipal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table th {
            background-color: #343a40;
            color: white;
        }
        .tabla-items {
            background-color: #f8f9fa;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0,0,0,0.08);
        }

        .tabla-items h2 {
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .table img {
            border-radius: 8px;
            height: 50px;
            transition: transform 0.2s ease-in-out;
        }

        .table img:hover {
            transform: scale(1.1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 tabla-items">
        <h2 class="text-center">Ítems Disponibles</h2>

        <asp:GridView ID="gvItems" runat="server" CssClass="table table-bordered table-striped table-hover text-center align-middle" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="item_id" HeaderText="ID" />
                <asp:BoundField DataField="nombre_item" HeaderText="Nombre del Ítem" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                
                <asp:TemplateField HeaderText="Imagen">
                    <ItemTemplate>
                        <a href='<%# ResolveUrl("~/" + Eval("imagen")) %>' target="_blank">
                            <img src='<%# ResolveUrl("~/" + Eval("imagen")) %>' alt="Imagen del Ítem" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="estado" HeaderText="Estado" />
                <asp:BoundField DataField="propietario" HeaderText="Registrado por" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
