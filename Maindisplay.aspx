<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Maindisplay.aspx.vb" Inherits="jaybrix.Maindisplay" MasterPageFile="~/Site.Master" Title="Overview" %>
<asp:Content ID="DashboardContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="dashboard-content">
                    <div class="welcome-row">
                        <div><p class="eyebrow">BUSINESS CONTROL CENTRE</p><h1>Good day. <span>Let&#39;s get to work.</span></h1><p class="subhead">Your inventory and accounting workspace, all in one place.</p></div>
                        <a class="button button-primary" href="sales.aspx"><span>&#43;</span> New sale</a>
                    </div>

                    <section class="quick-panel" aria-labelledby="quick-title">
                        <div class="section-heading"><div><h2 id="quick-title">Quick actions</h2><p>Start a common task</p></div><span class="section-rule"></span></div>
                        <div class="quick-grid">
                            <a class="quick-card" href="sales.aspx"><span class="quick-icon icon-green">&#8599;</span><span><strong>Head Office sale</strong><small>Create an invoice from Head Office stock</small></span><b>&#8594;</b></a>
                            <a class="quick-card" href="JasmineSales.aspx"><span class="quick-icon icon-green">&#8599;</span><span><strong>Jasmine sale</strong><small>Create an invoice from Jasmine stock</small></span><b>&#8594;</b></a>
                            <a class="quick-card" href="OkpanamSales.aspx"><span class="quick-icon icon-green">&#8599;</span><span><strong>Okpanam sale</strong><small>Create an invoice from Okpanam stock</small></span><b>&#8594;</b></a>
                            <a class="quick-card" href="stock.aspx"><span class="quick-icon icon-blue">&#43;</span><span><strong>Head Office stock</strong><small>Receive stock at Head Office</small></span><b>&#8594;</b></a>
                            <a class="quick-card" href="JasmineStock.aspx"><span class="quick-icon icon-blue">&#43;</span><span><strong>Jasmine stock</strong><small>Receive stock at Jasmine</small></span><b>&#8594;</b></a>
                            <a class="quick-card" href="OkpanamStock.aspx"><span class="quick-icon icon-blue">&#43;</span><span><strong>Okpanam stock</strong><small>Receive stock at Okpanam</small></span><b>&#8594;</b></a>
                            <a class="quick-card" href="inoutcome.aspx"><span class="quick-icon icon-amber">&#8358;</span><span><strong>Log an expense</strong><small>Keep your cash records current</small></span><b>&#8594;</b></a>
                            <a class="quick-card" href="customer.aspx"><span class="quick-icon icon-violet">&#43;</span><span><strong>Add a customer</strong><small>Set up a customer account</small></span><b>&#8594;</b></a>
                            <a class="quick-card" href="item.aspx"><span class="quick-icon icon-blue">&#43;</span><span><strong>Register item</strong><small>Add a product to your inventory</small></span><b>&#8594;</b></a>
                        </div>
                    </section>

                    <div class="dashboard-columns">
                        <section class="module-panel" aria-labelledby="operations-title">
                            <div class="section-heading"><div><h2 id="operations-title">Operations</h2><p>Manage everyday business activity</p></div><a class="text-link" href="viewstockbal.aspx">Head Office stock balance <span>→</span></a></div>
                            <div class="module-list">
                                <a class="module-row" href="sales.aspx"><span class="module-symbol symbol-green">&#8599;</span><span class="module-text"><strong>Sales &amp; invoicing</strong><small>Record Head Office sales and review transactions</small></span><span class="row-arrow">&#8594;</span></a>
                                <a class="module-row" href="JasmineSales.aspx"><span class="module-symbol symbol-green">&#8599;</span><span class="module-text"><strong>Jasmine sales</strong><small>Record sales against Jasmine stock</small></span><span class="row-arrow">&#8594;</span></a>
                                <a class="module-row" href="OkpanamSales.aspx"><span class="module-symbol symbol-green">&#8599;</span><span class="module-text"><strong>Okpanam sales</strong><small>Record sales against Okpanam stock</small></span><span class="row-arrow">&#8594;</span></a>
                                <a class="module-row" href="Headofficestockhistory.aspx"><span class="module-symbol symbol-blue">&#9776;</span><span class="module-text"><strong>Head Office stock history</strong><small>Review Head Office stock receipts by product and date</small></span><span class="row-arrow">&#8594;</span></a>
                                <a class="module-row" href="Jasminestockhistory.aspx"><span class="module-symbol symbol-blue">&#9776;</span><span class="module-text"><strong>Jasmine stock history</strong><small>Review Jasmine stock receipts by product and date</small></span><span class="row-arrow">&#8594;</span></a>
                                <a class="module-row" href="Jasminestockbal.aspx"><span class="module-symbol symbol-blue">&#9638;</span><span class="module-text"><strong>Jasmine stock balance</strong><small>Review Jasmine's current quantity by product</small></span><span class="row-arrow">&#8594;</span></a>
                                <a class="module-row" href="Okpanamstockhistory.aspx"><span class="module-symbol symbol-blue">&#9776;</span><span class="module-text"><strong>Okpanam stock history</strong><small>Review Okpanam stock receipts by product and date</small></span><span class="row-arrow">&#8594;</span></a>
                                <a class="module-row" href="Okpanamstockbal.aspx"><span class="module-symbol symbol-blue">&#9638;</span><span class="module-text"><strong>Okpanam stock balance</strong><small>Review Okpanam's current quantity by product</small></span><span class="row-arrow">&#8594;</span></a>
                                <a class="module-row" href="return.aspx"><span class="module-symbol symbol-amber">&#8617;</span><span class="module-text"><strong>Returns &amp; adjustments</strong><small>Record items returned by customers</small></span><span class="row-arrow">&#8594;</span></a>
                                <a class="module-row" href="waybill.aspx"><span class="module-symbol symbol-violet">&#9776;</span><span class="module-text"><strong>Dispatch &amp; waybills</strong><small>Prepare and track delivery documents</small></span><span class="row-arrow">&#8594;</span></a>
                            </div>
                        </section>
                        <section class="module-panel accounting-panel" aria-labelledby="accounts-title">
                            <div class="section-heading"><div><h2 id="accounts-title">Accounting</h2><p>Keep balances and cash activity in view</p></div><span class="ledger-badge">LEDGER</span></div>
                            <div class="accounting-feature"><div class="accounting-mark">&#8358;</div><div><strong>Daily financial records</strong><p>Record income and expenses, then follow up on customer and supplier balances.</p></div></div>
                            <div class="account-link-grid">
                                <a href="Ledger.aspx"><span>Customer ledger</span><b>&#8594;</b></a>
                                <a href="supplyLedger.aspx"><span>Supplier ledger</span><b>&#8594;</b></a>
                                <a href="inoutcome.aspx"><span>Income &amp; expenses</span><b>&#8594;</b></a>
                                <a href="viewnet.aspx"><span>Net position</span><b>&#8594;</b></a>
                            </div>
                        </section>
                    </div>

                    <section class="directory-strip">
                        <div><p class="eyebrow">YOUR BUSINESS DATA</p><h2>Everything connected.</h2><p>Products, customers, suppliers and staff records are one click away.</p></div>
                        <div class="directory-links"><a href="viewitem.aspx">Products <span>&#8594;</span></a><a href="viewcustomers.aspx">Customers <span>&#8594;</span></a><a href="viewsuppliers.aspx">Suppliers <span>&#8594;</span></a><a href="viewsalary.aspx">Payroll <span>&#8594;</span></a></div>
                    </section>
                    <footer class="app-footer"><span>Jaysbrix Business Suite</span><span>Inventory · Sales · Accounts</span></footer>
                </section>
</asp:Content>
