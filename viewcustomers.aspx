<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewcustomers.aspx.vb" Inherits="jaybrix.viewcustomers" MasterPageFile="~/Site.Master" Title="Customers" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page customers-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Customers</h1>
                <p>Browse registered customers and review their account balances.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="customers-card" aria-labelledby="customers-card-title">
            <div class="customers-card-heading">
                <div>
                    <h2 id="customers-card-title">Customer directory</h2>
                    <p>View customers across your branch or filter the list by branch.</p>
                </div>
                <div class="customers-branch-pill"><span>Current branch</span><asp:Label ID="LblBranch" runat="server" CssClass="customers-branch-value"></asp:Label></div>
            </div>

            <div class="customers-filter">
                <div class="customers-filter-field">
                    <asp:Label ID="BranchFilterLabel" runat="server" AssociatedControlID="txtBranch">Branch</asp:Label>
                    <asp:TextBox ID="txtBranch" runat="server" placeholder="Enter branch name"></asp:TextBox>
                </div>
                <asp:Button ID="cmdcontrol" runat="server" Text="Filter customers" CssClass="customers-filter-button" />
            </div>

            <div class="customers-table-wrap">
                <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Phone" DataSourceID="viewbust" GridLines="None" CssClass="customers-grid" EmptyDataText="No customer records were found for this branch." UseAccessibleHeader="True">
                    <Columns>
                        <asp:BoundField DataField="Phone" HeaderText="Phone number" ReadOnly="True" SortExpression="Phone" />
                        <asp:BoundField DataField="CustNames" HeaderText="Customer name" SortExpression="CustNames" />
                        <asp:BoundField DataField="Address" HeaderText="Location" SortExpression="Address" />
                        <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
                    </Columns>
                    <HeaderStyle CssClass="customers-grid-header" />
                    <RowStyle CssClass="customers-grid-row" />
                    <AlternatingRowStyle CssClass="customers-grid-alternate" />
                    <EmptyDataRowStyle CssClass="customers-grid-empty" />
                </asp:GridView>
                <asp:SqlDataSource ID="viewbust" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString8 %>" ProviderName="<%$ ConnectionStrings:ConnectionString8.ProviderName %>" SelectCommand="SELECT * FROM [Customer] ORDER BY [CustNames]"></asp:SqlDataSource>
            </div>
        </section>
    </section>
</asp:Content>
