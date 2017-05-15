<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pn_ServerAdd" runat="server" CssClass="panel panel-body panel-title panel-spacing" >
        <h2>Welcome to Brian</h2>
        <br />
        <asp:Label ID="lb_Welcome" runat="server" Text="Brian is the home for SQL Server inventory. Everything SQL will be recorded here to allow the DBA's to centrally manage the estate and observe changes made over time.<br /><br />Brian is the brains behind the scenes." CssClass="label-large label-darkblue" />
        <asp:Label ID="lb_User" runat="server" CssClass="label-large label-darkblue" />
    </asp:Panel>
</asp:Content>

