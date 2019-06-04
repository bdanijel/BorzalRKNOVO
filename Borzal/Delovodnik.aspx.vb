Imports System.Data
Imports System.Diagnostics
Imports System.IO
Imports System.AppDomain
'Imports word = Microsoft.Office.Interop.Word
Imports System.Drawing.Printing
Imports System.Globalization
Imports Microsoft.Reporting.WebForms
Imports System.Data.SqlClient

Partial Class DELOVODNIK
    Inherits System.Web.UI.Page

    Dim b As New ADM_MM()
    Dim PISARNICAConnectionString As String = b.ConnString_PISARNICA

    'za Word template docx (OMOT SPISA)
    'Dim wdApp As word.Application
    'Dim wdDocs As word.Documents
    'Const sPath As String = "~/Izvestaji/"
    'Const sPath As String = "C:\PISARNICA\PISARNICARZS\Izvestaji\"
    'Od Nataše!
    Dim sPath As String = System.AppDomain.CurrentDomain.BaseDirectory() + "Izvestaji\"
    Dim sFileName As String
    'za Word template docx (OMOT SPISA)


    Dim InvalidKlasa As String = "text-danger-800"
    Dim ZvezdicaError As String = "<i class=""icon-gear text-semibold text-danger-800 text-size-8 position-left""></i>"
    Dim klasa As String = "class"
    Dim KlasaHiddenRow As String = "row hidden"
    Dim KlasaRow As String = "row"

    Dim InvalidAlertKlasa As String = "alert alert-white alert-arrow-left alert-component border-danger-800 text-danger-800 pt-5 pb-5 text-center"
    Dim ValidAlertKlasa As String = "alert alert-white alert-arrow-left alert-component border-primary-800 text-primary-900 pt-5 pb-5 text-center"

    Dim FormaLevoKlasa As String = "col-md-6"
    Dim FormaSredinaKlasa As String = "col-md-6 col-md-push-3"

    Dim ImaAdminPrava As Integer = 0
    Dim ImaPrava As Integer = 0

    '**** KSENIJA *****
    Dim godina As String 'godina koja se obradjuje
    Dim PodOd3 As String
    Dim preuzima As String
    '***** KSENIJA ******

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Page.MaintainScrollPositionOnPostBack = True

        If Session("godina_pretraga") = Nothing Then
            Session("godina_pretraga") = Me.txtGodina.Text.ToString()
            If Session("godina") = Nothing Then
                Session("godina") = Year(Today)
            Else
                Me.txtGodina.Text = Session("godina")
            End If
        Else
            Me.txtGodina.Text = Session("godina_pretraga")
        End If

        'If Session("godina") = Nothing Then
        '    Session("godina") = Me.txtGodina.Text.ToString()
        'Else
        '    Me.txtGodina.Text = Session("godina")
        'End If



        If Session("rbr_pretraga") = Nothing Then
            Session("rbr_pretraga") = Me.txtRbr.Text.ToString()
            btnRazvod.Visible = False
            If Session("rbr") = Nothing Then
                Session("rbr") = Me.txtRbr.Text.ToString()
            Else
                Me.txtRbr.Text = Session("rbr")
            End If
        Else
            Me.txtRbr.Text = Session("rbr_pretraga")
            btnRazvod.Visible = True
        End If

        If Session("podbroj_pretraga") = Nothing Then
            Session("podbroj_pretraga") = Me.txtPodBroj.Text.ToString()
            If Session("podbroj") = Nothing Then
                Session("podbroj") = Me.txtPodBroj.Text.ToString()
            Else
                Me.txtPodBroj.Text = Session("podbroj")
            End If
        Else
            Me.txtPodBroj.Text = Session("podbroj_pretraga")
        End If

        If Session("podod3_pretraga") = Nothing Then
            Session("podod3_pretraga") = Me.txtPodOd3.Text.ToString()
            If Session("PodOd3") = Nothing Or Trim(Session("PodOd3")) = "" Then
                Session("PodOd3") = Me.txtPodOd3.Text.ToString()
            Else
                Me.txtPodOd3.Text = Session("PodOd3")
            End If
        Else
            Me.txtPodOd3.Text = Session("PodOd3_pretraga")
        End If

        'PROMENITI!!!! - SAMO ZA TESTIRANJE koristni se txtKorisnik, posle txtID_Korisnika - hidden textbox
        If Session("korisnik_ID") = Nothing Or Trim(Session("korisnik_ID")) = "" Then
            Session("korisnik_ID") = Me.txtKorisnik.Text.ToString()
            'Session("korisnik_ID") = Me.txtID_Korisnika.Text.ToString()
        Else
            Me.txtKorisnik.Text = Session("korisnik_ID")
            'Me.txtID_Korisnika.Text = Session("korisnik_ID")
        End If


        'Session godina, rbr, podbroj, podod
        'ZA PRENOŠENJE OD SEARCH GRIDA??? NE RADI ZA SADA!!!!
        'If Session("godina") = Nothing Then
        '    Session("godina") = Me.txtGodina.Text.ToString()
        'Else
        '    Me.txtGodina.Text = Session("godina")
        'End If

        'If Session("rbr") = Nothing Then
        '    Session("rbr") = Me.txtGodina.Text.ToString()
        'Else
        '    Me.txtRbr.Text = Session("rbr")
        'End If

        'If Session("podbroj") = Nothing Then
        '    Session("podbroj") = Me.txtPodbroj.Text.ToString()
        'Else
        '    Me.txtPodbroj.Text = Session("podbroj")
        'End If

        'If Session("podod") = Nothing Then
        '    Session("podod") = Me.txtPodOd.Text.ToString()
        'Else
        '    Me.txtPodOd.Text = Session("podod")
        'End If


        ImaPrava = b.ProveraKorisnikPosao(Session("korisnik_ID"), Path.GetFileName(Request.PhysicalPath))

        If ImaPrava = 0 Then
            Response.Redirect(ResolveClientUrl("~/Home.aspx"), True)
        End If



        If Not Page.IsPostBack Then
            'b.DajListuAdminKontaktaPO(tListaAdmin, b.DajPO(Trim(Me.txtMB.Text)))
            PopuniCOMBO()
            SetPorukaSpisakGresakaInvisible()
            If Session("rbr_pretraga") = Nothing Then

            Else
                Me.PodaciDelovodnik(Convert.ToInt32(Me.txtGodina.Text()), Convert.ToInt32(Me.txtRbr.Text()), Convert.ToInt32(Me.txtPodBroj.Text()), Me.txtPodOd3.Text())
                DajKontaktPodatke()
                DajPreuzeoKOPodatke()
                PrikazLinka()
            End If

        End If



    End Sub

#Region "PODACI O AKTU U DELOVODNIKU ZA RAZVOĐENJE"
    Private Sub DajDelovodnik(ByVal godina As String, ByVal rbr As String, ByVal podbroj As String, ByVal PodOd3 As String)
        Dim dsDelovodnik As New DataSet
        Dim UpitDelovodnik As String = ""
        'polja koja su podvučena se ne prikazuju prilikom razvođenja
        Dim KlasifikacioniBrojID, DelovodniBroj, tekst, primedba, posiljaoc, KlasaDokumentaID, korisnik, datumPrijema, datumRazvoda, OrgJedID, iznos, PopisAkata, AktivanPopisAkata, LinkZaDokument, INDLinkZaDokument, preuzeoKO, DatumPreuzeo, preuzeo, namenjeno, smer As String

        Dim sbDelovodnik As New StringBuilder
        'Samo ona polja koja se nalaze u podbroju 1 i koja ostaju dalje pri razvođenju
        UpitDelovodnik = "select  KlasifikacioniBrojID, DelovodniBroj,dbo.ufnSrediDatumPrikaz(datumPrijema) as datumPrijema, KlasaDokumentaID, tekst, PopisAkata, AktivanPopisAkata, korisnik from delovodnik  where (godina = '" & godina & "') and (rbr = '" & rbr & "') and (podbroj = '" & podbroj & "') and (podod3 = '" & PodOd3 & "')"


        dsDelovodnik = b.DajDS_IzUpita_Lokal(UpitDelovodnik, PISARNICAConnectionString)
        'Me.godina.Text = godina
        If dsDelovodnik.Tables.Count > 0 Then
            If dsDelovodnik.Tables(0).Rows.Count > 0 Then


                If dsDelovodnik.Tables(0).Rows(0).Item("KlasifikacioniBrojID").ToString() <> "" Then
                    KlasifikacioniBrojID = dsDelovodnik.Tables(0).Rows(0).Item("KlasifikacioniBrojID").ToString()
                Else
                    KlasifikacioniBrojID = ""
                End If
                Me.ddlKlasifikacioniBrojID.Text = KlasifikacioniBrojID
                Me.lblKlasifikacioniBroj.Text = KlasifikacioniBrojID

                If dsDelovodnik.Tables(0).Rows(0).Item("DelovodniBroj").ToString() <> "" Then
                    DelovodniBroj = dsDelovodnik.Tables(0).Rows(0).Item("DelovodniBroj").ToString()
                Else
                    DelovodniBroj = ""
                End If
                Me.lblDelovodniBroj.Text = DelovodniBroj

                If dsDelovodnik.Tables(0).Rows(0).Item("datumPrijema").ToString() <> "" Then
                    datumPrijema = dsDelovodnik.Tables(0).Rows(0).Item("datumPrijema").ToString()
                Else
                    datumPrijema = ""
                End If
                ' Me.txtDATUMPRIJEMA.Text = b.FormatDatuma_PRIKAZ(datumPrijema)
                Me.txtDATUMPRIJEMA.Text = datumPrijema

                If dsDelovodnik.Tables(0).Rows(0).Item("KlasaDokumentaID").ToString() <> "" Then
                    KlasaDokumentaID = dsDelovodnik.Tables(0).Rows(0).Item("KlasaDokumentaID").ToString()
                Else
                    KlasaDokumentaID = ""
                End If
                Me.ddlKlasaDokumentaID.Text = KlasaDokumentaID

                If dsDelovodnik.Tables(0).Rows(0).Item("tekst").ToString() <> "" Then
                    tekst = dsDelovodnik.Tables(0).Rows(0).Item("tekst").ToString()
                Else
                    tekst = ""
                End If
                Me.txtTekst.Text = tekst

                'If dsDelovodnik.Tables(0).Rows(0).Item("PopisAkata").ToString() <> "" Then
                '    PopisAkata = dsDelovodnik.Tables(0).Rows(0).Item("PopisAkata").ToString()
                'Else
                '    PopisAkata = ""
                'End If
                'Me.chkPopisAkata.Checked = PopisAkata

                'If dsDelovodnik.Tables(0).Rows(0).Item("AktivanPopisAkata").ToString() <> "" Then
                '    AktivanPopisAkata = dsDelovodnik.Tables(0).Rows(0).Item("AktivanPopisAkata").ToString()
                'Else
                '    AktivanPopisAkata = ""
                'End If
                'Me.chkAktivanPopisAkata.Checked = AktivanPopisAkata

                If dsDelovodnik.Tables(0).Rows(0).Item("korisnik").ToString() <> "" Then
                    korisnik = dsDelovodnik.Tables(0).Rows(0).Item("korisnik").ToString()
                Else
                    korisnik = ""
                End If
                Me.txtKorisnik.Text = korisnik

                'If dsDelovodnik.Tables(0).Rows(0).Item("smer").ToString() <> "" Then


                '    Select Case dsDelovodnik.Tables(0).Rows(0).Item("smer").ToString()
                '        Case "ОДНЕТО"
                '            Me.radioSmerOdneto.Checked = True
                '        Case "ПОСЛАТО"
                '            Me.radioSmerPoslato.Checked = True
                '        Case "ПРИМЉЕНО"
                '            Me.radioSmerPrimljeno.Checked = True
                '        Case Else
                '    End Select
                'End If


            End If
        End If
    End Sub


