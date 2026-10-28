Imports System.Data.SqlClient
Public Class customer
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmddel As SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        con.Open()
    End Sub

    Protected Sub cmdsubmit_Click(sender As Object, e As EventArgs) Handles cmdsubmit.Click
        Dim cmd As New SqlCommand("INSERT INTO Customer VALUES(@Phone,@CustNames,@Address,@Balance)", con)
        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text)
        cmd.Parameters.AddWithValue("@CustNames", txtName.Text)
        cmd.Parameters.AddWithValue("@Address", txtLocation.Text)
        cmd.Parameters.AddWithValue("@Balance", 0)
        cmd.ExecuteNonQuery()
        txtPhone.Text = ""
        txtName.Text = ""
        txtLocation.Text = ""
    End Sub

    Protected Sub cmdAct_Click(sender As Object, e As EventArgs) Handles cmdAct.Click
        Dim adapbt As SqlDataAdapter
        Dim dst As New System.Data.DataSet
        adapbt = New SqlDataAdapter("Select * from Customer where Phone='" & txtPhone.Text & "'", con)
        adapbt.Fill(dst)
        If dst.Tables(0).Rows.Count > 0 Then
            txtName.Text = dst.Tables(0).Rows(0)("CustNames")
            txtLocation.Text = dst.Tables(0).Rows(0)("Address")
        End If
    End Sub

    Protected Sub cmdupdate_Click(sender As Object, e As EventArgs) Handles cmdupdate.Click
        Dim myco As SqlCommand = New SqlCommand
        myco.Connection = con
        myco.CommandText = "UPDATE Customer SET CustNames=@CustNames,Address=@Address where Phone='" & txtPhone.Text & "'"
        myco.Parameters.AddWithValue("@CustNames", txtName.Text)
        myco.Parameters.AddWithValue("@Address", txtLocation.Text)
        myco.ExecuteNonQuery()
    End Sub

    Protected Sub Btndel_Click(sender As Object, e As EventArgs) Handles Btndel.Click
        cmddel = New SqlCommand("Delete from Customer where Phone='" & txtPhone.Text & "'", con)
        cmddel.ExecuteNonQuery()
        txtPhone.Text = ""
        txtName.Text = ""
        txtLocation.Text = ""
    End Sub
End Class