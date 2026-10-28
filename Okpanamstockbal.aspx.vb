Imports System.Data.SqlClient
Public Class Okpanamstockbal
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString

        con.Open()
        Dim sql As String = "SELECT Item,Balance FROM OKPANAMBal ORDER BY Item"

        Dim dataadapter As New SqlDataAdapter(sql, con)
        'Dim ds As New DataSet()
        Dim ds As New DataSet

        dataadapter.Fill(ds, "OKPANAMBal")

        GridWarebal.DataSource = ds
        GridWarebal.DataMember = "OKPANAMBal"
        GridWarebal.DataBind()
        con.Close()
    End Sub





    Protected Sub cmdprint_Click(sender As Object, e As EventArgs) Handles cmdprint.Click
        ClientScript.RegisterStartupScript([GetType](), "print", "window.print();", True)
        cmdprint.Visible = False
    End Sub
End Class
