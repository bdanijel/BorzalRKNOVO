Imports System.Data
Imports System.Diagnostics
Imports System.IO
Imports System.AppDomain
Imports System.Drawing.Printing
Imports System.Globalization
Imports Microsoft.Reporting.WebForms
Imports System.Data.SqlClient

Partial Class Predatnica
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
            PopuniCOMBO()
            SetPorukaSpisakGresakaInvisible()
            SetPorukaUspesnoInvisible()
            If Session("broj_PREDATNICA_pretraga") = Nothing Then

            Else
                Me.PodaciPredatnica(Me.txtBroj.Text(), Convert.ToInt32(Me.txtRBR.Text()))

            End If

        End If

        SetPorukaUspesnoInvisible()

    End Sub


#Region "DUGMIĆI"
    Protected Sub btnPotvrdiPREDATNICA_Click(sender As Object, e As EventArgs)
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




            If InsertUpdatePREDATNICA() = False Then
                Me.PorukaInfoNeuspesno.InnerText = "Došlo je do greške prilikom upisa podataka u bazu."
                SetPorukaNeuspesnoVisible()
                Exit Sub
            End If


            SetPorukaUspesnoVisible()
            Me.PorukaInfoUspesno.InnerHtml = "Uspešno ste uneli podatke!"

            IsprazniKontrolePredatnice()
            DajSledeciRBR()
        End If




    End Sub
    Protected Sub btnOdustaniLJ_Click(sender As Object, e As EventArgs) Handles btnOdustaniLJ.Click
        Response.Redirect(ResolveClientUrl("~/Predatnica_Pretraga.aspx"), True)
    End Sub
    Protected Sub NoviBroj_Click(sender As Object, e As EventArgs) Handles btnNoviBroj.Click

        Session("broj_pretraga") = Nothing
        Session("rbr_pretraga") = Nothing


        Me.txtBroj.Enabled = True
        Me.txtRBR.Enabled = True

        Me.ddlProizvodID.SelectedIndex = "0"
        Me.txtBroj.Text = ""
        Me.txtRBR.Text = ""
        Me.lblJM.Text = ""
        Me.txtKolicina.Text = ""
        Me.txtDATUM.Text = ""


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

        Dim UpitProizvod As String = "SELECT ID, NAZIV FROM PROIZVOD ORDER BY NAZIV"
        PopuniDDL(ddlProizvodID, UpitProizvod, "NAZIV", "ID")
        ddlProizvodID.Items.Insert(0, New ListItem("- - Izaberite proizvod - -", "0"))

    End Sub

    Protected Sub ddlProizvodID_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlProizvodID.SelectedIndexChanged
        Me.lblJM.Text = "KOM"
    End Sub
    Private Sub PopuniDDL(ddl As DropDownList, Upit As String, Tekst As String, Sifra As String)
        Dim dsDDL As DataSet = b.DajDS_IzUpita_Lokal(Upit, BORZALConnectionString)
        ddl.DataSource = dsDDL
        ddl.DataTextField = Tekst
        ddl.DataValueField = Sifra
        ddl.DataBind()
    End Sub

    Protected Sub txtBroj_TextChanged(sender As Object, e As EventArgs) Handles txtBroj.TextChanged

        ' AKO NE RADI BRIŠI, radi bez ovoga
        Session("rbr") = Nothing
        Session("rbr_pretraga") = Nothing
        Session("podbroj") = Nothing
        Session("podbroj_pretraga") = Nothing

        DajSledeciRBR()

    End Sub
    Private Function DajJM(ByVal ID_Sirovine As String) As String
        Dim JM As String = ""
        Dim UpitJM As String = "SELECT JM FROM SIROVINE WHERE (ID = '" & ID_Sirovine & "')"
        JM = b.DajScalarSTR_IzUpita_LOKAL(UpitJM, BORZALConnectionString)
        Return JM
    End Function
    Protected Sub DajSledeciRBR()


        txtBroj.Enabled = True
        txtRBR.Enabled = True

        Dim UpitSledeciRBR As String = ""
        Dim SledeciRbr As String = Nothing
        Dim dsSledeciRbr As New DataSet

        UpitSledeciRBR = "SELECT max(rbr)+1 as MaxRbr from Predatnica where Broj = '" & Me.txtBroj.Text & "'"

        dsSledeciRbr = b.DajDS_IzUpita_Lokal(UpitSledeciRBR, BORZALConnectionString)

        'Me.ValidRBRPoruka.Attributes("class") = "validation-valid-label"
        'Me.ValidRBRPoruka.InnerText = "Uzet je sledeći redni broj"
        If dsSledeciRbr.Tables.Count > 0 Then
            If dsSledeciRbr.Tables(0).Rows.Count > 0 Then
                For Each row As DataRow In dsSledeciRbr.Tables(0).Rows
                    SledeciRbr = dsSledeciRbr.Tables(0).Rows(0).Item("MaxRbr").ToString()
                Next
            End If
        End If

        If SledeciRbr = Nothing Then
            'Me.ValidRBRPoruka.Attributes("class") = "validation-error-label"
            'Me.ValidRBRPoruka.InnerText = "Prvi redni broj!"
            SledeciRbr = 1
        End If

        Me.txtRBR.Text = SledeciRbr


        txtRBR.Enabled = False
        txtBroj.Enabled = False

    End Sub
    Protected Sub txtKolicina_TextChanged(sender As Object, e As EventArgs) Handles txtKolicina.TextChanged
        Dim a As String
        Dim b As Decimal

        a = Trim(txtKolicina.Text)
        Dim c As String = Replace(a, ",", ".")

        If Decimal.TryParse(c, b) Then
            c = b.ToString("##.00")
            txtKolicina.Text = c
        Else
            txtKolicina.Text = ""
        End If
    End Sub

