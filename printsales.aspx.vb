Imports System.Data
Public Class printsales
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim invoiceItems As DataTable = TryCast(Session("SalesInvoiceItems"), DataTable)
        If invoiceItems Is Nothing OrElse invoiceItems.Rows.Count = 0 Then
            Response.Redirect("sales.aspx", False)
            Context.ApplicationInstance.CompleteRequest()
            Return
        End If

        lblname.Text = Custo
        lblinv.Text = Invoiceno
        lblAmt.Text = "₦ " & Totalamt
        lblDate.Text = Salesdate
        lblWaybill.Text = If(String.IsNullOrWhiteSpace(waybillno), "—", waybillno)
        lblDriver.Text = If(String.IsNullOrWhiteSpace(Drivername), "—", Drivername)
        lblLocation.Text = If(String.IsNullOrWhiteSpace(Convert.ToString(Session("SalesLocation"))), "HEAD OFFICE", Convert.ToString(Session("SalesLocation")))
        Lbluser.Text = Username
        gvUserInfo.DataSource = invoiceItems
        gvUserInfo.DataBind()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles cmdprint.Click
        ClientScript.RegisterStartupScript([GetType](), "print", "window.print();", True)
        cmdprint.Visible = False
    End Sub


End Class
