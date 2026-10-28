Imports System.Data.SqlClient
Public Class viewnet
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        If LblBranch.Text = String.Empty Then
            LblBranch.Text = UserBranch

        End If
    End Sub

    Protected Sub cmdAct_Click(sender As Object, e As EventArgs) Handles cmdAct.Click
        Dim m As String
        m = TxtBranch.Text
        con.Open()
        Dim sql As String = "SELECT Trandate AS Dates,Particulars,Debit,Credit FROM Net where Branch='" & m & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Net")

        Gridnet.DataSource = ds
        Gridnet.DataMember = "Net"
        Gridnet.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridnet.Rows.Count - 1
            stk += Val(Gridnet.Rows(i).Cells(2).Text)
            values += Val(Gridnet.Rows(i).Cells(3).Text)

        Next
        txtBal.Text = Val(values) - Val(stk)
        txtDamount.Text = FormatCurrency(stk, , , TriState.True, TriState.True)
        txtCamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
        txtBal.Text = FormatCurrency(txtBal.Text, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdAcctdate_Click(sender As Object, e As EventArgs) Handles cmdAcctdate.Click
        Dim m As String
        m = TxtBranch.Text + txtdate.Text
        con.Open()
        Dim sql As String = "SELECT Trandate AS Dates,Particulars,Debit,Credit FROM Net where Branchdate='" & m & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Net")

        Gridnet.DataSource = ds
        Gridnet.DataMember = "Net"
        Gridnet.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridnet.Rows.Count - 1
            stk += Val(Gridnet.Rows(i).Cells(2).Text)
            values += Val(Gridnet.Rows(i).Cells(3).Text)

        Next
        txtBal.Text = Val(values) - Val(stk)
        txtDamount.Text = FormatCurrency(stk, , , TriState.True, TriState.True)
        txtCamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
        txtBal.Text = FormatCurrency(txtBal.Text, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdAcctMonth_Click(sender As Object, e As EventArgs) Handles cmdAcctMonth.Click
        Dim m As String
        m = TxtBranch.Text + DrpMonth.Text
        con.Open()
        Dim sql As String = "SELECT Trandate AS Dates,Particulars,Debit,Credit FROM Net where Brchmonth='" & m & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Net")

        Gridnet.DataSource = ds
        Gridnet.DataMember = "Net"
        Gridnet.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridnet.Rows.Count - 1
            stk += Val(Gridnet.Rows(i).Cells(2).Text)
            values += Val(Gridnet.Rows(i).Cells(3).Text)

        Next
        txtBal.Text = Val(values) - Val(stk)
        txtDamount.Text = FormatCurrency(stk, , , TriState.True, TriState.True)
        txtCamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
        txtBal.Text = FormatCurrency(txtBal.Text, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmddate_Click(sender As Object, e As EventArgs) Handles cmddate.Click
        Dim m As String
        m = txtdate.Text
        con.Open()
        Dim sql As String = "SELECT Particulars,Debit,Credit FROM Net where Trandate='" & m & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Net")

        Gridnet.DataSource = ds
        Gridnet.DataMember = "Net"
        Gridnet.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridnet.Rows.Count - 1
            stk += Val(Gridnet.Rows(i).Cells(1).Text)
            values += Val(Gridnet.Rows(i).Cells(2).Text)

        Next
        txtBal.Text = Val(values) - Val(stk)
        txtDamount.Text = FormatCurrency(stk, , , TriState.True, TriState.True)
        txtCamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
        txtBal.Text = FormatCurrency(txtBal.Text, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdmonth_Click(sender As Object, e As EventArgs) Handles cmdmonth.Click
        Dim m As String
        m = DrpMonth.Text
        con.Open()
        Dim sql As String = "SELECT Trandate AS Dates,Particulars,Debit,Credit FROM Net where Months='" & m & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Net")

        Gridnet.DataSource = ds
        Gridnet.DataMember = "Net"
        Gridnet.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridnet.Rows.Count - 1
            stk += Val(Gridnet.Rows(i).Cells(2).Text)
            values += Val(Gridnet.Rows(i).Cells(3).Text)

        Next
        txtBal.Text = Val(values) - Val(stk)
        txtDamount.Text = FormatCurrency(stk, , , TriState.True, TriState.True)
        txtCamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
        txtBal.Text = FormatCurrency(txtBal.Text, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdclose_Click(sender As Object, e As EventArgs) Handles cmdclose.Click

    End Sub

    Protected Sub cmdpass_Click(sender As Object, e As EventArgs) Handles cmdpass.Click
        If txtadmin.Text = System.Configuration.ConfigurationManager.AppSettings("ReportsAdminPassword") Then
            cmddate.Enabled = True
            cmdmonth.Enabled = True
        End If
    End Sub
End Class