#End Region
#Region "PREUZEO OSOBA"
    Private Sub DajPreuzeoKOPodatke()
        Dim dsPreuzeoKO As New DataSet
        Dim UpitPreuzeoKO As String = ""

        ' UpitKontakt = "Select  ime, prezime, Ime + ' ' + Prezime as ImePrezime, EMAIL, Telefon " _
        '& "FROM v_LISTA_SpoljniKorisnici WHERE (ID_Korisnika = '" & Me.txtID_Korisnika.Text & "')"


        UpitPreuzeoKO = "SELECT ImePrezime, lokacija, direktni from [dbo].[v_AdresarZaposlenih] where [idenr]='" _
        & Me.txtPreuzeoKO.Text & "'"

        dsPreuzeoKO = b.DajDS_IzUpita_Lokal(UpitPreuzeoKO, PISARNICAConnectionString)

        If dsPreuzeoKO.Tables.Count > 0 Then
            If dsPreuzeoKO.Tables(0).Rows.Count > 0 Then
                If Not IsDBNull(dsPreuzeoKO.Tables(0).Rows(0).Item("ImePrezime")) Or dsPreuzeoKO.Tables(0).Rows(0).Item("ImePrezime").ToString() <> "" Then
                    Me.lblPreuzeoKOImePrezime.Text = dsPreuzeoKO.Tables(0).Rows(0).Item("ImePrezime").ToString()
                    Me.PreuzeoKOImePrezime.InnerText = dsPreuzeoKO.Tables(0).Rows(0).Item("ImePrezime").ToString()
                End If
                If Not IsDBNull(dsPreuzeoKO.Tables(0).Rows(0).Item("lokacija")) Or dsPreuzeoKO.Tables(0).Rows(0).Item("lokacija").ToString() <> "" Then
                    Me.lblPreuzeoKOLokacija.Text = dsPreuzeoKO.Tables(0).Rows(0).Item("lokacija").ToString()
                    Me.PreuzeoKOLokacija.InnerText = dsPreuzeoKO.Tables(0).Rows(0).Item("lokacija").ToString()
                End If
                If Not IsDBNull(dsPreuzeoKO.Tables(0).Rows(0).Item("direktni")) Or dsPreuzeoKO.Tables(0).Rows(0).Item("direktni").ToString() <> "" Then
                    Me.lblPreuzeoKODirektni.Text = dsPreuzeoKO.Tables(0).Rows(0).Item("direktni").ToString()
                    Me.PreuzeoKODirektni.InnerText = dsPreuzeoKO.Tables(0).Rows(0).Item("direktni").ToString()
                End If
            End If
        End If
    End Sub
#End Region

#Region "KONTAKT OSOBA"

    Private Sub DajKontaktPodatke()
        Dim dsKontakt As New DataSet
        Dim UpitKontakt As String = ""

        UpitKontakt = "SELECT ImePrezime, lokacija, direktni from [dbo].[v_AdresarZaposlenih] where [idenr]='" _
        & Me.txtKorisnik.Text & "'"

        dsKontakt = b.DajDS_IzUpita_Lokal(UpitKontakt, PISARNICAConnectionString)

        If dsKontakt.Tables.Count > 0 Then
            If dsKontakt.Tables(0).Rows.Count > 0 Then
                If Not IsDBNull(dsKontakt.Tables(0).Rows(0).Item("ImePrezime")) Or dsKontakt.Tables(0).Rows(0).Item("ImePrezime").ToString() <> "" Then
                    Me.txtKontaktOsoba.InnerHtml = dsKontakt.Tables(0).Rows(0).Item("ImePrezime").ToString()
                End If
                If Not IsDBNull(dsKontakt.Tables(0).Rows(0).Item("lokacija")) Or dsKontakt.Tables(0).Rows(0).Item("lokacija").ToString() <> "" Then
                    Me.txtKontaktLokacija.InnerHtml = dsKontakt.Tables(0).Rows(0).Item("lokacija").ToString()
                End If
                If Not IsDBNull(dsKontakt.Tables(0).Rows(0).Item("direktni")) Or dsKontakt.Tables(0).Rows(0).Item("direktni").ToString() <> "" Then
                    Me.txtKontaktTelefon.InnerHtml = dsKontakt.Tables(0).Rows(0).Item("direktni").ToString()
                End If
            End If
        End If
    End Sub


#End Region

