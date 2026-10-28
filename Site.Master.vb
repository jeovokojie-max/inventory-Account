Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim currentPage As String = System.IO.Path.GetFileName(Request.AppRelativeCurrentExecutionFilePath)
        Dim isSignInPage As Boolean = String.Equals(currentPage, "Default.aspx", StringComparison.OrdinalIgnoreCase) OrElse
                                      String.Equals(currentPage, "Default", StringComparison.OrdinalIgnoreCase) OrElse
                                      String.Equals(currentPage, "Index.aspx", StringComparison.OrdinalIgnoreCase) OrElse
                                      String.Equals(currentPage, "Index", StringComparison.OrdinalIgnoreCase)
        If String.Equals(Request.Url.AbsolutePath.TrimEnd("/"c), Request.ApplicationPath.TrimEnd("/"c), StringComparison.OrdinalIgnoreCase) Then
            isSignInPage = True
        End If
        SiteHeader.Visible = Not isSignInPage
        BusinessNavigation.Visible = Not isSignInPage
    End Sub
End Class
