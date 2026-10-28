<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Jasminestockbal.aspx.vb" Inherits="jaybrix.Jasminestockbal" MasterPageFile="~/Site.Master" Title="Jasmine stock balance" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page head-office-balance-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Jasmine stock balance</h1>
                <p>Review the current quantity of each product held at Jasmine.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="head-office-balance-card" aria-labelledby="head-office-balance-title">
            <div class="head-office-balance-card-heading">
                <div>
                    <h2 id="head-office-balance-title">Current stock by product</h2>
                    <p>Jasmine balances are listed by product name.</p>
                </div>
                <asp:Button ID="cmdprint" runat="server" Text="Print balance" CssClass="head-office-balance-print" />
            </div>
            <div class="head-office-balance-table-wrap">
                <asp:GridView ID="GridWarebal" runat="server" AutoGenerateColumns="True" GridLines="None" CssClass="head-office-balance-grid" EmptyDataText="No Jasmine stock balances were found." ShowHeaderWhenEmpty="True" UseAccessibleHeader="True">
                    <HeaderStyle CssClass="head-office-balance-grid-header" />
                    <RowStyle CssClass="head-office-balance-grid-row" />
                    <AlternatingRowStyle CssClass="head-office-balance-grid-alternate" />
                    <EmptyDataRowStyle CssClass="head-office-balance-grid-empty" />
                </asp:GridView>
            </div>
        </section>
    </section>
</asp:Content>
