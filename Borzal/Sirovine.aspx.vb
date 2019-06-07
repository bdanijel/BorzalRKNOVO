Imports System.Data
Imports System.Diagnostics
Imports System.IO
Imports System.AppDomain
Imports System.Drawing.Printing
Imports System.Globalization
Imports Microsoft.Reporting.WebForms
Imports System.Data.SqlClient

Partial Class Sirovine
    Inherits System.Web.UI.Page

    Dim b As New ADM_MM()
    Dim BORZALConnectionString As String = b.ConnString_BORZAL

    Dim sPath As String = System.AppDomain.CurrentDomain.BaseDirectory() + "Izvestaji\"
    Dim sFileName As String

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
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Page.MaintainScrollPositionOnPostBack = True

        'If Session("godina") = Nothing Then
        '    Session("godina") = Me.txtGodina.Text.ToString()
        'Else
        '    Me.txtGodina.Text = Session("godina")
        'End If

        ImaPrava = b.ProveraKorisnikPosao(Session("ID_Korisnika"), Path.GetFileName(Request.PhysicalPath))

        If ImaPrava = 0 Then
            Response.Redirect(ResolveClientUrl("~/Default.aspx"), True)
        End If



        If Not Page.IsPostBack Then

            SetPorukaSpisakGresakaInvisible()
            If Session("ID_SIROVINE_pretraga") = Nothing Then
                txtID.Text = "0"
            Else
                Me.txtID.Text = Session("ID_SIROVINE_pretraga")
                Me.PodaciSirovine(Convert.ToInt32(Me.txtID.Text))
            End If

        End If

    End Sub


#Region "DUGMIĆI"
    Protected Sub btnPotvrdiSIROVINE_Click(sender As Object, e As EventArgs)
        SetPorukaUspesnoInvisible()
        SetPorukaNeuspesnoInvisible()
        SetPorukaSpisakGresakaInvisible()
        dajDefaultVrednosti()


        If ObaveznaPolja() = False Then
            Me.PorukaInfoNeuspesno.InnerText = "Molimo Vas da popunite sva obavezna polja."
            SetPorukaNeuspesnoVisible()

            Exit Sub

        End If


        'dajDefaultVrednosti()

        If Validacija() = False Then
            Me.PorukaInfoNeuspesno.InnerText = "Molimo Vas da, na označenim poljima, korigujete greške."
            SetPorukaNeuspesnoVisible()
            SetPorukaSpisakGresakaVisible()
            Exit Sub
        Else

            If InsertUpdateSIROVINE() = False Then
                Me.PorukaInfoNeuspesno.InnerText = "Došlo je do greške prilikom upisa podataka u bazu."
                SetPorukaNeuspesnoVisible()
                Exit Sub
            End If

            SetPorukaUspesnoVisible()
            Me.PorukaInfoUspesno.InnerHtml = "Uspešno ste uneli podatke!"

            IsprazniKontroleSirovine()

        End If

    End Sub
    Protected Sub btnOdustaniLJ_Click(sender As Object, e As EventArgs) Handles btnOdustaniLJ.Click
        Response.Redirect(ResolveClientUrl("~/Sirovine_Pretraga.aspx"), True)
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

#Region "SELECT"
    Protected Sub PodaciSirovine(ByVal ID As Integer)
        Dim UpitSirovine As String = ""
        Dim dsSirovine As New DataSet

        Dim NAZIV, JM As String

        UpitSirovine = "SELECT ID, NAZIV, JM from Sirovine where (ID = '" & ID & "')"

        dsSirovine = b.DajDS_IzUpita_Lokal(UpitSirovine, BORZALConnectionString)

        If dsSirovine.Tables.Count > 0 Then
            If dsSirovine.Tables(0).Rows.Count > 0 Then
                For Each row As DataRow In dsSirovine.Tables(0).Rows

                    ''ID

                    If Not IsDBNull(dsSirovine.Tables(0).Rows(0).Item("ID")) Or dsSirovine.Tables(0).Rows(0).Item("ID").ToString() <> "" Then
                        ID = dsSirovine.Tables(0).Rows(0).Item("ID").ToString()
                    Else
                        ID = ""
                    End If
                    Me.txtID.Text = ID


                    ''NAZIV


                    If Not IsDBNull(dsSirovine.Tables(0).Rows(0).Item("NAZIV")) Or dsSirovine.Tables(0).Rows(0).Item("NAZIV").ToString() <> "" Then
                        NAZIV = dsSirovine.Tables(0).Rows(0).Item("NAZIV").ToString()
                    Else
                        NAZIV = ""
                    End If
                    Me.txtNaziv.Text = NAZIV


                    ''JM


                    If Not IsDBNull(dsSirovine.Tables(0).Rows(0).Item("JM")) Or dsSirovine.Tables(0).Rows(0).Item("JM").ToString() <> "" Then
                        JM = dsSirovine.Tables(0).Rows(0).Item("JM").ToString()
                    Else
                        JM = ""
                    End If
                    Me.txtJM.Text = JM

                Next
            End If
        End If
    End Sub


