Imports System.Data.SqlClient
Public Class warehouses
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        con.Open()
    End Sub

    Protected Sub cmdsubmit_Click(sender As Object, e As EventArgs) Handles cmdsubmit.Click
        Dim cmd As New SqlCommand("INSERT INTO Warehouses VALUES(@WareNames)", con)
        cmd.Parameters.AddWithValue("@WareNames", txtwarehouse.Text)

        cmd.ExecuteNonQuery()
        ClientScript.RegisterClientScriptBlock(Me.GetType, "clientScript", "Record Saved")
        con.Close()
        txtwarehouse.Text = ""
    End Sub
End Class