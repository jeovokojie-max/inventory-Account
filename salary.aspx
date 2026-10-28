<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="salary.aspx.vb" Inherits="jaybrix.salary" MasterPageFile="~/Site.Master" Title="Payroll entry" %>
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
            height: 701px;
        }
        .auto-style23 {
            width: 303px;
            height: 24px;
            background-color: #FFFFFF;
        }
        .auto-style28 {
            width: 79px;
            height: 24px;
        }
        .auto-style5 {
            width: 303px;
            color: #003366;
            background-color: #FFFFFF;
        }
        .auto-style36 {
            width: 150px;
            background-color: #FFFFFF;
        }
        .auto-style29 {
            width: 79px;
            background-color: #FFFFFF;
        }
        .auto-style40 {
            width: 303px;
            height: 29px;
            background-color: #3366CC;
            color: #FFFFFF;
        }
        .auto-style14 {
            width: 303px;
            height: 29px;
            background-color: #FFFFFF;
        }
        .auto-style32 {
            height: 29px;
            width: 79px;
        }
        .auto-style35 {
            width: 303px;
            height: 35px;
            background-color: #FFFFFF;
            color: #000099;
        }
        .auto-style33 {
            height: 35px;
            background-color: #FFFFFF;
            width: 79px;
            text-align: right;
        }
        .auto-style41 {
            height: 35px;
            background-color: #FFFFFF;
        }
        .auto-style42 {
            height: 29px;
            background-color: #3366CC;
        }
        .auto-style44 {
            background-color: #3366CC;
        }
        .auto-style48 {
            width: 303px;
            height: 29px;
            background-color: #FFFFFF;
            color: #0000CC;
        }
        .auto-style49 {
            height: 29px;
            width: 79px;
            color: #0000CC;
        }
        .auto-style50 {
            height: 29px;
            width: 79px;
            color: #CC0000;
        }
        .auto-style51 {
            height: 29px;
            width: 79px;
            margin-left: 40px;
        }
        .auto-style52 {
            width: 303px;
            height: 29px;
            background-color: #FFFFFF;
            color: #CC0000;
        }
        .auto-style53 {
            height: 29px;
        }
        .auto-style54 {
            height: 35px;
            background-color: #FFFFFF;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Payroll entry</h1><p>Record staff salary and payroll details.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


        <div class="auto-style1">
            <table class="auto-style6 legacy-title-row">
                <tr>
                    <td class="auto-style7">STAFF SALARY</td>
                    <td class="auto-style34">
                        <asp:Button ID="cmdclose" runat="server" Height="33px" Text="Home" Width="86px" BackColor="#3366CC" BorderStyle="Dotted" CssClass="auto-style25" ForeColor="White" PostBackUrl="~/Maindisplay.aspx" />
                    </td>
                </tr>
            </table>
            <br />
            <table class="auto-style2" align="center">
                <tr>
                    <td class="auto-style23">Select Month</td>
                    <td class="auto-style28" colspan="5">
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
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Select Staff Name:</strong></td>
                    <td class="auto-style36" colspan="3">
                        <asp:DropDownList ID="cmbstaff" runat="server" DataSourceID="staffnames" DataTextField="Staffname" DataValueField="Staffname" Height="34px" Width="243px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="staffnames" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString26 %>" ProviderName="<%$ ConnectionStrings:ConnectionString26.ProviderName %>" SelectCommand="SELECT [Staffname] FROM [reg] ORDER BY [Staffname]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style29" colspan="2">
                        <asp:Button ID="Btnsrch" runat="server" BackColor="#333333" BorderStyle="Dashed" Font-Size="XX-Small" ForeColor="White" Height="20px" Text="Show" Width="35px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style40">
                        Department:</td>
                    <td class="auto-style42">
                        <asp:TextBox ID="txtDept" runat="server" Width="168px" BorderStyle="Dotted" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="auto-style44" colspan="4" rowspan="4">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style40">
                        Phone Number</td>
                    <td class="auto-style42">
                        <asp:TextBox ID="txtphone" runat="server" Width="124px" BorderStyle="Dotted" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style40">
                        Bank</td>
                    <td class="auto-style42">
                        <asp:TextBox ID="txtbank" runat="server" Width="124px" BorderStyle="Dotted" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style40">
                        Account No</td>
                    <td class="auto-style42">
                        <asp:TextBox ID="txtaccno" runat="server" Width="124px" BorderStyle="Dotted" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style48">
                        <strong>Basic Salary:</strong></td>
                    <td class="auto-style53">
                        <asp:TextBox ID="txtbasic" runat="server" Width="82px" BorderStyle="Dotted" TextMode="Number"></asp:TextBox>
                    </td>
                    <td class="auto-style49" colspan="3">
                        <strong>Overtime:</strong></td>
                    <td class="auto-style32">
                        <asp:TextBox ID="txtovertime" runat="server" Width="82px" BorderStyle="Dotted" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style48">
                        <strong>Incentives:</strong></td>
                    <td class="auto-style53">
                        <asp:TextBox ID="txtinc" runat="server" Width="82px" BorderStyle="Dotted" TextMode="Number"></asp:TextBox>
                    </td>
                    <td class="auto-style50" colspan="3">
                        <strong>Loan</strong></td>
                    <td class="auto-style51">
                        <asp:TextBox ID="txtloan" runat="server" Width="82px" BorderStyle="Dotted" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style52">
                        <strong>Lateness</strong></td>
                    <td class="auto-style53">
                        <asp:TextBox ID="txtlate" runat="server" Width="82px" BorderStyle="Dotted" TextMode="Number"></asp:TextBox>
                    </td>
                    <td class="auto-style50" colspan="3">
                        <strong>Absent</strong></td>
                    <td class="auto-style32">
                        <asp:TextBox ID="txtabsent" runat="server" Width="82px" BorderStyle="Dotted" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        &nbsp;</td>
                    <td class="auto-style53">
                        &nbsp;</td>
                    <td class="auto-style32" colspan="3">
                        &nbsp;</td>
                    <td class="auto-style32">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style35">
                        <strong>NET SALARY</strong></td>
                    <td class="auto-style33" colspan="5">
                        <asp:TextBox ID="txtNet" runat="server" Width="82px" BorderStyle="Dotted" ReadOnly="True"></asp:TextBox>
                    &nbsp;
                        <asp:Button ID="btncheck" runat="server" BorderStyle="Solid" Text="Check" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style54" colspan="6">
                    <asp:GridView ID="Gridsalary" runat="server" Height="92px" Width="650px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                    </td>
                </tr>
                <tr>
                    <td class="auto-style41" colspan="6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style41" colspan="3">
                        <asp:Button ID="Cmdup" runat="server" BorderStyle="Dotted" Text="Update" />
                        <asp:Button ID="Cmdfind" runat="server" BorderStyle="Dotted" Text="Find" Width="67px" />
                    </td>
                    <td class="auto-style41" colspan="3">
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" Width="71px" />
                    </td>
                </tr>
            </table>
        </div>
            </section>
</asp:Content>
