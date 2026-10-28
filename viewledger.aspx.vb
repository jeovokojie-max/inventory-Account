Imports System.Data.SqlClient
Public Class viewledger
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim conC As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        con.Open()
        conC = New SqlConnection
        conC.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        conC.Open()
        If LblBranch.Text = String.Empty Then
            LblBranch.Text = UserBranch
        End If
    End Sub

    Protected Sub cmdshow_Click(sender As Object, e As EventArgs) Handles cmdshow.Click
        Dim adapter As SqlDataAdapter
        Dim ds As New System.Data.DataSet
        txtbal.Text = String.Empty
        ''con.Open()
        adapter = New SqlDataAdapter("Select * from Customer where CustNames='" & ltcustomer.Text & "'", conC)
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            txtbal.Text = Val(ds.Tables(0).Rows(0)("Balance"))
        End If

        Dim sql As String = "SELECT Dates,Refno AS [Detail],Description,Qty,Debit,Credit AS Payment FROM CustLedger  where Customer='" & ltcustomer.Text & "' ORDER BY SDate"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim dst As New DataSet

        dataadapter.Fill(ds, "CustLedger")

        Gridledger.DataSource = ds
        Gridledger.DataMember = "CustLedger"
        Gridledger.DataBind()
        con.Close()
        Dim dbt As String = 0
        Dim values As String = 0
        Dim q As String = 0
        For i As Integer = 0 To Gridledger.Rows.Count - 1
            q += Val(Gridledger.Rows(i).Cells(3).Text)
            dbt += Val(Gridledger.Rows(i).Cells(4).Text)
            values += Val(Gridledger.Rows(i).Cells(5).Text)

        Next
        txtqty.Text = FormatNumber(q, , , TriState.True, TriState.True)
        txtdebit.Text = FormatCurrency(dbt, , , TriState.True, TriState.True)
        txtcredit.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub
End Class