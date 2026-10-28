<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="return.aspx.vb" Inherits="jaybrix._return" MasterPageFile="~/Site.Master" Title="Sales return" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page return-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Sales return</h1>
                <p>Record returned items and update the related balances.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="return-card" aria-labelledby="return-details-title">
            <div class="return-section-heading">
                <div>
                    <h2 id="return-details-title">Return details</h2>
                    <p>Find the original invoice, select an item, and enter the quantity being returned.</p>
                </div>
            </div>

            <div class="return-form-grid">
                <div class="return-field return-invoice-field">
                    <asp:Label ID="InvoiceLabel" runat="server" AssociatedControlID="txtInvno">Invoice number</asp:Label>
                    <div class="return-invoice-search">
                        <asp:TextBox ID="txtInvno" runat="server" MaxLength="11" TextMode="Number" placeholder="Enter invoice number"></asp:TextBox>
                        <asp:Button ID="Cmdshow" runat="server" CssClass="return-show-button" Text="Find invoice" />
                    </div>
                </div>
                <div class="return-field">
                    <asp:Label ID="CustomerLabel" runat="server" AssociatedControlID="txtName">Customer</asp:Label>
                    <asp:TextBox ID="txtName" runat="server" MaxLength="11" Enabled="False"></asp:TextBox>
                </div>
                <div class="return-field">
                    <asp:Label ID="BranchLabel" runat="server" AssociatedControlID="txtBranch">Branch</asp:Label>
                    <asp:TextBox ID="txtBranch" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="return-field">
                    <asp:Label ID="ItemLabel" runat="server" AssociatedControlID="txtItem">Item</asp:Label>
                    <asp:TextBox ID="txtItem" runat="server" MaxLength="11" Enabled="False"></asp:TextBox>
                </div>
                <div class="return-field">
                    <asp:Label ID="RateLabel" runat="server" AssociatedControlID="txtrate">Unit rate</asp:Label>
                    <asp:TextBox ID="txtrate" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="return-field">
                    <asp:Label ID="QuantitySoldLabel" runat="server" AssociatedControlID="txtqty">Quantity sold</asp:Label>
                    <asp:TextBox ID="txtqty" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="return-field">
                    <asp:Label ID="QuantityReturnedLabel" runat="server" AssociatedControlID="txtqtyRet">Quantity returned</asp:Label>
                    <asp:TextBox ID="txtqtyRet" runat="server" TextMode="Number" min="1" placeholder="Enter quantity"></asp:TextBox>
                </div>
                <div class="return-field">
                    <asp:Label ID="AmountLabel" runat="server" AssociatedControlID="txtAmount">Remaining amount</asp:Label>
                    <asp:TextBox ID="txtAmount" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>

            <div class="return-actions">
                <asp:Button ID="Cmdreturn" runat="server" CssClass="return-submit-button" Text="Process return" />
            </div>
        </section>

        <section class="return-results" aria-labelledby="invoice-items-title">
            <div class="return-section-heading">
                <div>
                    <h2 id="invoice-items-title">Invoice items</h2>
                    <p>Select the invoice line you want to return.</p>
                </div>
            </div>
            <div class="return-table-wrap">
                <asp:GridView ID="Gridledger" runat="server" CssClass="return-grid" GridLines="Horizontal" EmptyDataText="No invoice loaded. Enter an invoice number and select Find invoice.">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Select item" />
                    </Columns>
                </asp:GridView>
            </div>
        </section>
    </section>
</asp:Content>