#End Region

#Region "INSERT/UPDATE"



    Protected Function InsertUpdateSIROVINE() As Boolean

        Dim UpitInsertUpdateSIROVINE As String = ""


        If ProveraPostojanjaZapisaSIROVINE(Convert.ToInt32(Me.txtID.Text), Me.txtNaziv.Text) = 1 Then


            UpitInsertUpdateSIROVINE = "UPDATE SIROVINE " _
& " Set NAZIV = " & "N'" & Trim(Me.txtNaziv.Text) & "', " _
& " Set JM = " & "N'" & Trim(Me.txtJM.Text) & "' " _
& "  WHERE (ID = " & Me.txtID.Text & ")"
        Else



            UpitInsertUpdateSIROVINE = "INSERT INTO SIROVINE (Naziv, JM) VALUES " _
& "(" & "N'" & Trim(Me.txtNaziv.Text) & "', " _
& "N'" & Trim(Me.txtJM.Text) & "') "

        End If

        Dim ret As Boolean = b.UpisPromenaBrisanje(UpitInsertUpdateSIROVINE, BORZALConnectionString)
        Return ret
    End Function

    Private Function ProveraPostojanjaZapisaSIROVINE(ByVal ID As Integer, ByVal NAZIV As String) As Integer
        Dim SIROVINASelect As String = ""
        Dim dsSIROVINASelect As New DataSet

        SIROVINASelect = "Select * FROM SIROVINE WHERE (ID = '" & ID & "')"
        dsSIROVINASelect = b.DajDS_IzUpita_Lokal(SIROVINASelect, BORZALConnectionString)

        Dim ret As Integer = dsSIROVINASelect.Tables(0).Rows.Count
        Return ret
    End Function

    Private Sub IsprazniKontroleSirovine()

        Session("ID_SIROVINE_pretraga") = Nothing

        Me.txtNaziv.Text = ""
        Me.txtJM.Text = ""

    End Sub
#End Region

#Region "VALIDACIJA"

    Sub dajDefaultVrednosti()
        'Dim dt As Date = Date.Today

        'If (Me.txtDATUMPRIJEMA.Text = Nothing) Then
        '    Me.txtDATUMPRIJEMA.Text = dt.ToString("dd.MM.yyyy", CultureInfo.InvariantCulture)
        'End If

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

        If Me.txtNaziv.Text = Nothing Then

            Me.ValidTekstPoruka.Attributes.Add(klasa, InvalidKlasa)
            Me.txtNaziv.BorderColor = Drawing.Color.Red
            Me.txtNaziv.ToolTip = "Obavezno polje!"

            ret = ret + 1
            SetPorukaNeuspesnoVisible()
        Else
            Me.txtNaziv.BorderColor = Drawing.Color.Empty

        End If

        If Me.txtJM.Text = Nothing Then

            Me.ValidTekstPoruka.Attributes.Add(klasa, InvalidKlasa)
            Me.txtJM.BorderColor = Drawing.Color.Red
            Me.txtJM.ToolTip = "Obavezno polje!"

            ret = ret + 1
            SetPorukaNeuspesnoVisible()
        Else
            Me.txtJM.BorderColor = Drawing.Color.Empty
        End If


        Me.lblPorukaGR.InnerHtml = poruka

        If ret = 0 Then
            rezultat = True
        End If
        Return rezultat
    End Function
    Protected Function Validacija() As Boolean

        Dim ret As Integer = 0
        Dim rezultat As Boolean = False
        Dim poruka As String = ""


        ret = b.Duplikat("Naziv", "Sirovine", Trim(Me.txtNaziv.Text))

        If ret = 0 Then
            rezultat = True
        Else
            Me.lblPorukaGR.Visible = True
            Me.lblPorukaGR.InnerHtml = "Postoji uneta sirovina pod tim nazivom"
            rezultat = False
        End If
        Return rezultat

    End Function
#End Region


End Class
