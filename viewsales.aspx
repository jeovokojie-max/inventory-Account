<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewsales.aspx.vb" Inherits="jaybrix.viewsales" MasterPageFile="~/Site.Master" Title="Sales register" %>
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
            height: 33px;
        }
        .auto-style21 {
            width: 269px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style22 {
            width: 40px;
            background-color: #3366CC;
        }
        .auto-style27 {
            height: 107px;
            width: 1295px;
        }
        .auto-style28 {
            width: 298px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style29 {
            width: 174px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style30 {
            width: 400px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style31 {
            width: 315px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style33 {
            width: 388px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style34 {
            color: #FFFFFF;
        }
        .auto-style35 {
            color: #000066;
        }
        .auto-style36 {
            text-align: center;
        }
        .auto-style25 {
            margin-left: 55px;
        }
        .auto-style37 {
            color: #FFFFFF;
            height: 28px;
            text-align: right;
            background-color: #3366CC;
        }
        .auto-style38 {
            color: #FFFFFF;
            height: 28px;
            text-align: right;
            background-color: #3366CC;
            width: 123px;
        }
        .auto-style39 {
            width: 102%;
            border: 1px solid #FFFFFF;
            background-color: #000080;
        }
        .auto-style40 {
            width: 1087px;
            background-color: #3366CC;
        }
        .auto-style41 {
            width: 109px;
            background-color: #3366CC;
        }
        .auto-style42 {
            width: 272px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style43 {
            width: 337px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style44 {
            width: 439px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style45 {
            width: 129px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style46 {
            width: 321px;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style47 {
            color: #FFFFFF;
            background-color: #3366CC;
        }
        .auto-style48 {
            width: 888px;
            background-color: #3366CC;
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Sales register</h1><p>Review sales by date, item, and branch.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


    <p class="auto-style8">
            <table class="auto-style39 legacy-title-row">
                <tr>
                    <td class="auto-style7">Sales Transactions</td>
                    <td class="auto-style38">
                    <asp:Button ID="cmdpass" runat="server" Text="&gt;" Width="26px" BorderStyle="Dotted" />
                        <asp:TextBox ID="txtadmin" runat="server" style="margin-left: 11; color: #000066;" TextMode="Password" Width="88px" BackColor="#3366CC" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                    <td class="auto-style37">
                        <asp:Button ID="cmdclose" runat="server" Height="33px" Text="Home" Width="86px" BackColor="#3366CC" BorderStyle="Dotted" CssClass="auto-style25" ForeColor="White" PostBackUrl="~/Maindisplay.aspx" />
                    </td>
                </tr>
            </table>
            <br />
&nbsp;&nbsp;&nbsp;
    </p>
        <p class="auto-style36">
            <asp:GridView ID="Gridsales" runat="server" Height="126px" Width="742px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        </p>
        <p>
            &nbsp;</p>
        <table class="auto-style27">
            <tr>
                <td class="auto-style21"><span class="auto-style34">Select Branch :</span><asp:DropDownList ID="txtWarehouse" runat="server" DataSourceID="warehousenames" DataTextField="WareNames" DataValueField="WareNames" Font-Size="Small" Height="24px" Width="178px" CssClass="auto-style35" Enabled="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="warehousenames" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString29 %>" ProviderName="<%$ ConnectionStrings:ConnectionString29.ProviderName %>" SelectCommand="SELECT [WareNames] FROM [Warehouses] ORDER BY [WareNames]"></asp:SqlDataSource>
                </td>
                <td class="auto-style22">
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="cmdsearch" runat="server" Text="&gt;" Width="26px" BorderStyle="Dotted" />
                    <br />
                    <br />
                    <br />
                </td>
                <td class="auto-style40">
                    <span class="auto-style47"><strong>Select Item</strong></span><br />
                    <asp:DropDownList ID="ltitem" runat="server" DataSourceID="SqlDataSource2" DataTextField="Item" DataValueField="Item" Font-Size="Small" Height="24px" Width="178px" CssClass="auto-style35">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString27 %>" ProviderName="<%$ ConnectionStrings:ConnectionString27.ProviderName %>" SelectCommand="SELECT [Item] FROM [Itemreg] ORDER BY [Item]"></asp:SqlDataSource>
                </td>
                <td class="auto-style48">
                    <span class="auto-style34">Qty</span><br />
                    <asp:TextBox ID="txtqty" runat="server" ReadOnly="True" Width="34px" BorderStyle="Dotted"></asp:TextBox>
                    <br />
                    <asp:Button ID="cmdsearchmonth0" runat="server" Text="M" Width="26px" BorderStyle="Dotted" />
                </td>
                <td class="auto-style43">
                    <br />
                    <br />
                    <span class="auto-style34">Amount</span><br />
                    <asp:TextBox ID="txtamount" runat="server" ReadOnly="True" Width="72px" BorderStyle="Dotted"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                </td>
                <td class="auto-style42">
                    <span class="auto-style34">Select Date</span><br />
                        <asp:TextBox ID="txtdate" runat="server" Width="116px" BorderStyle="Dotted"></asp:TextBox>
                </td>
                <td class="auto-style29"><span class="auto-style34">Daily</span><br />
                    <asp:Button ID="cmdsearchdate" runat="server" Text="&gt;" Width="26px" BorderStyle="Dotted" />
                </td>
                <td class="auto-style41">
                    <span class="auto-style34">B/Daily</span><br />
                    <asp:Button ID="cmdsearchwaredaily" runat="server" Text="&gt;" Width="30px" BorderStyle="Dotted" />
                </td>
                <td class="auto-style30">
                    <span class="auto-style34">Daily</span><br />
                    <asp:TextBox ID="txtdailyAmt" runat="server" ReadOnly="True" Width="76px" BorderStyle="Dotted"></asp:TextBox>
                    <br />
                </td>
                <td class="auto-style31">
                    <br />
                    <br />
                    <span class="auto-style34">B/Daily</span><br />
                    <asp:TextBox ID="txtWareAmt" runat="server" ReadOnly="True" Width="76px" BorderStyle="Dotted"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                </td>
                <td class="auto-style46">
                    <span class="auto-style34">Select Month</span><br />
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
                <td class="auto-style33">
                    <br />
                    <asp:Button ID="cmdsearchmonth" runat="server" Text="&gt;" Width="30px" Enabled="False" BorderStyle="Dotted" />
                    <br />
                </td>
                <td class="auto-style44">
                    <span class="auto-style34">Amount</span><br />
                    <asp:TextBox ID="txtAmtmonth" runat="server" ReadOnly="True" Width="61px" BorderStyle="Dotted"></asp:TextBox>
                </td>
                <td class="auto-style45">
                    <span class="auto-style34">M.B/Amount</span><br />
                    <asp:TextBox ID="txtWareAmtmonth" runat="server" ReadOnly="True" Width="61px" BorderStyle="Dotted"></asp:TextBox>
                </td>
                <td class="auto-style28">
                    <br />
                    <asp:Button ID="cmdsearchmonthware" runat="server" Text="&gt;" Width="30px" BorderStyle="Dotted" />
                </td>
            </tr>
        </table>
        <div>
        </div>
        <table class="auto-style6">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LblBranch" runat="server" BackColor="#3366CC" BorderColor="White" BorderStyle="Solid" Font-Size="Small" ForeColor="White" Width="197px"></asp:Label>
                </td>
                <td class="auto-style7">Data Solutions Nigeria</td>
            </tr>
        </table>
            </section>
</asp:Content>
