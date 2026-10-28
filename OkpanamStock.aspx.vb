Imports System.Data.SqlClient

Public Class OkpanamStock
    Inherits System.Web.UI.Page

    Private Const StockLocation As String = "OKPANAM"

    Protected Sub cmdsubmit_Click(sender As Object, e As EventArgs) Handles cmdsubmit.Click
        If String.IsNullOrWhiteSpace(txtitem.SelectedValue) Then
            ShowMessage("Select an item before recording stock.")
            Return
        End If

        Dim unitCost As Decimal
        Dim quantity As Integer
        Dim receivedDate As DateTime
        If Not Decimal.TryParse(txtcost.Text, unitCost) OrElse unitCost < 0D Then
            ShowMessage("Select an item with a valid cost price.")
            Return
        End If
        If Not Integer.TryParse(txtqty.Text, quantity) OrElse quantity < 1 Then
            ShowMessage("Enter a quantity of at least one.")
            Return
        End If
        If Not DateTime.TryParse(txtdate.Text, receivedDate) Then
            ShowMessage("Enter the date the stock was received.")
            Return
        End If

        Dim itemName As String = txtitem.SelectedValue
        Dim itemKey As String = itemName
        Dim totalValue As Decimal = unitCost * quantity
        Dim newBalance As Decimal = 0D
        Dim balanceExists As Boolean = False
        Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString

        Using con As New SqlConnection(connectionString)
            con.Open()
            Using transaction As SqlTransaction = con.BeginTransaction()
                    Try
                        Using balanceCommand As New SqlCommand("SELECT Balance FROM OKPANAMBal WITH (UPDLOCK, HOLDLOCK) WHERE Item = @Item", con, transaction)
                            balanceCommand.Parameters.AddWithValue("@Item", itemKey)
                            Dim currentBalance As Object = balanceCommand.ExecuteScalar()
                            If currentBalance IsNot Nothing AndAlso currentBalance IsNot DBNull.Value Then
                                balanceExists = True
                                newBalance = Convert.ToDecimal(currentBalance) + quantity
                            Else
                                newBalance = quantity
                            End If
                        End Using

                        Using receiptCommand As New SqlCommand("INSERT INTO OkpanamStockin (Item, Cost, Particulars, Trandate, Stockinqty, [Values], Months) VALUES (@Item, @Cost,@Particulars, @Trandate, @Stockinqty, @Values, @Months)", con, transaction)
                            receiptCommand.Parameters.AddWithValue("@Item", itemName)
                            receiptCommand.Parameters.AddWithValue("@Cost", unitCost)
                            receiptCommand.Parameters.AddWithValue("@Particulars", txtparticulars.Text.Trim())
                            receiptCommand.Parameters.AddWithValue("@Trandate", receivedDate)
                            receiptCommand.Parameters.AddWithValue("@Stockinqty", quantity)
                            receiptCommand.Parameters.AddWithValue("@Values", totalValue)
                            receiptCommand.Parameters.AddWithValue("@Months", Date.Today.ToString("MMMM"))

                            receiptCommand.ExecuteNonQuery()
                        End Using

                        If Not balanceExists Then
                            Using balanceCommand As New SqlCommand("INSERT INTO OKPANAMBal (Item, Balance) VALUES (@Item, @Balance)", con, transaction)

                                balanceCommand.Parameters.AddWithValue("@Item", itemName)

                                balanceCommand.Parameters.AddWithValue("@Balance", newBalance)

                                balanceCommand.ExecuteNonQuery()
                            End Using
                        Else
                            Using balanceCommand As New SqlCommand("UPDATE OKPANAMBal SET Balance = @Balance WHERE Item = @Item", con, transaction)
                                balanceCommand.Parameters.AddWithValue("@Balance", newBalance)
                                balanceCommand.Parameters.AddWithValue("@Item", itemName)

                                balanceCommand.ExecuteNonQuery()
                            End Using
                        End If

                        transaction.Commit()
                    Catch
                        Try
                            transaction.Rollback()
                        Catch
                        End Try
                        ShowMessage("Stock could not be saved. Please try again.")
                        Return
                    End Try
                End Using
            End Using

            txtBal.Text = newBalance.ToString("0.##")
            txtValue.Text = totalValue.ToString("0.00")
            txtqty.Text = String.Empty
            txtdate.Text = String.Empty
            txtparticulars.Text = String.Empty
            ShowMessage("Okpanam stock receipt saved.")
    End Sub

    Protected Sub txtitem_SelectedIndexChanged(sender As Object, e As EventArgs) Handles txtitem.SelectedIndexChanged
        txtBal.Text = String.Empty
        txtcost.Text = String.Empty
        If String.IsNullOrWhiteSpace(txtitem.SelectedValue) Then Return

        Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
        Using con As New SqlConnection(connectionString)
            con.Open()
            Using balanceCommand As New SqlCommand("SELECT Balance FROM OKPANAMBal WHERE Item = @Item", con)
                balanceCommand.Parameters.AddWithValue("@Item", txtitem.SelectedValue)
                Dim currentBalance As Object = balanceCommand.ExecuteScalar()
                If currentBalance IsNot Nothing AndAlso currentBalance IsNot DBNull.Value Then
                    txtBal.Text = Convert.ToDecimal(currentBalance).ToString("0.##")
                Else
                    txtBal.Text = "0"
                End If
            End Using

            Using costCommand As New SqlCommand("SELECT Cost FROM ItemReg WHERE Item = @Item", con)
                costCommand.Parameters.AddWithValue("@Item", txtitem.SelectedValue)
                Dim itemCost As Object = costCommand.ExecuteScalar()
                If itemCost IsNot Nothing AndAlso itemCost IsNot DBNull.Value Then
                    txtcost.Text = Convert.ToDecimal(itemCost).ToString("0.00")
                End If
            End Using
        End Using
    End Sub

    Protected Sub txtqty_TextChanged(sender As Object, e As EventArgs) Handles txtqty.TextChanged
        Dim quantity As Integer
        Dim unitCost As Decimal
        If Integer.TryParse(txtqty.Text, quantity) AndAlso Decimal.TryParse(txtcost.Text, unitCost) Then
            txtValue.Text = (quantity * unitCost).ToString("0.00")
        Else
            txtValue.Text = String.Empty
        End If
    End Sub

    Private Sub ShowMessage(message As String)
        Dim safeMessage As String = message.Replace("'", "\'")
        ClientScript.RegisterStartupScript(Me.GetType(), Guid.NewGuid().ToString("N"), "alert('" & safeMessage & "');", True)
    End Sub
End Class

