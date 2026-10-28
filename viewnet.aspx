<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewnet.aspx.vb" Inherits="jaybrix.viewnet" MasterPageFile="~/Site.Master" Title="Net position" %>
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
        .auto-style37 {
            color: #FFFFFF;
            height: 28px;
            text-align: right;
            background-color: #3366CC;
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
            width: 101%;
            height: 91px;
        }
        .auto-style44 {
            width: 140px;
            background-color: #3366CC;
            height: 51px;
        }
        .auto-style40 {
            color: #FFFFFF;
            width: 133px;
            background-color: #3366CC;
            height: 51px;
        }
        .auto-style41 {
            width: 146px;
            background-color: #3366CC;
            height: 51px;
        }
        .auto-style42 {
            background-color: #3366CC;
            width: 103px;
            height: 51px;
        }
        .auto-style35 {
            background-color: #3366CC;
            height: 51px;
        }
        .auto-style45 {
            color: #FFFFFF;
            width: 128px;
            background-color: #3366CC;
            height: 51px;
        }
        .auto-style46 {
            background-color: #3366CC;
            width: 102px;
            height: 51px;
        }
        .auto-style47 {
            color: #FFFFFF;
        }
        .auto-style48 {
            color: #FFFFFF;
            height: 28px;
            text-align: right;
            background-color: #3366CC;
            width: 111px;
        }
        .auto-style49 {
            color: #FFFFFF;
            height: 28px;
            text-align: center;
            background-color: #3366CC;
            width: 427px;
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Net position</h1><p>Review business account summaries.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


        <div>
            <table class="auto-style6 legacy-title-row">
                <tr>
                    <td class="auto-style49">Branch Net Transactions</td>
                    <td class="auto-style48">
                    <asp:Button ID="cmdpass" runat="server" Text="&gt;" Width="26px" BorderStyle="Dotted" />
                        <asp:TextBox ID="txtadmin" runat="server" style="margin-left: 11; color: #000066;" TextMode="Password" Width="70px" BackColor="#3366CC" BorderStyle="Dotted"></asp:TextBox>
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
            <asp:GridView ID="Gridnet" runat="server" Height="126px" Width="742px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
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
                </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <table class="auto-style34">
            <tr>
                <td class="auto-style44"><span class="auto-style37">Select Branch:&nbsp;<br />
                        <asp:DropDownList ID="TxtBranch" runat="server" DataSourceID="brchnames" DataTextField="WareNames" DataValueField="WareNames" Height="32px" Width="136px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="brchnames" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString13 %>" ProviderName="<%$ ConnectionStrings:ConnectionString13.ProviderName %>" SelectCommand="SELECT [WareNames] FROM [Warehouses] ORDER BY [WareNames]"></asp:SqlDataSource>
                    </span>
                    <br />
                    </td>
                <td class="auto-style45">&nbsp;<br />
                    <asp:Button ID="cmdAct" runat="server" Text="&gt;" Width="26px" BorderStyle="Dotted" />
                    &nbsp;<asp:Button ID="cmdAcctdate" runat="server" Text="&gt;D" Width="31px" BackColor="#000066" BorderColor="White" BorderStyle="Dotted" ForeColor="White" />
                    &nbsp;<asp:Button ID="cmdAcctMonth" runat="server" Text="&gt;M" Width="31px" BackColor="#000066" BorderColor="White" BorderStyle="Dotted" ForeColor="White" />
                    </td>
                <td class="auto-style40">
                    <br />
                    Enter Date : 
                    <br />
                    <asp:TextBox ID="txtdate" runat="server" Width="77px" BorderStyle="Dotted"></asp:TextBox>
                &nbsp;
                        <asp:Button ID="cmddate" runat="server" Text="&gt;" Width="31px" BorderStyle="Dotted" BackColor="White" Enabled="False" />
                    <br />
                    <br />
                    </td>
                <td class="auto-style41">
                    <span class="auto-style37">Select Month</span><br />
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
                &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="cmdmonth" runat="server" Text="&gt;" Width="31px" BorderStyle="Dotted" BackColor="White" Enabled="False" />
                </td>
                <td class="auto-style42"><span class="auto-style37">Debit</span><br />
                        <asp:TextBox ID="txtDamount" runat="server" Width="88px" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                <td class="auto-style46"><span class="auto-style37">Credit</span><br />
                        <asp:TextBox ID="txtCamount" runat="server" Width="88px" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                    </td>
                <td class="auto-style35"><span class="auto-style47">Net Balance</span><br />
                        <asp:TextBox ID="txtBal" runat="server" Width="88px" Enabled="False" BorderStyle="Dotted"></asp:TextBox>
                    </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <table class="auto-style6">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LblBranch" runat="server" BackColor="#3366CC" BorderColor="White" BorderStyle="Solid" Font-Size="Small" ForeColor="White" Width="206px"></asp:Label>
                </td>
                <td class="auto-style7">Data Solutions Nigeria</td>
            </tr>
        </table>
            </section>
</asp:Content>
