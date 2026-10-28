Imports System.Data.SqlClient
Public Class staff
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmddel As SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString

    End Sub



    Protected Sub cmdsubmit_Click(sender As Object, e As EventArgs) Handles cmdsubmit.Click
        con.Open()
        Dim cmd As New SqlCommand("INSERT INTO reg VALUES(@staffname,@Department,@Phone,@Bank,@AcctNo)", con)
        cmd.Parameters.AddWithValue("@staffname", txtstaff.Text)
        cmd.Parameters.AddWithValue("@Department", cmbdept.Text)
        cmd.Parameters.AddWithValue("@Phone", txtphone.Text)
        cmd.Parameters.AddWithValue("@Bank", txtbank.Text)
        cmd.Parameters.AddWithValue("@AcctNo", txtaccno.Text)
        cmd.ExecuteNonQuery()
        con.Close()
        ClientScript.RegisterClientScriptBlock(Me.GetType, "clientScript", "Record Saved")
        txtstaff.Text = String.Empty
        txtphone.Text = String.Empty
        txtaccno.Text = String.Empty
    End Sub



    Protected Sub Cmdup_Click(sender As Object, e As EventArgs) Handles Cmdup.Click
        Dim myco As SqlCommand = New SqlCommand
        con.Open()
        myco.Connection = con
        myco.CommandText = "UPDATE reg SET staffname=@staffname,Department=@Department,Bank=@Bank,AcctNo=@AcctNo where Phone='" & txtphone.Text & "'"
        myco.Parameters.AddWithValue("@staffname", txtstaff.Text)
        myco.Parameters.AddWithValue("@Department", cmbdept.Text)
        myco.Parameters.AddWithValue("@Bank", txtbank.Text)
        myco.Parameters.AddWithValue("@AcctNo", txtaccno.Text)
        myco.ExecuteNonQuery()
        txtstaff.Text = String.Empty
        txtphone.Text = String.Empty
        txtaccno.Text = String.Empty
        con.Close()
    End Sub

    Protected Sub Btnsrch_Click(sender As Object, e As EventArgs) Handles Btnsrch.Click
        Dim adapter As SqlDataAdapter
        Dim ds As New System.Data.DataSet
        adapter = New SqlDataAdapter("Select * from reg where Phone='" & txtphone.Text & "'", con)
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            txtstaff.Text = ds.Tables(0).Rows(0)("staffname")
            cmbdept.Text = ds.Tables(0).Rows(0)("Department")
            txtphone.Text = ds.Tables(0).Rows(0)("Phone")
            txtbank.Text = ds.Tables(0).Rows(0)("Bank")
            txtaccno.Text = ds.Tables(0).Rows(0)("AcctNo")
        End If
    End Sub

    Protected Sub Btndel_Click(sender As Object, e As EventArgs) Handles Btndel.Click
        con.Open()
        cmddel = New SqlCommand("Delete from reg where Phone='" & txtphone.Text & "'", con)
        cmddel.ExecuteNonQuery()
        txtstaff.Text = String.Empty
        txtphone.Text = String.Empty
        txtaccno.Text = String.Empty
        con.Close()
    End Sub
End Class