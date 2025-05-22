<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpHistorial.aspx.cs" Inherits="ITPItemExchange.wpHistorial" MasterPageFile="~/mpPrincipal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table th {
            background-color: #343a40;
            color: white;
            text-align: center;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .table img {
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            transition: transform 0.2s ease-in-out;
        }

        .table img:hover {
            transform: scale(1.1);
        }

        h2 {
            font-weight: bold;
            color: #2c3e50;
            padding-bottom: 10px;
            text-align: center;
        }

        .historial-container {
            background: #f8f9fa;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 historial-container">
        <h2>Historial de Préstamos Activos</h2>

        <asp:GridView ID="gvHistorial" runat="server" 
                      CssClass="table table-striped table-hover table-bordered text-center align-middle"
                      AutoGenerateColumns="false"
                      OnRowCommand="gvHistorial_RowCommand">
            <Columns>
                <asp:BoundField DataField="item_id" HeaderText="ID" />
                <asp:BoundField DataField="nombre_item" HeaderText="Ítem" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                <asp:TemplateField HeaderText="Imagen">
                    <ItemTemplate>
                        <img src='<%# ResolveUrl("~/" + Eval("imagen").ToString()) %>' alt="Imagen del ítem" style="height: 50px;" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="fecha_prestamo" HeaderText="Fecha de Préstamo" />
                <asp:BoundField DataField="lugar_entrega" HeaderText="Lugar de Entrega" />
                <asp:BoundField DataField="propietario" HeaderText="Propietario" />
                <asp:BoundField DataField="receptor" HeaderText="Receptor" />
                <asp:TemplateField HeaderText="Acción">
                    <ItemTemplate>
                        <asp:Button ID="btnDevolver" runat="server" Text="Devolver" CssClass="btn btn-warning btn-sm"
                                    CommandName="Devolver" CommandArgument='<%# Eval("item_id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <hr class="my-5" />

        <h2>Ítems Devueltos</h2>

        <asp:GridView ID="gvDevueltos" runat="server" 
                      CssClass="table table-striped table-hover table-bordered text-center align-middle"
                      AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="item_id" HeaderText="ID" />
                <asp:BoundField DataField="nombre_item" HeaderText="Ítem" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                <asp:TemplateField HeaderText="Imagen">
                    <ItemTemplate>
                        <img src='<%# ResolveUrl("~/" + Eval("imagen").ToString()) %>' alt="Imagen" style="height: 50px;" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="fecha_prestamo" HeaderText="Fecha de Préstamo" />
                <asp:BoundField DataField="fecha_devolucion" HeaderText="Fecha de Devolución" />
                <asp:BoundField DataField="lugar_entrega" HeaderText="Lugar de Entrega" />
                <asp:BoundField DataField="propietario" HeaderText="Propietario" />
                <asp:BoundField DataField="receptor" HeaderText="Receptor" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
