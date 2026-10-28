Imports System.Data.SqlClient
Public Class _Default


    Inherits Page

    Dim con As New SqlConnection
    Dim np As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        con = New SqlConnection
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        If Not IsPostBack Then
            Session.Clear()
        End If
        If IsPostBack Then
            ClientScript.RegisterStartupScript(Me.GetType(), "openAdmin", "var panel=document.querySelector('.admin-access');if(panel){panel.open=true;}", True)
        End If

    End Sub

    Private Sub cmdsign_Click(sender As Object, e As EventArgs) Handles cmdsign.Click
        Dim adapter As SqlDataAdapter
        'Dim adap As SqlDataAdapter
        Dim Accuser As String
        Dim ds As New System.Data.DataSet
        Dim dp As New System.Data.DataSet

        If Txtusername.Text = "" Then
            ShowMessage("Please enter your username.")
            Exit Sub
        End If
        con.Open()
        adapter = New SqlDataAdapter("Select * from Login where Usernames=@username", con)
        adapter.SelectCommand.Parameters.AddWithValue("@username", Txtusername.Text)
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            np = ds.Tables(0).Rows(0)("New_Pass").ToString()

        Else
            con.Close()
            ShowMessage("We couldn't find that username.")
            Exit Sub
        End If
        con.Close()

        If txtpass.Text = np Then
            'MsgBox("Welcome :" & fn & " Access granted")
            Username = Txtusername.Text
            Session("Authenticated") = True
            Session("Username") = Username

            Accuser = Txtusername.Text
            Server.Transfer("Maindisplay.aspx", True)
            'Main.Show()
            'Me.Hide()
        Else
            ShowMessage("The password is incorrect. Please try again.")
            txtpass.Text = String.Empty
        End If
    End Sub



    Protected Sub cmdadmin_Click(sender As Object, e As EventArgs) Handles cmdadmin.Click
        If txtadmin.Text = System.Configuration.ConfigurationManager.AppSettings("ReportsAdminPassword") Then
            Txtnewuser.Enabled = True
            txtnewpass.Enabled = True

            cmdupdate.Enabled = True
            cmdnew.Enabled = True
        Else
            ShowMessage("Administrator key was not accepted.")
        End If
    End Sub

    Protected Sub cmdnew_Click(sender As Object, e As EventArgs) Handles cmdnew.Click
        con.Open()
        Dim cmd As New SqlCommand("INSERT INTO Login VALUES(@Fullnames,@Usernames,@Old_Pass,@New_Pass)", con)
        cmd.Parameters.AddWithValue("@Fullnames", Txtnewuser.Text)
        cmd.Parameters.AddWithValue("@Usernames", Txtnewuser.Text)
        cmd.Parameters.AddWithValue("@Old_Pass", txtnewpass.Text)
        cmd.Parameters.AddWithValue("@New_Pass", txtnewpass.Text)

        cmd.ExecuteNonQuery()
        con.Close()
        Txtnewuser.Text = String.Empty
        txtnewpass.Text = String.Empty

    End Sub

    Protected Sub cmdupdate_Click(sender As Object, e As EventArgs) Handles cmdupdate.Click
        Dim adapter As SqlDataAdapter
        Dim ds As New System.Data.DataSet
        Dim bal As String = 0
        con.Open()
        adapter = New SqlDataAdapter("Select * from Login where Usernames=@username", con)
        adapter.SelectCommand.Parameters.AddWithValue("@username", Txtnewuser.Text)
        adapter.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            Dim myco As SqlCommand = New SqlCommand
            myco.Connection = con
            myco.CommandText = "UPDATE Login SET Old_Pass=@Old_Pass,New_Pass=@New_Pass where Usernames=@Usernames"
            myco.Parameters.AddWithValue("@Old_Pass", txtnewpass.Text)
            myco.Parameters.AddWithValue("@New_Pass", txtnewpass.Text)
            myco.Parameters.AddWithValue("@Usernames", Txtnewuser.Text)
            myco.ExecuteNonQuery()
        Else
            ShowMessage("User does not exist.")
        End If
        con.Close()
    End Sub

    Private Sub ShowMessage(message As String)
        Dim safeMessage As String = message.Replace("\\", "\\\\").Replace("'", "\\'")
        ClientScript.RegisterStartupScript(Me.GetType(), "loginMessage", "alert('" & safeMessage & "');", True)
    End Sub
End Class
