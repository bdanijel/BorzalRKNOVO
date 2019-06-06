Imports System.Net.Mail
Partial Class Kontakt
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim BORZALConnectionString As String = b.ConnString_BORZAL
    Dim ImaAdminPrava As Integer = 0
    Dim ImaSpoljniKorisnikPrava As Integer = 0
    Dim InvalidKlasa As String = "text-danger-800"
    Dim ZvezdicaError As String = "<i class=""icon-gear text-semibold text-danger-800 text-size-8 position-left""></i>"
    Dim klasa As String = "class"
    Dim KlasaHiddenRow As String = "row hidden"
    Dim KlasaRow As String = "row"

    Dim InvalidAlertKlasa As String = "alert alert-white alert-arrow-left alert-component border-danger-800 text-danger-800 pt-5 pb-5 text-center"
    Dim ValidAlertKlasa As String = "alert alert-white alert-arrow-left alert-component border-primary-800 text-primary-900 pt-5 pb-5 text-center"

    Dim FormaLevoKlasa As String = "col-md-6"
    Dim FormaSredinaKlasa As String = "col-md-6 col-md-push-3"

    Private Sub Poruka_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True
    End Sub
    Protected Sub btnPoruka_Click(sender As Object, e As EventArgs) Handles btnPoruka.Click
        Dim Mail As New MailMessage
        Mail.Subject = "BorzalRK - poruka"
        Mail.To.Add("lejinad5@gmail.com")
        Mail.From = New MailAddress("b.danijel76@hotmail.com")
        Mail.Body = txtPoruka.Text

        Dim SMTP As New SmtpClient("smtp.live.com") 'server of Outlook, Live and Hotmail accounts

        SMTP.EnableSsl = True
        SMTP.Credentials = New System.Net.NetworkCredential("b.danijel76@hotmail.com", "dado72.dado21")
        SMTP.Port = 587 'port for Microsoft accounts

        If ObaveznaPolja() = False Then
            Me.PorukaInfoNeuspesno.InnerText = "Molimo Vas da napišete poruku pre nego što je pošaljete!"
            SetPorukaNeuspesnoVisible()
            Exit Sub
        End If

        Try
            SMTP.Send(Mail)
            SetPorukaUspesnoVisible()
            Me.PorukaInfoUspesno.InnerHtml = "Poruka uspešno poslata!"
        Catch ex As Exception
            SetPorukaNeuspesnoVisible()
            Me.PorukaInfoNeuspesno.InnerText = "Došlo je do greške prilikom slanja poruke!"
        End Try

    End Sub
#Region "PORUKE"
    Public Sub SetPorukaNeuspesnoInvisible()
        Me.PorukaInfoNeuspesno.InnerText = ""
        Me.rowPorukaNeuspesno.Attributes.Add(klasa, "row hidden")
        Me.rowPorukaNeuspesno.Visible = False
    End Sub
    Public Sub SetPorukaNeuspesnoVisible()
        Me.rowPorukaNeuspesno.Attributes.Add(klasa, "row mt-10")
        Me.rowPorukaNeuspesno.Visible = True
    End Sub
    Public Sub SetPorukaUspesnoInvisible()
        Me.PorukaInfoUspesno.InnerText = ""
        Me.rowPorukaUspesno.Attributes.Add(klasa, "row hidden")
        Me.rowPorukaUspesno.Visible = False
    End Sub
    Public Sub SetPorukaUspesnoVisible()
        Me.rowPorukaUspesno.Attributes.Add(klasa, "row mt-10")
        Me.rowPorukaUspesno.Visible = True
    End Sub
    Public Sub SetPorukaSpisakGresakaInvisible()
        Me.lblPorukaGR.InnerText = ""
        Me.PorukaGR.Attributes.Add(klasa, "row hidden")
        Me.PorukaGR.Visible = False
    End Sub
    Public Sub SetPorukaSpisakGresakaVisible()
        Me.PorukaGR.Attributes.Add(klasa, "row mt-10")
        Me.PorukaGR.Visible = True
    End Sub

#End Region
    Protected Function ObaveznaPolja() As Boolean

        Dim ret As Integer = 0
        Dim rezultat As Boolean = False
        Dim poruka As String = ""

        If Me.txtPoruka.Text = Nothing Then

            Me.ValidTekstPoruka.Attributes.Add(klasa, InvalidKlasa)
            Me.txtPoruka.BorderColor = Drawing.Color.Red
            Me.txtPoruka.ToolTip = "Obavezno polje!"

            ret = ret + 1
            SetPorukaNeuspesnoVisible()

        End If

        Me.lblPorukaGR.InnerHtml = poruka

        If ret = 0 Then
            rezultat = True
        End If
        Return rezultat
    End Function
End Class
