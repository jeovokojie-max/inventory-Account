Imports System.Data.SqlClient
Public Class confirm
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim conS As New SqlConnection
    Dim conA As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString

        conS = New SqlConnection
        conS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        conS.Open()
        conA = New SqlConnection
        conA.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString

        LblBranch.Text = UserBranch
        TxtBranch.Text = UserBranch
    End Sub

    Protected Sub cmdcheck_Click(sender As Object, e As EventArgs) Handles cmdcheck.Click
        Dim mix As String
        mix = TxtBranch.Text + CDate(txtdate.Text)
        conA.Open()
        Dim sql As String = "SELECT Amount FROM Sales  where Whdate='" & mix & "'"
        Dim dataadapter As New SqlDataAdapter(sql, conA)
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Sales")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Sales"
        Gridsales.DataBind()
        conA.Close()
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            values += Val(Gridsales.Rows(i).Cells(0).Text)
        Next
        ClientScript.RegisterClientScriptBlock(Me.GetType, "clientScript", FormatCurrency(values, , , TriState.True, TriState.True))
        txtsales.Text = values
    End Sub

    Protected Sub cmdcheckExp_Click(sender As Object, e As EventArgs) Handles cmdcheckExp.Click
        Dim mix As String
        mix = TxtBranch.Text + CDate(txtdate.Text)
        conA.Open()
        Dim sql As String = "SELECT Debit,Credit FROM Income  where Brchdate='" & mix & "'"
        Dim dataadapter As New SqlDataAdapter(sql, conA)
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Income")

        Gridexp.DataSource = ds
        Gridexp.DataMember = "Income"
        Gridexp.DataBind()
        conA.Close()
        Dim values As String = 0
        Dim credit As String = 0
        For i As Integer = 0 To Gridexp.Rows.Count - 1
            values += Val(Gridexp.Rows(i).Cells(0).Text)
            credit += Val(Gridexp.Rows(i).Cells(1).Text)
        Next
        ClientScript.RegisterClientScriptBlock(Me.GetType, "clientScript", FormatCurrency(values, , , TriState.True, TriState.True), FormatCurrency(credit, , , TriState.True, TriState.True))
        txtExp.Text = values
        txtCredit.Text = credit
    End Sub

    Protected Sub cmdconsales_Click(sender As Object, e As EventArgs) Handles cmdconsales.Click
        con.Open()
        Dim cmd As New SqlCommand("INSERT INTO Net VALUES(@Brchdate,@Trandate,@Branch,@Brchmonth,@Months,@Particulars,@Credit,@Debit,@Branchdate)", con)
        cmd.Parameters.AddWithValue("@Brchdate", Trim(TxtBranch.Text) + CDate(txtdate.Text))
        cmd.Parameters.AddWithValue("@Trandate", txtdate.Text)
        cmd.Parameters.AddWithValue("@Branch", Trim(TxtBranch.Text))
        cmd.Parameters.AddWithValue("@Brchmonth", Trim(TxtBranch.Text) + Format(Today.Date, "MMMM"))
        cmd.Parameters.AddWithValue("@Months", Format(Today.Date, "MMMM"))
        cmd.Parameters.AddWithValue("@Particulars", Trim(TxtBranch.Text) + " Sales")
        cmd.Parameters.AddWithValue("@Credit", Val(txtsales.Text))
        cmd.Parameters.AddWithValue("@Debit", 0)
        cmd.Parameters.AddWithValue("@Branchdate", Trim(TxtBranch.Text) + CDate(txtdate.Text))
        cmd.ExecuteNonQuery()
        con.Close()
        txtsales.Text = String.Empty
    End Sub

    Protected Sub cmdconexp_Click(sender As Object, e As EventArgs) Handles cmdconexp.Click
        con.Open()
        Dim cmd As New SqlCommand("INSERT INTO Net VALUES(@Brchdate,@Trandate,@Branch,@Brchmonth,@Months,@Particulars,@Credit,@Debit,@Branchdate)", con)
        cmd.Parameters.AddWithValue("@Brchdate", Trim(TxtBranch.Text) + CDate(txtdate.Text) + "E")
        cmd.Parameters.AddWithValue("@Trandate", txtdate.Text)
        cmd.Parameters.AddWithValue("@Branch", Trim(TxtBranch.Text))
        cmd.Parameters.AddWithValue("@Brchmonth", Trim(TxtBranch.Text) + Format(Today.Date, "MMMM"))
        cmd.Parameters.AddWithValue("@Months", Format(Today.Date, "MMMM"))
        cmd.Parameters.AddWithValue("@Particulars", Trim(TxtBranch.Text) + " Expenses / Income")
        cmd.Parameters.AddWithValue("@Credit", Val(txtCredit.Text))
        cmd.Parameters.AddWithValue("@Debit", Val(txtExp.Text))
        cmd.Parameters.AddWithValue("@Branchdate", Trim(TxtBranch.Text) + CDate(txtdate.Text))
        cmd.ExecuteNonQuery()
        con.Close()
        txtCredit.Text = String.Empty
        txtExp.Text = String.Empty
    End Sub

    Protected Sub cmdclose_Click(sender As Object, e As EventArgs) Handles cmdclose.Click

    End Sub
End Class