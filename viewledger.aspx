<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewledger.aspx.vb" Inherits="jaybrix.viewledger" MasterPageFile="~/Site.Master" Title="Customer ledger report" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">


        .auto-style6 {
            width: 100%;
            border: 1px solid #FFFFFF;
            background-color: #000080;
        }
        .auto-style7 {
            color: #FFFFFF;
            height: 28px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style8 {
            height: 29px;
        }
        .auto-style13 {
            width: 240px;
            height: 73px;
        }
        .auto-style24 {
            height: 73px;
        }
        .auto-style36 {
            width: 147px;
            height: 73px;
        }
        .auto-style38 {
            height: 45px;
        }
        .auto-style39 {
            height: 62px;
            width: 983px;
        }
        .auto-style40 {
            width: 740px;
            text-align: center;
            height: 133px;
        }
        .auto-style41 {
            margin-left: 40px;
        }
        .auto-style42 {
            height: 73px;
            width: 121px;
        }
        .auto-style43 {
            height: 73px;
            width: 104px;
        }
        .auto-style44 {
            height: 73px;
            width: 125px;
        }
        .auto-style25 {
            margin-left: 55px;
        }
        .auto-style45 {
            color: #FFFFFF;
            height: 28px;
            text-align: right;
            background-color: #3366CC;
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Customer ledger report</h1><p>Review a customer account history.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


        <div class="auto-style8">
            <table class="auto-style6 legacy-title-row">
                <tr>
                    <td class="auto-style7">Customer Ledger</td>
                    <td class="auto-style45">
                        <asp:Button ID="cmdclose" runat="server" Height="33px" Text="Home" Width="86px" BackColor="#3366CC" BorderStyle="Dotted" CssClass="auto-style25" ForeColor="White" PostBackUrl="~/Maindisplay.aspx" />
                    </td>
                </tr>
            </table>
            <br />
        </div>
        <p>
            &nbsp;</p>
            <table class="auto-style39">
                <tr>
                    <td class="auto-style36">
                        Customer Name:</td>
                    <td class="auto-style13">
                        <asp:DropDownList ID="ltcustomer" runat="server" DataSourceID="customersrc" DataTextField="CustNames" DataValueField="CustNames" Height="34px" Width="228px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="customersrc" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString12 %>" ProviderName="<%$ ConnectionStrings:ConnectionString12.ProviderName %>" SelectCommand="SELECT [CustNames] FROM [Customer] ORDER BY [CustNames]">
                        </asp:SqlDataSource>
                    </td>
                    <td class="auto-style43">
                        Balance:<br />
                        <asp:TextBox ID="txtbal" runat="server" Width="86px" ReadOnly="True" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                    <td class="auto-style44">
                        Debit<br />
                        <asp:TextBox ID="txtdebit" runat="server" Width="101px" ReadOnly="True" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                    <td class="auto-style42">
                        Payment<br />
                        <asp:TextBox ID="txtcredit" runat="server" Width="101px" ReadOnly="True" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                    <td class="auto-style42">
                        Qty Balance<br />
                        <asp:TextBox ID="txtqty" runat="server" Width="56px" ReadOnly="True" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                    <td class="auto-style24">
                        <br />
                        <asp:Button ID="cmdshow" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="Dotted" ForeColor="#3366CC" Text="Display" />
                    </td>
                </tr>
            </table>
        <br />
        <br />
        <div class="auto-style40">
            <asp:GridView ID="Gridledger" runat="server" Height="126px" Width="742px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <br />
            <p class="auto-style41">
                <br />
            </p>
        </div>
    <p class="auto-style41">
        &nbsp;</p>
    <p class="auto-style41">
        &nbsp;</p>
    <p class="auto-style41">
        &nbsp;</p>
    <p class="auto-style41">
        &nbsp;</p>
    <p class="auto-style41">
        &nbsp;</p>
    <p class="auto-style41">
        &nbsp;</p>
    <p class="auto-style41">
        &nbsp;</p>
    <p class="auto-style41">
        &nbsp;</p>
    <p class="auto-style41">
        &nbsp;</p>
            <table class="auto-style6">
                <tr>
                    <td class="auto-style7">Data Solutions, Nigeria</td>
                    <td class="auto-style7">
                    <asp:Label ID="LblBranch" runat="server" BackColor="#3366CC" BorderColor="White" BorderStyle="Dotted" Font-Size="Small" ForeColor="White"></asp:Label>
                    </td>
                </tr>
            </table>
            </section>
</asp:Content>