#End Region

#Region "SELECT"
    Protected Sub PodaciPredatnica(ByVal Broj As String, ByVal rbr As Integer)
        Dim UpitPredatnica As String = ""
        Dim dsPredatnica As New DataSet

        Dim JM, KOLICINA As String
        Dim datum As Date
        Dim ID_PROIZVODA As Integer

        UpitPredatnica = "SELECT ID, BROJ, RBR, ID_PROIZVODA, JM, KOLICINA, DATUM from Predatnica  where (BROJ = '" & Broj & "') and (rbr = '" & rbr & "')"

        dsPredatnica = b.DajDS_IzUpita_Lokal(UpitPredatnica, BORZALConnectionString)

        If dsPredatnica.Tables.Count > 0 Then
            If dsPredatnica.Tables(0).Rows.Count > 0 Then
                For Each row As DataRow In dsPredatnica.Tables(0).Rows

                    ''Broj


                    If Not IsDBNull(dsPredatnica.Tables(0).Rows(0).Item("BROJ")) Or dsPredatnica.Tables(0).Rows(0).Item("BROJ").ToString() <> "" Then
                        Broj = dsPredatnica.Tables(0).Rows(0).Item("BROJ").ToString()
                    Else
                        Broj = ""
                    End If
                    Me.txtBroj.Text = Broj



                    ''Rbr



                    If Not IsDBNull(dsPredatnica.Tables(0).Rows(0).Item("RBR")) Or dsPredatnica.Tables(0).Rows(0).Item("RBR").ToString() <> "" Then
                        rbr = dsPredatnica.Tables(0).Rows(0).Item("RBR").ToString()
                    Else
                        rbr = ""
                    End If
                    Me.txtRBR.Text = rbr



                    ''ID_PROIZVODA


                    If Not IsDBNull(dsPredatnica.Tables(0).Rows(0).Item("ID_PROIZVODA")) Or dsPredatnica.Tables(0).Rows(0).Item("ID_PROIZVODA").ToString() <> "" Then
                        ID_PROIZVODA = dsPredatnica.Tables(0).Rows(0).Item("ID_PROIZVODA").ToString()
                    Else
                        ID_PROIZVODA = ""
                    End If
                    Me.ddlProizvodID.Text = ID_PROIZVODA


                    ''JM



                    If Not IsDBNull(dsPredatnica.Tables(0).Rows(0).Item("JM")) Or dsPredatnica.Tables(0).Rows(0).Item("JM").ToString() <> "" Then
                        JM = dsPredatnica.Tables(0).Rows(0).Item("JM").ToString()
                    Else
                        JM = ""
                    End If
                    Me.lblJM.Text = JM



                    ''KOLICINA



                    If Not IsDBNull(dsPredatnica.Tables(0).Rows(0).Item("KOLICINA")) Or dsPredatnica.Tables(0).Rows(0).Item("KOLICINA").ToString() <> "" Then
                        KOLICINA = dsPredatnica.Tables(0).Rows(0).Item("KOLICINA").ToString()
                    Else
                        KOLICINA = ""
                    End If
                    Me.txtKolicina.Text = KOLICINA


                Next
            End If
        End If
    End Sub


#End Region

#Region "INSERT/UPDATE"



    Protected Function InsertUpdatePREDATNICA() As Boolean

        Dim UpitInsertUpdatePREDATNICA As String = ""
        Dim Datum As String


        'DATUMI
        If Me.txtDATUM.Text <> "" Then
            Datum = "'" & b.DajDatumIzStringa(Trim(Me.txtDATUM.Text())) & "'"
        Else
            Datum = "NULL"
        End If


        If ProveraPostojanjaZapisaPREDATNICA(Me.txtBroj.Text, Me.txtRBR.Text) = 1 Then


            UpitInsertUpdatePREDATNICA = "UPDATE PREDATNICA " _
