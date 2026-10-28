Imports System.Data.SqlClient
Public Class inoutcome
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString

        LblBranch.Text = UserBranch
        'TxtBranch.Text = UserBranch
        Dim adapter As SqlDataAdapter = New SqlDataAdapter("Select * from IncBal", con)
        Dim ds As New System.Data.DataSet
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            txtBal.Text = ds.Tables(0).Rows(0)("Balance").ToString()
        End If
    End Sub

    Protected Sub cmdsubmit_Click(sender As Object, e As EventArgs) Handles cmdsubmit.Click
        con.Open()
        txtBal.Text = Val(txtBal.Text) + Val(txtCredit.Text) - Val(txtDebit.Text)
        Dim cmd As New SqlCommand("INSERT INTO income VALUES(@Trandate,@Months,@Particulars,@Detail,@Debit,@Credit,@Account,@BrchAcctdate,@BrchAcctmonth,@Branch,@Brchdate,@Brchmonth,@BrchAccount,@Balance)", con)
        cmd.Parameters.AddWithValue("@Trandate", txtdate.Text)
        cmd.Parameters.AddWithValue("@Months", Format(Today.Date, "MMMM"))
        cmd.Parameters.AddWithValue("@Particulars", Trim(txtparticulars.Text))
        cmd.Parameters.AddWithValue("@Detail", Trim(txtdetail.Text))
        cmd.Parameters.AddWithValue("@Debit", Val(txtDebit.Text))
        cmd.Parameters.AddWithValue("@Credit", Val(txtCredit.Text))
        cmd.Parameters.AddWithValue("@Account", Trim(txtAccount.Text))
        cmd.Parameters.AddWithValue("@BrchAcctdate", Trim(TxtBranch.Text) + Trim(txtAccount.Text) + CDate(txtdate.Text))
        cmd.Parameters.AddWithValue("@BrchAcctmonth", Trim(TxtBranch.Text) + Trim(txtAccount.Text) + Format(Today.Date, "MMMM"))
        cmd.Parameters.AddWithValue("@Branch", Trim(TxtBranch.Text))
        cmd.Parameters.AddWithValue("@Brchdate", Trim(TxtBranch.Text) + CDate(txtdate.Text))
        cmd.Parameters.AddWithValue("@Brchmonth", Trim(TxtBranch.Text) + Format(Today.Date, "MMMM"))
        cmd.Parameters.AddWithValue("@BrchAccount", Trim(TxtBranch.Text) + Trim(txtAccount.Text))
        cmd.Parameters.AddWithValue("@Balance", Val(txtBal.Text))
        cmd.ExecuteNonQuery()
        Dim myco As SqlCommand = New SqlCommand
        myco.Connection = con
        myco.CommandText = "UPDATE IncBal SET Balance=@Balance"
        myco.Parameters.AddWithValue("@Balance", Val(txtBal.Text) + Val(txtCredit.Text) - Val(txtDebit.Text))
        myco.ExecuteNonQuery()
        con.Close()


        ClientScript.RegisterClientScriptBlock(Me.GetType, "clientScript", "Record Saved")
        txtdetail.Text = String.Empty
        txtDebit.Text = String.Empty
        txtCredit.Text = String.Empty

    End Sub

    Protected Sub cmdclose_Click(sender As Object, e As EventArgs) Handles cmdclose.Click

    End Sub

End Class