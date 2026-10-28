<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OkpanamSales.aspx.vb" Inherits="jaybrix.OkpanamSales" MasterPageFile="~/Site.Master" Title="Okpanam sales" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .sales-page { max-width: 1160px; }
        .sales-location { display: inline-flex; align-items: center; gap: 8px; margin-top: 10px; padding: 7px 11px; border: 1px solid #d2e6d9; border-radius: 20px; background: #edf7f0; color: #176b4b; font-size: 11px; font-weight: 750; letter-spacing: .05em; }
        .sales-location:before { width: 7px; height: 7px; border-radius: 50%; background: #21815e; content: ""; }
        .sales-card { overflow: hidden; margin-bottom: 18px; border: 1px solid #dce7e0; border-radius: 12px; background: #fff; box-shadow: 0 6px 20px #203b2d09; }
        .sales-card-heading { padding: 19px 22px; border-bottom: 1px solid #e8eee9; background: #fbfdfb; }
        .sales-card-heading h2 { margin: 0; color: #203746; font-size: 17px; }
        .sales-card-heading p { margin: 5px 0 0; color: #647681; font-size: 12px; line-height: 1.5; }
        .sales-meta-grid,.sales-entry-grid { display: grid; grid-template-columns: repeat(3,minmax(0,1fr)); gap: 17px 19px; padding: 21px 22px; }
        .sales-field { min-width: 0; display: flex; flex-direction: column; gap: 7px; }
        .sales-field label { color: #304957; font-size: 12px; font-weight: 700; }
        .standard-page .sales-field input:not([type=submit]):not([type=button]),.standard-page .sales-field select { box-sizing: border-box; width: 100% !important; min-height: 41px !important; padding: 9px 11px !important; border: 1px solid #cfdad5 !important; border-radius: 6px !important; background: #fff !important; color: #203746 !important; font: 13px "Segoe UI",Arial,sans-serif !important; }
        .standard-page .sales-field input[readonly] { background: #f5f8f6 !important; color: #536974 !important; }
        .standard-page .sales-field input:focus,.standard-page .sales-field select:focus { border-color: #26835e !important; outline: 3px solid #26835e20; }
        .sales-field small { color: #75858e; font-size: 11px; line-height: 1.4; }
        .sales-field-wide { grid-column: span 2; }
        .sales-entry-grid { grid-template-columns: 2fr 1fr 1fr 1fr auto; align-items: end; }
        .sales-entry-actions { display: flex; align-items: end; }
        .standard-page input.sales-button[type=submit] { min-height: 41px !important; padding: 9px 16px !important; border: 1px solid #0e5d42 !important; border-radius: 6px !important; background: #146c4f !important; color: #fff !important; font: 750 13px "Segoe UI",Arial,sans-serif !important; cursor: pointer; white-space: nowrap; }
        .standard-page input.sales-button[type=submit]:hover { background: #0f5c43 !important; }
        .standard-page input.sales-button[type=submit]:focus-visible { outline: 3px solid #8ad6b0; outline-offset: 2px; }
        .sales-entry-footer { padding: 0 22px 20px; color: #667b85; font-size: 12px; }
        .sales-entry-footer strong { color: #176b4b; }
        .sales-cart { padding: 18px 22px 21px; }
        .sales-grid-wrap { overflow-x: auto; border: 1px solid #e2e9e5; border-radius: 8px; }
        .standard-page table.sales-grid { width: 100% !important; min-width: 560px; max-width: none !important; margin: 0 !important; border: 0 !important; border-collapse: collapse !important; border-spacing: 0 !important; border-radius: 0 !important; background: #fff !important; box-shadow: none !important; color: #304957; font-size: 13px; }
        .standard-page table.sales-grid th { padding: 12px 13px !important; border-color: #e8eee9 !important; background: #edf4ef !important; color: #254151 !important; text-align: left; font-size: 11px; font-weight: 750; white-space: nowrap; }
        .standard-page table.sales-grid td { padding: 11px 13px !important; border-color: #e8eee9 !important; border-top: 1px solid #e8eee9 !important; background: #fff !important; color: #304957 !important; }
        .standard-page table.sales-grid tr:nth-child(even) td { background: #fbfdfb !important; }
        .standard-page table.sales-grid a { color: #a73d3d !important; font-weight: 650; text-decoration: none; }
        .sales-total-row { display: flex; justify-content: flex-end; align-items: baseline; gap: 13px; padding: 16px 0 13px; color: #516773; font-size: 13px; }
        .sales-total-row label { font-weight: 700; }
        .standard-page .sales-total-row input { width: 150px !important; min-height: 40px !important; padding: 7px 10px !important; border: 1px solid #cfdad5 !important; border-radius: 6px !important; background: #f5f8f6 !important; color: #1f3b4a !important; text-align: right; font: 750 16px "Segoe UI",Arial,sans-serif !important; }
        .sales-save-row { display: flex; justify-content: flex-end; padding-top: 4px; }
        .sales-save { min-height: 46px !important; padding: 11px 20px !important; font-size: 14px !important; }
        .sales-empty { padding: 22px 13px; color: #75858e; text-align: center; font-size: 13px; }
        @media(max-width:800px) { .sales-entry-grid { grid-template-columns: repeat(2,minmax(0,1fr)); } }
        @media(max-width:600px) {
            .sales-page { padding-left: 14px; padding-right: 14px; }
            .sales-card-heading { padding: 17px; }
            .sales-meta-grid,.sales-entry-grid { grid-template-columns: minmax(0,1fr); gap: 15px; padding: 18px 17px; }
            .sales-field-wide { grid-column: auto; }
            .sales-entry-actions,.sales-entry-actions input,.sales-save-row,.sales-save-row input { width: 100%; }
            .sales-cart { padding: 15px 14px 17px; }
            .sales-total-row { justify-content: space-between; }
            .sales-total-row input { width: 52%; }
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page sales-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Okpanam sales</h1>
                <p>Create one invoice from selected Okpanam stock.</p>
                <span class="sales-location">OKPANAM</span>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">← Overview</a>
        </div>

        <section class="sales-card" aria-labelledby="invoice-details-title">
            <div class="sales-card-heading">
                <h2 id="invoice-details-title">Invoice details</h2>
                <p>Enter the customer and delivery information for this sale.</p>
            </div>
            <div class="sales-meta-grid">
                <div class="sales-field">
                    <asp:Label ID="DateLabel" runat="server" AssociatedControlID="txtdate">Sale date</asp:Label>
                    <asp:TextBox ID="txtdate" runat="server" TextMode="Date" />
                </div>
                <div class="sales-field">
                    <asp:Label ID="InvoiceLabel" runat="server" AssociatedControlID="txtinv">Invoice number</asp:Label>
                    <asp:TextBox ID="txtinv" runat="server" ReadOnly="True" />
                </div>
                <div class="sales-field">
                    <asp:Label ID="CustomerLabel" runat="server" AssociatedControlID="ltcustomer">Customer</asp:Label>
                    <asp:DropDownList ID="ltcustomer" runat="server" DataSourceID="customer" DataTextField="CustNames" DataValueField="CustNames" />
                    <asp:SqlDataSource ID="customer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString6 %>" ProviderName="<%$ ConnectionStrings:ConnectionString6.ProviderName %>" SelectCommand="SELECT [CustNames] FROM [Customer] ORDER BY [CustNames]"></asp:SqlDataSource>
                </div>
                <div class="sales-field">
                    <asp:Label ID="WaybillLabel" runat="server" AssociatedControlID="txtwaybil">Waybill number (optional)</asp:Label>
                    <asp:TextBox ID="txtwaybil" runat="server" MaxLength="25" />
                </div>
                <div class="sales-field sales-field-wide">
                    <asp:Label ID="DriverLabel" runat="server" AssociatedControlID="txtDriver">Driver (optional)</asp:Label>
                    <asp:TextBox ID="txtDriver" runat="server" MaxLength="100" />
                </div>
            </div>
        </section>

        <section class="sales-card" aria-labelledby="add-item-title">
            <div class="sales-card-heading">
                <h2 id="add-item-title">Add items</h2>
                <p>Select an item to load its selling price and available Okpanam balance.</p>
            </div>
            <div class="sales-entry-grid">
                <div class="sales-field">
                    <asp:Label ID="ItemLabel" runat="server" AssociatedControlID="ltitem">Item</asp:Label>
                    <asp:DropDownList ID="ltitem" runat="server" DataSourceID="SqlDataSource1" DataTextField="Item" DataValueField="Item" AutoPostBack="True" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT [Item] FROM [Itemreg] ORDER BY [Item]"></asp:SqlDataSource>
                </div>
                <div class="sales-field">
                    <asp:Label ID="RateLabel" runat="server" AssociatedControlID="txtrate">Selling price</asp:Label>
                    <asp:TextBox ID="txtrate" runat="server" TextMode="Number" min="0" step="0.01" AutoPostBack="True" />
                </div>
                <div class="sales-field">
                    <asp:Label ID="BalanceLabel" runat="server" AssociatedControlID="txtBal">Okpanam balance</asp:Label>
                    <asp:TextBox ID="txtBal" runat="server" ReadOnly="True" />
                </div>
                <div class="sales-field">
                    <asp:Label ID="QuantityLabel" runat="server" AssociatedControlID="txtqty">Quantity</asp:Label>
                    <asp:TextBox ID="txtqty" runat="server" TextMode="Number" min="1" step="1" AutoPostBack="True" />
                </div>
                <div class="sales-entry-actions">
                    <asp:Button ID="cmdcontrol" runat="server" Text="Add item" CssClass="sales-button" />
                </div>
                <div class="sales-entry-footer">
                    <span>Line total: </span><strong><asp:Label ID="LineTotalLabel" runat="server" Text="₦0.00" /></strong>
                </div>
            </div>
        </section>

        <section class="sales-card" aria-labelledby="invoice-items-title">
            <div class="sales-card-heading">
                <h2 id="invoice-items-title">Invoice items</h2>
                <p>Items stay in this draft until you save the invoice once.</p>
            </div>
            <div class="sales-cart">
                <div class="sales-grid-wrap">
                    <asp:GridView ID="Gridsales" runat="server" AutoGenerateColumns="False" DataKeyNames="Item" CssClass="sales-grid" GridLines="None" EmptyDataText="No items added yet.">
                        <Columns>
                            <asp:BoundField DataField="Item" HeaderText="Item" />
                            <asp:BoundField DataField="Rate" HeaderText="Unit price" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="Quantity" HeaderText="Qty" DataFormatString="{0:N0}" />
                            <asp:BoundField DataField="Amount" HeaderText="Line total" DataFormatString="{0:N2}" />
                            <asp:CommandField ShowDeleteButton="True" DeleteText="Remove" />
                        </Columns>
                        <EmptyDataRowStyle CssClass="sales-empty" />
                    </asp:GridView>
                </div>
                <div class="sales-total-row">
                    <asp:Label ID="InvoiceTotalLabel" runat="server" AssociatedControlID="txtAmount">Invoice total</asp:Label>
                    <asp:TextBox ID="txtAmount" runat="server" ReadOnly="True" Text="0.00" />
                </div>
                <div class="sales-save-row">
                    <asp:Button ID="cmdnext" runat="server" Text="Save once and prepare invoice" CssClass="sales-button sales-save" />
                </div>
            </div>
        </section>
    </section>
</asp:Content>
