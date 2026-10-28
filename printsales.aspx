<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="printsales.aspx.vb" Inherits="jaybrix.printsales" MasterPageFile="~/Site.Master" Title="Sales invoice" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .invoice-page { max-width: 900px; margin: 0 auto; }
        .invoice-actions { display: flex; justify-content: flex-end; gap: 10px; margin: 0 0 16px; }
        .invoice-actions a, .invoice-actions input { display: inline-flex; align-items: center; justify-content: center; min-height: 42px; padding: 9px 16px; border: 1px solid #d3dfd9; border-radius: 7px; background: #fff; color: #244153; font: 700 13px "Segoe UI", Arial, sans-serif; text-decoration: none; cursor: pointer; }
        .invoice-actions input { border-color: #0e5d42; background: #146c4f; color: #fff; }
        .invoice-actions input:hover { background: #0f5c43; }
        .invoice-paper { padding: 42px 46px; border: 1px solid #e1e9e4; border-radius: 12px; background: #fff; box-shadow: 0 10px 30px #203b2d10; }
        .invoice-header { display: flex; justify-content: space-between; align-items: flex-start; gap: 24px; padding-bottom: 22px; border-bottom: 2px solid #176b4b; }
        .invoice-brand { margin: 0; color: #176b4b; font-size: 14px; font-weight: 800; letter-spacing: .14em; }
        .invoice-title { margin: 8px 0 0; color: #1e3542; font-size: 30px; line-height: 1.15; letter-spacing: .025em; }
        .invoice-subtitle { margin: 7px 0 0; color: #73838b; font-size: 13px; }
        .invoice-number-block { text-align: right; }
        .invoice-number-label { display: block; color: #71818a; font-size: 11px; font-weight: 700; letter-spacing: .08em; text-transform: uppercase; }
        .invoice-number { display: block; margin-top: 5px; color: #176b4b; font-size: 21px; font-weight: 800; }
        .invoice-location { display: inline-block; margin-top: 10px; padding: 6px 10px; border: 1px solid #d3e7db; border-radius: 20px; background: #edf7f0; color: #176b4b; font-size: 10px; font-weight: 800; letter-spacing: .07em; }
        .invoice-meta { display: grid; grid-template-columns: repeat(2,minmax(0,1fr)); gap: 1px; margin: 24px 0 28px; overflow: hidden; border: 1px solid #e5ece7; border-radius: 8px; background: #e5ece7; }
        .invoice-meta-item { min-width: 0; padding: 13px 15px; background: #fbfdfb; }
        .invoice-meta-label { display: block; margin-bottom: 5px; color: #71818a; font-size: 10px; font-weight: 750; letter-spacing: .07em; text-transform: uppercase; }
        .invoice-meta-value { display: block; overflow-wrap: anywhere; color: #243d4b; font-size: 14px; font-weight: 650; }
        .invoice-items-heading { margin: 0 0 11px; color: #263e4b; font-size: 14px; font-weight: 750; }
        .invoice-table-wrap { overflow-x: auto; border: 1px solid #e2e9e5; border-radius: 8px; }
        .standard-page table.invoice-table { width: 100% !important; min-width: 540px; max-width: none !important; margin: 0 !important; border: 0 !important; border-collapse: collapse !important; border-spacing: 0 !important; border-radius: 0 !important; background: #fff !important; box-shadow: none !important; color: #304957; font-size: 13px; }
        .standard-page table.invoice-table th { padding: 12px 14px !important; border: 0 !important; background: #edf4ef !important; color: #284452 !important; font-size: 10px; font-weight: 800; letter-spacing: .06em; text-align: left; text-transform: uppercase; white-space: nowrap; }
        .standard-page table.invoice-table td { padding: 13px 14px !important; border: 0 !important; border-top: 1px solid #e8eee9 !important; background: #fff !important; color: #304957 !important; }
        .standard-page table.invoice-table tr:nth-child(even) td { background: #fbfdfb !important; }
        .invoice-total-wrap { display: flex; justify-content: flex-end; margin-top: 20px; }
        .invoice-total { min-width: 270px; padding: 15px 18px; border: 1px solid #d6e9dd; border-radius: 8px; background: #f0f7f2; color: #315248; text-align: right; }
        .invoice-total-label { display: block; color: #597166; font-size: 11px; font-weight: 750; letter-spacing: .07em; text-transform: uppercase; }
        .invoice-total-value { display: block; margin-top: 5px; color: #145e43; font-size: 24px; font-weight: 800; }
        .invoice-footer { display: flex; justify-content: space-between; align-items: flex-end; gap: 20px; margin-top: 36px; padding-top: 17px; border-top: 1px solid #e8eee9; color: #74838b; font-size: 12px; }
        .invoice-footer strong { color: #304957; }
        .invoice-thanks { margin: 0; text-align: center; }
        @media(max-width:600px) {
            .invoice-page { padding-left: 14px; padding-right: 14px; }
            .invoice-paper { padding: 25px 18px; }
            .invoice-header { gap: 12px; }
            .invoice-title { font-size: 24px; }
            .invoice-number { font-size: 18px; }
            .invoice-meta { grid-template-columns: minmax(0,1fr); margin: 19px 0 23px; }
            .invoice-total { min-width: 0; width: 100%; }
            .invoice-total-wrap { justify-content: stretch; }
            .invoice-footer { flex-direction: column; align-items: flex-start; gap: 14px; margin-top: 28px; }
            .invoice-thanks { text-align: left; }
        }
        @media print {
            @page { size: 80mm 210mm; margin: 0; }
            html, body { background: #fff !important; }
            .site-header, .invoice-page > .standard-page-heading, .invoice-actions { display: none !important; }
            .body-content { width: 80mm !important; max-width: 80mm !important; margin: 0 !important; padding: 0 !important; }
            .invoice-page { width: 80mm !important; max-width: 80mm !important; margin: 0 !important; padding: 0 !important; }
            .invoice-paper { box-sizing: border-box !important; width: 80mm !important; min-height: 210mm !important; margin: 0 !important; padding: 3.95mm !important; border: 0 !important; border-radius: 0 !important; box-shadow: none !important; }
            .invoice-header { gap: 3mm !important; padding-bottom: 3mm !important; }
            .invoice-title { margin-top: 1.5mm !important; font-size: 17pt !important; }
            .invoice-subtitle { margin-top: 1mm !important; font-size: 8pt !important; }
            .invoice-brand { font-size: 8pt !important; }
            .invoice-number-label { font-size: 7pt !important; }
            .invoice-number { margin-top: 1mm !important; font-size: 12pt !important; }
            .invoice-location { margin-top: 1.5mm !important; padding: 1mm 2mm !important; font-size: 6.5pt !important; }
            .invoice-meta { gap: .25mm !important; margin: 3mm 0 4mm !important; border-radius: 1mm !important; }
            .invoice-meta-item { padding: 2mm !important; }
            .invoice-meta-label { margin-bottom: .75mm !important; font-size: 6.5pt !important; }
            .invoice-meta-value { font-size: 8pt !important; }
            .invoice-items-heading { margin-bottom: 1.5mm !important; font-size: 9pt !important; }
            .invoice-table-wrap { overflow: visible !important; }
            .standard-page table.invoice-table { width: 100% !important; min-width: 0 !important; table-layout: fixed !important; font-size: 7.5pt !important; }
            .standard-page table.invoice-table th { padding: 1.5mm 1mm !important; font-size: 6pt !important; white-space: normal !important; }
            .standard-page table.invoice-table td { padding: 1.5mm 1mm !important; overflow-wrap: anywhere !important; }
            .invoice-total-wrap { margin-top: 3mm !important; }
            .invoice-total { min-width: 0 !important; padding: 2.5mm 3mm !important; border-radius: 1mm !important; }
            .invoice-total-label { font-size: 7pt !important; }
            .invoice-total-value { margin-top: 1mm !important; font-size: 14pt !important; }
            .invoice-footer { gap: 2mm !important; margin-top: 5mm !important; padding-top: 2mm !important; font-size: 7pt !important; }
            .invoice-thanks { text-align: left !important; }
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page invoice-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Sales invoice</h1>
                <p>Review and print the completed Head Office sale.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">← Overview</a>
        </div>

        <div class="invoice-actions">
            <a href="sales.aspx">← Back to sales</a>
            <asp:Button ID="cmdprint" runat="server" Text="Print invoice" />
        </div>

        <article class="invoice-paper">
            <header class="invoice-header">
                <div>
                    <p class="invoice-brand">JAYBRIX</p>
                    <h2 class="invoice-title">SALES INVOICE</h2>
                    <p class="invoice-subtitle">Thank you for your business.</p>
                </div>
                <div class="invoice-number-block">
                    <span class="invoice-number-label">Invoice number</span>
                    <asp:Label ID="lblinv" runat="server" CssClass="invoice-number" />
                    <asp:Label ID="lblLocation" runat="server" CssClass="invoice-location" />
                </div>
            </header>

            <section class="invoice-meta" aria-label="Invoice details">
                <div class="invoice-meta-item"><span class="invoice-meta-label">Customer</span><asp:Label ID="lblname" runat="server" CssClass="invoice-meta-value" /></div>
                <div class="invoice-meta-item"><span class="invoice-meta-label">Sale date</span><asp:Label ID="lblDate" runat="server" CssClass="invoice-meta-value" /></div>
                <div class="invoice-meta-item"><span class="invoice-meta-label">Waybill</span><asp:Label ID="lblWaybill" runat="server" CssClass="invoice-meta-value" /></div>
                <div class="invoice-meta-item"><span class="invoice-meta-label">Driver</span><asp:Label ID="lblDriver" runat="server" CssClass="invoice-meta-value" /></div>
            </section>

            <section aria-labelledby="invoice-items-title">
                <h3 id="invoice-items-title" class="invoice-items-heading">Invoice items</h3>
                <div class="invoice-table-wrap">
                    <asp:GridView ID="gvUserInfo" runat="server" AutoGenerateColumns="False" CssClass="invoice-table" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Item" HeaderText="Item" />
                            <asp:BoundField DataField="Rate" HeaderText="Unit price" DataFormatString="₦{0:N2}" />
                            <asp:BoundField DataField="Quantity" HeaderText="Qty" DataFormatString="{0:N0}" />
                            <asp:BoundField DataField="Amount" HeaderText="Line total" DataFormatString="₦{0:N2}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </section>

            <div class="invoice-total-wrap">
                <div class="invoice-total">
                    <span class="invoice-total-label">Total due</span>
                    <asp:Label ID="lblAmt" runat="server" CssClass="invoice-total-value" />
                </div>
            </div>

            <footer class="invoice-footer">
                <p class="invoice-thanks">No refund after payment. Thank you for your patronage.</p>
                <div><span class="invoice-meta-label">Posted by</span><strong><asp:Label ID="Lbluser" runat="server" /></strong></div>
            </footer>
        </article>
    </section>
</asp:Content>
