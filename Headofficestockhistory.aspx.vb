Imports System.Data.SqlClient
Public Class Headofficestockhistory
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString


    End Sub
    Protected Sub cmdprint_Click(sender As Object, e As EventArgs) Handles cmdprint.Click
        ClientScript.RegisterStartupScript([GetType](), "print", "window.print();", True)
        cmdprint.Visible = False
    End Sub

    Protected Sub txtItem_SelectedIndexChanged(sender As Object, e As EventArgs) Handles txtItem.SelectedIndexChanged
        Dim M As String
        M = txtItem.Text
        con.Open()
        Dim sql As String = "SELECT Trandate AS [Dates],Item,Cost,Stockinqty AS [QTY],[Values] FROM HeadStockin  where Item='" & M & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "HeadStockin")

        stkhistgrid.DataSource = ds
        stkhistgrid.DataMember = "HeadStockin"
        stkhistgrid.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To stkhistgrid.Rows.Count - 1
            stk += Val(stkhistgrid.Rows(i).Cells(3).Text)
            values += Val(stkhistgrid.Rows(i).Cells(4).Text)

        Next
        txtstock.Text = FormatNumber(stk, , , TriState.True, TriState.True)
        txtvalues.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub Txtdate_TextChanged(sender As Object, e As EventArgs) Handles Txtdate.TextChanged
        Dim M As String
        M = Txtdate.Text
        con.Open()
        Dim sql As String = "SELECT Trandate AS Dates,Item,Cost,Stockinqty AS [QTY],[Values] FROM HeadStockin  where Trandate='" & M & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "HeadStockin")

        stkhistgrid.DataSource = ds
        stkhistgrid.DataMember = "HeadStockin"
        stkhistgrid.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To stkhistgrid.Rows.Count - 1
            stk += Val(stkhistgrid.Rows(i).Cells(3).Text)
            values += Val(stkhistgrid.Rows(i).Cells(4).Text)

        Next
        txtstock.Text = FormatNumber(stk, , , TriState.True, TriState.True)
        txtvalues.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub Txtmonth_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Txtmonth.SelectedIndexChanged
        Dim M As String
        M = Txtmonth.Text
        con.Open()
        Dim sql As String = "SELECT Trandate AS Dates,Item,Cost,Stockinqty AS [QTY],[Values] FROM HeadStockin  where Months='" & M & "' ORDER BY Trandate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "HeadStockin")

        stkhistgrid.DataSource = ds
        stkhistgrid.DataMember = "HeadStockin"
        stkhistgrid.DataBind()
        con.Close()
        Dim stk As String = 0
        Dim values As String = 0

        For i As Integer = 0 To stkhistgrid.Rows.Count - 1
            stk += Val(stkhistgrid.Rows(i).Cells(3).Text)
            values += Val(stkhistgrid.Rows(i).Cells(4).Text)

        Next
        txtstock.Text = FormatNumber(stk, , , TriState.True, TriState.True)
        txtvalues.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub


End Class
