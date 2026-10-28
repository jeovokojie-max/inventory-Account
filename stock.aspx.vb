Imports System.Data.SqlClient

Public Class stock
    Inherits System.Web.UI.Page
    Private Const HeadOfficeLocation As String = "HEAD OFFICE"
    Private con As SqlConnection
    Dim M As String
    Dim bal As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
    End Sub



    Protected Sub cmdsubmit_Click(sender As Object, e As EventArgs) Handles cmdsubmit.Click
        txtBal.Text = Val(txtBal.Text) + Val(txtqty.Text)
        txtValue.Text = Val(txtcost.Text) * Val(txtqty.Text)
        con.Open()
        Dim cmd As New SqlCommand("INSERT INTO HeadStockin VALUES(@Item,@Cost,@Particulars,@Trandate,@Stockinqty,@Values,@Months)", con)
        cmd.Parameters.AddWithValue("@Item", txtitem.Text)
        cmd.Parameters.AddWithValue("@Cost", Val(txtcost.Text))
        cmd.Parameters.AddWithValue("@Particulars", Trim(txtparticulars.Text))
        cmd.Parameters.AddWithValue("@Trandate", Trim(txtdate.Text))
        cmd.Parameters.AddWithValue("@Stockinqty", Val(txtqty.Text))
        cmd.Parameters.AddWithValue("@Values", Val(txtcost.Text) * Val(txtqty.Text))
        cmd.Parameters.AddWithValue("@Months", Format(Today.Date, "MMMM"))

        cmd.ExecuteNonQuery()
        ClientScript.RegisterClientScriptBlock(Me.GetType, "clientScript", "Record Saved")

        Dim adapter As SqlDataAdapter
        Dim ds As New System.Data.DataSet

        M = HeadOfficeLocation & txtitem.Text
        adapter = New SqlDataAdapter("Select * from HeadOfficeBal where Item='" & txtitem.Text & "'", con)
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            bal = ds.Tables(0).Rows(0)("Balance")
            Dim mycom As SqlCommand = New SqlCommand
            mycom.Connection = con
            mycom.CommandText = "UPDATE HeadOfficeBal SET Balance=@Balance where BrchItem='" & txtitem.Text & "'"
            mycom.Parameters.AddWithValue("@Balance", Val(bal) + Val(txtqty.Text))
            mycom.ExecuteNonQuery()
        Else
            Dim cmdW As New SqlCommand("INSERT INTO HeadOfficeBal VALUES(@Item,@Balance)", con)
            cmdW.Parameters.AddWithValue("@Item", txtitem.Text)
            cmdW.Parameters.AddWithValue("@Balance", Val(bal) + Val(txtqty.Text))
            cmdW.ExecuteNonQuery()
        End If
        con.Close()

        txtcost.Text = String.Empty
        txtparticulars.Text = String.Empty
        'txtitem.Text = String.Empty
        txtdate.Text = String.Empty
        txtqty.Text = String.Empty
        txtValue.Text = String.Empty
        txtBal.Text = String.Empty
        'txtWarehouse.Text = ""

    End Sub

    Protected Sub txtitem_SelectedIndexChanged(sender As Object, e As EventArgs) Handles txtitem.SelectedIndexChanged
        Dim adapter As SqlDataAdapter
        Dim ds As New System.Data.DataSet
        Dim adapterI As SqlDataAdapter
        Dim dsI As New System.Data.DataSet
        txtBal.Text = String.Empty
        txtcost.Text = String.Empty
        M = txtitem.SelectedValue
        con.Open()
        adapter = New SqlDataAdapter("Select * from HeadOfficeBal where Item='" & M & "'", con)
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            txtBal.Text = Val(ds.Tables(0).Rows(0)("Balance"))
        End If

        adapterI = New SqlDataAdapter("Select * from ItemReg where Item='" & txtitem.Text & "'", con)
        adapterI.Fill(dsI)
        If dsI.Tables(0).Rows.Count > 0 Then
            txtcost.Text = dsI.Tables(0).Rows(0)("Cost")
        End If
        con.Close()
    End Sub

    Protected Sub txtqty_TextChanged(sender As Object, e As EventArgs) Handles txtqty.TextChanged
        txtValue.Text = Val(txtqty.Text) * Val(txtcost.Text)
    End Sub
End Class
