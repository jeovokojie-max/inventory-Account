<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewincome.aspx.vb" Inherits="jaybrix.viewincome" MasterPageFile="~/Site.Master" Title="Income analysis" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page income-report-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Income analysis</h1>
                <p>Review income and expense activity by account, date, or month.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="income-report-card" aria-labelledby="income-report-table-title">
            <div class="income-report-card-heading">
                <div>
                    <h2 id="income-report-table-title">Transaction report</h2>
                    <p>Choose a report filter below to load matching transactions.</p>
                </div>
                <div class="income-report-branch-pill"><span>Current branch</span><asp:Label ID="LblBranch" runat="server" CssClass="income-report-branch-value"></asp:Label></div>
            </div>
            <div class="income-report-table-wrap">
                <asp:GridView ID="Gridsales" runat="server" AutoGenerateColumns="True" GridLines="None" CssClass="income-report-grid" EmptyDataText="Select a filter below to view income and expense transactions." UseAccessibleHeader="True">
                    <HeaderStyle CssClass="income-report-grid-header" />
                    <RowStyle CssClass="income-report-grid-row" />
                    <AlternatingRowStyle CssClass="income-report-grid-alternate" />
                    <EmptyDataRowStyle CssClass="income-report-grid-empty" />
                </asp:GridView>
            </div>
        </section>

        <section class="income-report-card income-report-filters" aria-labelledby="income-report-filter-title">
            <div class="income-report-card-heading">
                <div>
                    <h2 id="income-report-filter-title">Report filters</h2>
                    <p>Run a report by account, date, or month.</p>
                </div>
            </div>
            <div class="income-report-filter-grid">
                <div class="income-report-filter-group">
                    <h3>Account</h3>
                    <div class="income-report-field">
                        <asp:Label ID="IncomeBranchLabel" runat="server" AssociatedControlID="TxtBranch">Branch</asp:Label>
                        <asp:DropDownList ID="TxtBranch" runat="server" DataSourceID="SqlDataSource1" DataTextField="WareNames" DataValueField="WareNames" Enabled="False"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString25 %>" ProviderName="<%$ ConnectionStrings:ConnectionString25.ProviderName %>" SelectCommand="SELECT [WareNames] FROM [Warehouses]"></asp:SqlDataSource>
                    </div>
                    <div class="income-report-field">
                        <asp:Label ID="IncomeAccountLabel" runat="server" AssociatedControlID="txtAccount">Account</asp:Label>
                        <asp:DropDownList ID="txtAccount" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Banking</asp:ListItem>
                            <asp:ListItem>Expenditure</asp:ListItem>
                            <asp:ListItem>External Income</asp:ListItem>
                            <asp:ListItem>Loan</asp:ListItem>
                            <asp:ListItem>Purchase</asp:ListItem>
                            <asp:ListItem>Cash Sales</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="cmdAct" runat="server" Text="View account" CssClass="income-report-action" />
                </div>

                <div class="income-report-filter-group">
                    <h3>Filter by date</h3>
                    <div class="income-report-field">
                        <asp:Label ID="IncomeDateLabel" runat="server" AssociatedControlID="txtdate">Date</asp:Label>
                        <asp:TextBox ID="txtdate" runat="server" placeholder="Enter date"></asp:TextBox>
                    </div>
                    <div class="income-report-button-row">
                        <asp:Button ID="cmdAcctdate" runat="server" Text="Account and date" CssClass="income-report-action income-report-secondary-action" />
                        <asp:Button ID="cmddate" runat="server" Text="Branch and date" CssClass="income-report-action" />
                    </div>
                </div>

                <div class="income-report-filter-group">
                    <h3>Filter by month</h3>
                    <div class="income-report-field">
                        <asp:Label ID="IncomeMonthLabel" runat="server" AssociatedControlID="DrpMonth">Month</asp:Label>
                        <asp:DropDownList ID="DrpMonth" runat="server">
                            <asp:ListItem>January</asp:ListItem><asp:ListItem>February</asp:ListItem><asp:ListItem>March</asp:ListItem><asp:ListItem>April</asp:ListItem>
                            <asp:ListItem>May</asp:ListItem><asp:ListItem>June</asp:ListItem><asp:ListItem>July</asp:ListItem><asp:ListItem>August</asp:ListItem>
                            <asp:ListItem>September</asp:ListItem><asp:ListItem>October</asp:ListItem><asp:ListItem>November</asp:ListItem><asp:ListItem>December</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="income-report-button-row">
                        <asp:Button ID="cmdAcctMonth" runat="server" Text="Account and month" CssClass="income-report-action income-report-secondary-action" />
                        <asp:Button ID="cmdmonth" runat="server" Text="Branch and month" CssClass="income-report-action" />
                    </div>
                </div>
            </div>
            <div class="income-report-totals">
                <div class="income-report-field">
                    <asp:Label ID="IncomeDebitTotalLabel" runat="server" AssociatedControlID="txtDamount">Total debit</asp:Label>
                    <asp:TextBox ID="txtDamount" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="income-report-field">
                    <asp:Label ID="IncomeCreditTotalLabel" runat="server" AssociatedControlID="txtCamount">Total credit</asp:Label>
                    <asp:TextBox ID="txtCamount" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="income-report-field income-report-balance">
                    <asp:Label ID="IncomeBalanceLabel" runat="server" AssociatedControlID="txtBal">Balance</asp:Label>
                    <asp:TextBox ID="txtBal" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>
        </section>
    </section>
</asp:Content>
