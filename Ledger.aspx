<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Ledger.aspx.vb" Inherits="jaybrix.Ledger" MasterPageFile="~/Site.Master" Title="Customer ledger" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page customer-ledger-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Customer ledger</h1>
                <p>Review a customer account and record payments or adjustments.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="ledger-card customer-card" aria-labelledby="customer-account-title">
            <div class="ledger-section-heading">
                <div>
                    <h2 id="customer-account-title">Customer account</h2>
                    <p>Choose a customer to view their contact details and current balance.</p>
                </div>
            </div>
            <div class="customer-select-row">
                <div class="ledger-field customer-select-field">
                    <asp:Label ID="CustomerSelectLabel" runat="server" AssociatedControlID="ltcustomer">Customer name</asp:Label>
                    <asp:DropDownList ID="ltcustomer" runat="server" DataSourceID="cust" DataTextField="CustNames" DataValueField="CustNames" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="cust" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString7 %>" ProviderName="<%$ ConnectionStrings:ConnectionString7.ProviderName %>" SelectCommand="SELECT [CustNames] FROM [Customer] ORDER BY [CustNames]"></asp:SqlDataSource>
                </div>
            </div>

            <div class="customer-summary-grid">
                <div class="ledger-field">
                    <asp:Label ID="PhoneLabel" runat="server" AssociatedControlID="txtPhone">Phone number</asp:Label>
                    <asp:TextBox ID="txtPhone" runat="server" MaxLength="11" TextMode="Number" Enabled="False"></asp:TextBox>
                </div>
                <div class="ledger-field">
                    <asp:Label ID="LocationLabel" runat="server" AssociatedControlID="txtLocation">Location</asp:Label>
                    <asp:TextBox ID="txtLocation" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="ledger-field balance-field">
                    <asp:Label ID="BalanceLabel" runat="server" AssociatedControlID="txtbalance">Current balance</asp:Label>
                    <asp:TextBox ID="txtbalance" runat="server" MaxLength="11" TextMode="Number" Enabled="False"></asp:TextBox>
                </div>
            </div>
        </section>

        <section class="ledger-card transaction-card" aria-labelledby="transaction-entry-title">
            <div class="ledger-section-heading">
                <div>
                    <h2 id="transaction-entry-title">Record a transaction</h2>
                    <p>Enter the payment or adjustment details for this account.</p>
                </div>
            </div>
            <div class="ledger-form-grid">
                <div class="ledger-field">
                    <asp:Label ID="DateLabel" runat="server" AssociatedControlID="txtdate">Transaction date</asp:Label>
                    <asp:TextBox ID="txtdate" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div class="ledger-field ledger-detail-field">
                    <asp:Label ID="DetailLabel" runat="server" AssociatedControlID="txtdetail">Reference or detail</asp:Label>
                    <asp:TextBox ID="txtdetail" runat="server" placeholder="Add a short reference"></asp:TextBox>
                </div>
                <div class="ledger-field ledger-particulars-field">
                    <asp:Label ID="ParticularsLabel" runat="server" AssociatedControlID="txtparticulars">Payment method or type</asp:Label>
                    <asp:DropDownList ID="txtparticulars" runat="server">
                        <asp:ListItem>Bank Transfer</asp:ListItem>
                        <asp:ListItem>Mobile Transfer</asp:ListItem>
                        <asp:ListItem>Cheque</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Wire Transfer</asp:ListItem>
                        <asp:ListItem>Bank Draft</asp:ListItem>
                        <asp:ListItem>POS Payment</asp:ListItem>
                        <asp:ListItem>Stock Out</asp:ListItem>
                        <asp:ListItem>Balance B/F</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="ledger-field">
                    <asp:Label ID="DebitLabel" runat="server" AssociatedControlID="txtDebit">Debit</asp:Label>
                    <asp:TextBox ID="txtDebit" runat="server" placeholder="0.00"></asp:TextBox>
                </div>
                <div class="ledger-field">
                    <asp:Label ID="PaymentLabel" runat="server" AssociatedControlID="txtCredit">Payment</asp:Label>
                    <asp:TextBox ID="txtCredit" runat="server" placeholder="0.00"></asp:TextBox>
                </div>
                <div class="ledger-field">
                    <asp:Label ID="QuantityLabel" runat="server" AssociatedControlID="txtqty">Quantity carried</asp:Label>
                    <asp:TextBox ID="txtqty" runat="server" placeholder="0"></asp:TextBox>
                </div>
            </div>
            <div class="ledger-actions">
                <asp:Button ID="cmdsubmit" runat="server" Text="Save transaction" CssClass="ledger-action-button" />
            </div>
        </section>
    </section>
</asp:Content>
