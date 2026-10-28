<%@ Page Title="Prescription Invoice" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FrmPrescription.aspx.vb" Inherits="onlineleeds.FrmPrescription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .prescription-wrap { max-width: 1000px; margin: 24px auto; color: #263238; }
        .prescription-card { background: #fff; border: 1px solid #dce5e7; border-radius: 8px; padding: 24px; box-shadow: 0 3px 14px rgba(20,50,55,.07); }
        .prescription-title { margin: 0 0 20px; color: #155e63; font-size: 24px; }
        .prescription-fields { display: grid; grid-template-columns: repeat(auto-fit,minmax(210px,1fr)); gap: 16px; margin-bottom: 22px; }
        .prescription-fields label, .medicine-entry label { display: block; font-weight: 600; margin-bottom: 6px; }
        .prescription-fields input, .prescription-fields select, .medicine-entry input { box-sizing: border-box; width: 100%; height: 38px; padding: 7px 9px; border: 1px solid #bdcbd0; border-radius: 4px; }
        .medicine-entry { display: grid; grid-template-columns: 2fr 1.2fr .8fr 1fr auto; gap: 12px; align-items: end; margin-bottom: 16px; }
        .prescription-table { width: 100%; border-collapse: collapse; margin: 12px 0; }
        .prescription-table th, .prescription-table td { padding: 10px; border-bottom: 1px solid #e1e8ea; text-align: left; }
        .prescription-table th { background: #155e63; color: #fff; }
        .prescription-table .number { text-align: right; }
        .prescription-total { text-align: right; font-size: 18px; font-weight: 700; margin: 18px 0; }
        .prescription-actions { display: flex; gap: 10px; justify-content: flex-end; margin-top: 18px; }
        .prescription-actions button { border: 0; border-radius: 4px; padding: 10px 18px; cursor: pointer; font-weight: 600; }
        .btn-add { background: #e6f1f1; color: #155e63; }
        .btn-save { background: #155e63; color: white; }
        .btn-remove { background: transparent; color: #a33; border: 0; cursor: pointer; }
        #invoicePreview { display: none; }
        .invoice-heading { text-align: center; border-bottom: 2px solid #155e63; padding-bottom: 14px; margin-bottom: 18px; }
        .invoice-heading h2 { margin: 0 0 5px; color: #155e63; }
        .invoice-meta { display: grid; grid-template-columns: 1fr 1fr; gap: 8px; margin: 16px 0; }
        @media print { body * { visibility: hidden; } #invoicePreview, #invoicePreview * { visibility: visible; } #invoicePreview { display: block !important; position: absolute; left: 0; top: 0; width: 100%; padding: 18px; color: #111; } }
        @media (max-width: 650px) { .medicine-entry { grid-template-columns: 1fr 1fr; } .medicine-entry > div:first-child { grid-column: 1 / -1; } }
    </style>
    <div class="prescription-wrap">
        <div class="prescription-card" id="prescriptionForm">
            <h1 class="prescription-title">Prescription</h1>
            <div class="prescription-fields">
                <div>
                    <label for="<%= cmbNames.ClientID %>">Patient</label>
                    <asp:DropDownList ID="cmbNames" runat="server" DataSourceID="SqlDatanames" DataTextField="CustNames" DataValueField="CustNames" AppendDataBoundItems="true" AutoPostBack="True" Height="30px">
                        <asp:ListItem Text="Select patient" Value="" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDatanames" runat="server" ConnectionString="<%$ ConnectionStrings:chaufConnectionString %>" SelectCommand="SELECT DISTINCT [CustNames] FROM [Customer] ORDER BY [CustNames]"></asp:SqlDataSource>
                </div>
                <div><label for="prescriptionDate">Transaction date</label><input id="prescriptionDate" type="date" /></div>
                <div><label for="<%= txtCardNumber.ClientID %>">Card No.</label><asp:TextBox ID="txtCardNumber" runat="server" ReadOnly="true" placeholder="Selected patient's card number" /></div>
            </div>
            <h2 style="font-size:18px">Prescribed items</h2>
            <div class="medicine-entry">
                <div><label for="<%= cmbMedicine.ClientID %>">Medicine</label><asp:DropDownList ID="cmbMedicine" runat="server" DataSourceID="SqlDataMedicines" DataTextField="Item" DataValueField="Item" AppendDataBoundItems="true" AutoPostBack="True" Height="30px" Width="585px"><asp:ListItem Text="Select medicine" Value="" /></asp:DropDownList><asp:SqlDataSource ID="SqlDataMedicines" runat="server" ConnectionString="<%$ ConnectionStrings:chaufConnectionString %>" SelectCommand="SELECT DISTINCT [Item] FROM [Itemreg] ORDER BY [Item]"></asp:SqlDataSource></div>
                <div><label for="medicineDose">Dose / instructions</label><input id="medicineDose" type="text" placeholder="e.g. 1 tablet twice daily" /></div>
                <div><label for="medicineQty">Quantity</label><input id="medicineQty" type="number" min="0.01" step="any" placeholder="0" /></div>
                <div><label for="<%= txtUnitPrice.ClientID %>">Unit price</label><asp:TextBox ID="txtUnitPrice" runat="server" ReadOnly="true" placeholder="Select a medicine" /></div>
                <button type="button" class="prescription-actions btn-add" onclick="addPrescriptionItem()">Add item</button>
            </div>
            <table class="prescription-table">
                <thead><tr><th>Medicine</th><th>Dose / instructions</th><th class="number">Qty</th><th class="number">Unit price</th><th class="number">Amount</th><th></th></tr></thead>
                <tbody id="prescriptionItems"><tr id="emptyPrescription"><td colspan="6" style="text-align:center;color:#718087">No medicines added yet.</td></tr></tbody>
            </table>
            <asp:HiddenField ID="hiddenPrescriptionItems" runat="server" />
            <div class="prescription-total">Total: <span id="prescriptionTotal">₦0.00</span></div>
            <div class="prescription-actions"><button type="button" class="btn-save" onclick="savePrescriptionInvoice()">Save &amp; prepare invoice</button></div>
        </div>
        <section class="prescription-card" id="invoicePreview" aria-live="polite">
            <div class="invoice-heading"><h2>INVOICE</h2><div>Prescription items</div></div>
            <div class="invoice-meta"><div><strong>Patient:</strong> <span id="invoicePatient"></span></div><div><strong>Invoice No.:</strong> <span id="invoiceNumber"></span></div><div><strong>Card No.:</strong> <span id="invoiceCard"></span></div><div><strong>Date:</strong> <span id="invoiceDate"></span></div></div>
            <table class="prescription-table"><thead><tr><th>Medicine</th><th>Dose / instructions</th><th class="number">Qty</th><th class="number">Unit price</th><th class="number">Amount</th></tr></thead><tbody id="invoiceItems"></tbody></table>
            <div class="prescription-total">Amount due: <span id="invoiceTotal"></span></div>
            <div class="prescription-actions" id="invoiceActions"><button type="button" class="btn-add" onclick="returnToPrescription()">Back to prescription</button><button type="button" class="btn-save" onclick="window.print()">Print invoice</button></div>
        </section>
    </div>
    <script>
        (function () {
            var date = document.getElementById('prescriptionDate');
            if (date && !date.value) {
                var today = new Date();
                date.value = today.getFullYear() + '-' + String(today.getMonth() + 1).padStart(2, '0') + '-' + String(today.getDate()).padStart(2, '0');
            }
        }());
        function money(value) { return '₦' + Number(value).toLocaleString('en-NG', { minimumFractionDigits: 2, maximumFractionDigits: 2 }); }
        function escapeHtml(value) { return String(value).replace(/[&<>"']/g, function (c) { return ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]; }); }
        function addPrescriptionItem() {
            var medicineSelect = document.getElementById('<%= cmbMedicine.ClientID %>');
            var name = medicineSelect.value.trim();
            var dose = document.getElementById('medicineDose').value.trim();
            var qty = Number(document.getElementById('medicineQty').value);
            var rateText = document.getElementById('<%= txtUnitPrice.ClientID %>').value.trim();
            var rate = Number(rateText);
            if (!name || !rateText || !Number.isFinite(qty) || qty <= 0 || !Number.isFinite(rate) || rate < 0) { alert('Select a medicine and enter a quantity greater than zero.'); return; }
            var empty = document.getElementById('emptyPrescription'); if (empty) empty.remove();
            var row = document.createElement('tr');
            row.innerHTML = '<td>' + escapeHtml(name) + '</td><td>' + escapeHtml(dose || '—') + '</td><td class="number">' + qty + '</td><td class="number">' + money(rate) + '</td><td class="number">' + money(qty * rate) + '</td><td><button type="button" class="btn-remove" aria-label="Remove ' + escapeHtml(name) + '" onclick="removePrescriptionItem(this)">Remove</button></td>';
            row.dataset.amount = String(qty * rate);
            row.dataset.item = name; row.dataset.dose = dose; row.dataset.qty = String(qty); row.dataset.rate = String(rate);
            document.getElementById('prescriptionItems').appendChild(row);
            medicineSelect.selectedIndex = 0; document.getElementById('<%= txtUnitPrice.ClientID %>').value = ''; document.getElementById('medicineDose').value = ''; document.getElementById('medicineQty').value = '';
            updatePrescriptionTotal();
        }
        function removePrescriptionItem(button) { button.closest('tr').remove(); updatePrescriptionTotal(); }
        function updatePrescriptionTotal() {
            var rows = document.querySelectorAll('#prescriptionItems tr[data-amount]');
            var total = Array.prototype.reduce.call(rows, function (sum, row) { return sum + Number(row.dataset.amount); }, 0);
            document.getElementById('prescriptionTotal').textContent = money(total);
            if (!rows.length) document.getElementById('prescriptionItems').innerHTML = '<tr id="emptyPrescription"><td colspan="6" style="text-align:center;color:#718087">No medicines added yet.</td></tr>';
            return total;
        }
        function savePrescriptionInvoice() {
            var patientSelect = document.getElementById('<%= cmbNames.ClientID %>');
            var patient = patientSelect.options[patientSelect.selectedIndex].text;
            var rows = document.querySelectorAll('#prescriptionItems tr[data-amount]');
            if (!patientSelect.value) { alert('Select a patient before saving.'); patientSelect.focus(); return; }
            if (!rows.length) { alert('Add at least one medicine before saving.'); document.getElementById('<%= cmbMedicine.ClientID %>').focus(); return; }
            var dateValue = document.getElementById('prescriptionDate').value;
            if (!dateValue) { alert('Select a transaction date before saving.'); return; }
            document.getElementById('invoicePatient').textContent = patient;
            document.getElementById('invoiceCard').textContent = document.getElementById('<%= txtCardNumber.ClientID %>').value.trim() || '—';
            document.getElementById('invoiceDate').textContent = new Date(dateValue + 'T00:00:00').toLocaleDateString();
            document.getElementById('invoiceNumber').textContent = 'RX-' + dateValue.replace(/-/g, '') + '-' + Math.random().toString(36).slice(2, 7).toUpperCase();
            var invoiceBody = document.getElementById('invoiceItems'); invoiceBody.innerHTML = '';
            Array.prototype.forEach.call(rows, function (row) {
                var cells = row.cells; var invoiceRow = document.createElement('tr');
                invoiceRow.innerHTML = '<td>' + cells[0].innerHTML + '</td><td>' + cells[1].innerHTML + '</td><td class="number">' + cells[2].textContent + '</td><td class="number">' + cells[3].textContent + '</td><td class="number">' + cells[4].textContent + '</td>';
                invoiceBody.appendChild(invoiceRow);
            });
            document.getElementById('invoiceTotal').textContent = document.getElementById('prescriptionTotal').textContent;
            document.getElementById('prescriptionForm').style.display = 'none';
            document.getElementById('invoicePreview').style.display = 'block';
            window.scrollTo(0, 0);
        }
        function returnToPrescription() { document.getElementById('invoicePreview').style.display = 'none'; document.getElementById('prescriptionForm').style.display = 'block'; }
        (function () {
            var savedItems = document.getElementById('<%= hiddenPrescriptionItems.ClientID %>');
            if (!savedItems || !savedItems.value) return;
            try {
                JSON.parse(decodeURIComponent(savedItems.value)).forEach(function (item) {
                    var empty = document.getElementById('emptyPrescription'); if (empty) empty.remove();
                    var row = document.createElement('tr');
                    row.innerHTML = '<td>' + escapeHtml(item.item) + '</td><td>' + escapeHtml(item.dose || '—') + '</td><td class="number">' + Number(item.qty) + '</td><td class="number">' + money(item.rate) + '</td><td class="number">' + money(item.amount) + '</td><td><button type="button" class="btn-remove" onclick="removePrescriptionItem(this)">Remove</button></td>';
                    row.dataset.item = item.item; row.dataset.dose = item.dose; row.dataset.qty = item.qty; row.dataset.rate = item.rate; row.dataset.amount = item.amount;
                    document.getElementById('prescriptionItems').appendChild(row);
                });
                updatePrescriptionTotal();
            } catch (ignore) { savedItems.value = ''; }
        }());
        function storePrescriptionItems() {
            var rows = document.querySelectorAll('#prescriptionItems tr[data-amount]');
            var items = Array.prototype.map.call(rows, function (row) { return { item: row.dataset.item, dose: row.dataset.dose, qty: row.dataset.qty, rate: row.dataset.rate, amount: row.dataset.amount }; });
            document.getElementById('<%= hiddenPrescriptionItems.ClientID %>').value = encodeURIComponent(JSON.stringify(items));
        }
        document.getElementById('<%= cmbNames.ClientID %>').addEventListener('change', storePrescriptionItems, true);
        document.getElementById('<%= cmbMedicine.ClientID %>').addEventListener('change', storePrescriptionItems, true);
        document.forms[0].addEventListener('submit', storePrescriptionItems);
    </script>
</asp:Content>
