<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="inoutcome.aspx.vb" Inherits="jaybrix.inoutcome" MasterPageFile="~/Site.Master" Title="Income and expenses" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page income-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Income &amp; expenses</h1>
                <p>Record cash activity and keep your account balance up to date.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="income-card" aria-labelledby="income-entry-title">
            <div class="income-card-header">
                <div>
                    <h2 id="income-entry-title">Transaction details</h2>
                    <p>Enter the date, account, and amount for this transaction.</p>
                </div>
                <div class="income-branch-summary">
                    <span>Active branch</span>
                    <asp:Label ID="LblBranch" runat="server" CssClass="income-branch-pill"></asp:Label>
                </div>
            </div>

            <div class="income-form-grid">
                <div class="income-field">
                    <asp:Label ID="TransactionDateLabel" runat="server" AssociatedControlID="txtdate">Transaction date</asp:Label>
                    <asp:TextBox ID="txtdate" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div class="income-field">
                    <asp:Label ID="BranchSelectLabel" runat="server" AssociatedControlID="TxtBranch">Branch</asp:Label>
                    <asp:DropDownList ID="TxtBranch" runat="server">
                        <asp:ListItem Selected="True"></asp:ListItem>
                        <asp:ListItem>HEAD OFFICE</asp:ListItem>
                        <asp:ListItem>OKPANAM</asp:ListItem>
                        <asp:ListItem>JASMINE</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="income-field">
                    <asp:Label ID="AccountTypeLabel" runat="server" AssociatedControlID="txtAccount">Account type</asp:Label>
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
                <div class="income-field income-particulars-field">
                    <asp:Label ID="ParticularsLabel" runat="server" AssociatedControlID="txtparticulars">Particulars</asp:Label>
                    <asp:DropDownList ID="txtparticulars" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Bank Transfer</asp:ListItem>
                        <asp:ListItem>Mobile Transfer</asp:ListItem>
                        <asp:ListItem>Cheque</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Wire Transfer</asp:ListItem>
                        <asp:ListItem>Bank Draft</asp:ListItem>
                        <asp:ListItem>POS Payment</asp:ListItem>
                        <asp:ListItem>Advert/Publicity</asp:ListItem>
                        <asp:ListItem>Carriage/Labourers</asp:ListItem>
                        <asp:ListItem>Computer/Printer</asp:ListItem>
                        <asp:ListItem>Domestic Expenses</asp:ListItem>
                        <asp:ListItem>Electricity/Lightning</asp:ListItem>
                        <asp:ListItem>Entertainment/PR</asp:ListItem>
                        <asp:ListItem>Feeding Allowance</asp:ListItem>
                        <asp:ListItem>Fine/Levies</asp:ListItem>
                        <asp:ListItem>Fuel,Oil/ Gas</asp:ListItem>
                        <asp:ListItem>Foreign Trip Exp.</asp:ListItem>
                        <asp:ListItem>Furnitures/ Fittings</asp:ListItem>
                        <asp:ListItem>Medical</asp:ListItem>
                        <asp:ListItem>Petty Expenses</asp:ListItem>
                        <asp:ListItem>Postage/Telephone</asp:ListItem>
                        <asp:ListItem>Printing/Stationary</asp:ListItem>
                        <asp:ListItem>Rent/Rates</asp:ListItem>
                        <asp:ListItem>Repair/Maintenance</asp:ListItem>
                        <asp:ListItem>Sanitation Fee</asp:ListItem>
                        <asp:ListItem>Taxation</asp:ListItem>
                        <asp:ListItem>Transport/Travelling</asp:ListItem>
                        <asp:ListItem>Union/Censor</asp:ListItem>
                        <asp:ListItem>Vehicle Repairs</asp:ListItem>
                        <asp:ListItem>Salary</asp:ListItem>
                        <asp:ListItem>Welfare/Bonus</asp:ListItem>
                        <asp:ListItem>Legal Fee</asp:ListItem>
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
                        <asp:ListItem>Raw Material</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="income-field income-detail-field">
                    <asp:Label ID="DetailLabel" runat="server" AssociatedControlID="txtdetail">Description or reference</asp:Label>
                    <asp:TextBox ID="txtdetail" runat="server" placeholder="Add details about this transaction"></asp:TextBox>
                </div>
                <div class="income-field">
                    <asp:Label ID="DebitLabel" runat="server" AssociatedControlID="txtDebit">Debit</asp:Label>
                    <asp:TextBox ID="txtDebit" runat="server" TextMode="Number" placeholder="0.00"></asp:TextBox>
                </div>
                <div class="income-field">
                    <asp:Label ID="CreditLabel" runat="server" AssociatedControlID="txtCredit">Credit</asp:Label>
                    <asp:TextBox ID="txtCredit" runat="server" TextMode="Number" placeholder="0.00"></asp:TextBox>
                </div>
                <div class="income-field income-balance-field">
                    <asp:Label ID="BalanceLabel" runat="server" AssociatedControlID="txtBal">Current balance</asp:Label>
                    <asp:TextBox ID="txtBal" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>

            <div class="income-form-actions">
                <asp:Button ID="cmdsubmit" runat="server" Text="Save transaction" CssClass="income-submit-button" />
            </div>
            <asp:Button ID="cmdclose" runat="server" Visible="False" Text="Home" PostBackUrl="~/Maindisplay.aspx" />
        </section>
    </section>
</asp:Content>
