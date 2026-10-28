<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewsalary.aspx.vb" Inherits="jaybrix.viewsalary" MasterPageFile="~/Site.Master" Title="Payroll register" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">



        .auto-style6 {
            width: 100%;
            border: 1px solid #FFFFFF;
            background-color: #000080;
        }
        .auto-style49 {
            color: #000000;
            height: 28px;
            text-align: center;
            background-color: #FFFFFF;
            width: 427px;
        }
        .auto-style48 {
            color: #FFFFFF;
            height: 28px;
            text-align: right;
            background-color: #FFFFFF;
            width: 154px;
        }
        .auto-style37 {
            color: #FFFFFF;
            height: 28px;
            text-align: right;
            background-color: #FFFFFF;
        }
        .auto-style25 {
            margin-left: 55px;
        }
        .auto-style32 {
            width: 80%;
        }
        .auto-style33 {
            width: 771px;
        }
        .auto-style34 {
            width: 38%;
            height: 0px;
        }
        .auto-style35 {
            background-color: #FFFFFF;
            height: 51px;
        }
        .auto-style50 {
            background-color: #FFFFFF;
            height: 51px;
            width: 157px;
            color: #000000;
        }
        .auto-style52 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Payroll register</h1><p>Review recorded salary transactions.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


        <div>
            <table class="auto-style6 legacy-title-row">
                <tr>
                    <td class="auto-style49"><strong>SALARY FOR THE&nbsp; MONTH OF</strong></td>
                    <td class="auto-style48">
                        <asp:Button ID="Btnsrch" runat="server" BackColor="#333333" BorderStyle="Dashed" Font-Size="XX-Small" ForeColor="White" Height="20px" Text="SHOW" Width="63px" CssClass="auto-style52" />
                    <asp:DropDownList ID="DrpMonth" runat="server">
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td class="auto-style37">
                        <asp:Button ID="cmdclose" runat="server" Height="33px" Text="Home" Width="86px" BackColor="#3366CC" BorderStyle="Dotted" CssClass="auto-style25" ForeColor="White" PostBackUrl="~/Maindisplay.aspx" />
                    </td>
                </tr>
            </table>
        </div>
        <p>
            &nbsp;</p>
        <table align="center" class="auto-style32">
            <tr>
                <td class="auto-style33">
            <asp:GridView ID="Gridnet" runat="server" Height="126px" Width="995px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
                </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <table class="auto-style34" align="right">
            <tr>
                <td class="auto-style50"><strong>TOTAL SALARY</strong></td>
                <td class="auto-style35">
                        <asp:TextBox ID="txtBal" runat="server" Width="120px" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="auto-style50">&nbsp;</td>
                <td class="auto-style35"><asp:Button ID="cmdprint" runat="server" BorderStyle="Dotted" Text="Print" Width="80px" />
                    </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
            </section>
</asp:Content>
