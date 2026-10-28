Imports System.Data.SqlClient
Public Class Ledger
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        con.Open()
    End Sub



    Protected Sub cmdsubmit_Click(sender As Object, e As EventArgs) Handles cmdsubmit.Click
        Dim cmd As New SqlCommand("INSERT INTO CustLedger VALUES(@Customer,@Dates,@Refno,@Months,@Description,@Qty,@Debit,@Credit,@Balance,@SDate)", con)
        cmd.Parameters.AddWithValue("@Customer", Trim(ltcustomer.Text))
        cmd.Parameters.AddWithValue("@Dates", txtdate.Text)
        cmd.Parameters.AddWithValue("@Refno", txtdetail.Text)
        cmd.Parameters.AddWithValue("@Months", Format(Today.Date, "MMMM"))
        cmd.Parameters.AddWithValue("@Description", Trim(txtparticulars.Text))
        cmd.Parameters.AddWithValue("@Qty", -Val(txtqty.Text))
        cmd.Parameters.AddWithValue("@Debit", Val(txtDebit.Text))
        cmd.Parameters.AddWithValue("@Credit", Val(txtCredit.Text))
        cmd.Parameters.AddWithValue("@Balance", Val(txtbalance.Text) + Val(txtDebit.Text) - Val(txtCredit.Text))
        cmd.Parameters.AddWithValue("@SDate", txtdate.Text)
        cmd.ExecuteNonQuery()
        Dim myco As SqlCommand = New SqlCommand
        myco.Connection = con
        myco.CommandText = "UPDATE Customer SET Balance=@Balance where CustNames='" & ltcustomer.Text & "'"
        myco.Parameters.AddWithValue("@Balance", Val(txtbalance.Text) + Val(txtDebit.Text) - Val(txtCredit.Text))
        myco.ExecuteNonQuery()

        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)

    End Sub

    Protected Sub ltcustomer_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ltcustomer.SelectedIndexChanged
        Dim adapter As SqlDataAdapter
        Dim ds As New System.Data.DataSet
        txtbalance.Text = String.Empty
        adapter = New SqlDataAdapter("Select * from Customer where CustNames='" & ltcustomer.Text & "'", con)
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            txtPhone.Text = ds.Tables(0).Rows(0)("Phone")
            txtLocation.Text = ds.Tables(0).Rows(0)("Address")
            txtbalance.Text = Val(ds.Tables(0).Rows(0)("Balance"))
        End If
    End Sub
End Class