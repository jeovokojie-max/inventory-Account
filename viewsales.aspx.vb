Imports System.Data.SqlClient
Public Class viewsales
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        If LblBranch.Text = String.Empty Then
            LblBranch.Text = UserBranch
            txtWarehouse.Text = UserBranch
        End If

    End Sub

    Protected Sub cmdsearch_Click(sender As Object, e As EventArgs) Handles cmdsearch.Click
        con.Open()
        Dim sql As String = "SELECT Sdate AS Dates,Description,Invno,Customer,Unit,Qty AS [Quantity],Amount FROM Sales  where Branch='" & txtWarehouse.Text & "' ORDER BY Dates"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Sales")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Sales"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(5).Text)
            values += Val(Gridsales.Rows(i).Cells(6).Text)

        Next
        txtqty.Text = FormatNumber(stk, , , TriState.True, TriState.True)
        txtamount.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdsearchdate_Click(sender As Object, e As EventArgs) Handles cmdsearchdate.Click
        con.Open()
        Dim sql As String = "SELECT Sdate AS Dates,Description,Invno,Customer,Branch,Unit,Qty AS [Quantity],Amount FROM Sales  where Sdate='" & txtdate.Text & "' ORDER BY Dates"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Sales")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Sales"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(6).Text)
            values += Val(Gridsales.Rows(i).Cells(7).Text)

        Next
        txtqty.Text = FormatNumber(stk, , , TriState.True, TriState.True)
        txtdailyAmt.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdsearchwaredaily_Click(sender As Object, e As EventArgs) Handles cmdsearchwaredaily.Click
        Dim mix As String
        mix = txtWarehouse.Text + txtdate.Text
        con.Open()
        Dim sql As String = "SELECT Sdate AS Dates,Description,Invno,Customer,Branch,Unit,Qty AS [Quantity],Amount FROM Sales  where Whdate='" & mix & "' ORDER BY Dates"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Sales")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Sales"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(6).Text)
            values += Val(Gridsales.Rows(i).Cells(7).Text)

        Next
        txtqty.Text = FormatNumber(stk, , , TriState.True, TriState.True)
        txtWareAmt.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdsearchmonth_Click(sender As Object, e As EventArgs) Handles cmdsearchmonth.Click
        con.Open()
        Dim sql As String = "SELECT Sdate AS Dates,Description,Invno,Customer,Branch,Unit,Qty AS [Quantity],Amount FROM Sales  where Months='" & DrpMonth.Text & "' ORDER BY Dates"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Sales")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Sales"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(6).Text)
            values += Val(Gridsales.Rows(i).Cells(7).Text)

        Next
        txtqty.Text = FormatNumber(stk, , , TriState.True, TriState.True)
        txtAmtmonth.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdsearchmonthware_Click(sender As Object, e As EventArgs) Handles cmdsearchmonthware.Click
        Dim mix As String
        mix = txtWarehouse.Text + DrpMonth.Text
        con.Open()
        Dim sql As String = "SELECT Sdate AS Dates,Description,Invno,Customer,Branch,Unit,Qty AS [Quantity],Amount FROM Sales  where Whmonth='" & mix & "' ORDER BY Dates"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Sales")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Sales"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(6).Text)
            values += Val(Gridsales.Rows(i).Cells(7).Text)

        Next
        txtqty.Text = FormatNumber(stk, , , TriState.True, TriState.True)
        txtWareAmtmonth.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdclose_Click(sender As Object, e As EventArgs) Handles cmdclose.Click

    End Sub

    Protected Sub cmdpass_Click(sender As Object, e As EventArgs) Handles cmdpass.Click
        If txtadmin.Text = System.Configuration.ConfigurationManager.AppSettings("ReportsAdminPassword") Then
            cmdsearchdate.Enabled = True
            cmdsearchmonth.Enabled = True
            txtWarehouse.Enabled = True
        End If
    End Sub

    Protected Sub cmdsearchmonth0_Click(sender As Object, e As EventArgs) Handles cmdsearchmonth0.Click
        Dim mix As String
        mix = txtWarehouse.Text + Trim(ltitem.Text) + DrpMonth.Text
        con.Open()
        Dim sql As String = "SELECT Sdate AS Dates,Description,Invno,Customer,Branch,Unit,Qty AS [Quantity],Amount FROM Sales  where ItemMonth='" & mix & "' ORDER BY Dates"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "Sales")

        Gridsales.DataSource = ds
        Gridsales.DataMember = "Sales"
        Gridsales.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridsales.Rows.Count - 1
            stk += Val(Gridsales.Rows(i).Cells(6).Text)
            values += Val(Gridsales.Rows(i).Cells(7).Text)

        Next
        txtqty.Text = FormatNumber(stk, , , TriState.True, TriState.True)
        txtWareAmtmonth.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub
End Class