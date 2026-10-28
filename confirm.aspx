<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="confirm.aspx.vb" Inherits="jaybrix.confirm" MasterPageFile="~/Site.Master" Title="Confirmations" %>
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
        .auto-style38 {
            width: 87%;
            height: 222px;
        }
        .auto-style39 {
            width: 110px;
        }
        .auto-style40 {
            width: 110px;
            height: 23px;
            color: #FFFFFF;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style41 {
            height: 23px;
            color: #FFFFFF;
            text-align: center;
            width: 126px;
            background-color: #FFFFFF;
        }
        .auto-style42 {
            height: 23px;
            width: 108px;
            color: #FFFFFF;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style43 {
            width: 108px;
            height: 59px;
        }
        .auto-style44 {
            height: 23px;
            width: 62px;
            color: #FFFFFF;
            text-align: center;
            background-color: #669999;
        }
        .auto-style45 {
            width: 62px;
            background-color: #669999;
        }
        .auto-style46 {
            color: #000066;
        }
        .auto-style31 {
            background-color: #99CCFF;
        }
        .auto-style47 {
            width: 108px;
            text-align: center;
        }
        .auto-style48 {
            height: 23px;
            width: 47px;
            background-color: #FFFFFF;
        }
        .auto-style49 {
            width: 47px;
            background-color: #FFFFFF;
        }
        .auto-style50 {
            height: 23px;
            width: 174px;
            color: #FFFFFF;
            text-align: center;
            background-color: #3366CC;
        }
        .auto-style51 {
            width: 195px;
            text-align: center;
            background-color: #669999;
        }
        .auto-style52 {
            width: 95px;
            background-color: #FFFFFF;
        }
        .auto-style53 {
            width: 110px;
            height: 59px;
        }
        .auto-style54 {
            width: 62px;
            height: 59px;
            background-color: #669999;
        }
        .auto-style55 {
            width: 47px;
            height: 59px;
            background-color: #FFFFFF;
        }
        .auto-style56 {
            width: 195px;
            height: 59px;
            text-align: center;
            background-color: #669999;
        }
        .auto-style57 {
            height: 59px;
            text-align: center;
            width: 126px;
            background-color: #FFFFFF;
        }
        .auto-style58 {
            height: 23px;
            width: 195px;
            color: #FFFFFF;
            text-align: center;
            background-color: #669999;
        }
        .auto-style59 {
            width: 174px;
            height: 59px;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style60 {
            text-align: center;
            width: 126px;
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Confirmations</h1><p>Review pending operational confirmations.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


        <div>
            <table class="auto-style6 legacy-title-row">
                <tr>
                    <td class="auto-style7">Transactions Confirmation </td>
                    <td class="auto-style37">
                        <asp:Button ID="cmdclose" runat="server" Height="33px" Text="Home" Width="86px" BackColor="#3366CC" BorderStyle="Dotted" CssClass="auto-style25" ForeColor="White" PostBackUrl="~/Maindisplay.aspx" />
                    </td>
                </tr>
            </table>
        </div>
        <p>
            Please this process is irreversible.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <table align="center" class="auto-style38">
            <tr>
                <td class="auto-style40">Sales : Date</td>
                <td class="auto-style42">Branch</td>
                <td class="auto-style44">Amount</td>
                <td class="auto-style48"></td>
                <td class="auto-style50">Expenditure / Other Income</td>
                <td class="auto-style58">Credit</td>
                <td class="auto-style41">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style53">
                        <asp:TextBox ID="txtdate" runat="server" Width="93px" TextMode="Date"></asp:TextBox>
                    </td>
                <td class="auto-style43">
                        <asp:DropDownList ID="TxtBranch" runat="server" DataSourceID="Brchdata" DataTextField="WareNames" DataValueField="WareNames" Height="34px" Width="157px" Enabled="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Brchdata" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString21 %>" ProviderName="<%$ ConnectionStrings:ConnectionString21.ProviderName %>" SelectCommand="SELECT [WareNames] FROM [Warehouses] ORDER BY [WareNames]"></asp:SqlDataSource>
                </td>
                <td class="auto-style54">
                    <asp:TextBox ID="txtsales" runat="server" ReadOnly="True" Width="88px" Enabled="False" CssClass="auto-style46"></asp:TextBox>
                </td>
                <td class="auto-style55"></td>
                <td class="auto-style59">
                    <asp:TextBox ID="txtExp" runat="server" ReadOnly="True" Width="88px" Enabled="False" CssClass="auto-style46"></asp:TextBox>
                </td>
                <td class="auto-style56">
                    <asp:TextBox ID="txtCredit" runat="server" ReadOnly="True" Width="88px" Enabled="False" CssClass="auto-style46"></asp:TextBox>
                </td>
                <td class="auto-style57">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style39">
                    <asp:GridView ID="Gridsales" runat="server" Height="16px" Visible="False" Width="66px">
                    </asp:GridView>
                </td>
                <td class="auto-style47">
                    <asp:Button ID="cmdcheck" runat="server" BackColor="White" ForeColor="#000099" Height="31px" Text="Verify" Width="97px" CssClass="auto-style31" BorderStyle="Dashed" />
                </td>
                <td class="auto-style45">
                    <asp:Button ID="cmdconsales" runat="server" BackColor="White" ForeColor="#000099" Height="31px" Text="Confirm" Width="97px" CssClass="auto-style31" BorderStyle="Dashed" />
                </td>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style52">&nbsp;<asp:Button ID="cmdcheckExp" runat="server" BackColor="White" ForeColor="#000099" Height="31px" Text="Verify" Width="97px" CssClass="auto-style31" BorderStyle="Dashed" />
                </td>
                <td class="auto-style51">
                    <asp:Button ID="cmdconexp" runat="server" BackColor="White" ForeColor="#000099" Height="31px" Text="Confirm" Width="97px" CssClass="auto-style31" BorderStyle="Dashed" />
                </td>
                <td class="auto-style60">
                    <asp:GridView ID="Gridexp" runat="server" Height="16px" Visible="False" Width="66px">
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <table class="auto-style6">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LblBranch" runat="server" BackColor="#3366CC" BorderColor="White" BorderStyle="Solid" Font-Size="Small" ForeColor="White" Width="193px"></asp:Label>
                </td>
                <td class="auto-style7">Data Solutions Nigeria</td>
            </tr>
        </table>
            </section>
</asp:Content>
