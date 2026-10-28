<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="supplier.aspx.vb" Inherits="jaybrix.supplier" MasterPageFile="~/Site.Master" Title="Supplier setup" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="standard-page supplier-page">
        <div class="standard-page-heading">
            <div>
                <p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p>
                <h1>Supplier setup</h1>
                <p>Create a supplier record or update an existing one.</p>
            </div>
            <a class="standard-page-home" href="Maindisplay.aspx">&#8592; Overview</a>
        </div>

        <section class="supplier-card" aria-labelledby="supplier-details-title">
            <div class="supplier-card-heading">
                <div>
                    <h2 id="supplier-details-title">Supplier details</h2>
                    <p>Enter a phone number to find an existing supplier, or add a new supplier record.</p>
                </div>
            </div>

            <div class="supplier-form-grid">
                <div class="supplier-field">
                    <asp:Label ID="SupplierNameLabel" runat="server" AssociatedControlID="txtName">Supplier Name:</asp:Label>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Enter supplier name"></asp:TextBox>
                </div>
                <div class="supplier-field supplier-phone-field">
                    <asp:Label ID="SupplierPhoneLabel" runat="server" AssociatedControlID="txtPhone">Phone number</asp:Label>
                    <div class="supplier-phone-row">
                        <asp:TextBox ID="txtPhone" runat="server" MaxLength="11" TextMode="Number" placeholder="Enter phone number"></asp:TextBox>
                        <asp:Button ID="cmdAct" runat="server" Text="Find supplier" CssClass="supplier-find-button" />
                    </div>
                </div>
                <div class="supplier-field supplier-address-field">
                    <asp:Label ID="SupplierAddressLabel" runat="server" AssociatedControlID="txtLocation">Address</asp:Label>
                    <asp:TextBox ID="txtLocation" runat="server" placeholder="Enter supplier address"></asp:TextBox>
                </div>
            </div>

            <div class="supplier-actions">
                <asp:Button ID="cmdupdate" runat="server" Text="Update supplier" CssClass="supplier-action-button secondary-supplier-button" />
                <asp:Button ID="cmdsubmit" runat="server" Text="Add supplier" CssClass="supplier-action-button" />
            </div>
            <asp:Button ID="cmdclose" runat="server" Visible="False" Text="Home" PostBackUrl="~/Maindisplay.aspx" />
        </section>
    </section>
</asp:Content>
