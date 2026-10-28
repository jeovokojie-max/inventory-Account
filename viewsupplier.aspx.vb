Imports System.Data.SqlClient
Public Class viewsupplier
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        con.Open()
    End Sub

    Protected Sub cmdshow_Click(sender As Object, e As EventArgs) Handles cmdshow.Click
        Dim ds As New System.Data.DataSet
        Dim m As String
        txtbal.Text = String.Empty

        Dim sql As String = "SELECT Dates,Description,Refno AS [Detail],Debit,Credit AS Payment FROM SupplyLedger  where Supplier='" & ltcustomer.Text & "' ORDER BY SDate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim dst As New DataSet

        dataadapter.Fill(ds, "SupplyLedger")

        Gridledger.DataSource = ds
        Gridledger.DataMember = "SupplyLedger"
        Gridledger.DataBind()
        Dim dbt As String = 0
        Dim values As String = 0

        For i As Integer = 0 To Gridledger.Rows.Count - 1
            dbt += Val(Gridledger.Rows(i).Cells(3).Text)
            values += Val(Gridledger.Rows(i).Cells(4).Text)
        Next
        m = Val(dbt) - Val(values)
        txtdebit.Text = FormatNumber(dbt, , , TriState.True, TriState.True)
        txtcredit.Text = FormatCurrency(values, , , TriState.True, TriState.True)
        txtbal.Text = FormatCurrency(m, , , TriState.True, TriState.True)
    End Sub
End Class