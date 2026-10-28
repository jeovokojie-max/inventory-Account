<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewsupplier.aspx.vb" Inherits="jaybrix.viewsupplier" MasterPageFile="~/Site.Master" Title="Supplier ledger report" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">



        .auto-style6 {
            width: 100%;
            border: 1px solid #FFFFFF;
            background-color: #000080;
        }
        .auto-style47 {
            color: #FFFFFF;
            height: 28px;
            text-align: center;
            background-color: #3366CC;
            width: 716px;
        }
        .auto-style45 {
            color: #FFFFFF;
            height: 28px;
            text-align: right;
            background-color: #3366CC;
        }
        .auto-style25 {
            margin-left: 55px;
        }
        .auto-style39 {
            height: 62px;
            width: 983px;
        }
        .auto-style36 {
            width: 147px;
            height: 73px;
        }
        .auto-style13 {
            width: 240px;
            height: 73px;
        }
        .auto-style44 {
            height: 73px;
            width: 125px;
        }
        .auto-style24 {
            height: 73px;
        }
        .auto-style48 {
            height: 73px;
            width: 136px;
        }
        .auto-style49 {
            width: 153px;
            height: 73px;
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Supplier ledger report</h1><p>Review a supplier account history.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


        <div>
            <table class="auto-style6 legacy-title-row">
                <tr>
                    <td class="auto-style47">Supply Ledger</td>
                    <td class="auto-style45">
                        <asp:Button ID="cmdclose" runat="server" Height="33px" Text="Home" Width="86px" BackColor="#3366CC" BorderStyle="Dotted" CssClass="auto-style25" ForeColor="White" PostBackUrl="~/Maindisplay.aspx" />
                    </td>
                </tr>
            </table>
        </div>
        <p>
            &nbsp;</p>
            <table class="auto-style39">
                <tr>
                    <td class="auto-style36">
                        Supply Name:</td>
                    <td class="auto-style13">
                        <asp:DropDownList ID="ltcustomer" runat="server" DataSourceID="supplydata" DataTextField="SupplyNames" DataValueField="SupplyNames" Height="30px" Width="228px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="supplydata" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString18 %>" ProviderName="<%$ ConnectionStrings:ConnectionString18.ProviderName %>" SelectCommand="SELECT [SupplyNames] FROM [supplier] ORDER BY [SupplyNames]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style48">
                        Debit<br />
                        <asp:TextBox ID="txtdebit" runat="server" Width="101px" ReadOnly="True" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                        <br />
                    </td>
                    <td class="auto-style44">
                        Payment<br />
                        <asp:TextBox ID="txtcredit" runat="server" Width="101px" ReadOnly="True" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                        <br />
                    </td>
                    <td class="auto-style49">
                        Balance:<br />
                        <asp:TextBox ID="txtbal" runat="server" Width="86px" ReadOnly="True" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                        <br />
                    </td>
                    <td class="auto-style24">
                        <br />
                        <asp:Button ID="cmdshow" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="Dotted" ForeColor="#3366CC" Text="Display" />
                    </td>
                </tr>
            </table>
        <p>
            &nbsp;</p>
            <asp:GridView ID="Gridledger" runat="server" Height="126px" Width="742px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </section>
</asp:Content>