& "Set Broj = " & "N'" & Me.txtBroj.Text & "'," _
& "RBR = " & "N'" & Me.txtRBR.Text & "'," _
& "ID_PROIZVODA = " & "N'" & Me.ddlProizvodID.Text & "'," _
& "JM = " & "N'" & Me.lblJM.Text & "'," _
& "Kolicina = " & "N'" & Me.txtKolicina.Text & "' " _
& "Datum = " & Datum _
& "  WHERE (Broj = " & Me.txtBroj.Text & ") And (rbr = " & Me.txtRBR.Text & ")"
        Else



            UpitInsertUpdatePREDATNICA = "INSERT INTO PREDATNICA (BROJ, RBR, ID_PROIZVODA, JM, KOLICINA, DATUM) VALUES " _
& "(" & "N'" & Me.txtBroj.Text & "' " _
& "," & Me.txtRBR.Text & " " _
& "," & "N'" & Me.ddlProizvodID.Text & "' " _
& "," & "N'" & Me.lblJM.Text & "' " _
& "," & "N'" & Me.txtKolicina.Text & "' " _
& "," & Datum & ") "

        End If

        Dim ret As Boolean = b.UpisPromenaBrisanje(UpitInsertUpdatePREDATNICA, BORZALConnectionString)
        Return ret
    End Function

    Private Function ProveraPostojanjaZapisaPREDATNICA(ByVal Broj As String, ByVal rbr As Integer) As Integer
        Dim PREDATNICASelect As String = ""
        Dim dsPREDATNICASelect As New DataSet

        PREDATNICASelect = "Select * FROM PREDATNICA WHERE (Broj = '" & Broj & "') AND (rbr = '" & rbr & "')"
        dsPREDATNICASelect = b.DajDS_IzUpita_Lokal(PREDATNICASelect, BORZALConnectionString)

        Dim ret As Integer = dsPREDATNICASelect.Tables(0).Rows.Count
        Return ret
    End Function

    Private Sub IsprazniKontrolePredatnice()

        Session("broj_PREDATNICA_pretraga") = Nothing
        Session("rbr_PREDATCNIA_pretraga") = Nothing

        'Me.ddlProizvodID.SelectedIndex = "0"
        'Me.txtBroj.Text = ""
        'Me.txtRBR.Text = ""
        Me.ddlProizvodID.SelectedIndex = "0"
        Me.lblJM.Text = ""
        Me.txtKolicina.Text = ""
        Me.txtDATUM.Text = ""

    End Sub
#End Region

#Region "VALIDACIJA"

    Sub dajDefaultVrednosti()


        Dim dt As Date = Date.Today

        If (Me.txtDATUM.Text = Nothing) Then
            Me.txtDATUM.Text = dt.ToString("dd.MM.yyyy", CultureInfo.InvariantCulture)
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

        If Me.txtBroj.Text = Nothing Then

            Me.ValidBroj.Attributes.Add(klasa, InvalidKlasa)
            Me.txtBroj.BorderColor = Drawing.Color.Red
            Me.txtBroj.ToolTip = "Obavezno polje!"

            ret = ret + 1
            SetPorukaNeuspesnoVisible()
        Else
            Me.txtBroj.BorderColor = Drawing.Color.Empty

        End If

        If Me.txtRBR.Text = Nothing Then

            Me.ValidRBR.Attributes.Add(klasa, InvalidKlasa)
            Me.txtRBR.BorderColor = Drawing.Color.Red
            Me.txtRBR.ToolTip = "Obavezno polje!"

            ret = ret + 1
            SetPorukaNeuspesnoVisible()
        Else
            Me.txtRBR.BorderColor = Drawing.Color.Empty

        End If

        If Me.txtKolicina.Text = Nothing Then

            Me.ValidKolicina.Attributes.Add(klasa, InvalidKlasa)
            Me.txtKolicina.BorderColor = Drawing.Color.Red
            Me.txtKolicina.ToolTip = "Obavezno polje!"

            ret = ret + 1
            SetPorukaNeuspesnoVisible()
        Else
            Me.txtKolicina.BorderColor = Drawing.Color.Empty

        End If

        If Me.ddlProizvodID.SelectedIndex = "0" Then

            Me.ValidKolicina.Attributes.Add(klasa, InvalidKlasa)
            Me.txtKolicina.BorderColor = Drawing.Color.Red
            Me.txtKolicina.ToolTip = "Obavezno polje!"

            ret = ret + 1
            SetPorukaNeuspesnoVisible()
        Else
            Me.txtKolicina.BorderColor = Drawing.Color.Empty

        End If

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


End Class
