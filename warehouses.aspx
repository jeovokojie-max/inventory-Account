<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="warehouses.aspx.vb" Inherits="jaybrix.warehouses" MasterPageFile="~/Site.Master" Title="Warehouse setup" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 1104px;
            height: 251px;
            text-align: center;
        }
        .auto-style6 {
            width: 100%;
            border: 1px solid #FFFFFF;
            background-color: #000080;
        }
        .auto-style7 {
            color: #FFFFFF;
            height: 45px;
            background-color: #3333FF;
        }
        .auto-style2 {
            width: 100%;
            height: 188px;
        }
        .auto-style5 {
            width: 366px;
            height: 32px;
        }
        .auto-style14 {
            width: 366px;
            height: 29px;
        }
        .auto-style15 {
            height: 29px;
        }
        .auto-style12 {
            width: 366px;
            height: 35px;
            background-color: #FFFFFF;
        }
        .auto-style11 {
            height: 35px;
            background-color: #FFFFFF;
        }
        .auto-style16 {
            font-size: medium;
            background-color: #3366CC;
        }
        .auto-style19 {
            text-align: left;
            height: 38px;
            background-color: #3366CC;
        }
        .auto-style20 {
            width: 366px;
            height: 38px;
            color: #FFFFFF;
            background-color: #3366CC;
            font-size: medium;
        }
        .auto-style21 {
            height: 32px;
        }
        .auto-style25 {
            margin-left: 55px;
        }
        .auto-style26 {
            color: #FFFFFF;
            height: 45px;
            background-color: #3333FF;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Warehouse setup</h1><p>Maintain branch and warehouse records.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


        <div class="auto-style1">
            <table class="auto-style6 legacy-title-row">
                <tr>
                    <td class="auto-style7"><span class="auto-style16">P</span><strong><span class="auto-style16">lease Register Branch and click Submit</span></strong></td>
                    <td class="auto-style26">
                        <asp:Button ID="cmdclose" runat="server" Height="33px" Text="Home" Width="86px" BackColor="#3366CC" BorderStyle="Dotted" CssClass="auto-style25" ForeColor="White" PostBackUrl="~/About.aspx" />
                    </td>
                </tr>
            </table>
            <br />
            <table class="auto-style2">
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style21"></td>
                </tr>
                <tr>
                    <td class="auto-style20">Branch Name:</td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtwarehouse" runat="server" Width="264px" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:Button ID="cmdsubmit" runat="server" Height="33px" Text="Submit" Width="86px" BorderStyle="Dotted" />
                    </td>
                    <td class="auto-style11">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        &nbsp;</td>
                    <td class="auto-style11">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
            </section>
</asp:Content>
