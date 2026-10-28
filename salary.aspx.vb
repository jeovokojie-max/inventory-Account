Imports System.Data.SqlClient
Public Class salary
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmddel As SqlCommand
    Dim DT As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        If Not IsPostBack Then
            If ViewState("Record") = Nothing Then
                DT.Columns.Add("Staff")
                DT.Columns.Add("Net")
                ViewState("Record") = DT
            End If
        End If
    End Sub

    Protected Sub Cmdup_Click(sender As Object, e As EventArgs) Handles Cmdup.Click
        Dim myco As SqlCommand = New SqlCommand
        con.Open()
        myco.Connection = con
        myco.CommandText = "UPDATE salary SET Basic=@Basic,Overtime=@Overtime,Incentives=@Incentives,Loan=@Loan,Lateness=@Lateness,Absent=@Absent,Net=@Net,Months=@Months where staffname='" & cmbstaff.Text & "'"
        myco.Parameters.AddWithValue("@Basic", Val(txtbasic.Text))
        myco.Parameters.AddWithValue("@Overtime", Val(txtovertime.Text))
        myco.Parameters.AddWithValue("@Incentives", Val(txtinc.Text))
        myco.Parameters.AddWithValue("@Loan", Val(txtloan.Text))
        myco.Parameters.AddWithValue("@Lateness", Val(txtlate.Text))
        myco.Parameters.AddWithValue("@Absent", Val(txtabsent.Text))
        myco.Parameters.AddWithValue("@Net", Val(txtNet.Text))
        myco.Parameters.AddWithValue("@Months", DrpMonth.Text)
        myco.ExecuteNonQuery()
        txtbank.Text = String.Empty
        txtphone.Text = String.Empty
        txtaccno.Text = String.Empty
        txtbasic.Text = String.Empty
        txtovertime.Text = String.Empty
        txtinc.Text = String.Empty
        txtloan.Text = String.Empty
        txtlate.Text = String.Empty
        txtabsent.Text = String.Empty
        txtNet.Text = String.Empty
        con.Close()
    End Sub

    Protected Sub Btnsrch_Click(sender As Object, e As EventArgs) Handles Btnsrch.Click
        Dim adapter As SqlDataAdapter
        Dim ds As New System.Data.DataSet
        adapter = New SqlDataAdapter("Select * from reg where staffname='" & cmbstaff.Text & "'", con)
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            txtDept.Text = ds.Tables(0).Rows(0)("Department")
            txtphone.Text = ds.Tables(0).Rows(0)("Phone")
            txtbank.Text = ds.Tables(0).Rows(0)("Bank")
            txtaccno.Text = ds.Tables(0).Rows(0)("AcctNo")
        End If
    End Sub

    Protected Sub btnsubmit_Click(sender As Object, e As EventArgs) Handles btnsubmit.Click
        DT = ViewState("Record")
        DT.Rows.Add(cmbstaff.Text, txtNet.Text)
        Gridsalary.DataSource = DT
        Gridsalary.DataBind()
        btnsubmit.Enabled = False

        con.Open()
        Dim cmd As New SqlCommand("INSERT INTO salary VALUES(@staffname,@Department,@Phone,@Bank,@AcctNo,@Basic,@Overtime,@Incentives,@Loan,@Lateness,@Absent,@Net,@Months)", con)
        cmd.Parameters.AddWithValue("@staffname", cmbstaff.Text)
        cmd.Parameters.AddWithValue("@Department", txtDept.Text)
        cmd.Parameters.AddWithValue("@Phone", txtphone.Text)
        cmd.Parameters.AddWithValue("@Bank", txtbank.Text)
        cmd.Parameters.AddWithValue("@AcctNo", txtaccno.Text)
        cmd.Parameters.AddWithValue("@Basic", Val(txtbasic.Text))
        cmd.Parameters.AddWithValue("@Overtime", Val(txtovertime.Text))
        cmd.Parameters.AddWithValue("@Incentives", Val(txtinc.Text))
        cmd.Parameters.AddWithValue("@Loan", Val(txtloan.Text))
        cmd.Parameters.AddWithValue("@Lateness", Val(txtlate.Text))
        cmd.Parameters.AddWithValue("@Absent", Val(txtabsent.Text))
        cmd.Parameters.AddWithValue("@Net", Val(txtNet.Text))
        cmd.Parameters.AddWithValue("@Months", DrpMonth.Text)
        cmd.ExecuteNonQuery()
        con.Close()
        ClientScript.RegisterClientScriptBlock(Me.GetType, "clientScript", "Record Saved")
        txtbank.Text = String.Empty
        txtphone.Text = String.Empty
        txtaccno.Text = String.Empty
        txtbasic.Text = String.Empty
        txtovertime.Text = String.Empty
        txtinc.Text = String.Empty
        txtloan.Text = String.Empty
        txtlate.Text = String.Empty
        txtabsent.Text = String.Empty
        txtNet.Text = String.Empty
    End Sub

    Protected Sub btncheck_Click(sender As Object, e As EventArgs) Handles btncheck.Click
        txtNet.Text = Val(txtbasic.Text) + Val(txtovertime.Text) + Val(txtinc.Text) - (Val(txtloan.Text) + Val(txtlate.Text) + Val(txtabsent.Text))
        btnsubmit.Enabled = True
    End Sub

    Protected Sub Cmdfind_Click(sender As Object, e As EventArgs) Handles Cmdfind.Click
        Dim adapter As SqlDataAdapter
        Dim ds As New System.Data.DataSet
        adapter = New SqlDataAdapter("Select * from salary where staffname='" & cmbstaff.Text & "'", con)
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            txtDept.Text = ds.Tables(0).Rows(0)("Department")
            txtphone.Text = ds.Tables(0).Rows(0)("Phone")
            txtbank.Text = ds.Tables(0).Rows(0)("Bank")
            txtaccno.Text = ds.Tables(0).Rows(0)("AcctNo")
            txtbasic.Text = ds.Tables(0).Rows(0)("Basic")
            txtovertime.Text = ds.Tables(0).Rows(0)("Overtime")
            txtinc.Text = ds.Tables(0).Rows(0)("Incentives")
            txtloan.Text = ds.Tables(0).Rows(0)("Loan")
            txtlate.Text = ds.Tables(0).Rows(0)("Lateness")
            txtabsent.Text = ds.Tables(0).Rows(0)("Absent")
            txtNet.Text = ds.Tables(0).Rows(0)("Net")

        End If
    End Sub
End Class