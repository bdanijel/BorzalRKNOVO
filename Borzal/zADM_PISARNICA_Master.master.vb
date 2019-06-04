Imports System.Data
Partial Class zADM_PISARNICA_Master
    Inherits System.Web.UI.MasterPage
    Dim Dani() As String = {"Недеља", "Понедељак", "Уторак", "Среда", "Четвртак", "Петак", "Субота"}
    Dim Mesec() As String = {"јануар", "фебруар", "март", "април", "мај", "јун", "јул", "август", "септембар", "октобар", "новембар", "децембар"}
    Dim DaniL() As String = {"Nedelja", "Ponedeljak", "Utorak", "Sreda", "Četvrtak", "Petak", "Subota"}
    Dim MesecL() As String = {"januar", "februar", "mart", "april", "maj", "jun", "jul", "avgust", "septembar", "oktobar", "novembar", "decembar"}
    Dim DaniE() As String = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
    Dim MesecE() As String = {"January", "February", "March", "April", "May", "Jun", "July", "August", "September", "October", "November", "December"}
    Dim danas As New Date
    Dim Dat As String
    Dim b As New ADM_MM()
    Dim PISARNICAConnectionString As String = b.ConnString_PISARNICA
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True



        '******* KSENIJA LOGOVANJE KORISNIKA ******
        If Not (Page.IsPostBack) Then
            If (Page.User.Identity.IsAuthenticated) Then
                Try

                    If Me.hkorisnikID.Value = "" Then
                        Me.hkorisnikID.Value = b.KoJe_AD(Page.User.Identity.Name.ToString)
                    End If

                    'Iz AD dobijamo kompletne podatke za nalog sa kojim se logovao korisnik

                    Me.SDSlog.SelectCommand = "SELECT ImeCIR, PrezimeCIR, ImePrezime, lokacija, PodOd3, grupa, oj from [dbo].[v_AdresarZaposlenih] where [idenr]='" & Trim(Me.hkorisnikID.Value) & "'"
                    'Ime korisnika
                    Dim dv As DataView = DirectCast(SDSlog.Select(DataSourceSelectArguments.Empty), DataView)
                    For Each drv As DataRowView In dv
                        'Me.lblKorisnikIme.Text = Trim(drv("imeCIR").ToString()) & " " & Trim(drv("PrezimeCIR").ToString())
                        'Me.hKorisnikemail.Value = Trim(drv("email").ToString())
                        Me.hlokacija.Value = Trim(drv("lokacija").ToString())
                        Me.hPodOd3.Value = Trim(drv("PodOd3").ToString())
                        Me.hgrupa.Value = Trim(drv("grupa").ToString())
                        Me.hoj.Value = Trim(drv("oj").ToString())
                        Me.hImePrezime.Value = Trim(drv("ImePrezime").ToString())

                        'ISPIS NA EKRAN
                        Me.lblKorisnikIme.Text = Trim(drv("ImePrezime").ToString())
                        Me.lblPodOd3.Text = Trim(drv("PodOd3").ToString())
                        Me.lblOj.Text = Trim(drv("oj").ToString())
                        Me.lblZaposleniID.Text = hkorisnikID.Value
                        Me.lbllokacija.Text = Trim(drv("lokacija").ToString())
                    Next
                    Me.hKorisnikIP.Value = Request.ServerVariables("remote_addr")
                    Me.hgodina.Value = Date.Today.Year
                    If Me.hPodOd3.Value = "201" Or Me.hPodOd3.Value = "202" Then
                        Me.hPodOd3.Value = "200"
                    End If

                Catch ex As Exception
                    Me.lblKorisnikIme.Text = "neuspela identifikacija korisnika"
                End Try


            Else
                'ovo se koristi samo u testu, jer IIS nije podesen na razvojnoj stanici

                Me.lblKorisnikIme.Text = "IME PREZIME"
                Me.lblPodOd3.Text = "PODOD"
                Me.lblOj.Text = "OJ"
                Me.lbllokacija.Text = "lokacija"


                'podrucno odeljenje - nacelnik
                Me.hkorisnikID.Value = "1040"
                Me.hlokacija.Value = "Beograd"
                Me.lbllokacija.Text = hlokacija.Value
                Me.hPodOd3.Value = "200"
                Me.hgrupa.Value = "1"
                Me.hoj.Value = "25"






                Me.hKorisnikIP.Value = Request.ServerVariables("remote_addr")
                'Me.lblKorisnikIP.Text = hKorisnikIP.Value
                Me.hgodina.Value = Session("P_PO_godina")
                If (Me.hgodina.Value) = "" Then
                    Me.hgodina.Value = Date.Today.Year
                End If


            End If

            'korisnik lokaciju na kojoj radi menja samo odabirom iz ponudjene liste (?!)

            Session("korisnik_ime") = Me.lblKorisnikIme.Text
            Session("korisnik_ID") = Me.hkorisnikID.Value
            Session("lokacija") = Me.hlokacija.Value
            Session("PodOd3") = Me.hPodOd3.Value
            Session("user_email") = Me.hKorisnikemail.Value
            Session("grupa") = Me.hgrupa.Value
            Session("oj") = Me.hoj.Value
            ' ??????
            Session("godina") = Me.hgodina.Value



        End If



        Me.lblKorisnikIme.Text = Session("korisnik_ime")
        Me.hkorisnikID.Value = Session("korisnik_ID")
        Me.hlokacija.Value = Session("lokacija")
        Me.hPodOd3.Value = Session("PodOd3")
        Me.hKorisnikemail.Value = Session("user_email")
        Me.hgrupa.Value = Session("grupa")
        Me.hoj.Value = Session("oj")
        ' ????
        Me.hgodina.Value = Session("godina")


        '******* KSENIJA LOGOVANJE KORISNIKA ******



        If Not Page.IsPostBack Then
            danas = Date.Now
            Dat = Dani(danas.DayOfWeek)
            Me.DanNaziv.InnerHtml = Dat
            'MeniLabele()

        End If

        PostaviMeni()
    End Sub
    Private Sub PostaviMeni()


        Dim Korisnik_ID As String = Session("korisnik_ID")
        Dim ProveraKorisnika As Integer = 0

        'proverava se da li je korisnik admin, ako nije onda mu se čita posao SIGN (potpis) i pravi meni samo sa tim poslom. Ako jeste, ide meni po tekućim poslovima
        ProveraKorisnika = b.ProveraAdminKorisnika(Korisnik_ID)
        If ProveraKorisnika = 1 Then
            Korisnik_ID = Session("korisnik_ID")
        Else
            Korisnik_ID = "SIGN"
        End If
        Dim Meni = DajGlavniMeni(Korisnik_ID)
        Me.mainMenu.InnerHtml = Meni


    End Sub
    Public Function DajGlavniMeni(ByVal korisnik_ID As String) As String
        Dim GlavniMeni As String = ""
        Dim OblastID, Oblast, Ikona, OblastURL As String
        Dim sbGlavniMeni As New StringBuilder
        Dim dsGlavniMeni As New DataSet()
        Dim UpitGlavniMeni As String = "SELECT DISTINCT OblastID, Oblast, OblastURL, Ikona, RedosledOblast, StatusOblast FROM ADM_Oblasti WHERE OblastID IN(SELECT OblastID FROM v_ADM_Veza_Korisnik_Posao WHERE (idenr ='" & korisnik_ID & "')) ORDER BY RedosledOblast"
        dsGlavniMeni = b.DajDS_IzUpita_Lokal(UpitGlavniMeni, b.ConnString_PISARNICA)
        If dsGlavniMeni.Tables.Count > 0 Then
            If dsGlavniMeni.Tables(0).Rows.Count > 0 Then
                For i As Integer = 0 To dsGlavniMeni.Tables(0).Rows.Count - 1

                    OblastID = CInt(dsGlavniMeni.Tables(0).Rows(i)("OblastID"))
                    Oblast = dsGlavniMeni.Tables(0).Rows(i)("Oblast").ToString()
                    OblastURL = dsGlavniMeni.Tables(0).Rows(i)("OblastURL").ToString()
                    Ikona = dsGlavniMeni.Tables(0).Rows(i)("Ikona").ToString()
                    Select Case OblastURL
                        Case <> "#"
                            sbGlavniMeni.Append("<li><a href=""" & OblastURL & """><i class=""" & Ikona & """></i> <span>" & Oblast & "</span></a></li>")
                        Case "#"
                            sbGlavniMeni.Append("<li><a href=""" & OblastURL & """><i class=""" & Ikona & """></i> <span>" & Oblast & "</span></a><ul>")
                            sbGlavniMeni.Append(PostaviPodMeni(OblastID, Session("korisnik_ID")))
                            sbGlavniMeni.Append("</ul></li>")
                    End Select
                Next
            End If
        End If
        GlavniMeni = sbGlavniMeni.ToString()
        Return GlavniMeni
    End Function
    Private Function PostaviPodMeni(ByVal OblastID As String, ByVal ID_AdminKorisnika As String) As String
        Dim PodMeni As String = ""
        Dim UpitMeni As String = "SELECT * FROM v_ADM_Veza_Korisnik_Posao WHERE (OblastID = '" & OblastID & "') AND (StatusPosao = 1) AND idenr = ('" & Session("korisnik_ID") & "') ORDER BY RedosledPosao"
        Dim dsMeni As New DataSet
        Dim sbMeni As New StringBuilder
        Dim PosaoID As String = ""
        Dim Poslovi As String = ""
        Dim PosloviURL As String = ""
        Dim Ikona As String = ""

        dsMeni = b.DajDS_IzUpita_Lokal(UpitMeni, PISARNICAConnectionString)
        If dsMeni.Tables.Count > 0 Then
            If dsMeni.Tables(0).Rows.Count > 0 Then
                For i = 0 To dsMeni.Tables(0).Rows.Count - 1
                    PosaoID = dsMeni.Tables(0).Rows(i).Item("PosaoID").ToString()
                    Poslovi = dsMeni.Tables(0).Rows(i).Item("Posao").ToString()
                    Ikona = dsMeni.Tables(0).Rows(i).Item("Ikona").ToString()
                    PosloviURL = dsMeni.Tables(0).Rows(i).Item("PosaoURL").ToString()

                    sbMeni.Append("<li><a href=""" & PosloviURL & """>" & Poslovi & "</a></li>")
                Next
            End If
        End If
        PodMeni = sbMeni.ToString()
        Return PodMeni
    End Function

End Class

