<%@ Page Title="Sign in" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="jaybrix._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-layout">
        <section class="login-intro">
            <div class="login-brand"><span class="login-brand-mark">J</span><span>JAYBRIX <small>BUSINESS SUITE</small></span></div>
            <div class="login-message"><p class="login-kicker">INVENTORY · SALES · ACCOUNTS</p><h1>A clearer view<br />of your business.</h1><p>Manage stock, sales, customers and accounts from one simple workspace.</p></div>
            <div class="login-footer-note"><span class="login-live-dot"></span> Your business workspace</div>
        </section>
        <section class="login-side">
            <div class="login-card">
                <div class="login-card-heading"><p class="login-kicker">WELCOME BACK</p><h2>Sign in to Jaysbrix</h2><p>Enter your account details to continue.</p></div>
                <div class="login-field"><asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="Txtusername">Username</asp:Label><asp:TextBox ID="Txtusername" runat="server" CssClass="login-input" placeholder="Enter your username" autocomplete="username"></asp:TextBox></div>
                <div class="login-field"><asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="txtpass">Password</asp:Label><asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="login-input" placeholder="Enter your password" autocomplete="current-password"></asp:TextBox></div>
                <asp:Button ID="cmdsign" runat="server" CssClass="login-submit" Text="Sign in" />
                <div class="login-secure-note"><span>⌑</span> Secure access to your business workspace</div>
                <details class="admin-access">
                    <summary>Administrator access <span>＋</span></summary>
                    <div class="admin-fields">
                        <div class="login-field"><asp:Label ID="AdminPasswordLabel" runat="server" AssociatedControlID="txtadmin">Administrator key</asp:Label><asp:TextBox ID="txtadmin" runat="server" TextMode="Password" CssClass="login-input" placeholder="Administrator key"></asp:TextBox></div>
                        <asp:Button ID="cmdadmin" runat="server" CssClass="admin-unlock" Text="Unlock account tools" />
                        <div class="admin-grid">
                            <div class="login-field"><asp:Label ID="NewUserLabel" runat="server" AssociatedControlID="Txtnewuser">New username</asp:Label><asp:TextBox ID="Txtnewuser" runat="server" Enabled="False" CssClass="login-input" placeholder="Username"></asp:TextBox></div>
                            <div class="login-field"><asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="txtnewpass">Password</asp:Label><asp:TextBox ID="txtnewpass" runat="server" Enabled="False" TextMode="Password" CssClass="login-input" placeholder="Password"></asp:TextBox></div>
                        </div>
                        <div class="login-field"><asp:Label ID="BranchLabel" runat="server" AssociatedControlID="TxtBranch">Branch</asp:Label><asp:DropDownList ID="TxtBranch" runat="server" DataSourceID="SqlDataSource1" DataTextField="WareNames" DataValueField="WareNames" Enabled="False" CssClass="login-input"></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Warehouses] ORDER BY [WareNames]"></asp:SqlDataSource></div>
                        <div class="admin-actions"><asp:Button ID="cmdnew" runat="server" Enabled="False" CssClass="admin-action" Text="Create user" /><asp:Button ID="cmdupdate" runat="server" Enabled="False" CssClass="admin-action secondary" Text="Update password" /></div>
                    </div>
                </details>
            </div>
            <p class="login-copyright">© <%: DateTime.Now.Year %> Jaysbrix · Inventory and accounting</p>
        </section>
    </div>
</asp:Content>
