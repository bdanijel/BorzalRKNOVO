Imports System.Data
Imports System.IO
Imports Microsoft.Reporting.WebForms

Partial Class rRazlika
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
            'PopuniCOMBO()
            PopuniTabeluMB()
        End If

    End Sub
    Private Function DajPO(ByVal ID_Korisnika As String) As String
        Dim PO As String = ""
        Dim UpitPO As String = "Select PodOd3 FROM v_AdresarZaposlenih WHERE (idenr = '" & ID_Korisnika & "')"
        PO = b.DajScalarSTR_IzUpita_LOKAL(UpitPO, BORZALConnectionString)
        Return PO
    End Function
    Private Sub PopuniTabeluMB()
        Dim SelectSQL, WhereSQL As String
        Dim UpitMB As String = ""

        SessionUpit()
        SelectSQL = Session("UpitRazlika")
        'UslovWHERE()

        'If Session("WhereSQL") = DBNull.Value.ToString() Or Trim(Session("WhereSQL")) = "" Then
        '    Session("WhereSQL") = ""
        'End If
        'WhereSQL = Session("WhereSQL")


        Dim rp1 As ReportParameter = New ReportParameter("DatumOD", txtDATUMPRIJEMAOD.Text.ToString())
        Dim rp2 As ReportParameter = New ReportParameter("DatumDO", txtDATUMPRIJEMADO.Text.ToString())


        'ReportViewer1.LocalReport.DataSources.Clear()
        ReportViewer1.LocalReport.ReportPath = "Izvestaji\rRazlika.rdlc"
        ReportViewer1.LocalReport.SetParameters(New ReportParameter() {rp1, rp2})
        'rwOmotSpisa.LocalReport.DataSources.Add(rds)
        Session("UpitRazlika") = SelectSQL
        ReportViewer1.LocalReport.Refresh()




        'Session("UpitRazlika") = SelectSQL

        'ReportViewer1.LocalReport.Refresh()


    End Sub
    Protected Sub SessionUpit()
        Dim SelectSQL As String
        Dim DatumPrijemaOD As String = ""
        Dim DatumPrijemaDO As String = ""

        If txtDATUMPRIJEMAOD.Text <> "" Then
            DatumPrijemaOD = b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMAOD.Text()))
        End If

        If txtDATUMPRIJEMADO.Text <> "" Then
            DatumPrijemaDO = b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMADO.Text()))
        End If



        'SelectSQL = "with TrebovanjeSumarDATUM as (SELECT dbo.sirovine.ID, dbo.sirovine.NAZIV, SUM(dbo.trebovanje.KOLICINA) AS TrebovanoUkupno, dbo.sirovine.JM, dbo.trebovanje.DATUM FROM  dbo.sirovine INNER JOIN dbo.trebovanje ON dbo.sirovine.ID = dbo.trebovanje.ID_SIROVINE GROUP BY dbo.sirovine.ID, dbo.sirovine.NAZIV, dbo.sirovine.JM, dbo.trebovanje.DATUM having trebovanje.DATUM >= '1.1.2019' and trebovanje.DATUM <= '1.1.2020'), TrebovanjeSumar as (select id,naziv,  JM, sum(TrebovanoUkupno) as TrebovanjeUkupnoSUMAR FROM TrebovanjeSumarDATUM group by id,naziv,jm), UtrosenoSumarDATUM as (SELECT ID, NAZIV, JM, SUM(Utroseno) AS UtrosenoUkupno, DATUM FROM dbo.vUtrosenoDATUM GROUP BY ID, NAZIV, JM, DATUM HAVING DATUM >= '1.1.2019' and DATUM <= '1.1.2020'), UtrosenoSumar as (select ID,naziv,jm,SUM(UtrosenoUkupno) as UtrosenoUkupnoSUMAR FROM UtrosenoSumarDATUM group by ID, NAZIV,jm) select TrebovanjeSumar.id, TrebovanjeSumar.naziv, TrebovanjeSumar.jm, TrebovanjeUkupnoSUMAR,UtrosenoUkupnoSUMAR, (TrebovanjeUkupnoSUMAR - UtrosenoUkupnoSUMAR) as Razlika FROM TrebovanjeSumar join UtrosenoSumar on TrebovanjeSumar.ID=UtrosenoSumar.ID"

        If DatumPrijemaOD <> "" And DatumPrijemaOD <> "0" And DatumPrijemaDO <> "" And DatumPrijemaDO <> "0" Then
            SelectSQL = "with TrebovanjeSumarDATUM as (SELECT dbo.sirovine.ID, dbo.sirovine.NAZIV, SUM(dbo.trebovanje.KOLICINA) AS TrebovanoUkupno, dbo.sirovine.JM, dbo.trebovanje.DATUM FROM  dbo.sirovine INNER JOIN dbo.trebovanje ON dbo.sirovine.ID = dbo.trebovanje.ID_SIROVINE GROUP BY dbo.sirovine.ID, dbo.sirovine.NAZIV, dbo.sirovine.JM, dbo.trebovanje.DATUM having trebovanje.DATUM >=" & "'" & DatumPrijemaOD & "'" & " and trebovanje.DATUM <= " & "'" & DatumPrijemaDO & "'" & "), TrebovanjeSumar as (select id,naziv,  JM, sum(TrebovanoUkupno) as TrebovanjeUkupnoSUMAR FROM TrebovanjeSumarDATUM group by id,naziv,jm), UtrosenoSumarDATUM as (SELECT ID, NAZIV, JM, SUM(Utroseno) AS UtrosenoUkupno, DATUM FROM dbo.vUtrosenoDATUM GROUP BY ID, NAZIV, JM, DATUM HAVING DATUM >= " & "'" & DatumPrijemaOD & "'" & " and DATUM <= " & "'" & DatumPrijemaDO & "'" & "), UtrosenoSumar as (select ID,naziv,jm,SUM(UtrosenoUkupno) as UtrosenoUkupnoSUMAR FROM UtrosenoSumarDATUM group by ID, NAZIV,jm) select TrebovanjeSumar.id, TrebovanjeSumar.naziv, TrebovanjeSumar.jm, TrebovanjeUkupnoSUMAR,UtrosenoUkupnoSUMAR, (TrebovanjeUkupnoSUMAR - UtrosenoUkupnoSUMAR) as Razlika FROM TrebovanjeSumar join UtrosenoSumar on TrebovanjeSumar.ID=UtrosenoSumar.ID"
        Else
            SelectSQL = "with TrebovanjeSumarDATUM as (SELECT dbo.sirovine.ID, dbo.sirovine.NAZIV, SUM(dbo.trebovanje.KOLICINA) AS TrebovanoUkupno, dbo.sirovine.JM, dbo.trebovanje.DATUM FROM  dbo.sirovine INNER JOIN dbo.trebovanje ON dbo.sirovine.ID = dbo.trebovanje.ID_SIROVINE GROUP BY dbo.sirovine.ID, dbo.sirovine.NAZIV, dbo.sirovine.JM, dbo.trebovanje.DATUM having trebovanje.DATUM >= '1.1.2019' and trebovanje.DATUM <= '1.1.2020'), TrebovanjeSumar as (select id,naziv,  JM, sum(TrebovanoUkupno) as TrebovanjeUkupnoSUMAR FROM TrebovanjeSumarDATUM group by id,naziv,jm), UtrosenoSumarDATUM as (SELECT ID, NAZIV, JM, SUM(Utroseno) AS UtrosenoUkupno, DATUM FROM dbo.vUtrosenoDATUM GROUP BY ID, NAZIV, JM, DATUM HAVING DATUM >= '1.1.2019' and DATUM <= '1.1.2020'), UtrosenoSumar as (select ID,naziv,jm,SUM(UtrosenoUkupno) as UtrosenoUkupnoSUMAR FROM UtrosenoSumarDATUM group by ID, NAZIV,jm) select TrebovanjeSumar.id, TrebovanjeSumar.naziv, TrebovanjeSumar.jm, TrebovanjeUkupnoSUMAR,UtrosenoUkupnoSUMAR, (TrebovanjeUkupnoSUMAR - UtrosenoUkupnoSUMAR) as Razlika FROM TrebovanjeSumar join UtrosenoSumar on TrebovanjeSumar.ID=UtrosenoSumar.ID"

        End If

        Session("UpitRazlika") = SelectSQL
    End Sub
    Protected Sub UslovWHERE()
        Dim WhereSQL As String = ""
        Dim DatumPrijemaOD As String = ""
        Dim DatumPrijemaDO As String = ""

        If txtDATUMPRIJEMAOD.Text <> "" Then
            DatumPrijemaOD = b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMAOD.Text()))
        End If

        If txtDATUMPRIJEMADO.Text <> "" Then
            DatumPrijemaDO = b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMADO.Text()))
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
        'If DatumPrijemaOD <> "" And DatumPrijemaOD <> "0" And DatumPrijemaDO <> "" And DatumPrijemaDO <> "0" Then
        '    If WhereSQL = "" Then
        '        WhereSQL = "(DATUMPUTOVANJA >=  N'" & DatumPrijemaOD & "') AND (DATUMPUTOVANJA <= N'" & DatumPrijemaDO & "')"
        '    Else
        '        WhereSQL = WhereSQL & " AND (DATUMPUTOVANJA >=  N'" & DatumPrijemaOD & "') AND (DATUMPUTOVANJA <= N'" & DatumPrijemaDO & "')"
        '    End If
        'End If




        If WhereSQL <> "" Then
            Session("WhereSQL") = " WHERE (" & WhereSQL & ")"
        Else
            Session("WhereSQL") = ""
        End If

    End Sub
#Region "COMBO PRETRAGA"
    Private Sub PopuniCOMBO()

        'Dim UpitGODINA As String = "SELECT DISTINCT GODINA FROM vDELOVODNIK WHERE (PODOD3 = '" & "1" & "') ORDER BY GODINA desc"
        'PopuniDDL_1KOLONA(DDLGODINA, UpitGODINA, "GODINA")


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
    Protected Sub DDLGODINA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLGODINA.SelectedIndexChanged
        PopuniTabeluMB()
    End Sub
    Private Sub txtDATUMPRIJEMAOD_TextChanged(sender As Object, e As EventArgs) Handles txtDATUMPRIJEMAOD.TextChanged
        If Me.txtDATUMPRIJEMADO.Visible = "false" Then
            Me.txtDATUMPRIJEMADO.Visible = "True"
        End If
        Me.PopuniTabeluMB()
    End Sub
    Private Sub txtDATUMPRIJEMADO_TextChanged(sender As Object, e As EventArgs) Handles txtDATUMPRIJEMADO.TextChanged
        Me.PopuniTabeluMB()
    End Sub
#End Region
End Class