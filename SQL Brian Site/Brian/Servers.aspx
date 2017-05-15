<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Servers.aspx.cs" Inherits="Servers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <asp:Panel ID="pn_Debug" runat="server" CssClass="panel panel-body panel-title panel-spacing" Visible="false" >
        <h2>Debugging Information</h2>
        <asp:Label ID="lb_InfoHeading" runat="server" Text="Debugging information will be displayed below." /><br /><br />
        <asp:Label ID="lb_Warning" runat="server" CssClass="alert-warning" />
    </asp:Panel>
    <asp:Panel ID="pn_ServerSelect" runat="server" CssClass="panel panel-body panel-title panel-spacing" >
        <asp:Label ID="lb_ServerSelect_Info" runat="server" CssClass="label-red" /><br /><br />
        <asp:Label id="lb_ServerSelect" runat="server" CssClass="label-large label-darkblue main-left" Text="Server: " />&nbsp&nbsp
        <asp:DropDownList id="ddl_ServerSelect" runat="server" CssClass="dropdown label-darkblue label-large form-right" AutoPostBack="true" OnSelectedIndexChanged="Click_ServerSelect_ViewServer" />
        <asp:ImageButton ID="imgbtn_AddServer" runat="server" ImageUrl="~/Images/Add.png" ImageAlign="AbsBottom" CssClass="ImageButton5" OnClick="Click_ServerSelect_AddServer" />
        <asp:ImageButton ID="imgbtn_ViewServer" runat="server" ImageUrl="~/Images/List.png" ImageAlign="AbsBottom" CssClass="ImageButton5" OnClick="Click_ServerSelect_ViewServer" />
    </asp:Panel>

    <asp:Panel ID="pn_ServerInfo" runat="server" CssClass="panel panel-body panel-title panel-spacing" Visible="false" >
        <asp:Label ID="lb_ServerInfo_Warning" runat="server" ForeColor="#ff0000" /><br /><br />
        <!-- Server Name -->
        <asp:Label ID="lb_ServerName" runat="server" CssClass="label-large label-darkblue form-left" Text="Server Name:" />&nbsp&nbsp
        <asp:TextBox ID="txt_ServerName" runat="server" MaxLength="16" CssClass="label-darkblue label-large form-right" />
        <asp:Label ID="lb_ServerName_Ast" runat="server" Text="*" CssClass="label-large" ForeColor="#ff0000" /><br />
        <asp:RequiredFieldValidator ID="rfv_ServerName" runat="server" ControlToValidate="txt_ServerName" ValidationGroup="ServerInfo" ErrorMessage="Server Name is a required field." ForeColor="#ff0000" /> <br />
        <!-- Instance Name -->
        <asp:Label ID="lb_InstanceName" runat="server" CssClass="label-large label-darkblue form-left" Text="Instance Name:" />&nbsp&nbsp
        <asp:TextBox ID="txt_InstanceName" runat="server" MaxLength="50" CssClass="label-darkblue label-large form-right" Text="MSSQLSERVER" />
        <asp:Label ID="lb_InstanceName_Ast" runat="server" Text="*" CssClass="label-large" ForeColor="#ff0000" /><br />
        <asp:RequiredFieldValidator ID="rfv_InstanceName" runat="server" ControlToValidate="txt_InstanceName" ValidationGroup="ServerInfo" ErrorMessage="Instance Name is a required field." ForeColor="#ff0000" /><br />
        <!-- IP Address -->
        <div runat="server" id="div_hide1">
            <asp:Label ID="lb_IPAddress" runat="server" CssClass="label-large label-darkblue form-left" Text="IP Address:" />&nbsp&nbsp
            <asp:TextBox ID="txt_IPAddress" runat="server" MaxLength="15" CssClass="label-darkblue label-large form-right" />
            <!-- Version -->
            <asp:Label ID="lb_Version" runat="server" CssClass="label-large label-darkblue form-left" Text="SQL Version:" />&nbsp&nbsp
            <asp:TextBox ID="txt_Version" runat="server" CssClass="dropdown label-darkblue label-large form-right" AutoPostBack="true" />
            <!-- Edition -->
            <asp:Label ID="lb_Edition" runat="server" CssClass="label-large label-darkblue form-left" Text="SQL Edition:" />&nbsp&nbsp
            <asp:TextBox ID="txt_Edition" runat="server" CssClass="dropdown label-darkblue label-large form-right" />
            <!-- Build Number -->
            <asp:Label ID="lb_BuildNo" runat="server" CssClass="label-large label-darkblue form-left" Text="Build No:" />&nbsp&nbsp
            <asp:TextBox ID="txt_BuildNo" runat="server" CssClass="dropdown label-darkblue label-large form-right" />
        </div>
        <!-- Environment -->
        <asp:Label ID="lb_Environment" runat="server" CssClass="label-large label-darkblue form-left" Text="Environment:" />&nbsp&nbsp
        <asp:DropDownList ID="ddl_Environment" runat="server" CssClass="dropdown label-darkblue label-large form-right" />
        <asp:Label ID="lb_Environment_Ast" runat="server" Text="*" CssClass="label-large" ForeColor="#ff0000" /><br />
        <asp:RequiredFieldValidator ID="rfv_Environment" runat="server" ControlToValidate="ddl_Environment" InitialValue="0" ValidationGroup="ServerInfo" ErrorMessage="Environment is a required field." ForeColor="#ff0000" /><br />
        <!-- Location -->
        <asp:Label ID="lb_Location" runat="server" CssClass="label-large label-darkblue form-left" Text="Location:" />&nbsp&nbsp
        <asp:DropDownList ID="ddl_Location" runat="server" CssClass="dropdown label-darkblue label-large form-right" />
        <asp:Label ID="lb_Location_Ast" runat="server" Text="*" CssClass="label-large" ForeColor="#ff0000" /><br />
        <asp:RequiredFieldValidator ID="rfv_Location" runat="server" ControlToValidate="ddl_Location" InitialValue="0" ValidationGroup="ServerInfo" ErrorMessage="Location is a required field." ForeColor="#ff0000" /><br />
        <!-- Business Unit -->
        <asp:Label ID="lb_BusinessUnit" runat="server" CssClass="label-large label-darkblue form-left" Text="Business Unit:" />&nbsp&nbsp
        <asp:DropDownList ID="ddl_BusinessUnit" runat="server" CssClass="dropdown label-darkblue label-large form-right" />
        <asp:Label ID="lb_BusinessUnit_Ast" runat="server" Text="*" CssClass="label-large" ForeColor="#ff0000" /><br />
        <asp:RequiredFieldValidator ID="rfv_BusinessUnit" runat="server" ControlToValidate="ddl_BusinessUnit" InitialValue="0" ValidationGroup="ServerInfo" ErrorMessage="Business Unit is a required field." ForeColor="#ff0000" /><br />
        <!-- CPU Cores -->
        <asp:Label ID="lb_CPUCores" runat="server" CssClass="label-large label-darkblue form-left" Text="CPU Cores:" />&nbsp&nbsp
        <asp:TextBox ID="txt_CPUCores" runat="server" TextMode="Number" min="0" max="128" step="1" CssClass="label-darkblue label-large form-right" /><br /><br />
        <!-- CPU Speed -->
        <asp:Label ID="lb_CPUSpeed" runat="server" CssClass="label-large label-darkblue form-left" Text="CPU Speed (GHz):" />&nbsp&nbsp
        <asp:TextBox ID="txt_CPUSpeed" runat="server" TextMode="Number" min="0.00" max="5.00" step="0.01" CssClass="label-darkblue label-large form-right" /><br /><br />
        <!-- Server RAM -->
        <div runat="server" id="div_hide2">
            <asp:Label ID="lb_ServerRAM" runat="server" CssClass="label-large label-darkblue form-left" Text="Server RAM (GB):" />&nbsp&nbsp
            <asp:TextBox ID="txt_ServerRAM" runat="server" TextMode="Number" min="0" max="2048" step="0.5" CssClass="label-darkblue label-large form-right" /><br /><br />
            <!-- Instance RAM -->
            <asp:Label ID="lb_InstanceRAM" runat="server" CssClass="label-large label-darkblue form-left" Text="Instance RAM (GB):" />&nbsp&nbsp
            <asp:TextBox ID="txt_InstanceRAM" runat="server" TextMode="Number" min="0" max="2048" step="0.5" CssClass="label-darkblue label-large form-right" /><br /><br />
        </div>
        <!-- Install Date -->
        <asp:Label ID="lb_InstallDate" runat="server" CssClass="label-large label-darkblue form-left" Text="Install Date:" />&nbsp&nbsp
        <asp:Calendar ID="cal_InstallDate" runat="server" NextPrevFormat="ShortMonth" DayNameFormat="FirstTwoLetters" Font-Names="Book Antiqua" Font-Size="Medium" CssClass="Calendar" >
            <DayHeaderStyle BackColor="#00ffff" Width="2%" HorizontalAlign="Center" />
            <DayStyle BackColor="#00b2b3" BorderColor="#00ccbc" BorderWidth="1" Width="2%" Font-Bold="true" Font-Italic="true" />
            <NextPrevStyle Font-Italic="true" Font-Names="Arial CE" Width="25%" />
            <SelectedDayStyle BackColor="#00ccbc" BorderColor="#00ccbc" />
            <OtherMonthDayStyle BackColor="#007f80" />
            <TitleStyle BackColor="#00ccff" Height="36" Width="45%" Font-Size="Large" Font-Names="Courier New Baltic" />
        </asp:Calendar><br /><br />
        <!-- Server Status -->
        <asp:Label ID="lb_ServerStatus" runat="server" CssClass="label-large label-darkblue form-left" Text="Server Status:" />&nbsp&nbsp
        <asp:DropDownList ID="ddl_ServerStatus" runat="server" CssClass="dropdown label-darkblue label-large form-right" />
        <asp:Label ID="lb_ServerStatus_Ast" runat="server" Text="*" CssClass="label-large" ForeColor="#ff0000" /><br />
        <asp:RequiredFieldValidator ID="rfv_ServerStatus" runat="server" ControlToValidate="ddl_ServerStatus" InitialValue="0" ValidationGroup="ServerInfo" ErrorMessage="Server Status is a required field." ForeColor="#ff0000" /><br />
        <!-- Action Buttons -->
        <div style="text-align:center">
            <asp:ImageButton ID="imgbtn_ServerInfo_AddServer" runat="server" ValidationGroup="ServerInfo" ImageUrl="~/Images/Save.png" ImageAlign="AbsBottom" CssClass="ImageButton5" ToolTip="Add Server" Visible="false" OnClick="Click_ServerInfo_AddServer" />
            <asp:ImageButton ID="imgbtn_ServerInfo_EditServer" runat="server" ImageUrl="~/Images/edit.gif" ImageAlign="AbsBottom" CssClass="ImageButton5" ToolTip="Edit Server" Visible="false" OnClick="Click_ServerInfo_EditServer" />
            <asp:ImageButton ID="imgbtn_ServerInfo_UpdateServer" runat="server" ValidationGroup="ServerInfo" ImageUrl="~/Images/Save.png" ImageAlign="AbsBottom" CssClass="ImageButton5" ToolTip="Update Server" Visible="false" OnClick="Click_ServerInfo_UpdateServer" />
            <asp:ImageButton ID="imgbtn_Home" runat="server" ImageUrl="~/Images/Home.png" ImageAlign="AbsBottom" CssClass="ImageButton5" OnClick="Click_Home" />
        </div>

    </asp:Panel>

<%--    <asp:Panel ID="pn_Clus8ter" runat="server" CssClass="panel panel-body panel-title panel-spacing" Visible="false" >

    </asp:Panel>--%>

</asp:Content>

