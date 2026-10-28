Imports System.Data.SqlClient
Public Class _return
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim conS As New SqlConnection
    Dim M As String
    Dim B As String
    Dim Bal As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString

        conS = New SqlConnection
        conS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        conS.Open()
    End Sub

    Protected Sub Cmdshow_Click(sender As Object, e As EventArgs) Handles Cmdshow.Click
        txtqty.Text = String.Empty
        txtAmount.Text = String.Empty
        txtBranch.Text = String.Empty
        txtItem.Text = String.Empty
        txtName.Text = String.Empty
        txtrate.Text = String.Empty
        con.Open()
        Dim sql As String = "SELECT SDate AS Dates,Customer,Description,Branch,Unit,Qty,Amount FROM Sales  where Invno='" & txtInvno.Text & "' ORDER BY SDate"
        Dim dataadapter As New SqlDataAdapter(sql, con)
        Dim ds As New DataSet()
        'Dim dst As New DataSet

        dataadapter.Fill(ds, "Sales")

        Gridledger.DataSource = ds
        Gridledger.DataMember = "Sales"
        Gridledger.DataBind()
        con.Close()

    End Sub



    Protected Sub Cmdreturn_Click(sender As Object, e As EventArgs) Handles Cmdreturn.Click
        Dim T As String
        Dim R As String
        R = Val(txtqty.Text) - Val(txtqtyRet.Text)
        T = txtInvno.Text + txtItem.Text
        Dim mycommand As SqlCommand = New SqlCommand
        con.Open()
        mycommand.Connection = con
        mycommand.CommandText = "UPDATE Sales SET Unit=@Unit,Qty=@Qty,Amount=@Amount where Invitem='" & T & "'"
        mycommand.Parameters.AddWithValue("@Unit", Val(txtrate.Text))
        mycommand.Parameters.AddWithValue("@Qty", Val(R))
        mycommand.Parameters.AddWithValue("@Amount", Val(R) * Val(txtrate.Text))
        mycommand.ExecuteNonQuery()

        M = txtBranch.Text & txtItem.Text
        Dim adapter As SqlDataAdapter
        Dim ds As New System.Data.DataSet
        adapter = New SqlDataAdapter("Select * from WareBalance where BrchItem='" & M & "'", conS)
        adapter.Fill(ds)
        B = String.Empty
        If ds.Tables(0).Rows.Count > 0 Then
            B = ds.Tables(0).Rows(0)("Balance")
            Dim mycom As SqlCommand = New SqlCommand
            mycom.Connection = conS
            mycom.CommandText = "UPDATE WareBalance SET Balance=@Balance,Return=@Return where BrchItem='" & M & "'"
            mycom.Parameters.AddWithValue("@Balance", Val(B) + Val(txtqtyRet.Text))
            mycom.Parameters.AddWithValue("@Return", Val(txtqtyRet.Text))
            mycom.ExecuteNonQuery()
            conS.Close()
        End If
        Dim adap As SqlDataAdapter
        Dim dsd As New System.Data.DataSet
        Dim A As String
        A = Val(R) * Val(txtrate.Text)
        Bal = String.Empty
        adap = New SqlDataAdapter("Select * from Customer where CustNames='" & txtName.Text & "'", con)
        adap.Fill(dsd)
        If dsd.Tables(0).Rows.Count > 0 Then
            Bal = dsd.Tables(0).Rows(0)("Balance")
            Dim myco As SqlCommand = New SqlCommand
            myco.Connection = con
            myco.CommandText = "UPDATE Customer SET Balance=@Balance where CustNames='" & txtName.Text & "'"
            myco.Parameters.AddWithValue("@Balance", Val(Bal) + Val(A))
            myco.ExecuteNonQuery()
            con.Close()
        End If
        ClientScript.RegisterClientScriptBlock(Me.GetType, "clientScript", "Item returned...")
    End Sub

    Protected Sub Gridledger_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Gridledger.SelectedIndexChanged
        Dim row As GridViewRow = Gridledger.SelectedRow
        txtItem.Text = row.Cells(3).Text
        txtBranch.Text = row.Cells(4).Text
        txtAmount.Text = row.Cells(7).Text
        txtrate.Text = row.Cells(5).Text
        txtqty.Text = row.Cells(6).Text
        txtName.Text = row.Cells(2).Text

    End Sub


End Class