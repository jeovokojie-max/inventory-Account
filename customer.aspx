<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="customer.aspx.vb" Inherits="jaybrix.customer" MasterPageFile="~/Site.Master" Title="Customer setup" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 1337px;
            height: 657px;
        }
        .auto-style6 {
            width: 100%;
            border: 1px solid #FFFFFF;
            background-color: #000080;
        }
        .auto-style7 {
            color: #FFFFFF;
            height: 37px;
            text-align: right;
            background-color: #3366CC;
            width: 1055px;
        }
        .auto-style24 {
            color: #FFFFFF;
            height: 37px;
            text-align: center;
            background-color: #3366CC;
            width: 3057px;
        }
        .auto-style25 {
            margin-left: 55px;
        }
        .auto-style26 {
            width: 100%;
            height: 621px;
            background-image: url('green-and-black-background.jpg');
        }
        .auto-style2 {
            width: 40%;
            height: 183px;
            background-color: #FFFFFF;
        }
        .auto-style5 {
            width: 305px;
            height: 23px;
        }
        .auto-style3 {
            height: 23px;
            width: 540px;
            background-color: #FFFFFF;
        }
        .auto-style20 {
            width: 305px;
            font-size: medium;
            color: #FFFFFF;
            height: 32px;
            background-color: #3366CC;
        }
        .auto-style21 {
            width: 540px;
            height: 32px;
            background-color: #FFFFFF;
        }
        .auto-style23 {
            color: #000066;
        }
        .auto-style19 {
            width: 305px;
            font-size: medium;
            color: #FFFFFF;
            background-color: #3366CC;
        }
        .auto-style18 {
            width: 540px;
            background-color: #FFFFFF;
        }
        .auto-style22 {
            width: 305px;
            font-size: medium;
            color: #FFFFFF;
            height: 28px;
            background-color: #3366CC;
        }
        .auto-style13 {
            height: 28px;
            width: 540px;
            background-color: #FFFFFF;
        }
        .auto-style14 {
            width: 305px;
            height: 29px;
        }
        .auto-style15 {
            height: 29px;
            width: 540px;
            background-color: #FFFFFF;
        }
        .auto-style12 {
            width: 305px;
            height: 35px;
            background-color: #FFFFFF;
        }
        .auto-style11 {
            height: 35px;
            width: 540px;
            background-color: #FFFFFF;
        }
        </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Customer setup</h1><p>Create and maintain customer records.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


        <div class="auto-style1">
            <table class="auto-style6 legacy-title-row">
                <tr>
                    <td class="auto-style24">P<strong>lease Register Customers</strong></td>
                    <td class="auto-style7">
                        <asp:Button ID="cmdclose" runat="server" Height="33px" Text="Home" Width="86px" BackColor="#3366CC" BorderStyle="Dotted" CssClass="auto-style25" ForeColor="White" PostBackUrl="~/Maindisplay.aspx" />
                    </td>
                </tr>
            </table>
            <br />
            <table align="center" cellpadding="0" class="auto-style26">
                <tr>
                    <td>
            <table class="auto-style2" align="center">
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style3" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style20">Customer Name:</td>
                    <td class="auto-style21" colspan="2">
                        <asp:TextBox ID="txtName" runat="server" Width="264px" CssClass="auto-style23" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style19">Phone Number:</td>
                    <td class="auto-style18" colspan="2">
                        <asp:TextBox ID="txtPhone" runat="server" MaxLength="11" TextMode="Number" Width="133px" CssClass="auto-style23" BorderStyle="Dotted"></asp:TextBox>
                    &nbsp;<asp:Button ID="cmdAct" runat="server" Text="&gt;" Width="26px" BorderStyle="Dotted" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style22">Location:</td>
                    <td class="auto-style13" colspan="2">
                        <asp:TextBox ID="txtLocation" runat="server" Width="183px" CssClass="auto-style23" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14"></td>
                    <td class="auto-style15" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:Button ID="Btndel" runat="server" BackColor="White" BorderStyle="Dashed" Font-Size="XX-Small" ForeColor="#CC0000" Height="20px" Text="Del" Width="35px" />
                    </td>
                    <td class="auto-style11">
                        <asp:Button ID="cmdupdate" runat="server" Height="33px" Text="Update" Width="86px" BorderStyle="Solid" ForeColor="#000066" />
                    </td>
                    <td class="auto-style11">
                        <asp:Button ID="cmdsubmit" runat="server" Height="33px" Text="Submit" Width="86px" BorderStyle="Solid" ForeColor="#000066" />
                    </td>
                </tr>
            </table>
                    </td>
                </tr>
            </table>
        </div>
            </section>
</asp:Content>
