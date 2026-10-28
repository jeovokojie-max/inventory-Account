Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Globalization

Public Class FrmPrescription
    Inherits System.Web.UI.Page

    Private ReadOnly Property ChaufConnectionString As String
        Get
            Return ConfigurationManager.ConnectionStrings("chaufConnectionString").ConnectionString
        End Get
    End Property

    Protected Sub cmbNames_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbNames.SelectedIndexChanged
        txtCardNumber.Text = String.Empty
        If String.IsNullOrWhiteSpace(cmbNames.SelectedValue) Then Return

        Using connection As New SqlConnection(ChaufConnectionString)
            Using command As New SqlCommand("SELECT TOP 1 CardNo FROM Customer WHERE CustNames = @CustNames", connection)
                command.Parameters.AddWithValue("@CustNames", cmbNames.SelectedValue)
                connection.Open()
                Dim cardNumber As Object = command.ExecuteScalar()
                If cardNumber IsNot Nothing AndAlso cardNumber IsNot DBNull.Value Then
                    txtCardNumber.Text = Convert.ToString(cardNumber)
                End If
            End Using
        End Using
    End Sub

    Protected Sub cmbMedicine_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbMedicine.SelectedIndexChanged
        txtUnitPrice.Text = String.Empty
        If String.IsNullOrWhiteSpace(cmbMedicine.SelectedValue) Then Return

        Using connection As New SqlConnection(ChaufConnectionString)
            Using command As New SqlCommand("SELECT TOP 1 SellingPrice FROM Itemreg WHERE Item = @Item", connection)
                command.Parameters.AddWithValue("@Item", cmbMedicine.SelectedValue)
                connection.Open()
                Dim unitPrice As Object = command.ExecuteScalar()
                If unitPrice IsNot Nothing AndAlso unitPrice IsNot DBNull.Value Then
                    txtUnitPrice.Text = Convert.ToDecimal(unitPrice).ToString(CultureInfo.InvariantCulture)
                End If
            End Using
        End Using
    End Sub
End Class
