
Imports System.Data

Partial Class LogIn
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim BORZALConnectionString As String = b.ConnString_BORZAL
    Dim DatumVreme As String = b.srediDatumVreme
    Dim LoginClassHidden As String = "panel panel-body login-form hidden"
    Dim LoginClassVisible As String = "panel panel-body login-form"
    Dim RegisterClassHidden As String = "row hidden"
    Dim RegisterClassVisible As String = "row"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        'Me.UserNameRequired.ToolTip = "Корисничко име је обавезно."
        'Me.PasswordRequired.ToolTip = "Лозинка је обавезна."
        'Me.problemLabel.InnerText = "Ако имате проблема при логовању обратите се Небојши Стаменковићу или Сави Рашковићу на локал 355."
        'Me.porukaHiddenField.Value = "Погрешно корисничко име или лозинка"
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        Me.Nalog.Focus()
    End Sub
    Protected Sub LoginButton_Click(Source As Object, E As EventArgs)

        Me.PorukaUspesno.InnerText = ""
        Me.PorukaNeuspesno.InnerText = ""
        Dim ipadresa As String = b.GetIP4Address
        Dim Browser As String = Request.Browser.Browser
        Dim BrowserVersion As String = Request.Browser.Version
        Dim BrowserMajorVersion As String = Request.Browser.MajorVersion
        Dim MAC As String = b.GetMAC(ipadresa)
        Dim userAgent As String = HttpContext.Current.Request.UserAgent.ToLower()
        Dim IsMobile_V1 As Boolean = b.isMobileBrowser_V1
        Dim IsMobile_V2 As String = b.IsMobileBrowser_V2

        Dim ID_Korisnika As String = ""
        Dim ID_AdminKorisnika = ""
        Dim ID_Korisnik As String = ""

        Dim IdiUProgram As Integer = 0
        Dim Status As Boolean = False

        If Page.IsValid Then

            Dim Nalog As String = Me.Nalog.Value
            Dim pass As String = Me.Lozinka.Value
            Dim datumvreme As String = b.srediDatumVreme
            Dim ID_Session As String = Session.SessionID.ToString
            If Me.Nalog.Value = "" Or Me.Lozinka.Value = "" Then
                Me.PorukaNeuspesno.InnerText = "Корисничко име и лозинка су обавезна поља."
                Exit Sub
            End If
            If Me.Nalog.Value <> "" And Me.Lozinka.Value <> "" Then
                ID_Korisnika = Me.DajIDSpoljnogKorisnika(Trim(Me.Nalog.Value), Trim(Me.Lozinka.Value))
            End If

            If ID_Korisnika = Nothing Then
                ID_Korisnika = "-1"
            End If
            If Trim(ID_Korisnika) = "" Then
                ID_Korisnika = "-1"
            End If


            Select Case ID_Korisnika
                Case Nothing, "-1"
                    Me.PorukaNeuspesno.InnerText = "Погрешно корисничко име или лозинка!"
                    Me.LogPoruke.Visible = True
                Case Else
                    Session.Add("ID_Korisnika", ID_Korisnika)
                    Me.PorukaUspesno.InnerText = "Успешно логовање!"
                    Me.PorukaNeuspesno.InnerText = ""
                    Me.LogPoruke.Visible = True
                    IdiUProgram = 1
                    Status = True
                    PronadjiSpoljnogKorisnika(ID_Korisnika)
                    Response.Redirect(ResolveClientUrl("~/Home.aspx"), True)
            End Select

        End If
    End Sub

    Protected Sub LozinkaMailButton_Click(Source As Object, E As EventArgs)
        Response.Redirect("~/Home.aspx", True)
    End Sub

    Public Sub PronadjiSpoljnogKorisnika(ID_Korisnika As String)
        Dim Upit As String
        Dim ds As New DataSet
        Dim strLogovaniKorisnik As String

        Upit = "SELECT (Ime + ' ' + Prezime) As ImePrezime FROM LISTA_Korisnici WHERE ID_Korisnika ='" & ID_Korisnika & "'"

        ds = b.DajDS_IzUpita_Lokal(Upit, BORZALConnectionString)
        Dim dr As DataRow = ds.Tables(0).Rows(0)
        strLogovaniKorisnik = dr("ImePrezime")

        Session("LogovaniKorisnik") = strLogovaniKorisnik

    End Sub
    Public Function DajIDSpoljnogKorisnika(ByVal Nalog As String, ByVal Lozinka As String) As String
        Dim ds As New DataSet
        Dim ID_Korisnika As String = ""
        Dim Upit As String = "SELECT ID_Korisnika FROM LISTA_Korisnici WHERE (Nalog = '" & Nalog & "') AND (Lozinka = '" & Lozinka & "')"
        ds = b.DajDS_IzUpita_Lokal(Upit, BORZALConnectionString)
        If ds.Tables.Count > 0 Then
            If ds.Tables(0).Rows.Count = 1 Then
                ID_Korisnika = ds.Tables(0).Rows(0).Item("ID_Korisnika")
            Else
                ID_Korisnika = "-1"
            End If
        End If
        Return ID_Korisnika
    End Function
End Class
