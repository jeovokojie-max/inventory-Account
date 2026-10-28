<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="item.aspx.vb" Inherits="jaybrix.item" MasterPageFile="~/Site.Master" Title="Product setup" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .item-setup { max-width: 820px; }
        .item-card { overflow: hidden; border: 1px solid #dce7e0; border-radius: 12px; background: #fff; box-shadow: 0 8px 24px #203b2d0b; }
        .item-card-heading { padding: 22px 26px; border-bottom: 1px solid #e8eee9; background: #fbfdfb; }
        .item-card-heading h2 { margin: 0; color: #203746; font-size: 18px; line-height: 1.35; }
        .item-card-heading p { margin: 6px 0 0; color: #647681; font-size: 13px; line-height: 1.5; }
        .item-form { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 19px 22px; padding: 25px 26px 22px; }
        .item-field { min-width: 0; display: flex; flex-direction: column; gap: 7px; }
        .item-field-full { grid-column: 1 / -1; }
        .item-field label { color: #304957; font-size: 13px; font-weight: 650; }
        .item-field input { width: 100%; min-height: 43px; padding: 10px 12px !important; border: 1px solid #cfdad5 !important; border-radius: 6px !important; background: #fff !important; color: #203746 !important; font: 14px "Segoe UI", Arial, sans-serif !important; }
        .item-field input:focus { border-color: #26835e !important; outline: 3px solid #26835e20; }
        .item-help { color: #75858e; font-size: 12px; line-height: 1.45; }
        .item-actions { display: flex; flex-wrap: wrap; align-items: center; gap: 10px; padding: 17px 26px; border-top: 1px solid #e8eee9; background: #fbfdfb; }
        .item-actions input { min-height: 40px !important; padding: 9px 17px !important; border: 1px solid #1b805c !important; border-radius: 6px !important; background: #1b8c64 !important; color: #fff !important; font: 650 13px "Segoe UI", Arial, sans-serif !important; cursor: pointer; }
        .item-actions input:hover { background: #126e4e !important; }
        .item-actions .item-delete { margin-right: auto; border-color: #f0d7d7 !important; background: #fff !important; color: #b43b3b !important; }
        .item-actions .item-delete:hover { border-color: #e6baba !important; background: #fff7f7 !important; }
        @media (max-width: 600px) {
            .item-setup { padding-left: 14px; padding-right: 14px; }
            .item-card-heading { padding: 18px 17px; }
            .item-card-heading h2 { font-size: 16px; }
            .item-form { grid-template-columns: minmax(0, 1fr); gap: 17px; padding: 20px 17px; }
            .item-field-full { grid-column: auto; }
            .item-actions { padding: 15px 17px; gap: 8px; }
            .item-actions input { flex: 1 1 auto; }
            .item-actions .item-delete { margin-right: 0; }
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page item-setup">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Product setup</h1>
                <p>Register a product or update its pricing.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">← Overview</a>
        </div>

        <section class="item-card" aria-labelledby="item-form-title">
            <div class="item-card-heading">
                <h2 id="item-form-title">Product details</h2>
                <p>Enter a product name. If it already exists, its current prices will load so you can update them.</p>
            </div>
            <div class="item-form">
                <div class="item-field item-field-full">
                    <asp:Label ID="ItemNameLabel" runat="server" AssociatedControlID="txtitem">Item name</asp:Label>
                    <asp:TextBox ID="txtitem" runat="server" AutoPostBack="True" MaxLength="150" placeholder="e.g. Product name"></asp:TextBox>
                    <span class="item-help">Use the existing item name to look up its current pricing.</span>
                </div>
                <div class="item-field">
                    <asp:Label ID="CostPriceLabel" runat="server" AssociatedControlID="txtcost">Cost price</asp:Label>
                    <asp:TextBox ID="txtcost" runat="server" TextMode="Number" step="0.01" min="0" placeholder="0.00"></asp:TextBox>
                </div>
                <div class="item-field">
                    <asp:Label ID="SellingPriceLabel" runat="server" AssociatedControlID="txtSP">Selling price</asp:Label>
                    <asp:TextBox ID="txtSP" runat="server" TextMode="Number" step="0.01" min="0" placeholder="0.00"></asp:TextBox>
                </div>
            </div>
            <div class="item-actions">
                <asp:Button ID="Btndel" runat="server" Text="Delete item" CssClass="item-delete" OnClientClick="return confirm('Delete this item? This cannot be undone.');" />
                <asp:Button ID="Cmdup" runat="server" Text="Update prices" />
                <asp:Button ID="cmdsubmit" runat="server" OnClick="cmdsubmit_Click" Text="Register item" />
            </div>
        </section>
    </section>
</asp:Content>
