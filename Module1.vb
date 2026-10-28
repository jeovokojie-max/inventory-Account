Module Module1
    Public Property UserBranch As String
        Get
            Return GetSessionString("UserBranch")
        End Get
        Set(value As String)
            SetSessionString("UserBranch", value)
        End Set
    End Property

    Public Property Custo As String
        Get
            Return GetSessionString("Custo")
        End Get
        Set(value As String)
            SetSessionString("Custo", value)
        End Set
    End Property

    Public Property Drivername As String
        Get
            Return GetSessionString("Drivername")
        End Get
        Set(value As String)
            SetSessionString("Drivername", value)
        End Set
    End Property

    Public Property Invoiceno As String
        Get
            Return GetSessionString("Invoiceno")
        End Get
        Set(value As String)
            SetSessionString("Invoiceno", value)
        End Set
    End Property

    Public Property Totalamt As String
        Get
            Return GetSessionString("Totalamt")
        End Get
        Set(value As String)
            SetSessionString("Totalamt", value)
        End Set
    End Property

    Public Property Salesdate As String
        Get
            Return GetSessionString("Salesdate")
        End Get
        Set(value As String)
            SetSessionString("Salesdate", value)
        End Set
    End Property

    Public Property waybillno As String
        Get
            Return GetSessionString("waybillno")
        End Get
        Set(value As String)
            SetSessionString("waybillno", value)
        End Set
    End Property

    Public Property Username As String
        Get
            Return GetSessionString("Username")
        End Get
        Set(value As String)
            SetSessionString("Username", value)
        End Set
    End Property

    Private Function GetSessionString(key As String) As String
        Dim context As System.Web.HttpContext = System.Web.HttpContext.Current
        If context Is Nothing OrElse context.Session Is Nothing Then Return String.Empty
        Return Convert.ToString(context.Session(key))
    End Function

    Private Sub SetSessionString(key As String, value As String)
        Dim context As System.Web.HttpContext = System.Web.HttpContext.Current
        If context IsNot Nothing AndAlso context.Session IsNot Nothing Then context.Session(key) = value
    End Sub
End Module
