Imports System.Data.SqlClient
Public Class viewsalary
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
    End Sub

    Protected Sub Btnsrch_Click(sender As Object, e As EventArgs) Handles Btnsrch.Click
        Dim m As String
        m = DrpMonth.Text
        con.Open()
        Dim sql As String = "SELECT Staffname AS STAFF,Department AS DEPARTMENT,Bank AS BANK,AcctNo AS [ACCT NO],Basic AS BASIC,Overtime AS OVERTIME,Incentives AS INCENTIVES,Loan AS LOAN,Lateness AS LATENESS,Absent AS ABSENT, Net AS NET FROM salary where Months='" & m & "' ORDER BY Staffname"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "salary")

        Gridnet.DataSource = ds
        Gridnet.DataMember = "salary"
        Gridnet.DataBind()
        con.Close()

        Dim values As String = 0

        For i As Integer = 0 To Gridnet.Rows.Count - 1
            values += Val(Gridnet.Rows(i).Cells(10).Text)
        Next
        txtBal.Text = FormatCurrency(values, , , TriState.True, TriState.True)
    End Sub

    Protected Sub cmdprint_Click(sender As Object, e As EventArgs) Handles cmdprint.Click
        ClientScript.RegisterStartupScript([GetType](), "print", "window.print();", True)
        cmdprint.Visible = False
    End Sub
End Class