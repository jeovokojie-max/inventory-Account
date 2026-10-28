Imports System.Data.SqlClient
Public Class item
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmddel As SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString

    End Sub

    Protected Sub txtitem_TextChanged(sender As Object, e As EventArgs) Handles txtitem.TextChanged
        Dim adapter As SqlDataAdapter
        Dim ds As New System.Data.DataSet
        adapter = New SqlDataAdapter("Select * from Itemreg where Item='" & txtitem.Text & "'", con)
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            txtcost.Text = ds.Tables(0).Rows(0)("Cost")
            txtSP.Text = ds.Tables(0).Rows(0)("Sellingprice")
        End If
    End Sub

    Protected Sub cmdsubmit_Click(sender As Object, e As EventArgs) Handles cmdsubmit.Click
        con.Open()
        Dim cmd As New SqlCommand("INSERT INTO ItemReg VALUES(@Item,@Cost,@Sellingprice,@Balance)", con)
        cmd.Parameters.AddWithValue("@Item", txtitem.Text)
        cmd.Parameters.AddWithValue("@Cost", Val(txtcost.Text))
        cmd.Parameters.AddWithValue("@Sellingprice", Val(txtSP.Text))
        cmd.Parameters.AddWithValue("@Balance", 0)

        cmd.ExecuteNonQuery()
        con.Close()
        ClientScript.RegisterClientScriptBlock(Me.GetType, "clientScript", "Record Saved")
        txtitem.Text = String.Empty
        txtcost.Text = String.Empty
        txtSP.Text = String.Empty
    End Sub



    Protected Sub Cmdup_Click(sender As Object, e As EventArgs) Handles Cmdup.Click
        Dim myco As SqlCommand = New SqlCommand
        con.Open()
        myco.Connection = con
        myco.CommandText = "UPDATE ItemReg SET Sellingprice=@Sellingprice,Cost=@Cost where Item='" & txtitem.Text & "'"
        myco.Parameters.AddWithValue("@Sellingprice", Val(txtSP.Text))
        myco.Parameters.AddWithValue("@Cost", Val(txtcost.Text))
        myco.ExecuteNonQuery()
        txtitem.Text = String.Empty
        txtcost.Text = String.Empty
        txtSP.Text = String.Empty
        con.Close()
    End Sub



    Protected Sub Btndel_Click(sender As Object, e As EventArgs) Handles Btndel.Click
        con.Open()
        cmddel = New SqlCommand("Delete from Itemreg where Item='" & txtitem.Text & "'", con)
        cmddel.ExecuteNonQuery()
        txtitem.Text = String.Empty
        txtcost.Text = String.Empty
        txtSP.Text = String.Empty
        con.Close()
    End Sub
End Class