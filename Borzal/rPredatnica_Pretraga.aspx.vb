Imports System.Data
Imports System.Globalization
Imports System.IO
Imports Microsoft.Reporting.WebForms

Partial Class rPredatnica_Pretraga
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim BORZALConnectionString As String = b.ConnString_BORZAL
    Dim ImaAdminPrava As Integer = 0
    Dim ImaPrava As Integer = 0



    Private Sub Poruka_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True

        'If Session("godina") = Nothing Then
        '    Session("godina") = Year(Today)
        'Else
        '    Me.txtGodina.Text = Session("godina")
        'End If



        ImaPrava = b.ProveraKorisnikPosao(Session("ID_Korisnika"), Path.GetFileName(Request.PhysicalPath))

        If ImaPrava = 0 Then
            Response.Redirect(ResolveClientUrl("~/Default.aspx"), True)
        End If


        If Not Page.IsPostBack Then
            PopuniCOMBO()
            PopuniTabeluMB()
        End If

    End Sub
    Private Function DajPO(ByVal ID_Korisnika As String) As String
        Dim PO As String = ""
        Dim UpitPO As String = "Select PodOd3 FROM v_AdresarZaposlenih WHERE (idenr = '" & ID_Korisnika & "')"
        PO = b.DajScalarSTR_IzUpita_LOKAL(UpitPO, BORZALConnectionString)
        Return PO
    End Function
    Protected Sub ResetClick(Source As Object, E As EventArgs)
        txtDATUMPRIJEMAOD.Text = ""
        txtDATUMPRIJEMADO.Text = ""
        PopuniCOMBO()
        SessionUpit()
    End Sub
    Private Sub PopuniTabeluMB()
        Dim SelectSQL, WhereSQL As String
        Dim UpitMB As String = ""

        SessionUpit()
        SelectSQL = Session("UpitPredatnicaPretraga")
        UslovWHERE()

        If Session("WhereSQL") = DBNull.Value.ToString() Or Trim(Session("WhereSQL")) = "" Then
            Session("WhereSQL") = ""
        End If
        WhereSQL = Session("WhereSQL")


        'Dim rp1 As ReportParameter = New ReportParameter("DatumOD", txtDATUMPRIJEMAOD.Text.ToString())
        'Dim rp2 As ReportParameter = New ReportParameter("DatumDO", txtDATUMPRIJEMADO.Text.ToString())


        'ReportViewer1.LocalReport.DataSources.Clear()
        'ReportViewer1.LocalReport.ReportPath = "Izvestaji\rPredatnica_Pretraga.rdlc"
        'ReportViewer1.LocalReport.SetParameters(New ReportParameter() {rp1, rp2})
        'rwOmotSpisa.LocalReport.DataSources.Add(rds)
        'Session("UpitPredatnicaPretraga") = SelectSQL
        'ReportViewer1.LocalReport.Refresh()


        Session("UpitPredatnicaPretraga") = SelectSQL + WhereSQL + " ORDER BY BROJ, RBR"

        ReportViewer1.LocalReport.Refresh()


    End Sub
    Protected Sub SessionUpit()
        Dim SelectSQL As String




        SelectSQL = "SELECT BROJ,RBR,NAZIV,JM,KOLICINA,DATUM FROM vPREDATNICA"

        Session("UpitPredatnicaPretraga") = SelectSQL
    End Sub
    Protected Sub UslovWHERE()
        Dim WhereSQL As String = ""
        Dim DatumPrijemaOD As String = ""
        Dim DatumPrijemaDO As String = ""

        Dim BROJ As String = Trim(Me.DDLBROJ.SelectedValue.ToString())
        Dim NAZIV As String = Trim(Me.DDLNAZIV.SelectedValue.ToString())


        If txtDATUMPRIJEMAOD.Text <> "" Then
            DatumPrijemaOD = b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMAOD.Text())).ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)
        End If

        If txtDATUMPRIJEMADO.Text <> "" Then
            DatumPrijemaDO = b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMADO.Text())).ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)
        End If

        'If chkAnketar.Checked = True Then
        '    Anketar = 1
        'Else
        '    Anketar = 0
        'End If

        Session("WhereSQL") = ""

        ''PODOD3
        'If PO <> "" And PO <> "0" Then
        '    If WhereSQL = "" Then
        '        WhereSQL = "(PodOd3 = N'" & PO & "')"
        '    Else
        '        WhereSQL = WhereSQL & " AND (PodOd3 = N'" & PO & "')"
        '    End If
        'End If

        ''GODINA DDL
        'If GODINA <> "" And GODINA <> "0" Then
        '    If WhereSQL = "" Then
        '        WhereSQL = "(GODINA = N'" & GODINA & "')"
        '    Else
        '        WhereSQL = WhereSQL & " AND (GODINA = N'" & GODINA & "')"
        '    End If
        'End If


        'DATUM
        If DatumPrijemaOD <> "" And DatumPrijemaOD <> "0" And DatumPrijemaDO <> "" And DatumPrijemaDO <> "0" Then
            If WhereSQL = "" Then
                WhereSQL = "(DATUM >=  N'" & DatumPrijemaOD & "') AND (DATUM <= N'" & DatumPrijemaDO & "')"
            Else
                WhereSQL = WhereSQL & " AND (DATUM >=  N'" & DatumPrijemaOD & "') AND (DATUM <= N'" & DatumPrijemaDO & "')"
            End If
        End If

        'BROJ DDL
        If BROJ <> "" And BROJ <> "0" Then
            If WhereSQL = "" Then
                WhereSQL = "(BROJ = N'" & BROJ & "')"
            Else
                WhereSQL = WhereSQL & " AND (BROJ = N'" & BROJ & "')"
            End If
        End If

        'NAZIV DDL
        If NAZIV <> "" And NAZIV <> "0" Then
            If WhereSQL = "" Then
                WhereSQL = "(NAZIV = N'" & NAZIV & "')"
            Else
                WhereSQL = WhereSQL & " AND (NAZIV = N'" & NAZIV & "')"
            End If
        End If



        If WhereSQL <> "" Then
            Session("WhereSQL") = " WHERE (" & WhereSQL & ")"
        Else
            Session("WhereSQL") = ""
        End If

    End Sub
