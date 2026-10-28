<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="staff.aspx.vb" Inherits="jaybrix.staff" MasterPageFile="~/Site.Master" Title="Staff setup" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .auto-style1 {
            width: 1376px;
            height: 251px;
        }
        .auto-style6 {
            width: 100%;
            border: 1px solid #FFFFFF;
            background-color: #000080;
        }
        .auto-style7 {
            color: #FFFFFF;
            text-align: center;
            height: 47px;
            background-color: #3366CC;
        }
        .auto-style34 {
            color: #FFFFFF;
            text-align: right;
            height: 47px;
            background-color: #3366CC;
        }
        .auto-style25 {
            width: 79px;
            height: 35px;
            background-color: #FFFFFF;
        }
        .auto-style2 {
            width: 45%;
            height: 188px;
        }
        .auto-style23 {
            width: 125px;
            height: 24px;
            background-color: #FFFFFF;
        }
        .auto-style28 {
            width: 79px;
            height: 24px;
        }
        .auto-style5 {
            width: 125px;
            color: #FFFFFF;
            background-color: #3366CC;
        }
        .auto-style29 {
            width: 79px;
        }
        .auto-style26 {
            height: 27px;
            color: #FFFFFF;
            background-color: #3366CC;
        }
        .auto-style14 {
            width: 125px;
            height: 29px;
            background-color: #FFFFFF;
        }
        .auto-style32 {
            height: 29px;
            width: 79px;
        }
        .auto-style33 {
            height: 35px;
            background-color: #FFFFFF;
            width: 79px;
            text-align: right;
        }
        .auto-style35 {
            width: 125px;
            height: 35px;
            background-color: #FFFFFF;
        }
        .auto-style36 {
            width: 150px;
        }
        .auto-style37 {
            width: 89px;
            height: 27px;
            color: #FFFFFF;
            background-color: #3366CC;
        }
        .auto-style38 {
            height: 29px;
            width: 79px;
            background-color: #3366CC;
        }
        .auto-style40 {
            width: 125px;
            height: 29px;
            background-color: #3366CC;
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Staff setup</h1><p>Maintain staff and payment details.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


        <div class="auto-style1">
            <table class="auto-style6 legacy-title-row">
                <tr>
                    <td class="auto-style7">STAFF REGISTRATION</td>
                    <td class="auto-style34">
                        <asp:Button ID="cmdclose" runat="server" Height="33px" Text="Home" Width="86px" BackColor="#3366CC" BorderStyle="Dotted" CssClass="auto-style25" ForeColor="White" PostBackUrl="~/Maindisplay.aspx" />
                    </td>
                </tr>
            </table>
            <br />
            <table class="auto-style2" align="center">
                <tr>
                    <td class="auto-style23"></td>
                    <td class="auto-style28" colspan="6"></td>
                </tr>
                <tr>
                    <td class="auto-style5">Staff Name:</td>
                    <td class="auto-style36" colspan="4">
                        <asp:TextBox ID="txtstaff" runat="server" Width="264px" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                    <td class="auto-style29" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style37" colspan="2">Department:</td>
                    <td class="auto-style26" colspan="2">
                        <asp:DropDownList ID="cmbdept" runat="server" Height="34px" Width="243px">
                            <asp:ListItem>ACCOUNT</asp:ListItem>
                            <asp:ListItem>OPERATION</asp:ListItem>
                            <asp:ListItem>MARKETING</asp:ListItem>
                            <asp:ListItem>CASHIER</asp:ListItem>
                            <asp:ListItem>SALES</asp:ListItem>
                            <asp:ListItem>DRIVER</asp:ListItem>
                            <asp:ListItem>AUDITOR</asp:ListItem>
                            <asp:ListItem>LOADERS</asp:ListItem>
                            <asp:ListItem>STORE</asp:ListItem>
                            <asp:ListItem>MANAGER</asp:ListItem>
                            <asp:ListItem>SUPERVISOR</asp:ListItem>
                            <asp:ListItem>OPERATORS</asp:ListItem>
                            <asp:ListItem>CASUAL STAFF</asp:ListItem>
                            <asp:ListItem>SECRETARY</asp:ListItem>
                            <asp:ListItem>COMPUTER OPERATOR</asp:ListItem>
                        </asp:DropDownList>
                        </td>
                    <td class="auto-style26" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style37" colspan="2">Phone Number</td>
                    <td class="auto-style26" colspan="2">
                        <asp:TextBox ID="txtphone" runat="server" Width="124px" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                    <td class="auto-style26" colspan="3">
                        <asp:Button ID="Btnsrch" runat="server" BackColor="#333333" BorderStyle="Dashed" Font-Size="XX-Small" ForeColor="White" Height="20px" Text="Find" Width="35px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style40">
                        Bank</td>
                    <td class="auto-style38" colspan="2">
                        <asp:DropDownList ID="txtbank" runat="server" Height="34px" Width="262px">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Access Bank</asp:ListItem>
                            <asp:ListItem>Eco Bank</asp:ListItem>
                            <asp:ListItem>Enterprise Bank</asp:ListItem>
                            <asp:ListItem>FCMB</asp:ListItem>
                            <asp:ListItem>Fidelity Bank</asp:ListItem>
                            <asp:ListItem>First Bank</asp:ListItem>
                            <asp:ListItem>GTB</asp:ListItem>
                            <asp:ListItem>Keystone Bank</asp:ListItem>
                            <asp:ListItem>Mainstreet Bank</asp:ListItem>
                            <asp:ListItem>Stanbic IBTC Bank</asp:ListItem>
                            <asp:ListItem>Sterling Bank</asp:ListItem>
                            <asp:ListItem>Standard Chartered Bank</asp:ListItem>
                            <asp:ListItem>UBA</asp:ListItem>
                            <asp:ListItem>Union Bank</asp:ListItem>
                            <asp:ListItem>Unity Bank</asp:ListItem>
                            <asp:ListItem>Zenith Bank</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style38" colspan="3">
                        &nbsp;</td>
                    <td class="auto-style38">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style40">
                        Account No</td>
                    <td class="auto-style38" colspan="2">
                        <asp:TextBox ID="txtaccno" runat="server" Width="124px" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                    <td class="auto-style38" colspan="3">
                        &nbsp;</td>
                    <td class="auto-style38">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:Button ID="Btndel" runat="server" BackColor="White" BorderStyle="Dashed" Font-Size="XX-Small" ForeColor="#CC0000" Height="20px" Text="Del" Width="35px" />
                    </td>
                    <td class="auto-style32" colspan="2">
                        &nbsp;</td>
                    <td class="auto-style32" colspan="3">
                        <asp:Button ID="Cmdup" runat="server" BorderStyle="Dotted" Text="Update" />
                    </td>
                    <td class="auto-style32">
                        <asp:Button ID="cmdsubmit" runat="server" OnClick="cmdsubmit_Click" Text="Submit" Width="81px" BorderStyle="Dotted" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style35">
                        &nbsp;</td>
                    <td class="auto-style33" colspan="6">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
            </section>
</asp:Content>
