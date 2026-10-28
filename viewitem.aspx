<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewitem.aspx.vb" Inherits="jaybrix.viewitem" MasterPageFile="~/Site.Master" Title="Products" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page catalog-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Products</h1>
                <p>Browse registered products, costs, and selling prices.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="catalog-card" aria-labelledby="catalog-title">
            <div class="catalog-card-heading">
                <div>
                    <h2 id="catalog-title">Product catalogue</h2>
                    <p>Sort by a column heading or use the page controls to browse the list.</p>
                </div>
            </div>
            <div class="catalog-table-wrap">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Item" DataSourceID="itemrep" CssClass="catalog-grid" GridLines="None" EmptyDataText="No products are available.">
                    <Columns>
                        <asp:BoundField DataField="Item" HeaderText="Product" ReadOnly="True" SortExpression="Item" />
                        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" DataFormatString="{0:N2}" />
                        <asp:BoundField DataField="SellingPrice" HeaderText="Selling price" SortExpression="SellingPrice" DataFormatString="{0:N2}" />
                    </Columns>
                    <HeaderStyle CssClass="catalog-grid-header" />
                    <RowStyle CssClass="catalog-grid-row" />
                    <AlternatingRowStyle CssClass="catalog-grid-alternate" />
                    <PagerStyle CssClass="catalog-grid-pager" />
                    <EmptyDataRowStyle CssClass="catalog-grid-empty" />
                </asp:GridView>
                <asp:SqlDataSource ID="itemrep" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString11 %>" ProviderName="<%$ ConnectionStrings:ConnectionString11.ProviderName %>" SelectCommand="SELECT [Item], [Cost], [SellingPrice] FROM [Itemreg] ORDER BY [Item]"></asp:SqlDataSource>
            </div>
        </section>
    </section>
</asp:Content>
