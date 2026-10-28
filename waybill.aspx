<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="waybill.aspx.vb" Inherits="jaybrix.waybill" MasterPageFile="~/Site.Master" Title="Waybill" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .auto-style13 {
            text-align: center;
            width: 272px;
            position: relative;
            left: -16px;
            top: 46px;
            height: 72px;
        }
        .auto-style17 {
            font-size: x-large;
        }
        .auto-style2 {
            width: 20%;
        }
        .auto-style3 {
            width: 117px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: normal;
            font-size: small;
        }
        .auto-style4 {
            width: 393px;
            margin-left: 120px;
        }
        .auto-style10 {
            height: 211px;
        }
        .auto-style1 {
            text-align: left;
        }
        .auto-style16 {
            font-size: small;
        }
        .auto-style20 {
            font-size: medium;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style21 {
            margin-left: 120px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: medium;
        }
        .auto-style22 {
            text-align: center;
            width: 263px;
        }
        .auto-style23 {
            height: 39px;
            width: 247px;
        }
        .auto-style24 {
            font-size: xx-large;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style25 {
            font-size: medium;
        }
        .auto-style26 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: small;
        }
        .auto-style27 {
            width: 117px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<section class="standard-page"><div class="standard-page-heading"><div><p class="standard-page-kicker">JAYBRIX BUSINESS SUITE</p><h1>Waybill</h1><p>Review and print the selected dispatch document.</p></div><a class="standard-page-home" href="Maindisplay.aspx">← Overview</a></div>


    <p class="auto-style13">
        <strong><span class="auto-style17">JAYSBRIX NIG. LTD</span><br />
        <span class="auto-style25">DISTRIBUTORS OF DANGOTE &amp; BUA CEMENT</span></strong></p>
    <p>
        &nbsp;</p>
        <p>
            &nbsp;</p>
    <p>
        <table class="auto-style2">
            <tr>
                <td class="auto-style27"><strong>Customer:</strong></td>
                <td class="auto-style4">
                    <strong>
                    <asp:TextBox ID="lblname" runat="server" BorderStyle="None" Font-Bold="True" ReadOnly="True" Width="182px"></asp:TextBox>
                    </strong>
                </td>
                <td class="auto-style21" rowspan="4">
                    &nbsp;</td>
                </strong>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>Driver:</strong></td>
                <td class="auto-style4">
                    <strong>
                    <asp:TextBox ID="lbldriver" runat="server" BorderStyle="None" Font-Bold="True" ReadOnly="True" Width="175px"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style27"><strong>Waybill:</strong></td>
                <td class="auto-style4">
                    <strong>
                    <asp:Label ID="lblinv" runat="server" Text="Label" CssClass="auto-style20"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style27"><strong>Date:</strong></td>
                <td class="auto-style4">
                    <strong>
                    <asp:Label ID="lblDate" runat="server" Text="Label" CssClass="auto-style20"></asp:Label>
                    </strong>
                </td>
            </tr>
        </table>
    </p>
 <div class="auto-style10">
     <div class="auto-style22">
         <p class="auto-style23">
         <strong><span class="auto-style24">WAYBILL</span></strong></p>
         <br />
     </div>
     <div class="auto-style1">
<asp:GridView ID="gvUserInfo" runat="server" Width="284px" CssClass="auto-style26" >
    <HeaderStyle HorizontalAlign="Left" />
</asp:GridView>
     </div>
     <br />
     <br />
     <span class="auto-style16"><em>No Refund of Money after Payment. Thanks For your patronage.</em></span><br />
     <br />
&nbsp;<asp:Button ID="cmdprint" runat="server" BorderStyle="Dotted" Text="Print" Width="80px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <br />
     <br />
</div>
    <td align="right">
    </td>
            </section>
</asp:Content>
