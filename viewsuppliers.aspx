<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewsuppliers.aspx.vb" Inherits="jaybrix.viewsuppliers" MasterPageFile="~/Site.Master" Title="Suppliers" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page suppliers-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Suppliers</h1>
                <p>Browse registered suppliers and review their contact details and balances.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="suppliers-card" aria-labelledby="suppliers-card-title">
            <div class="suppliers-card-heading">
                <div>
                    <h2 id="suppliers-card-title">Supplier directory</h2>
                    <p>View the supplier list for your branch or enter another branch to filter.</p>
                </div>
                <div class="suppliers-branch-pill"><span>Current branch</span><asp:Label ID="LblBranch" runat="server" CssClass="suppliers-branch-value"></asp:Label></div>
            </div>
            <div class="suppliers-filter">
                <div class="suppliers-filter-field">
                    <asp:Label ID="SupplierBranchFilterLabel" runat="server" AssociatedControlID="txtBranch">Branch</asp:Label>
                    <asp:TextBox ID="txtBranch" runat="server" placeholder="Enter branch name"></asp:TextBox>
                </div>
                <asp:Button ID="cmdcontrol" runat="server" Text="Filter suppliers" CssClass="suppliers-filter-button" />
            </div>
            <div class="suppliers-table-wrap">
                <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Phone" DataSourceID="viewbust" GridLines="None" CssClass="suppliers-grid" EmptyDataText="No supplier records were found for this branch." UseAccessibleHeader="True">
                    <Columns>
                        <asp:BoundField DataField="Phone" HeaderText="Phone number" ReadOnly="True" SortExpression="Phone" />
                        <asp:BoundField DataField="SupplyNames" HeaderText="Supplier name" SortExpression="SupplyNames" />
                        <asp:BoundField DataField="Address" HeaderText="Location" SortExpression="Address" />
                        <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" DataFormatString="{0:N2}" />
                    </Columns>
                    <HeaderStyle CssClass="suppliers-grid-header" />
                    <RowStyle CssClass="suppliers-grid-row" />
                    <AlternatingRowStyle CssClass="suppliers-grid-alternate" />
                    <EmptyDataRowStyle CssClass="suppliers-grid-empty" />
                </asp:GridView>
                <asp:SqlDataSource ID="viewbust" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString20 %>" ProviderName="<%$ ConnectionStrings:ConnectionString20.ProviderName %>" SelectCommand="SELECT * FROM [supplier] ORDER BY [SupplyNames]"></asp:SqlDataSource>
            </div>
        </section>
    </section>
</asp:Content>
