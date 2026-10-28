<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="supplyLedger.aspx.vb" Inherits="jaybrix.supplyLedger" MasterPageFile="~/Site.Master" Title="Supplier ledger" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page supplier-ledger-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Supplier ledger</h1>
                <p>Review supplier balances and record payments.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="supplier-ledger-card supplier-ledger-summary" aria-labelledby="supplier-ledger-profile-title">
            <div class="supplier-ledger-card-heading">
                <div>
                    <h2 id="supplier-ledger-profile-title">Supplier account</h2>
                    <p>Select a supplier to view their contact details and current balance.</p>
                </div>
            </div>
            <div class="supplier-ledger-grid supplier-profile-grid">
                <div class="supplier-ledger-field supplier-ledger-name-field">
                    <asp:Label ID="SupplierNameLabel" runat="server" AssociatedControlID="ltcustomer">Supplier Name:</asp:Label>
                    <asp:SqlDataSource ID="supplynames" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString19 %>" ProviderName="<%$ ConnectionStrings:ConnectionString19.ProviderName %>" SelectCommand="SELECT [SupplyNames] FROM [supplier] ORDER BY [SupplyNames]"></asp:SqlDataSource>
                    <asp:DropDownList ID="ltcustomer" runat="server" DataSourceID="supplynames" DataTextField="SupplyNames" DataValueField="SupplyNames" AutoPostBack="True"></asp:DropDownList>
                </div>
                <div class="supplier-ledger-field">
                    <asp:Label ID="SupplierPhoneLabel" runat="server" AssociatedControlID="txtPhone">Phone number</asp:Label>
                    <asp:TextBox ID="txtPhone" runat="server" MaxLength="11" TextMode="Number" Enabled="False"></asp:TextBox>
                </div>
                <div class="supplier-ledger-field">
                    <asp:Label ID="SupplierLocationLabel" runat="server" AssociatedControlID="txtLocation">Location</asp:Label>
                    <asp:TextBox ID="txtLocation" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="supplier-ledger-field supplier-ledger-balance-field">
                    <asp:Label ID="SupplierBalanceLabel" runat="server" AssociatedControlID="txtbalance">Current balance</asp:Label>
                    <asp:TextBox ID="txtbalance" runat="server" MaxLength="11" TextMode="Number" Enabled="False"></asp:TextBox>
                </div>
            </div>
        </section>

        <section class="supplier-ledger-card supplier-ledger-entry" aria-labelledby="supplier-ledger-entry-title">
            <div class="supplier-ledger-card-heading">
                <div>
                    <h2 id="supplier-ledger-entry-title">Record a transaction</h2>
                    <p>Enter the transaction details, then submit to update this supplier's ledger.</p>
                </div>
            </div>
            <div class="supplier-ledger-grid supplier-entry-grid">
                <div class="supplier-ledger-field">
                    <asp:Label ID="SupplierDateLabel" runat="server" AssociatedControlID="txtdate">Transaction date</asp:Label>
                    <asp:TextBox ID="txtdate" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div class="supplier-ledger-field">
                    <asp:Label ID="SupplierDetailLabel" runat="server" AssociatedControlID="txtdetail">Payment detail / reference</asp:Label>
                    <asp:TextBox ID="txtdetail" runat="server" placeholder="Enter a reference or note"></asp:TextBox>
                </div>
                <div class="supplier-ledger-field">
                    <asp:Label ID="SupplierParticularsLabel" runat="server" AssociatedControlID="txtparticulars">Transaction type</asp:Label>
                    <asp:DropDownList ID="txtparticulars" runat="server">
                        <asp:ListItem>Bank Transfer</asp:ListItem>
                        <asp:ListItem>Mobile Transfer</asp:ListItem>
                        <asp:ListItem>Cheque</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Wire Transfer</asp:ListItem>
                        <asp:ListItem>Bank Draft</asp:ListItem>
                        <asp:ListItem>POS Payment</asp:ListItem>
                        <asp:ListItem>Supplies</asp:ListItem>
                        <asp:ListItem>Raw Material</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="supplier-ledger-field">
                    <asp:Label ID="SupplierDebitLabel" runat="server" AssociatedControlID="txtDebit">Debit / charge</asp:Label>
                    <asp:TextBox ID="txtDebit" runat="server" TextMode="Number" placeholder="0.00"></asp:TextBox>
                </div>
                <div class="supplier-ledger-field">
                    <asp:Label ID="SupplierPaymentLabel" runat="server" AssociatedControlID="txtCredit">Payment / credit</asp:Label>
                    <asp:TextBox ID="txtCredit" runat="server" TextMode="Number" placeholder="0.00"></asp:TextBox>
                </div>
            </div>
            <div class="supplier-ledger-actions">
                <asp:Button ID="cmdsubmit" runat="server" Text="Record transaction" CssClass="supplier-ledger-submit" />
            </div>
            <asp:Button ID="cmdclose" runat="server" Visible="False" Text="Home" PostBackUrl="~/Maindisplay.aspx" />
        </section>
    </section>
</asp:Content>
