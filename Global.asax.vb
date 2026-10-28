Imports System.Web.Optimization

Public Class Global_asax
    Inherits HttpApplication

    Sub Application_Start(sender As Object, e As EventArgs)
        ' Fires when the application is started
        RouteConfig.RegisterRoutes(RouteTable.Routes)
        BundleConfig.RegisterBundles(BundleTable.Bundles)
    End Sub

    Sub Application_PostAcquireRequestState(sender As Object, e As EventArgs)
        Dim requestPath As String = Request.AppRelativeCurrentExecutionFilePath
        Dim pageName As String = System.IO.Path.GetFileName(requestPath)

        ' Let IIS resolve the application root to its configured default document.
        ' At this point in the pipeline, the root request may not have session state.
        If String.Equals(Request.Url.AbsolutePath.TrimEnd("/"c), Request.ApplicationPath.TrimEnd("/"c), StringComparison.OrdinalIgnoreCase) Then
            Return
        End If

        If String.Equals(pageName, "Index.aspx", StringComparison.OrdinalIgnoreCase) OrElse
           String.Equals(pageName, "Index", StringComparison.OrdinalIgnoreCase) OrElse
           String.Equals(pageName, "Default.aspx", StringComparison.OrdinalIgnoreCase) OrElse
           String.Equals(pageName, "Default", StringComparison.OrdinalIgnoreCase) OrElse
           IsPublicAsset(requestPath) Then
            Return
        End If

        If Session Is Nothing OrElse Not Object.Equals(Session("Authenticated"), True) Then
            Response.Redirect(Request.ApplicationPath.TrimEnd("/"c) & "/Index", True)
        End If
    End Sub

    Private Function IsPublicAsset(requestPath As String) As Boolean
        If requestPath.StartsWith("~/bundles/", StringComparison.OrdinalIgnoreCase) OrElse
           requestPath.StartsWith("~/Scripts/", StringComparison.OrdinalIgnoreCase) OrElse
           requestPath.StartsWith("~/Content/", StringComparison.OrdinalIgnoreCase) OrElse
           requestPath.StartsWith("~/fonts/", StringComparison.OrdinalIgnoreCase) Then
            Return True
        End If

        Dim fileName As String = System.IO.Path.GetFileName(requestPath)
        If String.Equals(fileName, "WebResource.axd", StringComparison.OrdinalIgnoreCase) OrElse
           String.Equals(fileName, "ScriptResource.axd", StringComparison.OrdinalIgnoreCase) Then
            Return True
        End If

        Dim extension As String = System.IO.Path.GetExtension(requestPath)
        Select Case extension.ToLowerInvariant()
            Case ".css", ".js", ".png", ".jpg", ".jpeg", ".gif", ".svg", ".ico", ".woff", ".woff2", ".ttf", ".eot"
                Return True
            Case Else
                Return False
        End Select
    End Function
End Class
