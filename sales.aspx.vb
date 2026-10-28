Imports System.Data
Imports System.Data.SqlClient

Public Class sales
    Inherits System.Web.UI.Page

    Private Const SalesLocation As String = "HEAD OFFICE"
    Private Const DraftSavedSessionKey As String = "SalesDraftSavedInvoice"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session.Remove(DraftSavedSessionKey)
            txtdate.Text = Date.Today.ToString("yyyy-MM-dd")
            GetDraftTable()
            LoadNextInvoiceNumber()
        End If

        BindInvoiceGrid()
        UpdateInvoiceTotal()
        UpdateCurrentLineTotal()
    End Sub

    Private Function GetDraftTable() As DataTable
        Dim draft As DataTable = TryCast(ViewState("SalesDraft"), DataTable)
        If draft Is Nothing Then
            draft = New DataTable()
            draft.Columns.Add("Item", GetType(String))
            draft.Columns.Add("Rate", GetType(Decimal))
            draft.Columns.Add("Quantity", GetType(Integer))
            draft.Columns.Add("Amount", GetType(Decimal))
            ViewState("SalesDraft") = draft
        End If
        Return draft
    End Function

    Private Function GetConnectionString() As String
        Return System.Configuration.ConfigurationManager.ConnectionStrings("Jochiss").ConnectionString
    End Function

    Private Sub LoadNextInvoiceNumber()
        Using con As New SqlConnection(GetConnectionString())
            Using cmd As New SqlCommand("SELECT TOP 1 Invno FROM GenInv", con)
                con.Open()
                Dim invoiceNumber As Object = cmd.ExecuteScalar()
                If invoiceNumber Is Nothing OrElse invoiceNumber Is DBNull.Value Then
                    txtinv.Text = String.Empty
                Else
                    txtinv.Text = Convert.ToString(invoiceNumber)
                End If
            End Using
        End Using
    End Sub

    Private Sub BindInvoiceGrid()
        Gridsales.DataSource = GetDraftTable()
        Gridsales.DataBind()
    End Sub

    Private Sub UpdateInvoiceTotal()
        Dim total As Decimal = 0D
        For Each row As DataRow In GetDraftTable().Rows
            total += Convert.ToDecimal(row("Amount"))
        Next
        txtAmount.Text = total.ToString("N2")
    End Sub

    Private Sub UpdateCurrentLineTotal()
        Dim rate As Decimal
        Dim quantity As Integer
        If Decimal.TryParse(txtrate.Text, rate) AndAlso Integer.TryParse(txtqty.Text, quantity) Then
            LineTotalLabel.Text = "₦" & (rate * quantity).ToString("N2")
        Else
            LineTotalLabel.Text = "₦0.00"
        End If
    End Sub

    Protected Sub ltitem_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ltitem.SelectedIndexChanged
        LoadSelectedItemDetails()
    End Sub

    Protected Sub ltitem_DataBound(sender As Object, e As EventArgs) Handles ltitem.DataBound
        If Not IsPostBack Then LoadSelectedItemDetails()
    End Sub

    Private Sub LoadSelectedItemDetails()
        txtBal.Text = String.Empty
        txtrate.Text = String.Empty
        If String.IsNullOrWhiteSpace(ltitem.SelectedValue) Then
            UpdateCurrentLineTotal()
            Return
        End If

        Using con As New SqlConnection(GetConnectionString())
            con.Open()
            Using balanceCommand As New SqlCommand("SELECT Balance FROM HeadOfficeBal WHERE Item = @Item", con)
                balanceCommand.Parameters.AddWithValue("@Item", ltitem.SelectedValue)
                Dim balance As Object = balanceCommand.ExecuteScalar()
                txtBal.Text = If(balance Is Nothing OrElse balance Is DBNull.Value, "0", Convert.ToDecimal(balance).ToString("0.##"))
            End Using

            Using rateCommand As New SqlCommand("SELECT SellingPrice FROM ItemReg WHERE Item = @Item", con)
                rateCommand.Parameters.AddWithValue("@Item", ltitem.SelectedValue)
                Dim rate As Object = rateCommand.ExecuteScalar()
                If rate IsNot Nothing AndAlso rate IsNot DBNull.Value Then
                    txtrate.Text = Convert.ToDecimal(rate).ToString("0.00")
                End If
            End Using
        End Using
        UpdateCurrentLineTotal()
    End Sub

    Protected Sub cmdcontrol_Click(sender As Object, e As EventArgs) Handles cmdcontrol.Click
        If String.IsNullOrWhiteSpace(ltitem.SelectedValue) Then
            ShowMessage("Select an item first.")
            Return
        End If

        Dim rate As Decimal
        Dim quantity As Integer
        Dim available As Decimal
        If Not Decimal.TryParse(txtrate.Text, rate) OrElse rate < 0D Then
            ShowMessage("Enter a valid selling price.")
            Return
        End If
        If Not Integer.TryParse(txtqty.Text, quantity) OrElse quantity < 1 Then
            ShowMessage("Enter a quantity of at least one.")
            Return
        End If
        If Not Decimal.TryParse(txtBal.Text, available) Then available = 0D

        Dim draft As DataTable = GetDraftTable()
        Dim existingRow As DataRow = Nothing
        Dim quantityAlreadyDrafted As Integer = 0
        For Each row As DataRow In draft.Rows
            If String.Equals(Convert.ToString(row("Item")), ltitem.SelectedValue, StringComparison.OrdinalIgnoreCase) Then
                existingRow = row
                quantityAlreadyDrafted = Convert.ToInt32(row("Quantity"))
                Exit For
            End If
        Next

        If quantityAlreadyDrafted + quantity > available Then
            ShowMessage("The quantity exceeds the available Head Office stock.")
            Return
        End If

        Dim combinedQuantity As Integer = quantityAlreadyDrafted + quantity
        Dim lineAmount As Decimal = rate * combinedQuantity
        If existingRow Is Nothing Then
            draft.Rows.Add(ltitem.SelectedValue, rate, quantity, rate * quantity)
        Else
            existingRow("Rate") = rate
            existingRow("Quantity") = combinedQuantity
            existingRow("Amount") = lineAmount
        End If

        ViewState("SalesDraft") = draft
        BindInvoiceGrid()
        UpdateInvoiceTotal()
        txtqty.Text = String.Empty
        UpdateCurrentLineTotal()
    End Sub

    Protected Sub Gridsales_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles Gridsales.RowDeleting
        Dim draft As DataTable = GetDraftTable()
        If e.RowIndex >= 0 AndAlso e.RowIndex < draft.Rows.Count Then
            draft.Rows(e.RowIndex).Delete()
            draft.AcceptChanges()
            ViewState("SalesDraft") = draft
        End If
        BindInvoiceGrid()
        UpdateInvoiceTotal()
    End Sub

    Protected Sub txtqty_TextChanged(sender As Object, e As EventArgs) Handles txtqty.TextChanged
        UpdateCurrentLineTotal()
    End Sub

    Protected Sub txtrate_TextChanged(sender As Object, e As EventArgs) Handles txtrate.TextChanged
        UpdateCurrentLineTotal()
    End Sub

    Protected Sub cmdnext_Click(sender As Object, e As EventArgs) Handles cmdnext.Click
        Dim savedInvoice As String = Convert.ToString(Session(DraftSavedSessionKey))
        If Not String.IsNullOrWhiteSpace(savedInvoice) Then
            Invoiceno = savedInvoice
            RedirectToInvoice()
            Return
        End If

        Dim draft As DataTable = GetDraftTable()
        If draft.Rows.Count = 0 Then
            ShowMessage("Add at least one item before saving the invoice.")
            Return
        End If
        If String.IsNullOrWhiteSpace(ltcustomer.SelectedValue) Then
            ShowMessage("Select a customer before saving the invoice.")
            Return
        End If

        Dim saleDate As DateTime
        If Not DateTime.TryParse(txtdate.Text, saleDate) Then
            ShowMessage("Enter a valid sale date.")
            Return
        End If

        Dim invoiceTotal As Decimal = 0D
        Dim totalQuantity As Integer = 0
        For Each row As DataRow In draft.Rows
            invoiceTotal += Convert.ToDecimal(row("Amount"))
            totalQuantity += Convert.ToInt32(row("Quantity"))
        Next

        Dim invoiceNumber As Integer
        Dim customerBalance As Decimal
        Dim newCustomerBalance As Decimal
        Dim saleDateText As String = saleDate.ToString("dd/MM/yy")
        Dim saveStep As String = "opening the save transaction"
        Using con As New SqlConnection(GetConnectionString())
            con.Open()
            Using transaction As SqlTransaction = con.BeginTransaction()
                Try
                    saveStep = "reserving the invoice number"
                    Using invoiceCommand As New SqlCommand("SELECT TOP 1 Invno FROM GenInv WITH (UPDLOCK, HOLDLOCK)", con, transaction)
                        Dim currentInvoice As Object = invoiceCommand.ExecuteScalar()
                        If currentInvoice Is Nothing OrElse currentInvoice Is DBNull.Value Then
                            Throw New ApplicationException("The invoice number is not configured.")
                        End If
                        invoiceNumber = Convert.ToInt32(currentInvoice)
                    End Using

                    saveStep = "checking the customer account"
                    Using customerCommand As New SqlCommand("SELECT Balance FROM Customer WITH (UPDLOCK, HOLDLOCK) WHERE CustNames = @Customer", con, transaction)
                        customerCommand.Parameters.AddWithValue("@Customer", ltcustomer.SelectedValue)
                        Dim currentCustomerBalance As Object = customerCommand.ExecuteScalar()
                        If currentCustomerBalance Is Nothing OrElse currentCustomerBalance Is DBNull.Value Then
                            Throw New ApplicationException("The selected customer could not be found.")
                        End If
                        customerBalance = Convert.ToDecimal(currentCustomerBalance)
                    End Using

                    For Each row As DataRow In draft.Rows
                        Dim itemName As String = Convert.ToString(row("Item"))
                        Dim unitPrice As Decimal = Convert.ToDecimal(row("Rate"))
                        Dim quantity As Integer = Convert.ToInt32(row("Quantity"))
                        Dim lineAmount As Decimal = Convert.ToDecimal(row("Amount"))
                        Dim available As Decimal

                        saveStep = "checking Head Office stock for " & itemName
                        Using stockCommand As New SqlCommand("SELECT Balance FROM HeadOfficeBal WITH (UPDLOCK, HOLDLOCK) WHERE Item = @Item", con, transaction)
                            stockCommand.Parameters.AddWithValue("@Item", itemName)
                            Dim stockBalance As Object = stockCommand.ExecuteScalar()
                            If stockBalance Is Nothing OrElse stockBalance Is DBNull.Value Then
                                Throw New ApplicationException("No Head Office balance is recorded for " & itemName & ".")
                            End If
                            available = Convert.ToDecimal(stockBalance)
                        End Using

                        If quantity > available Then
                            Throw New ApplicationException("Not enough Head Office stock for " & itemName & ". Available quantity: " & available.ToString("0.##") & ".")
                        End If

                        saveStep = "updating Head Office stock for " & itemName
                        Using stockCommand As New SqlCommand("UPDATE HeadOfficeBal SET Balance = @Balance WHERE Item = @Item", con, transaction)
                            stockCommand.Parameters.AddWithValue("@Balance", available - quantity)
                            stockCommand.Parameters.AddWithValue("@Item", itemName)
                            stockCommand.ExecuteNonQuery()
                        End Using

                        saveStep = "writing the invoice line to HeadSales for " & itemName
                        Using saleCommand As New SqlCommand("INSERT INTO HeadSales (Dates, Sdate, Months, Invno, Customer, Description, Unit, Qty, Amount, Invitem, Waybill, Driver, itemMonth) VALUES (@Dates, @Sdate, @Months, @Invno, @Customer, @Description, @Unit, @Qty, @Amount, @Invitem, @Waybill, @Driver, @itemMonth)", con, transaction)
                            saleCommand.Parameters.Add("@Dates", SqlDbType.DateTime).Value = saleDate
                            saleCommand.Parameters.Add("@Sdate", SqlDbType.NVarChar, 255).Value = saleDate.ToString("dd-MM-yyyy")
                            saleCommand.Parameters.AddWithValue("@Months", Date.Today.ToString("MMMM"))
                            saleCommand.Parameters.AddWithValue("@Invno", invoiceNumber)
                            saleCommand.Parameters.AddWithValue("@Customer", ltcustomer.SelectedValue)
                            saleCommand.Parameters.AddWithValue("@Description", itemName)
                            saleCommand.Parameters.AddWithValue("@Unit", unitPrice)
                            saleCommand.Parameters.AddWithValue("@Qty", quantity)
                            saleCommand.Parameters.AddWithValue("@Amount", lineAmount)
                            saleCommand.Parameters.AddWithValue("@Invitem", invoiceNumber.ToString() & itemName)
                            saleCommand.Parameters.AddWithValue("@Waybill", txtwaybil.Text.Trim())
                            saleCommand.Parameters.AddWithValue("@Driver", txtDriver.Text.Trim())
                            saleCommand.Parameters.AddWithValue("@itemMonth", SalesLocation & itemName & Date.Today.ToString("MMMM"))
                            saleCommand.ExecuteNonQuery()
                        End Using
                    Next

                    saveStep = "updating the customer balance"
                    newCustomerBalance = customerBalance + invoiceTotal
                    Using customerCommand As New SqlCommand("UPDATE Customer SET Balance = @Balance WHERE CustNames = @Customer", con, transaction)
                        customerCommand.Parameters.AddWithValue("@Balance", newCustomerBalance)
                        customerCommand.Parameters.AddWithValue("@Customer", ltcustomer.SelectedValue)
                        customerCommand.ExecuteNonQuery()
                    End Using

                    saveStep = "writing the customer ledger"
                    Using ledgerCommand As New SqlCommand("INSERT INTO CustLedger (Customer, Dates, Refno, Months, Description, Qty, Debit, Credit, Balance, SDate) VALUES (@Customer, @Dates, @Refno, @Months, @Description, @Qty, @Debit, @Credit, @Balance, @SDate)", con, transaction)
                        ledgerCommand.Parameters.AddWithValue("@Customer", ltcustomer.SelectedValue)
                        ledgerCommand.Parameters.AddWithValue("@Dates", SqlDbType.DateTime).Value = saleDate
                        ledgerCommand.Parameters.AddWithValue("@Refno", invoiceNumber)
                        ledgerCommand.Parameters.AddWithValue("@Months", Date.Today.ToString("MMMM"))
                        ledgerCommand.Parameters.AddWithValue("@Description", "Sales invoice")
                        ledgerCommand.Parameters.AddWithValue("@Qty", totalQuantity)
                        ledgerCommand.Parameters.AddWithValue("@Debit", invoiceTotal)
                        ledgerCommand.Parameters.AddWithValue("@Credit", 0D)
                        ledgerCommand.Parameters.AddWithValue("@Balance", newCustomerBalance)
                        ledgerCommand.Parameters.AddWithValue("@SDate", SqlDbType.DateTime).Value = saleDate
                        ledgerCommand.ExecuteNonQuery()
                    End Using

                    saveStep = "advancing the invoice number"
                    Using nextInvoiceCommand As New SqlCommand("UPDATE GenInv SET Invno = @NextInvoice", con, transaction)
                        nextInvoiceCommand.Parameters.AddWithValue("@NextInvoice", invoiceNumber + 1)
                        nextInvoiceCommand.ExecuteNonQuery()
                    End Using

                    transaction.Commit()
                Catch ex As ApplicationException
                    Try
                        transaction.Rollback()
                    Catch
                    End Try
                    ShowMessage(ex.Message)
                    Return
                Catch ex As Exception
                    Try
                        transaction.Rollback()
                    Catch
                    End Try
                    ShowMessage("The invoice could not be saved while " & saveStep & ". No stock was deducted. Details: " & ex.Message)
                    Return
                End Try
            End Using
        End Using

        Dim invoiceText As String = invoiceNumber.ToString()
        Session(DraftSavedSessionKey) = invoiceText
        Session("SalesInvoiceItems") = draft.Copy()
        Session("SalesLocation") = SalesLocation
        Custo = ltcustomer.SelectedValue
        Drivername = txtDriver.Text.Trim()
        Invoiceno = invoiceText
        waybillno = txtwaybil.Text.Trim()
        Totalamt = invoiceTotal.ToString("N2")
        Salesdate = saleDateText
        RedirectToInvoice()
    End Sub

    Private Sub RedirectToInvoice()
        Response.Redirect("printsales.aspx", False)
        Context.ApplicationInstance.CompleteRequest()
    End Sub

    Private Sub ShowMessage(message As String)
        Dim safeMessage As String = System.Web.HttpUtility.JavaScriptStringEncode(message)
        ClientScript.RegisterStartupScript(Me.GetType(), Guid.NewGuid().ToString("N"), "alert('" & safeMessage & "');", True)
    End Sub
End Class