#Region "COMBO PRETRAGA"
    Private Sub PopuniCOMBO()

        Dim UpitBROJ As String = "SELECT DISTINCT BROJ FROM vPREDATNICA ORDER BY BROJ"
        PopuniDDL_1KOLONA(DDLBROJ, UpitBROJ, "BROJ")
        DDLBROJ.Items.Insert(0, New ListItem("- - Izaberite broj predatnice - -", "0"))

        Dim UpitNAZIV As String = "SELECT DISTINCT NAZIV FROM vPREDATNICA ORDER BY NAZIV"
        PopuniDDL_1KOLONA(DDLNAZIV, UpitNAZIV, "NAZIV")
        DDLNAZIV.Items.Insert(0, New ListItem("- - Izaberite naziv proizvoda - -", "0"))


        'txtDATUMPRIJEMADO.Text = ""
        'txtDATUMPRIJEMAOD.Text = ""
        'txtDATUMPRIJEMADO.Visible = False

    End Sub
    Private Sub PopuniDDL(ddl As DropDownList, Upit As String, Tekst As String, Sifra As String)
        Dim dsDDL As DataSet = b.DajDS_IzUpita_Lokal(Upit, BORZALConnectionString)
        ddl.DataSource = dsDDL
        ddl.DataTextField = Tekst
        ddl.DataValueField = Sifra
        ddl.DataBind()
    End Sub

    Private Sub PopuniDDL_1KOLONA(ddl As DropDownList, Upit As String, Sifra As String)
        Dim dsDDL As DataSet = b.DajDS_IzUpita_Lokal(Upit, BORZALConnectionString)
        ddl.DataSource = dsDDL
        ddl.DataValueField = Sifra
        ddl.DataBind()
    End Sub

#End Region
#Region "TXT-COMBO-CHK CHANGE"
    Private Sub txtDATUMPRIJEMAOD_TextChanged(sender As Object, e As EventArgs) Handles txtDATUMPRIJEMAOD.TextChanged
        If Me.txtDATUMPRIJEMADO.Visible = "false" Then
            Me.txtDATUMPRIJEMADO.Visible = "True"
        End If
        Me.PopuniTabeluMB()
    End Sub
    Private Sub txtDATUMPRIJEMADO_TextChanged(sender As Object, e As EventArgs) Handles txtDATUMPRIJEMADO.TextChanged
        Me.PopuniTabeluMB()
    End Sub
    Private Sub DDLBROJ_TextChanged(sender As Object, e As EventArgs) Handles DDLBROJ.TextChanged
        PopuniTabeluMB()
    End Sub
    Private Sub DDLNAZIV_TextChanged(sender As Object, e As EventArgs) Handles DDLNAZIV.TextChanged
        PopuniTabeluMB()
    End Sub
#End Region
End Class