#Region "DUGMIĆI"
    Protected Sub btnPotvrdiDELOVODNIK_Click(sender As Object, e As EventArgs)
        SetPorukaUspesnoInvisible()
        SetPorukaNeuspesnoInvisible()
        SetPorukaSpisakGresakaInvisible()
        dajDefaultVrednosti()


        If ObaveznaPolja() = False Then
            Me.PorukaInfoNeuspesno.InnerText = "Молимо Вас да попуните сва обавезна поља."
            SetPorukaNeuspesnoVisible()

            Exit Sub

        End If


        'dajDefaultVrednosti()

        If Validacija() = False Then
            Me.PorukaInfoNeuspesno.InnerText = "Молимо Вас да, на означеним пољима, коригујете грешке."
            SetPorukaNeuspesnoVisible()
            SetPorukaSpisakGresakaVisible()
            Exit Sub
        Else




            If InsertUpdateDELOVODNIK() = False Then
                Me.PorukaInfoNeuspesno.InnerText = "Дошло је до грешке приликом уписа података у базу."
                Exit Sub
            End If


            'If ImaAdminPrava = 0 Then
            '    InsertUpdateKorisnik()
            'End If
            'UpdateIndAkt()
            'UpdateZaradeKraj()
            SetPorukaUspesnoVisible()
            Me.PorukaInfoUspesno.InnerHtml = "Успешно сте унели податке у деловодник!"
            'Me.PorukaInfoUspesno.InnerHtml = "Успешно сте унели податке у деловодник!!!<br><a href=""javascript:window.print()"">Кликните овде уколико желите да одштампате унете податке</a>"
            'Me.PorukaInfoUspesno.InnerHtml = "Успешно сте унели податке у деловодник!"
            '            $("#myHref").on('click', function() {
            '    document.getElementById(".myDiv").style.flexGrow = "5";
            '     window.location = "http://www.google.com";

            '});

            IsprazniKontroleDelovodnika()

        End If




    End Sub
    Protected Sub btnOdustaniLJ_Click(sender As Object, e As EventArgs) Handles btnOdustaniLJ.Click
        Response.Redirect(ResolveClientUrl("~/Delovodnik_Pretraga.aspx"), True)
    End Sub

    Protected Sub UploadButton_Click(sender As Object, e As EventArgs) Handles btnUpload.Click


        If FileUploadDOKUMENT.HasFile Then

            If txtRbr.Text <> "" And txtPodBroj.Text <> "" Then

                Try
                    If FileUploadDOKUMENT.PostedFile.ContentLength < 2048000 Then
                        'filename of fajla koji se uploduje
                        Dim filename As String = Path.GetFileName(FileUploadDOKUMENT.FileName)
                        Dim extension As String
                        extension = Path.GetExtension(filename)
                        'Menja se filename u pod od + godina  + redni broj  + podbroj + extension --> 85201911.ekstenzija
                        filename = txtPodOd3.Text & txtGodina.Text & txtRbr.Text & txtPodBroj.Text & extension

                        'koristi apsolutan put 
                        Dim folderPath As String = Server.MapPath("~/Content/doc/SkeniraniDokumenti/" & txtPodOd3.Text & "/")
                        'Dim folderPathSERVER As String = "www.statsrb.lan/pisarnicarzs/Content/doc/SkeniraniDokumenti/" & txtPodOd3.Text & "/"
                        Dim folderPathLINK As String = "http://www.statsrb.lan/pisarnicarzs/Content/doc/SkeniraniDokumenti/" & txtPodOd3.Text & "/"

                        'Check whether Directory (Folder) exists.
                        If Not (Directory.Exists(folderPath)) Then
                            'If Directory (Folder) does Not exists. Create it.
                            Directory.CreateDirectory(folderPath)
                        End If

                        FileUploadDOKUMENT.SaveAs(folderPath & filename)
                        lblStatusUpload.Text = "Upload status: File uploaded!"
                        txtLinkZaDokument.Text = folderPathLINK & filename
                        chkINDLinkZaDokument.Checked = True
                        SetPorukaSpisakGresakaInvisible()
                        PrikazLinka()
                    Else
                        lblStatusUpload.Text = "Upload status: The file has to be less than 2MB!"
                        SetPorukaSpisakGresakaVisible()
                        lblPorukaGR.InnerText = "Документ је превелик!"
                        chkINDLinkZaDokument.Checked = False
                    End If
                Catch ex As Exception
                    lblStatusUpload.Text = "Upload status: The file could not be uploaded. Error: " + ex.Message
                    SetPorukaSpisakGresakaVisible()
                    lblPorukaGR.InnerText = "Документ се није могао снимити!: " + ex.Message
                    chkINDLinkZaDokument.Checked = False
                End Try
            Else
                lblStatusUpload.Text = "odredi rbr i podbroj prvo!!"
                SetPorukaSpisakGresakaVisible()
                lblPorukaGR.InnerText = "Одреди прво редни број и подброј за овај документ!"
                chkINDLinkZaDokument.Checked = False
            End If
        Else
            lblStatusUpload.Text = "Upload status: nije ništa izabrano!!"
            SetPorukaSpisakGresakaVisible()
            lblPorukaGR.InnerText = "Документ није изабран!"
            chkINDLinkZaDokument.Checked = False
        End If

    End Sub

    Protected Sub Razvod_Click(sender As Object, e As EventArgs) Handles btnRazvod.Click


        Dim UpitSledeciPodBroj As String = ""
        Dim SledeciPodBroj As String = Nothing
        Dim dsSledeciPodBroj As New DataSet

        UpitSledeciPodBroj = "SELECT MAX(podbroj)+1 as MaxPodbroj from delovodnik where PodOd3 = '" & Me.txtPodOd3.Text & "' and godina = " & Me.txtGodina.Text & " and rbr = " & Me.txtRbr.Text
        dsSledeciPodBroj = b.DajDS_IzUpita_Lokal(UpitSledeciPodBroj, PISARNICAConnectionString)

        If dsSledeciPodBroj.Tables.Count > 0 Then
            If dsSledeciPodBroj.Tables(0).Rows.Count > 0 Then
                For Each row As DataRow In dsSledeciPodBroj.Tables(0).Rows
                    SledeciPodBroj = dsSledeciPodBroj.Tables(0).Rows(0).Item("MaxPodBroj").ToString()
                Next
            End If
        End If

        If SledeciPodBroj = Nothing Then
            SledeciPodBroj = 1
        End If

        txtPodBroj.Text = SledeciPodBroj

        DodeliDelovodniBroj()




        'Me.txtTekst.Text = ""
        Me.txtPrimedba.Text = ""
        Me.txtPosiljaoc.Text = ""
        'Me.ddlKlasaDokumentaID.SelectedIndex = "0"
        'Me.txtKorisnik.Text = ""
        'Me.txtDATUMPRIJEMA.Text = ""
        Me.txtDatumRazvoda.Text = ""
        Me.ddlOrgJedID.SelectedIndex = "0"
        Me.lblOrgJedNaziv.Text = ""
        Me.txtIznos.Text = ""
        Me.chkPopisAkata.Checked = False
        Me.chkAktivanPopisAkata.Checked = False
        Me.txtLinkZaDokument.Text = ""
        Me.chkINDLinkZaDokument.Checked = False
        Me.txtPreuzeoKO.Text = ""
        Me.txtDatumPreuzeo.Text = ""
        Me.chkPreuzeo.Checked = False
        Me.radioSmerPrimljeno.Checked = False
        Me.radioSmerOdneto.Checked = False
        Me.radioSmerPoslato.Checked = False
        Me.ddlNamenjeno.SelectedIndex = "0"
        Me.lblNamenjenoImePrezime.Text = ""
        'Me.txtPodOd3.Text = ""


        lblKlasifikacioniBroj.Enabled = False
        ddlKlasaDokumentaID.Enabled = False
        txtDATUMPRIJEMA.Enabled = False
        ddlKlasifikacioniBrojID.Enabled = False
        txtRbr.Enabled = False
        btnRazvod.Visible = False


    End Sub
    Protected Sub Reset_Click(sender As Object, e As EventArgs) Handles btnReset.Click

        IsprazniKontroleDelovodnika()

    End Sub

    Protected Sub DownloadButton_Click(sender As Object, e As EventArgs) Handles btnDownload.Click

        'Dim sPath As String = System.AppDomain.CurrentDomain.BaseDirectory()

        'C:\PISARNICA\PISARNICARZS\Content\doc\SkeniraniDokumenti\200\2002019221.JPG
        'C:\EPZ\PisarnicaRZS\Content\doc\SkeniraniDokumenti\805\805201911.jpg
        '\\INTRAWEB\pisarnicaRZS$\Contentdoc\SkeniraniDokumenti\805\805201921.jpg


        'If Me.txtLinkZaDokument.Text <> Nothing Then
        '    dokument = Me.txtLinkZaDokument.Text
        'End If






        Dim dokument = txtLinkZaDokument.Text
        'Dim dokument As String = txtLinkZaDokument.Text.ToString()

        'Dim dokument As String = “\\INTRAWEB\pisarnicaRZS$\Contentdoc\SkeniraniDokumenti\805\805201921.jpg“
        'Dim dokument As String = “http://www.statsrb.lan/pisarnicarzs/Content/doc/SkeniraniDokumenti/805/805201921.jpg“


        'My.Computer.Network.DownloadFile("http://www.statsrb.lan/pisarnicarzs/Content/doc/SkeniraniDokumenti/805/805201921.jpg")


        'Process.Start(url)

        If dokument <> "" And dokument <> "NULL" Then

            Try
                'Process.Start("http://www.statsrb.lan/pisarnicarzs/Content/doc/SkeniraniDokumenti/805/805201921.jpg")

                Dim p As New System.Diagnostics.Process
                Dim s As New System.Diagnostics.ProcessStartInfo(dokument)
                s.UseShellExecute = True
                s.WindowStyle = ProcessWindowStyle.Normal
                p.StartInfo = s
                p.Start()

            Catch ex As Exception
                lblStatusUpload.Text = ex.ToString()
            End Try
        Else

            'lblStatusUpload.Text = "Нема линк за приказ"
            'SetPorukaSpisakGresakaVisible()
            'lblPorukaGR.InnerText = "Нема линк за приказ"
        End If


        'Dim strRequest As String = Request.QueryString("file")
        'Dim strRequest As String = Request.QueryString("http://www.statsrb.lan/pisarnicarzs/Content/doc/SkeniraniDokumenti/805/805201921.jpg")
        ''If strRequest <> "" Then

        'Try
        '        Dim path As String = Server.MapPath(strRequest)
        '        Dim file As System.IO.FileInfo = New System.IO.FileInfo(path)
        '        If file.Exists Then
        '            Response.Clear()
        '            Response.AddHeader("Content-Disposition", "attachment; filename=" & file.Name)
        '            Response.AddHeader("Content-Length", file.Length.ToString())
        '            Response.ContentType = "application/octet-stream"
        '            Response.WriteFile(file.FullName)
        '            Response.End()
        '        Else
        '            Response.Write("This file does not exist.")
        '        End If
        '    ' Else
        '    ' Response.Write("Click link to download.")
        '    ' End If
        'Catch ex As Exception
        'lblStatusUpload.Text = ex.ToString()
        'End Try

    End Sub

    Sub PrikazLinka()
        If Me.txtLinkZaDokument.Text <> "" Or Me.txtLinkZaDokument.Text <> Nothing Then
            Dim sbGlavniMeni As New StringBuilder
            sbGlavniMeni.Append("<li><a href = """ & Me.txtLinkZaDokument.Text.ToString() & """ target=""_blank""></i>ПРИКАЖИ ПРИЛОГ</a></li>")
            Me.linkPrikaz.InnerHtml = sbGlavniMeni.ToString()
        End If
    End Sub

#End Region

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

#Region "COMBO BOX, TEXTCHANGED"

    '***** COMBO BOX *********************************************************************
    Private Sub PopuniCOMBO()

        Dim UpitKlasifikacioniBroj As String = "SELECT KlasifikacioniBrojID, KlasifikacioniBroj FROM v_SIF_COMBO_KLASIFIKACIONIBROJ ORDER BY KlasifikacioniBroj"
        PopuniDDL(ddlKlasifikacioniBrojID, UpitKlasifikacioniBroj, "KlasifikacioniBroj", "KlasifikacioniBrojID")
        ddlKlasifikacioniBrojID.Items.Insert(0, New ListItem("- - Изаберите класификацију - -", "0"))

        Dim UpitOrgJed As String = "SELECT OrgJedID,NazOrgJed FROM v_SIF_COMBO_ORGJED ORDER BY NazOrgJed"
        PopuniDDL(ddlOrgJedID, UpitOrgJed, "NazOrgJed", "OrgJedID")
        ddlOrgJedID.Items.Insert(0, New ListItem("- - Изаберите организациону јединицу - -", "0"))

        Dim UpitKlasa As String = "SELECT KLASADOKUMENTAID,NAZIVKLASADOKUMENTA FROM v_SIF_COMBO_KLASADOKUMENTA ORDER BY NAZIVKLASADOKUMENTA"
        PopuniDDL(ddlKlasaDokumentaID, UpitKlasa, "NAZIVKLASADOKUMENTA", "KLASADOKUMENTAID")
        ddlKlasaDokumentaID.Items.Insert(0, New ListItem("- - Изаберите класу документа - -", "0"))

        Dim UpitNamenjeno As String = "SELECT IDENR,IMEPREZIME FROM v_SIF_COMBO_NAMENJENO ORDER BY IMEPREZIME"
        PopuniDDL(ddlNamenjeno, UpitNamenjeno, "IMEPREZIME", "IDENR")
        ddlNamenjeno.Items.Insert(0, New ListItem("- - Изаберите коме је намењено - -", "0"))



    End Sub

    Protected Sub ddlKlasifikacioniBrojID_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlKlasifikacioniBrojID.SelectedIndexChanged
        Me.lblKlasifikacioniBroj.Text = ddlKlasifikacioniBrojID.SelectedValue.Trim()
        'Ako se upiše direktno onda ide preko txtKlasifikacioniBroj - textChanged
        DodeliDelovodniBroj()
    End Sub

    Protected Sub ddlOrgJedID_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlOrgJedID.SelectedIndexChanged
        Me.lblOrgJedNaziv.Text = ddlOrgJedID.SelectedValue.Trim()
    End Sub

    Protected Sub ddlKlasaDokumentaID_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlKlasaDokumentaID.SelectedIndexChanged
        ' Me.lblKlasaDokumentaNaziv.Text = ddlKlasaDokumentaID.SelectedValue.Trim()
    End Sub
    Protected Sub ddlNamenjeno_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlNamenjeno.SelectedIndexChanged
        Me.lblNamenjenoImePrezime.Text = ddlNamenjeno.SelectedValue.Trim()
    End Sub


    Private Sub PopuniDDL(ddl As DropDownList, Upit As String, Tekst As String, Sifra As String)
        Dim dsDDL As DataSet = b.DajDS_IzUpita_Lokal(Upit, PISARNICAConnectionString)
        ddl.DataSource = dsDDL
        ddl.DataTextField = Tekst
        ddl.DataValueField = Sifra
        ddl.DataBind()
    End Sub

    Protected Sub txtrbr_TextChanged(sender As Object, e As EventArgs) Handles txtRbr.TextChanged

        ' AKO NE RADI BRIŠI, radi bez ovoga
        Session("rbr") = Nothing
        Session("rbr_pretraga") = Nothing
        Session("podbroj") = Nothing
        Session("podbroj_pretraga") = Nothing



        Dim UpitSledeciRbr As String = ""
        Dim UpitSledeciPodBroj As String = ""
        Dim SledeciRbr As String = Nothing
        Dim SledeciPodBroj As String = Nothing
        Dim dsSledeciRbr As New DataSet
        Dim dsSledeciPodBroj As New DataSet




        If Me.txtRbr.Text = "0" Or Me.txtRbr.Text = "" Then

            IsprazniKontroleDelovodnika()
            'Session("Rbr") = 0
            'Session("Rbr_pretraga") = 0

            'Ako je korisnik uneo 0 za rbr se uzima sledeći slobodan broj MAX+1
            'Ne bi trebalo da se proverava ako nema rednih brojeva jer na početku godine treba da se postave popisi akata
            UpitSledeciRbr = "SELECT max(rbr)+1 as MaxRbr from delovodnik where PodOd3 = '" _
                & Me.txtPodOd3.Text & "' and godina = " & Me.txtGodina.Text

            dsSledeciRbr = b.DajDS_IzUpita_Lokal(UpitSledeciRbr, PISARNICAConnectionString)
            'briši poruku ako je bila jer je korisnik stavio 0 odnosno sledeći slobodan broj
            Me.ValidRbrPoruka.Attributes("class") = "validation-valid-label"
            Me.ValidRbrPoruka.InnerText = "Узет је следећи слободан број"
            If dsSledeciRbr.Tables.Count > 0 Then
                If dsSledeciRbr.Tables(0).Rows.Count > 0 Then
                    For Each row As DataRow In dsSledeciRbr.Tables(0).Rows
                        SledeciRbr = dsSledeciRbr.Tables(0).Rows(0).Item("MaxRbr").ToString()
                    Next
                End If
            End If



            If SledeciRbr = Nothing Then
                Me.ValidRbrPoruka.Attributes("class") = "validation-error-label"
                Me.ValidRbrPoruka.InnerText = "Треба поставити пописе аката за ову годину!"
                SledeciRbr = 1
            End If

            Me.txtRbr.Text = SledeciRbr
            'Session("rbr") = SledeciRbr
            'Session("rbr_pretraga") = SledeciRbr

        Else
            If ProveraPostojanjaZapisaDELOVODNIK(Convert.ToInt32(Me.txtGodina.Text), Convert.ToInt32(Me.txtRbr.Text), 1, Me.txtPodOd3.Text) = 1 Then
                'Ako postoje podaci u bazi za zadati kriterijum, treba ih iščitati iz baze

                Try
                    DajDelovodnik(Me.txtGodina.Text, Me.txtRbr.Text, 1, Me.txtPodOd3.Text)
                Catch ex As Exception
                    PorukaGR.InnerText = "PodaciDelovodnik nije uspeo: " & ex.Message.ToString()
                End Try
                Me.ValidRbrPoruka.Attributes("class") = "validation-valid-label"
                Me.ValidRbrPoruka.InnerText = "Постоји акт са тим редним бројем!"
            Else
                IsprazniKontroleDelovodnika()
                Me.ValidRbrPoruka.Attributes("class") = "validation-error-label"
                Me.ValidRbrPoruka.InnerText = "Не постоји акт са тим редним бројем!"
                'Me.txtRbr.Text = ""
            End If
        End If
        'Nezavisno od rbr, ako je došlo do promene PodBroj treba da bude sledeći
        UpitSledeciPodBroj = "SELECT MAX(podbroj)+1 as MaxPodbroj from delovodnik where PodOd3 = '" & Me.txtPodOd3.Text & "' and godina = " & Me.txtGodina.Text & " and rbr = " & Me.txtRbr.Text

        dsSledeciPodBroj = b.DajDS_IzUpita_Lokal(UpitSledeciPodBroj, PISARNICAConnectionString)

        If dsSledeciPodBroj.Tables.Count > 0 Then
            If dsSledeciPodBroj.Tables(0).Rows.Count > 0 Then
                For Each row As DataRow In dsSledeciPodBroj.Tables(0).Rows
                    SledeciPodBroj = dsSledeciPodBroj.Tables(0).Rows(0).Item("MaxPodBroj").ToString()
                Next
            End If
        End If

        If SledeciPodBroj = Nothing Then
            SledeciPodBroj = 1
        End If
        txtPodBroj.Text = SledeciPodBroj
        DodeliDelovodniBroj()

        'Session("PodBroj") = SledeciPodBroj
        'Session("PodBroj_pretraga") = SledeciPodBroj

    End Sub

    Protected Sub ddlKlasifikacioniBrojID_TextChanged(sender As Object, e As EventArgs) Handles ddlKlasifikacioniBrojID.TextChanged
        DodeliDelovodniBroj()
    End Sub

    'Protected Sub INDSED01_CheckedChanged(sender As Object, e As EventArgs) Handles radioSmerOdneto.CheckedChanged, radioSmerPoslato.CheckedChanged, radioSmerPrimljeno.CheckedChanged
    '    If radioSmerOdneto.Checked = True Then Me.txtSmer.text = "ОДНЕТО"
    '    If radioSmerPoslato.Checked = True Then Me.txtSmer.text = "ПОСЛАТО"
    '    If radioSmerPrimljeno.Checked = True Then Me.txtSmer.text = "ПРИМЉЕНО"
    'End Sub

    'Protected Sub chkPopisAkata_CheckedChanged(sender As Object, e As EventArgs) Handles chkPopisAkata.CheckedChanged
    '    Dim preuzeo As String
    '    preuzeo = Me.chkAktivanPopisAkata.Checked
    '    lblPoruka1.Text = "chkAktivanPopisAkata.checked: " & preuzeo
    '    lblPoruka2.Text = "chkPopisAkata.text: " & Me.chkPopisAkata.Text

    '    'If chkPopisAkata.Checked = True Then
    '    '    Me.txtPopisAkata.text = "1"
    '    'Else
    '    '    Me.txtPopisAkata.text = "0"
    '    'End If
    'End Sub


    'Protected Sub txtDATREG_TextChanged(sender As Object, e As EventArgs) Handles txtDATREG.TextChanged
    '    Dim VRPROMENE As String = Trim(Me.txtVRPROMENE.Text())
    '    If VRPROMENE = "1" OrElse VRPROMENE = "2" OrElse VRPROMENE = "11" OrElse VRPROMENE = "22" Then
    '        If Trim(Me.txtDATREG.Text()) = "" Then
    '            Me.ValidDATREGPoruka.InnerText = "Изаберите датум почетка активности!"
    '        Else
    '            Me.ValidDATREGPoruka.InnerText = ""

    '            If Convert.ToInt32(b.FormatDatuma_BAZA(Me.txtDATREG.Text())) > Convert.ToInt32(GetDatum()) Then
    '                Me.ValidDATREGPoruka.InnerText = "Датум почетка активности не може бити већи од тренутног!"
    '            ElseIf Trim(txtDATPAKT.Text()) <> "" Then
    '                If Convert.ToInt32(b.FormatDatuma_BAZA(Me.txtDATREG.Text())) > Convert.ToInt32(b.FormatDatuma_BAZA(Me.txtDATPAKT.Text())) Then
    '                    'Me.ValidDATREGPoruka.InnerText = "Датум почетка активности не може бити већи од датума престанка активности!"
    '                Else
    '                    Me.ValidDATREGPoruka.InnerText = ""
    '                End If
    '            End If
    '        End If
    '    End If

    '    '*** Valid DATREG - VRPROMENE 9, 99 **********************************************************

    '    If VRPROMENE = "9" OrElse VRPROMENE = "99" Then
    '        If Trim(Me.txtDATREG.Text()) = "" Then
    '            Me.ValidDATREGPoruka.InnerText = "Датум почетка активности мора бити уписан!"
    '        Else
    '            Me.ValidDATREGPoruka.InnerText = ""

    '            If Convert.ToInt32(b.FormatDatuma_BAZA(Me.txtDATREG.Text())) > Convert.ToInt32(GetDatum()) Then
    '                Me.ValidDATREGPoruka.InnerText = "Датум почетка активности не може бити већи од тренутног!"
    '            ElseIf Trim(Me.txtDATPAKT.Text()) <> "" Then
    '                If Convert.ToInt32(b.FormatDatuma_BAZA(Me.txtDATREG.Text())) > Convert.ToInt32(b.FormatDatuma_BAZA(Me.txtDATPAKT.Text())) Then
    '                    Me.ValidDATREG.Attributes.Add(klasa, InvalidKlasa)
    '                    'Me.ValidDATREGPoruka.InnerText = "Датум почетка активности не може бити већи од датума гашења!"
    '                Else
    '                    Me.ValidDATREG.Attributes.Remove(klasa)
    '                    Me.ValidDATREGPoruka.InnerText = ""
    '                End If
    '            End If
    '        End If
    '    End If
    'End Sub
#End Region




#Region "SELECT"
    Protected Sub PodaciDelovodnik(ByVal godina As Integer, ByVal rbr As Integer, ByVal podbroj As Integer, ByVal podod3 As String)
        Dim UpitDelovodnik As String = ""
        Dim dsDelovodnik As New DataSet

        Dim KlasifikacioniBrojID, DelovodniBroj, tekst, primedba, posiljaoc, KlasaDokumentaID, korisnik, datumPrijema, datumRazvoda, OrgJedID, iznos, PopisAkata, AktivanPopisAkata, LinkZaDokument, INDLinkZaDokument, preuzeoKO, DatumPreuzeo, preuzeo, smer, namenjeno As String
        UpitDelovodnik = "select  KlasifikacioniBrojID, DelovodniBroj, tekst, primedba, posiljaoc, KlasaDokumentaID, korisnik, dbo.ufnSrediDatumPrikaz(datumPrijema) as datumPrijema, dbo.ufnSrediDatumPrikaz(datumRazvoda) as datumRazvoda,OrgJedID, iznos, PopisAkata, AktivanPopisAkata,LinkZaDokument,INDLinkZaDokument,preuzeoKO, dbo.ufnSrediDatumPrikaz(DatumPreuzeo) as DatumPreuzeo, preuzeo, smer, namenjeno from delovodnik  where (godina = '" & godina & "') and (rbr = '" & rbr & "') and (podbroj = '" & podbroj & "') and (podod3 = '" & podod3 & "')"

        dsDelovodnik = b.DajDS_IzUpita_Lokal(UpitDelovodnik, PISARNICAConnectionString)


        If dsDelovodnik.Tables.Count > 0 Then
            If dsDelovodnik.Tables(0).Rows.Count > 0 Then
                For Each row As DataRow In dsDelovodnik.Tables(0).Rows





                    ''KlasifikacioniBrojID

                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("KlasifikacioniBrojID")) Or dsDelovodnik.Tables(0).Rows(0).Item("KlasifikacioniBrojID").ToString() <> "" Then
                        KlasifikacioniBrojID = dsDelovodnik.Tables(0).Rows(0).Item("KlasifikacioniBrojID").ToString()
                    Else
                        KlasifikacioniBrojID = ""
                    End If
                    Me.ddlKlasifikacioniBrojID.Text = KlasifikacioniBrojID
                    Me.lblKlasifikacioniBroj.Text = KlasifikacioniBrojID


                    ''DelovodniBroj



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("DelovodniBroj")) Or dsDelovodnik.Tables(0).Rows(0).Item("DelovodniBroj").ToString() <> "" Then
                        DelovodniBroj = dsDelovodnik.Tables(0).Rows(0).Item("DelovodniBroj").ToString()
                    Else
                        DelovodniBroj = ""
                    End If
                    Me.lblDelovodniBroj.Text = DelovodniBroj



                    ''tekst



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("tekst")) Or dsDelovodnik.Tables(0).Rows(0).Item("tekst").ToString() <> "" Then
                        tekst = dsDelovodnik.Tables(0).Rows(0).Item("tekst").ToString()
                    Else
                        tekst = ""
                    End If
                    Me.txtTekst.Text = tekst



                    ''primedba



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("primedba")) Or dsDelovodnik.Tables(0).Rows(0).Item("primedba").ToString() <> "" Then
                        primedba = dsDelovodnik.Tables(0).Rows(0).Item("primedba").ToString()
                    Else
                        primedba = ""
                    End If
                    Me.txtPrimedba.Text = primedba



                    ''posiljaoc



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("posiljaoc")) Or dsDelovodnik.Tables(0).Rows(0).Item("posiljaoc").ToString() <> "" Then
                        posiljaoc = dsDelovodnik.Tables(0).Rows(0).Item("posiljaoc").ToString()
                    Else
                        posiljaoc = ""
                    End If
                    Me.txtPosiljaoc.Text = posiljaoc


                    ''klasa



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("KlasaDokumentaID")) Or dsDelovodnik.Tables(0).Rows(0).Item("KlasaDokumentaID").ToString() <> "" Then
                        KlasaDokumentaID = dsDelovodnik.Tables(0).Rows(0).Item("KlasaDokumentaID").ToString()
                    Else
                        KlasaDokumentaID = ""
                    End If
                    Me.ddlKlasaDokumentaID.Text = KlasaDokumentaID


                    ''korisnik



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("korisnik")) Or dsDelovodnik.Tables(0).Rows(0).Item("korisnik").ToString() <> "" Then
                        korisnik = dsDelovodnik.Tables(0).Rows(0).Item("korisnik").ToString()
                    Else
                        korisnik = ""
                    End If
                    Me.txtKorisnik.Text = korisnik


                    ''datumPrijema



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("datumPrijema")) Or dsDelovodnik.Tables(0).Rows(0).Item("datumPrijema").ToString() <> "" Then
                        datumPrijema = dsDelovodnik.Tables(0).Rows(0).Item("datumPrijema").ToString()
                    Else
                        datumPrijema = ""
                    End If
                    Me.txtDATUMPRIJEMA.Text = datumPrijema


                    ''datumRazvoda



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("datumRazvoda")) Or dsDelovodnik.Tables(0).Rows(0).Item("datumRazvoda").ToString() <> "" Then
                        datumRazvoda = dsDelovodnik.Tables(0).Rows(0).Item("datumRazvoda").ToString()
                    Else
                        datumRazvoda = ""
                    End If
                    Me.txtDatumRazvoda.Text = datumRazvoda


                    ''OrgJedID



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("OrgJedID")) Or dsDelovodnik.Tables(0).Rows(0).Item("OrgJedID").ToString() <> "" Then
                        OrgJedID = dsDelovodnik.Tables(0).Rows(0).Item("OrgJedID").ToString()
                    Else
                        OrgJedID = ""
                    End If
                    Me.ddlOrgJedID.Text = OrgJedID


                    ''iznos



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("iznos")) Or dsDelovodnik.Tables(0).Rows(0).Item("iznos").ToString() <> "" Then
                        iznos = dsDelovodnik.Tables(0).Rows(0).Item("iznos").ToString()
                    Else
                        iznos = ""
                    End If
                    Me.txtIznos.Text = iznos


                    ''PopisAkata



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("PopisAkata")) Or dsDelovodnik.Tables(0).Rows(0).Item("PopisAkata").ToString() <> "" Then
                        PopisAkata = dsDelovodnik.Tables(0).Rows(0).Item("PopisAkata").ToString()
                    Else
                        PopisAkata = 0
                    End If
                    Me.chkPopisAkata.Checked = PopisAkata


                    ''AktivanPopisAkata



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("AktivanPopisAkata")) Or dsDelovodnik.Tables(0).Rows(0).Item("AktivanPopisAkata").ToString() <> "" Then
                        AktivanPopisAkata = dsDelovodnik.Tables(0).Rows(0).Item("AktivanPopisAkata").ToString()
                    Else
                        AktivanPopisAkata = 0
                    End If
                    Me.chkAktivanPopisAkata.Checked = AktivanPopisAkata


                    ''LinkZaDokument



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("LinkZaDokument")) Or dsDelovodnik.Tables(0).Rows(0).Item("LinkZaDokument").ToString() <> "" Then
                        LinkZaDokument = dsDelovodnik.Tables(0).Rows(0).Item("LinkZaDokument").ToString()
                    Else
                        LinkZaDokument = ""
                    End If
                    Me.txtLinkZaDokument.Text = LinkZaDokument


                    ''INDLinkZaDokument



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("INDLinkZaDokument")) Or dsDelovodnik.Tables(0).Rows(0).Item("INDLinkZaDokument").ToString() <> "" Then
                        INDLinkZaDokument = dsDelovodnik.Tables(0).Rows(0).Item("INDLinkZaDokument").ToString()
                        Me.lblINDLinkZaDokument.InnerText = "Документ је сачуван"
                    Else
                        INDLinkZaDokument = 0
                    End If
                    Me.chkINDLinkZaDokument.Checked = INDLinkZaDokument



                    ''preuzeoKO



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("preuzeoKO")) Or dsDelovodnik.Tables(0).Rows(0).Item("preuzeoKO").ToString() <> "" Then
                        preuzeoKO = dsDelovodnik.Tables(0).Rows(0).Item("preuzeoKO").ToString()
                    Else
                        preuzeoKO = ""
                    End If
                    Me.txtPreuzeoKO.Text = preuzeoKO


                    ''preuzeoDATUM



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("DatumPreuzeo")) Or dsDelovodnik.Tables(0).Rows(0).Item("DatumPreuzeo").ToString() <> "" Then
                        DatumPreuzeo = dsDelovodnik.Tables(0).Rows(0).Item("DatumPreuzeo").ToString()
                    Else
                        DatumPreuzeo = ""
                    End If
                    Me.txtDatumPreuzeo.Text = DatumPreuzeo
                    'za prikaz
                    Me.DatumPreuzeo.InnerText = DatumPreuzeo

                    ''preuzeo



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("preuzeo")) Or dsDelovodnik.Tables(0).Rows(0).Item("preuzeo").ToString() <> "" Then
                        preuzeo = dsDelovodnik.Tables(0).Rows(0).Item("preuzeo").ToString()
                    Else
                        preuzeo = 0
                        'Me.lblPreuzeo.Text = "Документ није преузет"
                    End If
                    Me.chkPreuzeo.Checked = preuzeo



                    ''namenjeno



                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("namenjeno")) Or dsDelovodnik.Tables(0).Rows(0).Item("namenjeno").ToString() <> "" Then
                        namenjeno = dsDelovodnik.Tables(0).Rows(0).Item("namenjeno").ToString()
                    Else
                        namenjeno = ""
                    End If
                    Me.ddlNamenjeno.Text = namenjeno




                    ''smer

                    If Not IsDBNull(dsDelovodnik.Tables(0).Rows(0).Item("smer")) Or dsDelovodnik.Tables(0).Rows(0).Item("smer").ToString() <> "" Then
                        Select Case dsDelovodnik.Tables(0).Rows(0).Item("smer").ToString()
                            Case "ОДНЕТО"
                                Me.radioSmerOdneto.Checked = True
                            Case "ПОСЛАТО"
                                Me.radioSmerPoslato.Checked = True
                            Case "ПРИМЉЕНО"
                                Me.radioSmerPrimljeno.Checked = True
                            Case Else
                        End Select
                    Else
                        Me.radioSmerPrimljeno.Checked = True
                    End If



                Next
            End If
        End If
    End Sub


#End Region

#Region "INSERT/UPDATE"



    Protected Function InsertUpdateDELOVODNIK() As Boolean

        Dim UpitInsertUpdateDELOVODNIK As String = ""
        Dim smer As String = ""
        Dim DatumPrijema, DatumRazvoda, DatumPreuzeo, PreuzeoKO As String
        Dim PopisAkata, AktivanPopisAkata, Preuzeo, INDLinkZaDokument As String


        'DATUMI
        If Me.txtDATUMPRIJEMA.Text <> "" Then
            DatumPrijema = "'" & b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMA.Text())) & "'"
        Else
            DatumPrijema = "NULL"
        End If

        If Me.txtDatumRazvoda.Text <> "" Then
            DatumRazvoda = "'" & b.DajDatumIzStringa(Trim(Me.txtDatumRazvoda.Text())) & "'"
        Else
            DatumRazvoda = "NULL"
        End If

        If Me.txtDatumPreuzeo.Text <> "" Then
            DatumPreuzeo = "'" & b.DajDatumIzStringa(Trim(Me.txtDatumPreuzeo.Text())) & "'"
        Else
            DatumPreuzeo = "NULL"
        End If

        'CHECKBOXOVI
        If chkAktivanPopisAkata.Checked = True Then
            AktivanPopisAkata = 1
        Else
            AktivanPopisAkata = 0
        End If

        If chkPopisAkata.Checked = True Then
            PopisAkata = 1
        Else
            PopisAkata = 0
        End If

        If chkPreuzeo.Checked = True Then
            Preuzeo = 1
        Else
            Preuzeo = 0
        End If

        If chkINDLinkZaDokument.Checked = True Then
            INDLinkZaDokument = 1
        Else
            INDLinkZaDokument = 0
        End If



        'RADIO BUTTON
        If Me.radioSmerOdneto.Checked = True Then smer = "ОДНЕТО"
        If Me.radioSmerPoslato.Checked = True Then smer = "ПОСЛАТО"
        If Me.radioSmerPrimljeno.Checked = True Then smer = "ПРИМЉЕНО"

        'null
        If txtPreuzeoKO.Text = "" Then
            PreuzeoKO = ""
        Else
            PreuzeoKO = txtPreuzeoKO.Text
        End If


        If ProveraPostojanjaZapisaDELOVODNIK(Me.txtGodina.Text, Me.txtRbr.Text, Me.txtPodBroj.Text, Me.txtPodOd3.Text) = 1 Then


            UpitInsertUpdateDELOVODNIK = "UPDATE DELOVODNIK " _
& " Set KlasifikacioniBrojID = " & "N'" & Me.ddlKlasifikacioniBrojID.Text & "'," _
& "DelovodniBroj = " & "N'" & Me.lblDelovodniBroj.Text & "'," _
& "datumPrijema = " & DatumPrijema & "," _
& "KlasaDokumentaID = " & "N'" & Me.ddlKlasaDokumentaID.Text & "'," _
& "tekst = " & "N'" & Me.txtTekst.Text & "'," _
& "primedba = " & "N'" & Me.txtPrimedba.Text & "'," _
& "posiljaoc = " & "N'" & Me.txtPosiljaoc.Text & "'," _
& "iznos = " & "N'" & Me.txtIznos.Text & "'," _
& "OrgJedID = " & "N'" & Me.ddlOrgJedID.Text & "'," _
& "namenjeno = " & Me.ddlNamenjeno.Text & "," _
& "datumRazvoda = " & DatumRazvoda & "," _
& "PopisAkata = " & PopisAkata & "," _
& "AktivanPopisAkata = " & AktivanPopisAkata & "," _
& "preuzeo = " & Preuzeo & "," _
& "preuzeoKO = " & "N'" & PreuzeoKO & "'," _
& "DatumPreuzeo = " & DatumPreuzeo & "," _
& "LinkZaDokument = " & "N'" & Me.txtLinkZaDokument.Text & "'," _
& "INDLinkZaDokument = " & INDLinkZaDokument & "," _
& "smer = " & "N'" & smer & "', " _
& "korisnik = " & Session("korisnik_ID") & "" _
& "  WHERE (godina = " & Me.txtGodina.Text & ") And (rbr = " & Me.txtRbr.Text & ") And (podbroj = " & Me.txtPodBroj.Text & ") And (PodOd3 = " & Me.txtPodOd3.Text & ")"
        Else



            UpitInsertUpdateDELOVODNIK = "INSERT INTO DELOVODNIK (godina, rbr, podbroj, podod3,KlasifikacioniBrojID, DelovodniBroj, datumPrijema,KlasaDokumentaID,tekst,primedba, posiljaoc,iznos,OrgJedID,namenjeno,datumRazvoda, PopisAkata, AktivanPopisAkata,preuzeo,preuzeoKO,datumPreuzeo,LinkZaDokument,INDLinkZaDokument, smer,korisnik) VALUES " _
& "(" & Me.txtGodina.Text & " " _
& "," & Me.txtRbr.Text & " " _
& "," & Me.txtPodBroj.Text & " " _
& "," & Me.txtPodOd3.Text & " " _
& "," & "N'" & Me.ddlKlasifikacioniBrojID.Text & "' " _
& "," & "N'" & Me.lblDelovodniBroj.Text & "' " _
& "," & DatumPrijema & " " _
& "," & "N'" & Me.ddlKlasaDokumentaID.Text & "' " _
& "," & "N'" & Me.txtTekst.Text & "' " _
& "," & "N'" & Me.txtPrimedba.Text & "' " _
& "," & "N'" & Me.txtPosiljaoc.Text & "' " _
& "," & "N'" & Me.txtIznos.Text & "' " & " " _
& "," & "N'" & Me.ddlOrgJedID.Text & "' " _
& "," & "N'" & Me.ddlNamenjeno.Text & "' " _
& "," & DatumRazvoda & " " _
& "," & PopisAkata & " " _
& "," & AktivanPopisAkata & " " _
& "," & Preuzeo & " " _
& "," & "N'" & PreuzeoKO & "' " _
& "," & DatumPreuzeo & " " _
& "," & "N'" & Me.txtLinkZaDokument.Text & "' " _
& "," & INDLinkZaDokument & " " _
& "," & "N'" & smer & "' " _
& "," & Session("korisnik_ID") & ") "

        End If

        Dim ret As Boolean = b.UpisPromenaBrisanje(UpitInsertUpdateDELOVODNIK, PISARNICAConnectionString)
        Return ret
    End Function

    Private Function ProveraPostojanjaZapisaDELOVODNIK(ByVal godina As String, ByVal rbr As String, ByVal podbroj As String, ByVal podod3 As String) As Integer
        Dim DELOVODNIKSelect As String = ""
        Dim dsDELOVODNIKSelect As New DataSet

        DELOVODNIKSelect = "Select * FROM DELOVODNIK WHERE (godina = '" & godina & "') AND (rbr = '" & rbr & "') AND (podbroj = '" & podbroj & "') AND (podod3 = '" & podod3 & "')"
        dsDELOVODNIKSelect = b.DajDS_IzUpita_Lokal(DELOVODNIKSelect, PISARNICAConnectionString)

        Dim ret As Integer = dsDELOVODNIKSelect.Tables(0).Rows.Count
        Return ret
    End Function

    Private Sub IsprazniKontroleDelovodnika()

        Session("godina") = Year(Today)
        'Session("rbr") = Nothing
        'Session("podbroj") = Nothing

        Session("godina_pretraga") = Nothing
        Session("rbr_pretraga") = Nothing
        Session("podbroj_pretraga") = Nothing

        Me.txtGodina.Text = Session("godina")
        Me.txtRbr.Text = ""
        Me.txtPodBroj.Text = ""
        Me.ddlKlasifikacioniBrojID.SelectedIndex = "0"
        Me.lblKlasifikacioniBroj.Text = ""
        Me.lblDelovodniBroj.Text = ""
        Me.txtTekst.Text = ""
        Me.txtPrimedba.Text = ""
        Me.txtPosiljaoc.Text = ""
        Me.ddlKlasaDokumentaID.SelectedIndex = "0"
        'Me.txtKorisnik.Text = ""
        Me.txtDATUMPRIJEMA.Text = ""
        Me.txtDatumRazvoda.Text = ""
        Me.ddlOrgJedID.SelectedIndex = "0"
        Me.lblOrgJedNaziv.Text = ""
        Me.txtIznos.Text = ""
        Me.chkPopisAkata.Checked = False
        Me.chkAktivanPopisAkata.Checked = False
        Me.txtLinkZaDokument.Text = ""
        Me.chkINDLinkZaDokument.Checked = False
        Me.txtPreuzeoKO.Text = ""
        Me.txtDatumPreuzeo.Text = ""
        Me.chkPreuzeo.Checked = False
        Me.radioSmerPrimljeno.Checked = False
        Me.radioSmerOdneto.Checked = False
        Me.radioSmerPoslato.Checked = False
        Me.ddlNamenjeno.SelectedIndex = "0"
        Me.lblNamenjenoImePrezime.Text = ""
        'Me.txtPodOd3.Text = ""
        Me.txtKontaktOsoba.InnerText = ""
        Me.txtKontaktTelefon.InnerText = ""
        Me.txtKontaktLokacija.InnerText = ""

        'Zbog razvođenja
        Me.txtRbr.Enabled = True
        Me.ddlKlasifikacioniBrojID.Enabled = True
        Me.ddlKlasaDokumentaID.Enabled = True
        Me.txtDATUMPRIJEMA.Enabled = True
        Me.lblKlasifikacioniBroj.Enabled = True
        Me.btnRazvod.Visible = False

    End Sub

    Private Sub DodeliDelovodniBroj()
        Me.lblDelovodniBroj.Text = ddlKlasifikacioniBrojID.SelectedValue.Trim() + "-" + txtRbr.Text.Trim() + "/" + txtPodBroj.Text.Trim()
    End Sub


    '    Protected Function UpdateIndAkt() As Boolean


    '        '''''''''''''update INDakt''''''''''''''''''''''''''''

    '        Dim UpitIndAkt As String = ""
    '        Dim DatumVreme As String = b.DajDatumVreme14()

    '        UpitIndAkt = "UPDATE ADM_Uzorak_LJ " _
    '& " SET indakt = 1, " _
    '& "ID_Korisnika = N'" & Me.txtID_Korisnika.Text & "', " _
    '& "datumvreme =  N'" & DatumVreme & "' " _
    '& " WHERE (mb = '" & Me.txtMB.Text & "') AND (idlj = " & Me.txtIDLJ.Text & ")"


    '        Dim ret As Boolean = b.UpisPromenaBrisanje(UpitIndAkt, SPRLJConnectionString)
    '        Return ret
    '    End Function

    '    Protected Function UpdateIndAktNemaZarade() As Boolean


    '        '''''''''''''update INDakt   7  ''''''''''''''''''''''''''''

    '        Dim UpitIndAkt As String = ""
    '        Dim DatumVreme As String = b.DajDatumVreme14()

    '        UpitIndAkt = "UPDATE ADM_Uzorak_LJ " _
    '& " SET indakt = 7, " _
    '& "ID_Korisnika = N'" & Me.txtID_Korisnika.Text & "', " _
    '& "datumvreme =  N'" & DatumVreme & "' " _
    '& " WHERE (mb = '" & Me.txtMB.Text & "') AND (idlj = " & Me.txtIDLJ.Text & ")"


    '        Dim ret As Boolean = b.UpisPromenaBrisanje(UpitIndAkt, SPRLJConnectionString)
    '        Return ret
    '    End Function

    'Protected Function DeleteNemaZaradeKV() As Boolean

    '    Dim UpitDelete As String = ""

    '    UpitDelete = "delete from Podaci_Rad1_G_KV_web WHERE (mbr = '" & Me.txtMB.Text & "') AND (idlj = " & Me.txtIDLJ.Text & ")"


    '    Dim ret As Boolean = b.UpisPromenaBrisanje(UpitDelete, SPRLJConnectionString)
    '    Return ret
    'End Function
    'Function DeleteNemaZaradeMES() As Boolean

    '    Dim UpitDelete As String = ""

    '    UpitDelete = "delete from Podaci_Rad1_G_MES_web WHERE (mbr = '" & Me.txtMB.Text & "') AND (idlj = " & Me.txtIDLJ.Text & ")"


    '    Dim ret As Boolean = b.UpisPromenaBrisanje(UpitDelete, SPRLJConnectionString)
    '    Return ret
    'End Function


    'Protected Function UpdateZaradeKraj() As Boolean

    '    Dim ret As Boolean = False

    '    ''''''''''''''broj lokalnih jedinica sa zaradama'''''''''''''''''''''

    '    Dim dsBroj As New DataSet
    '    Dim UpitBroj As String = ""
    '    Dim BrojLokJed As String

    '    UpitBroj = " SELECT count(*) as broj From ADM_Uzorak_LJ Where indzarade = 1 and  (mb = '" & Me.txtMB.Text & "')"

    '    dsBroj = b.DajDS_IzUpita(UpitBroj, SPRLJConnectionString)

    '    If dsBroj.Tables.Count > 0 Then
    '        If dsBroj.Tables(0).Rows.Count > 0 Then
    '            If Not IsDBNull(dsBroj.Tables(0).Rows(0).Item("broj")) Or dsBroj.Tables(0).Rows(0).Item("broj").ToString() <> "" Then
    '                BrojLokJed = dsBroj.Tables(0).Rows(0).Item("broj").ToString()

    '            End If
    '        End If
    '    End If



    '''''''''''''broj lokalnih jedinica sa popunjenim indakt''''''''''''''''''''''''''''



    'Dim dsBrojIndAkt As New DataSet
    '    Dim UpitBrojIndAkt As String = ""
    '    Dim BrojLokJedIndAkt As String

    '    UpitBrojIndAkt = " SELECT count(*) as brojindakt From ADM_Uzorak_LJ Where indzarade=1 and indakt in (1,2,3,4,5,6,7,8) and  (mb = '" & Me.txtMB.Text & "')"

    '    dsBrojIndAkt = b.DajDS_IzUpita(UpitBrojIndAkt, SPRLJConnectionString)

    '    If dsBrojIndAkt.Tables.Count > 0 Then
    '        If dsBrojIndAkt.Tables(0).Rows.Count > 0 Then
    '            If Not IsDBNull(dsBrojIndAkt.Tables(0).Rows(0).Item("brojindakt")) Or dsBrojIndAkt.Tables(0).Rows(0).Item("brojindakt").ToString() <> "" Then
    '                BrojLokJedIndAkt = dsBrojIndAkt.Tables(0).Rows(0).Item("brojindakt").ToString()

    '            End If
    '        End If
    '    End If


    '''''''''''''update INDZaradeKraj ''''''''''''''''''''''''''''


    'If BrojLokJedIndAkt = BrojLokJed Then
    '        Dim DATZAR As String = b.DajDatumVreme14()
    '        Dim UpitUpdateZaradeKraj As String = ""

    '        UpitUpdateZaradeKraj = "UPDATE ADM_Uzorak_MB  SET INDZaradeKraj = 1, DATZAR = '" & DATZAR & "'  where  (mb = '" & Me.txtMB.Text & "')"

    '        ret = b.UpisPromenaBrisanje(UpitUpdateZaradeKraj, SPRLJConnectionString)
    '    End If

    '    Return ret


    'End Function


#End Region

#Region "VALIDACIJA"

    Sub dajDefaultVrednosti()
        Dim dt As Date = Date.Today

        If (Me.txtDATUMPRIJEMA.Text = Nothing) Then
            Me.txtDATUMPRIJEMA.Text = dt.ToString("dd.MM.yyyy", CultureInfo.InvariantCulture)
        End If

        ''''If (Me.txtZbruto.Text = Nothing) Then
        ''''    Me.txtZbruto.Text = "0"
        ''''End If

        'If (Me.txtPorez.Text = Nothing) Then
        '    Me.txtPorez.Text = "0"
        'End If

        ''tabela2
        'Me.txtP1.BorderColor = Drawing.Color.Empty
        'Me.txtP2.BorderColor = Drawing.Color.Empty

        ''T1
        'Me.txtZbruto.ToolTip = ""
        'Me.txtPorez.ToolTip = ""


        ''T1
        'Me.ValidtxtZbruto.Attributes.Remove(klasa)
        'Me.ValidtxtPorez.Attributes.Remove(klasa)

    End Sub
    Protected Function ObaveznaPolja() As Boolean


        Dim ret As Integer = 0
        Dim rezultat As Boolean = False
        Dim poruka As String = ""


        '        '********************************* tabela 1*****************************************************
        '        '     jelena milakovic -	U Tabeli 1. - obavezno je popunjavanje  polja u kolonama 1 i  5 redu 1; 
        '        '******************************************************************************************************

        '        If Me.txtZbruto.Text = Nothing Then


        '            Me.ValidtxtZbruto.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtZbruto.BorderColor = Drawing.Color.Red
        '            Me.txtZbruto.ToolTip = "Обавезно поље!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If



        '        If Me.txtRadisp.Text = Nothing Then


        '            Me.ValidtxtRadisp.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtRadisp.BorderColor = Drawing.Color.Red
        '            Me.txtRadisp.ToolTip = "Обавезно поље!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If


        '        '********************************* tabela 2*****************************************************
        '        '    jelena milakovic -	U Tabeli 2. - obavezno je popunjavanje  polja 
        '        '                       u kolonama 1 i 2 uredu 1 i barem u jednom od redova 2 do 9 
        '        '                       u istim kolonama  (1 i 2);
        '        '******************************************************************************************************

        '        If Me.txtP1.Text = Nothing Then

        '            Me.ValidtxtP.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtP1.BorderColor = Drawing.Color.Red
        '            Me.txtP1.ToolTip = "Обавезно поље!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If


        '        If Me.txtPI11.Text = Nothing Then

        '            Me.ValidtxtPI.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtPI11.BorderColor = Drawing.Color.Red
        '            Me.txtPI11.ToolTip = "Обавезно поље!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If


        '        If (Me.txtP2.Text = Nothing And Me.txtP3.Text = Nothing And Me.txtP4.Text = Nothing And Me.txtP5.Text = Nothing And Me.txtP6.Text = Nothing And Me.txtP7.Text = Nothing And Me.txtP8.Text = Nothing And Me.txtP9.Text = Nothing) Or
        '           (Convert.ToDouble(Me.txtP2.Text) + Convert.ToDouble(Me.txtP3.Text) + Convert.ToDouble(Me.txtP4.Text) + Convert.ToDouble(Me.txtP5.Text) + Convert.ToDouble(Me.txtP6.Text) + Convert.ToDouble(Me.txtP7.Text) + Convert.ToDouble(Me.txtP8.Text) + Convert.ToDouble(Me.txtP9.Text) = 0) Then

        '            Me.ValidtxtP.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtP2.BorderColor = Drawing.Color.Red
        '            Me.txtP3.BorderColor = Drawing.Color.Red
        '            Me.txtP4.BorderColor = Drawing.Color.Red
        '            Me.txtP5.BorderColor = Drawing.Color.Red
        '            Me.txtP6.BorderColor = Drawing.Color.Red
        '            Me.txtP7.BorderColor = Drawing.Color.Red
        '            Me.txtP8.BorderColor = Drawing.Color.Red
        '            Me.txtP9.BorderColor = Drawing.Color.Red

        '            'Me.txtP2.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtP3.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtP4.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtP5.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtP6.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtP7.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtP8.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtP9.ToolTip = "Барем једно поље из ове колоне је обавезно!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If



        '        If (Me.txtPI12.Text = Nothing And Me.txtPI13.Text = Nothing And Me.txtPI14.Text = Nothing And Me.txtPI15.Text = Nothing And Me.txtPI16.Text = Nothing And Me.txtPI17.Text = Nothing And Me.txtPI18.Text = Nothing And Me.txtPI19.Text = Nothing) Or
        '(Convert.ToDouble(Me.txtPI12.Text) + Convert.ToDouble(Me.txtPI13.Text) + Convert.ToDouble(Me.txtPI14.Text) + Convert.ToDouble(Me.txtPI15.Text) + Convert.ToDouble(Me.txtPI16.Text) + Convert.ToDouble(Me.txtPI17.Text) + Convert.ToDouble(Me.txtPI18.Text) + Convert.ToDouble(Me.txtPI19.Text) = 0) Then



        '            Me.ValidtxtPI.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtPI12.BorderColor = Drawing.Color.Red
        '            Me.txtPI13.BorderColor = Drawing.Color.Red
        '            Me.txtPI14.BorderColor = Drawing.Color.Red
        '            Me.txtPI15.BorderColor = Drawing.Color.Red
        '            Me.txtPI16.BorderColor = Drawing.Color.Red
        '            Me.txtPI17.BorderColor = Drawing.Color.Red
        '            Me.txtPI18.BorderColor = Drawing.Color.Red
        '            Me.txtPI19.BorderColor = Drawing.Color.Red

        '            'Me.txtPI12.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtPI13.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtPI14.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtPI15.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtPI16.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtPI17.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtPI18.ToolTip = "Барем једно поље из ове колоне је обавезно!"
        '            'Me.txtPI19.ToolTip = "Барем једно поље из ове колоне је обавезно!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If




        '        '********************************* tabela 3*****************************************************
        '        '    jelena milakovic -	U Tabeli 3. – obavezno je popunjavanje polja 
        '        '                       u kolonama 1 i 7 u redu 4 (III kvartal tekuće godine). 
        '        '******************************************************************************************************



        '        If Me.txtcasuk3.Text = Nothing Then


        '            Me.ValidtxtCasUk.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtcasuk3.BorderColor = Drawing.Color.Red
        '            Me.txtcasuk3.ToolTip = "Обавезно поље!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If

        '        '''novo citava kolona 1
        '        If Me.txtcasuk1.Text = Nothing Then


        '            Me.ValidtxtCasUk.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtcasuk1.BorderColor = Drawing.Color.Red
        '            Me.txtcasuk1.ToolTip = "Обавезно поље!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If

        '        If Me.txtcasuk2.Text = Nothing Then


        '            Me.ValidtxtCasUk.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtcasuk2.BorderColor = Drawing.Color.Red
        '            Me.txtcasuk2.ToolTip = "Обавезно поље!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If

        '        If Me.txtcasuk4.Text = Nothing Then


        '            Me.ValidtxtCasUk.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtcasuk4.BorderColor = Drawing.Color.Red
        '            Me.txtcasuk4.ToolTip = "Обавезно поље!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If


        '        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        '        If Me.txtizvrseni3.Text = Nothing Then


        '            Me.ValidtxtIzvrseni.Attributes.Add(klasa, InvalidKlasa)
        '            Me.txtizvrseni3.BorderColor = Drawing.Color.Red
        '            Me.txtizvrseni3.ToolTip = "Обавезно поље!"

        '            ret = ret + 1
        '            SetPorukaNeuspesnoVisible()

        '        End If




        '        Me.lblPorukaGR.InnerHtml = poruka

        If ret = 0 Then
            rezultat = True
        End If
        Return rezultat
    End Function




    Protected Function Validacija() As Boolean

        Dim ret As Integer = 0
        Dim rezultat As Boolean = False
        Dim poruka As String = ""


        '********************************* G026 iskljucena*****************************************************
        '    Zbruto > 999900000  
        '******************************************************************************************************

        'If Convert.ToDouble(Me.txtZbruto.Text) > 999900000 Then
        '    poruka = poruka + "L026 - Укупно(бруто) не сме бити веће од 999900000 <br/>"

        '    Me.ValidtxtZbruto.Attributes.Add(klasa, InvalidKlasa)
        '    Me.txtZbruto.BorderColor = Drawing.Color.Red
        '    Me.txtZbruto.ToolTip = "L026 - Укупно(бруто) не сме бити веће од 999900000"

        '    ret = ret + 1




        'End If
        '********************************* G027 iskljucena*****************************************************
        '    Zbruto> 0 And Porez = 0 
        '******************************************************************************************************


        'If Convert.ToDouble(Me.txtZbruto.Text) > 0 And Convert.ToDouble(Me.txtPorez.Text) = 0 Then

        '    poruka = poruka + "L027 Уколико је Укупно(бруто) >0 онда Порез на зараде запослених не може бити 0 <br/>"

        '    Me.ValidtxtZbruto.Attributes.Add(klasa, InvalidKlasa)
        '    Me.ValidtxtPorez.Attributes.Add(klasa, InvalidKlasa)

        '    Me.txtZbruto.BorderColor = Drawing.Color.Red
        '    Me.txtZbruto.ToolTip = "L027 Уколико је Укупно(бруто) >0 онда Порез на зараде запослених не може бити 0"


        '    Me.txtPorez.BorderColor = Drawing.Color.Red
        '    Me.txtPorez.ToolTip = "L027 Уколико је Укупно(бруто) >0 онда Порез на зараде запослених не може бити 0"



        '    ret = ret + 1


        'End If








        Me.lblPorukaGR.InnerHtml = poruka

        If ret = 0 Then
            rezultat = True
        End If
        Return rezultat
    End Function
#End Region

    'Protected Sub txtZbruto_TextChanged(sender As Object, e As EventArgs) Handles txtZbruto.TextChanged, txtRadisp.TextChanged
    '    If Me.txtZbruto.Text() <> "" Or Me.txtZbruto.Text <> "&nbsp;" Then
    '        Me.txtP1.Text() = Me.txtZbruto.Text()
    '    End If
    '    If Me.txtRadisp.Text() <> "" Or Me.txtRadisp.Text <> "&nbsp;" Then
    '        Me.txtPI11.Text() = Me.txtRadisp.Text()
    '    End If
    'End Sub
#Region "WORD TEMPLATE (OMOT SPISA)"
    Private Sub ReleaseObject(ByVal obj As Object)
        'http://www.siddharthrout.com/2012/08/06/vb-net-two-dot-rule-when-working-with-office-applications-2/
        Try
            System.Runtime.InteropServices.Marshal.ReleaseComObject(obj)
            obj = Nothing
        Catch ex As Exception
            obj = Nothing
        Finally
            GC.Collect()
        End Try
    End Sub

    Public Sub btnCreate_Click(sender As Object, e As EventArgs) Handles btnCreate.Click
        ''sFileName = txtFileName.Text
        'sFileName = txtGodina.Text.ToString() & txtRbr.Text.ToString() & txtPodBroj.Text.ToString() & txtPodOd3.Text.ToString() & ".docx"

        'wdApp = New word.Application
        'wdDocs = wdApp.Documents
        'Dim wdDoc As word.Document = wdDocs.Add(sPath & "MustraOmotSpisa.dotx")
        'Dim wdBooks As word.Bookmarks = wdDoc.Bookmarks

        'wdBooks("bkDatum").Range.Text = txtDATUMPRIJEMA.Text.ToString()
        'wdBooks("bkKlasifikacioniZnak").Range.Text = ddlKlasifikacioniBrojID.SelectedValue.ToString()
        'wdBooks("bkObradio").Range.Text = txtKorisnik.Text.ToString()
        'wdBooks("bkPredmet").Range.Text = txtTekst.Text.ToString()

        'wdDoc.SaveAs2(sPath & sFileName)

        'ReleaseObject(wdBooks)
        'wdDoc.Close(False)
        'ReleaseObject(wdDoc)
        'ReleaseObject(wdDocs)
        'wdApp.Quit()
        ''txtFileName.Enabled = False
        ''btnPrint.Enabled = True
        ''btnPreview.Enabled = True

    End Sub

    Public Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click

        ''Postavke za duplex - štampač
        'Dim printers = PrinterSettings.InstalledPrinters()

        'Dim pd As New PrintDocument()
        'pd.PrinterSettings.PrinterName = printers(1)     ' Select the printer

        'If pd.PrinterSettings.CanDuplex Then
        '    pd.PrinterSettings.Duplex = Duplex.Horizontal       'Set duplex mode if available
        'End If
        '' /Postavke za duplex - štampač


        'wdApp = New word.Application
        'wdDocs = wdApp.Documents
        'wdApp.Visible = True    'need to monitor process
        'sFileName = txtGodina.Text.ToString() & txtRbr.Text.ToString() & txtPodBroj.Text.ToString() & txtPodOd3.Text.ToString() & ".docx"

        'Dim wdDoc As word.Document = wdDocs.Open(sPath & sFileName)

        ''pd.Print()
        'wdDoc.PrintOut()

        'wdDoc.Close()
        'ReleaseObject(wdDoc)
        'ReleaseObject(wdDocs)
        'wdApp.Quit()

    End Sub

    'Private Sub btnPreview_Click(sender As Object, e As EventArgs) Handles btnPreview.Click
    '    wdApp = New word.Application
    '    wdDocs = wdApp.Documents
    '    sFileName = "Naziv"
    '    Dim wdDoc As word.Document = wdDocs.Open(sPath & sFileName & ".docx")
    '    wdDoc.SaveAs2(sPath & sFileName, word.WdSaveFormat.wdFormatHTML)
    '    wdDoc.Close(False)
    '    ReleaseObject(wdDoc)
    '    ReleaseObject(wdDocs)
    '    wdApp.Quit()
    '    wbPreview.Navigate(sPath & sFileName & ".htm")

    'End Sub

    Public Sub OmotSpisaStampa_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOmotSpisaStampa.Click

        Dim ImePrezime As String = DajImePrezime(txtKorisnik.Text)
        Dim dt As Date = Date.Today
        Dim DatumPrijema As String

        If (Me.txtDATUMPRIJEMA.Text = Nothing) Then
            DatumPrijema = dt.ToString("dd.MM.yyyy", CultureInfo.InvariantCulture)
        Else
            DatumPrijema = Me.txtDATUMPRIJEMA.Text
        End If

        Dim rp1 As ReportParameter = New ReportParameter("ReportParameterKlasifikacioniBrojID", lblKlasifikacioniBroj.Text.ToString())
        Dim rp2 As ReportParameter = New ReportParameter("ReportParameterTekst", txtTekst.Text.ToString())
        Dim rp3 As ReportParameter = New ReportParameter("ReportParameterDatumPrijema", DatumPrijema)
        Dim rp4 As ReportParameter = New ReportParameter("ReportParameterObradio", ImePrezime)

        rwOmotSpisa.LocalReport.DataSources.Clear()
        rwOmotSpisa.LocalReport.ReportPath = "Izvestaji\rOmotSpisa.rdlc"
        rwOmotSpisa.LocalReport.SetParameters(New ReportParameter() {rp1, rp2, rp3, rp4})
        'rwOmotSpisa.LocalReport.DataSources.Add(rds)
        rwOmotSpisa.LocalReport.Refresh()



    End Sub
    Sub CreatePDF2()


        ' Variables
        Dim warnings As Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim tabela As New DataTable



        Try
            ' Setup the report viewer object and get the array of bytes

            'Dim viewer As New ReportViewer()
            rwOmotSpisa.ProcessingMode = ProcessingMode.Local
            Dim rp1 As ReportParameter = New ReportParameter("ReportParameterKlasifikacioniBrojID", lblKlasifikacioniBroj.Text.ToString())
            Dim rp2 As ReportParameter = New ReportParameter("ReportParameterTekst", txtTekst.Text.ToString())

            rwOmotSpisa.LocalReport.DataSources.Clear()
            rwOmotSpisa.LocalReport.ReportPath = "Izvestaji\rOmotSpisa.rdlc"
            rwOmotSpisa.LocalReport.SetParameters(New ReportParameter() {rp1, rp2})


            rwOmotSpisa.LocalReport.DataSources.Clear()
            'viewer.LocalReport.DataSources.Add(rds)
            rwOmotSpisa.LocalReport.Refresh()
            Dim bytes As Byte() = rwOmotSpisa.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamids, warnings)
            'rwOmotSpisa.ProcessingMode = ProcessingMode.Local
            'rwOmotSpisa.LocalReport.ReportPath = "Izvestaji\rOmotSpisa.rdlc"
            'rwOmotSpisa.LocalReport.DataSources.Add(rds)
            'Dim bytes As Byte() = rwOmotSpisa.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamids, warnings)

            ' Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Me.Response.Buffer = True
            Me.Response.Clear()
            Me.Response.ContentType = mimeType
            Me.Response.AddHeader("content-disposition", ("attachment; filename = OmotSpisa.pdf"))
            Me.Response.BinaryWrite(bytes)
            ' create the file
            ' send it to the client to download
            Me.Response.Flush()
        Catch ex As Exception
            Throw New Exception("Error Creating PDF File: " + ex.InnerException.Message)
        End Try

    End Sub
    Sub CreatePDF()
        Dim dt As New DataTable
        Dim ds As New DataSet
        Dim UpitOmotSpisa As String

        UpitOmotSpisa = "select KlasifikacioniBrojID, DelovodniBroj, tekst from vDelovodnik where godina = " & godina & " and rbr = " & txtRbr.Text & " and podbroj = " & txtPodBroj.Text & " and podod3 = " & PodOd3
        ds = b.DajDS_IzUpita_Lokal(UpitOmotSpisa, PISARNICAConnectionString)

        ' Variables
        Dim warnings As Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim tabela As New DataTable

        ' Create Report DataSource
        Dim rds As New ReportDataSource("dsOmotSpisa", ds.Tables(0))
        dt.Clear()
        ds.Tables.Add(dt)
        Me.rwOmotSpisa.Reset()
        Me.rwOmotSpisa.LocalReport.ReportPath = "Izvestaji\rOmotSpisa.rdlc"
        Me.rwOmotSpisa.LocalReport.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsOmotSpisa", ds.Tables(0)))


        Try
            ' Setup the report viewer object and get the array of bytes

            Dim viewer As New ReportViewer()
            viewer.ProcessingMode = ProcessingMode.Local
            viewer.LocalReport.ReportPath = "Izvestaji\rOmotSpisa.rdlc"



            'Dim rds As New ReportDataSource
            'rds.Name = "dsOmotSpisa"
            'rds.Value = tabela
            'tabela.Rows.Add(ds)
            'tabela.Rows.Add(Me.lblKlasifikacioniBroj.Text, Me.txtTekst.Text)
            viewer.LocalReport.DataSources.Clear()
            viewer.LocalReport.DataSources.Add(rds)
            viewer.LocalReport.Refresh()
            Dim bytes As Byte() = viewer.LocalReport.Render("PDF", Nothing, mimeType, Encoding, extension, streamids, warnings)
            'rwOmotSpisa.ProcessingMode = ProcessingMode.Local
            'rwOmotSpisa.LocalReport.ReportPath = "Izvestaji\rOmotSpisa.rdlc"
            'rwOmotSpisa.LocalReport.DataSources.Add(rds)
            'Dim bytes As Byte() = rwOmotSpisa.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamids, warnings)

            ' Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Me.Response.Buffer = True
            Me.Response.Clear()
            Me.Response.ContentType = mimeType
            Me.Response.AddHeader("content-disposition", ("attachment; filename = OmotSpisa.pdf"))
            Me.Response.BinaryWrite(bytes)
            ' create the file
            ' send it to the client to download
            Me.Response.Flush()
        Catch ex As Exception
            Throw New Exception("Error Creating PDF File: " + ex.InnerException.Message)
        End Try

    End Sub

    Private Function DajImePrezime(ByVal ID_Korisnika As String) As String
        Dim ImePrezime As String = ""
        Dim UpitPO As String = "SELECT ImePrezime FROM v_AdresarZaposlenih WHERE (idenr = '" & ID_Korisnika & "')"
        ImePrezime = b.DajScalarSTR_IzUpita_LOKAL(UpitPO, PISARNICAConnectionString)
        Return ImePrezime
    End Function

#End Region
    Sub downloadFile()
        Dim serverPath As String = System.AppDomain.CurrentDomain.BaseDirectory() + "Content\doc\SkeniraniDokumenti\805"
        ' Dim FilePath As String = "C:\EPZ\PisarnicaRZS\Content\doc\SkeniraniDokumenti\805\805201911.jpg"
        Dim FilePath As String = "C:\Pisarnica\PisarnicaRZS\Content\doc\SkeniraniDokumenti\805\805201911.jpg"

        Dim TargetFile As New System.IO.FileInfo(FilePath)

        Try
            ' clear the current output content from the buffer
            Response.Clear()
            ' add the header that specifies the default filename for the Download/
            ' SaveAs dialog
            Response.AddHeader("Content-Disposition", "attachment; filename=" +
            TargetFile.Name)
            ' add the header that specifies the file size, so that the browser
            ' can show the download progress
            Response.AddHeader("Content-Length", TargetFile.Length.ToString())
            ' specify that the response is a stream that cannot be read by the
            ' client and must be downloaded
            Response.ContentType = "application/octet-stream"
            ' send the file stream to the client
            Response.WriteFile(TargetFile.FullName)
            ' stop the execution of this page
            Response.End()

        Catch ex As Exception
            lblStatusUpload.Text = ex.ToString()
        End Try

    End Sub
End Class
