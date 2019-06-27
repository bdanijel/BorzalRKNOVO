
Partial Class E404
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim PISARNICAConnectionString As String = b.ConnString_PISARNICA
    Dim ImaAdminPrava As Integer = 0
    Dim ImaSpoljniKorisnikPrava As Integer = 0

    Dim godina As String 'godina koja se obradjuje
    Dim IDkorisnika As String 'ID korisnika koji je logovan
    Dim IPkorisnika As String 'sa koje IP adrese je logovan
    Dim knjiga As String 'da li upisujemo novi popis akata, knjigu racuna ili red u delovodniku
    Dim PodOd2 As String

    Private Sub Poruka_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True



    End Sub
End Class
