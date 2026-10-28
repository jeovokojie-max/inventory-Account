<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Headofficestockhistory.aspx.vb" Inherits="jaybrix.Headofficestockhistory" MasterPageFile="~/Site.Master" Title="Head Office stock history" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page head-office-history-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Head Office stock history</h1>
                <p>Review stock receipts by product, date, or month.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="head-office-history-card" aria-labelledby="stock-history-table-title">
            <div class="head-office-history-card-heading">
                <div>
                    <h2 id="stock-history-table-title">Stock movement report</h2>
                    <p>Select a product, date, or month to view Head Office stock receipts.</p>
                </div>
                <asp:Button ID="cmdprint" runat="server" Text="Print report" CssClass="stock-history-print-button" />
            </div>
            <div class="stock-history-table-wrap">
                <asp:GridView ID="stkhistgrid" runat="server" GridLines="None" CssClass="stock-history-grid" EmptyDataText="Choose a product, date, or month to view stock history." ShowHeaderWhenEmpty="True" UseAccessibleHeader="True">
                    <HeaderStyle CssClass="stock-history-grid-header" />
                    <RowStyle CssClass="stock-history-grid-row" />
                    <AlternatingRowStyle CssClass="stock-history-grid-alternate" />
                    <EmptyDataRowStyle CssClass="stock-history-grid-empty" />
                </asp:GridView>
            </div>
        </section>

        <section class="head-office-history-card stock-history-controls" aria-labelledby="stock-history-filter-title">
            <div class="head-office-history-card-heading">
                <div>
                    <h2 id="stock-history-filter-title">Report filters</h2>
                    <p>Choose one filter to load matching stock records.</p>
                </div>
            </div>
            <div class="stock-history-filter-grid">
                <div class="stock-history-field">
                    <asp:Label ID="StockItemLabel" runat="server" AssociatedControlID="txtItem">Product</asp:Label>
                    <asp:DropDownList ID="txtItem" runat="server" DataSourceID="Itemsrc" DataTextField="Item" DataValueField="Item" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="Itemsrc" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString17 %>" ProviderName="<%$ ConnectionStrings:ConnectionString17.ProviderName %>" SelectCommand="SELECT [Item] FROM [Itemreg] ORDER BY [Item]"></asp:SqlDataSource>
                </div>
                <div class="stock-history-field">
                    <asp:Label ID="StockDateLabel" runat="server" AssociatedControlID="Txtdate">Transaction date</asp:Label>
                    <asp:TextBox ID="Txtdate" runat="server" TextMode="Date" AutoPostBack="True"></asp:TextBox>
                </div>
                <div class="stock-history-field">
                    <asp:Label ID="StockMonthLabel" runat="server" AssociatedControlID="Txtmonth">Month</asp:Label>
                    <asp:DropDownList ID="Txtmonth" runat="server" AutoPostBack="True">
                        <asp:ListItem>January</asp:ListItem><asp:ListItem>February</asp:ListItem><asp:ListItem>March</asp:ListItem><asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem><asp:ListItem>June</asp:ListItem><asp:ListItem>July</asp:ListItem><asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem><asp:ListItem>October</asp:ListItem><asp:ListItem>November</asp:ListItem><asp:ListItem>December</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="stock-history-totals">
                <div class="stock-history-total">
                    <asp:Label ID="StockQuantityTotalLabel" runat="server" AssociatedControlID="txtstock">Total stock received</asp:Label>
                    <asp:TextBox ID="txtstock" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="stock-history-total stock-history-total-value">
                    <asp:Label ID="StockValueTotalLabel" runat="server" AssociatedControlID="txtvalues">Total stock value</asp:Label>
                    <asp:TextBox ID="txtvalues" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
            </div>
        </section>
    </section>
</asp:Content>
