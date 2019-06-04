
Imports System.Data

Partial Class Home
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim BORZALConnectionString As String = b.ConnString_BORZAL
    Dim ImaAdminPrava As Integer = 0


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True

        'PopuniTabeluMB()

    End Sub

    Private Sub PopuniTabeluMB()
        Dim UpitMB As String = ""
        Dim odsMB As New DataSet

        UpitMB = "SELECT rbr, opis,klasifikacionibrojID,klasifikacionibroj FROM vPopisAkata ORDER BY rbr"
        odsMB = b.DajDS_IzUpita_Lokal(UpitMB, BORZALConnectionString)

        Me.gvMB.EmptyDataText = "Без података"
        Me.gvMB.DataBind()

    End Sub
End Class
