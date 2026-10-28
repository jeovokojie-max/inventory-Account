<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OkpanamStock.aspx.vb" Inherits="jaybrix.OkpanamStock" MasterPageFile="~/Site.Master" Title="Okpanam Stock page" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .stock-page { max-width: 980px; }
        .stock-card { overflow: hidden; border: 1px solid #dce7e0; border-radius: 12px; background: #fff; box-shadow: 0 8px 24px #203b2d0b; }
        .stock-card-heading { display: flex; align-items: flex-start; justify-content: space-between; gap: 18px; padding: 22px 25px; border-bottom: 1px solid #e8eee9; background: #fbfdfb; }
        .stock-card-heading h2 { margin: 0; color: #203746; font-size: 18px; line-height: 1.35; }
        .stock-card-heading p { margin: 6px 0 0; color: #647681; font-size: 13px; line-height: 1.5; }
        .stock-location-chip { flex: 0 0 auto; display: flex; align-items: center; gap: 8px; min-height: 34px; padding: 6px 11px; border: 1px solid #d3e7db; border-radius: 20px; background: #edf7f0; color: #176b4b; font-size: 12px; font-weight: 650; letter-spacing: .04em; }
        .stock-location-chip:before { width: 7px; height: 7px; border-radius: 50%; background: #21815e; content: ""; }
        .stock-form { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 20px 22px; padding: 24px 25px; }
        .stock-section { grid-column: 1 / -1; display: flex; align-items: center; gap: 12px; margin-top: 2px; padding-bottom: 10px; border-bottom: 1px solid #e8eee9; color: #254151; font-size: 14px; font-weight: 700; }
        .stock-section span { color: #809098; font-size: 12px; font-weight: 400; }
        .stock-field { min-width: 0; display: flex; flex-direction: column; gap: 7px; }
        .stock-field label { color: #304957; font-size: 13px; font-weight: 650; }
        .stock-field input:not([type=submit]):not([type=button]), .stock-field select { box-sizing: border-box; width: 100%; min-height: 42px; padding: 9px 11px; border: 1px solid #cfdad5; border-radius: 6px; background: #fff; color: #203746; font: 14px "Segoe UI", Arial, sans-serif; }
        .stock-field input[readonly] { background: #f5f8f6 !important; color: #536974 !important; }
        .stock-field input:focus, .stock-field select:focus { border-color: #26835e; outline: 3px solid #26835e20; }
        .stock-hint { color: #75858e; font-size: 12px; line-height: 1.45; }
        .stock-show-balance { align-self: end; min-height: 42px !important; padding: 9px 15px !important; border: 1px solid #b8d8c5 !important; border-radius: 6px !important; background: #f1f8f3 !important; color: #176b4b !important; font: 650 13px "Segoe UI", Arial, sans-serif !important; cursor: pointer; }
        .stock-show-balance:hover { background: #e4f2e8 !important; }
        .stock-actions { grid-column: 1 / -1; display: flex; justify-content: flex-end; padding-top: 4px; }
        .stock-actions input { min-height: 43px !important; padding: 10px 22px !important; border: 1px solid #1b805c !important; border-radius: 6px !important; background: #1b8c64 !important; color: #fff !important; font: 700 14px "Segoe UI", Arial, sans-serif !important; cursor: pointer; }
        .standard-page .stock-actions input[type=submit] { border-color: #0e5d42 !important; background: #146c4f !important; color: #fff !important; font-weight: 800 !important; text-shadow: 0 1px 1px #103e2f; }
        .stock-actions input:hover { background: #126e4e !important; }
        .standard-page .stock-actions input[type=submit]:hover { background: #0f5c43 !important; }
        .standard-page .stock-actions input[type=submit]:focus-visible { outline: 3px solid #8ad6b0; outline-offset: 2px; }
        @media (max-width: 600px) {
            .stock-page { padding-left: 14px; padding-right: 14px; }
            .stock-card-heading { flex-direction: column; padding: 18px 17px; }
            .stock-card-heading h2 { font-size: 16px; }
            .stock-form { grid-template-columns: minmax(0, 1fr); gap: 17px; padding: 20px 17px; }
            .stock-section, .stock-actions { grid-column: auto; }
            .stock-section { flex-wrap: wrap; gap: 4px 10px; }
            .stock-show-balance { width: 100%; }
            .stock-actions input { width: 100%; }
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page stock-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Okpanam Stock page</h1>
                <p>Receive and track stock held at the Okpanam location.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">← Overview</a>
        </div>

        <section class="stock-card" aria-labelledby="stock-entry-title">
            <div class="stock-card-heading">
                <div>
                    <h2 id="stock-entry-title">Receive stock</h2>
                    <p>Select an item and enter the delivery details for Okpanam.</p>
                </div>
                <div class="stock-location-chip">OKPANAM</div>
            </div>
            <div class="stock-form">
                <div class="stock-section">Stock selection <span>Item and current Okpanam balance</span></div>
                <div class="stock-field">
                    <asp:Label ID="ItemLabel" runat="server" AssociatedControlID="txtitem">Item</asp:Label>
                    <asp:DropDownList ID="txtitem" runat="server" DataSourceID="SqlDataSource1" DataTextField="Item" DataValueField="Item" AutoPostBack="True" Height="25px" Width="285px" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [Item] FROM [Itemreg] ORDER BY [Item]"></asp:SqlDataSource>
                </div>
                <div class="stock-field">
                    <asp:Label ID="CostLabel" runat="server" AssociatedControlID="txtcost">Unit cost</asp:Label>
                    <asp:TextBox ID="txtcost" runat="server" ReadOnly="True" TextMode="Number" step="0.01" />
                </div>
                <div class="stock-field">
                    <asp:Label ID="BalanceLabel" runat="server" AssociatedControlID="txtBal">Current Okpanam balance</asp:Label>
                    <asp:TextBox ID="txtBal" runat="server" ReadOnly="True" />
                </div>

                <div class="stock-section">Receiving details <span>Date and quantity for this stock-in</span></div>
                <div class="stock-field">
                    <asp:Label ID="DateLabel" runat="server" AssociatedControlID="txtdate">Received date</asp:Label>
                    <asp:TextBox ID="txtdate" runat="server" TextMode="Date" />
                </div>
                <div class="stock-field">
                    <asp:Label ID="QuantityLabel" runat="server" AssociatedControlID="txtqty">Quantity received</asp:Label>
                    <asp:TextBox ID="txtqty" runat="server" TextMode="Number" min="1" step="1" AutoPostBack="True" />
                </div>
                <div class="stock-field">
                    <asp:Label ID="ValueLabel" runat="server" AssociatedControlID="txtValue">Total stock value</asp:Label>
                    <asp:TextBox ID="txtValue" runat="server" ReadOnly="True" TextMode="Number" step="0.01" />
                    <span class="stock-hint">Calculated from unit cost and quantity.</span>
                </div>
                <div class="stock-field">
                    <asp:Label ID="ParticularsLabel" runat="server" AssociatedControlID="txtparticulars">Particulars</asp:Label>
                    <asp:TextBox ID="txtparticulars" runat="server" MaxLength="250" placeholder="Optional delivery note" />
                </div>
                <div class="stock-actions">
                    <asp:Button ID="cmdsubmit" runat="server" Text="Record stock received" />
                </div>
            </div>
        </section>
    </section>
</asp:Content>

