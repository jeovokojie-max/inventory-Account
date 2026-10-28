Imports System.Data.SqlClient
Public Class viewSuppliers
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If LblBranch.Text = String.Empty Then
            LblBranch.Text = UserBranch
            txtBranch.Text = UserBranch
        End If
    End Sub

    Protected Sub cmdcontrol_Click(sender As Object, e As EventArgs) Handles cmdcontrol.Click
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        con.Open()
        Dim sql As String = "SELECT Phone,SupplyNames,Address,Balance FROM supplier WHERE Address=@Branch ORDER BY SupplyNames"
        Using command As New SqlCommand(sql, con)
            command.Parameters.AddWithValue("@Branch", txtBranch.Text.Trim())
            Using dataadapter As New SqlDataAdapter(command)
                Dim ds As New DataSet()
                dataadapter.Fill(ds, "supplier")
                GridView.DataSource = ds
                GridView.DataMember = "supplier"
                GridView.DataBind()
            End Using
        End Using
        con.Close()
    End Sub
End Class
