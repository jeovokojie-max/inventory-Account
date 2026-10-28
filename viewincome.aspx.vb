Imports System.Data.SqlClient
Public Class viewincome
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        If LblBranch.Text = String.Empty Then
            LblBranch.Text = UserBranch
            TxtBranch.Text = UserBranch
        End If

    End Sub

    Protected Sub cmdAct_Click(sender As Object, e As EventArgs) Handles cmdAct.Click
        Dim m As String
        m = TxtBranch.Text + txtAccount.Text
        con.Open()
        Dim sql As String = "SELECT Trandate AS Dates,Particulars,Detail,Debit,Credit,Balance FROM Income where BrchAccount='" & m & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Income")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Income"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(3).Text)
            values += Val(Gridsales.Rows(i).Cells(4).Text)

        Next
        txtDamount.Text = FormatCurrency(stk, , , TriState.True, TriState.True)
        txtCamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdAcctdate_Click(sender As Object, e As EventArgs) Handles cmdAcctdate.Click
        Dim T As String
        T = TxtBranch.Text + txtAccount.Text + CDate(txtdate.Text)
        con.Open()
        Dim sql As String = "SELECT Trandate AS Dates,Particulars,Detail,Debit,Credit,Balance FROM Income where BrchAcctdate='" & T & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Income")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Income"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(3).Text)
            values += Val(Gridsales.Rows(i).Cells(4).Text)

        Next
        txtDamount.Text = FormatCurrency(stk, , , TriState.True, TriState.True)
        txtCamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdAcctMonth_Click(sender As Object, e As EventArgs) Handles cmdAcctMonth.Click
        Dim T As String
        T = TxtBranch.Text + txtAccount.Text + DrpMonth.Text
        con.Open()
        Dim sql As String = "SELECT Trandate AS Dates,Particulars,Detail,Debit,Credit,Balance FROM Income where BrchAcctmonth='" & T & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Income")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Income"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(3).Text)
            values += Val(Gridsales.Rows(i).Cells(4).Text)

        Next
        txtDamount.Text = FormatCurrency(stk, , , TriState.True, TriState.True)
        txtCamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmddate_Click(sender As Object, e As EventArgs) Handles cmddate.Click
        Dim T As String
        T = TxtBranch.Text + CDate(txtdate.Text)
        con.Open()
        Dim sql As String = "SELECT Account,Particulars,Detail,Debit,Credit,Balance FROM Income where Brchdate='" & T & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Income")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Income"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(3).Text)
            values += Val(Gridsales.Rows(i).Cells(4).Text)

        Next
        txtDamount.Text = FormatCurrency(stk, , , TriState.True, TriState.True)
        txtCamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdmonth_Click(sender As Object, e As EventArgs) Handles cmdmonth.Click
        Dim T As String
        T = TxtBranch.Text + DrpMonth.Text
        con.Open()
        Dim sql As String = "SELECT Trandate AS Dates,Account,Particulars,Detail,Debit,Credit,Balance FROM Income where BrchMonth='" & T & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Income")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Income"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(4).Text)
            values += Val(Gridsales.Rows(i).Cells(5).Text)

        Next
        txtDamount.Text = FormatCurrency(stk, , , TriState.True, TriState.True)
        txtCamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdclose_Click(sender As Object, e As EventArgs) Handles cmdclose.Click

    End Sub
End Class