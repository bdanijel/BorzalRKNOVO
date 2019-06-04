Imports System.Data
Imports System.IO

Partial Class rDelovodnik
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim PISARNICAConnectionString As String = b.ConnString_PISARNICA
    Dim ImaAdminPrava As Integer = 0
    Dim ImaPrava As Integer = 0



    Private Sub Poruka_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True

        If Session("godina") = Nothing Then
            Session("godina") = Year(Today)
        Else
            Me.txtGodina.Text = Session("godina")
        End If


        If Session("korisnik_ID") = Nothing Or Trim(Session("korisnik_ID")) = "" Then
            Session("korisnik_ID") = Me.txtID_Korisnika.Text.ToString()
        Else
            Me.txtID_Korisnika.Text = Session("korisnik_ID")
        End If


        Dim PO As String = DajPO(Trim(Me.txtID_Korisnika.Text))

        If Session("korisnik_ID") = Nothing Or Trim(Session("korisnik_ID")) = "" Or Session("korisnik_ID") = "-1" Then
            Session.Add("MorasSeLogovat", 2)
            Response.Redirect(ResolveClientUrl("~/LogOut.aspx"), True)
        Else
            Me.txtID_Korisnika.Text = Session("korisnik_ID")
        End If

        ImaPrava = b.ProveraKorisnikPosao(Session("korisnik_ID"), Path.GetFileName(Request.PhysicalPath))

        If ImaPrava = 0 Then
            Response.Redirect(ResolveClientUrl("~/Home.aspx"), True)
        End If


        If Not Page.IsPostBack Then
            PopuniCOMBO(PO)
            PopuniTabeluMB()
        End If

    End Sub
    Private Function DajPO(ByVal ID_Korisnika As String) As String
        Dim PO As String = ""
        Dim UpitPO As String = "Select PodOd3 FROM v_AdresarZaposlenih WHERE (idenr = '" & ID_Korisnika & "')"
        PO = b.DajScalarSTR_IzUpita_LOKAL(UpitPO, PISARNICAConnectionString)
        Return PO
    End Function
    Private Sub PopuniTabeluMB()
        Dim SelectSQL, WhereSQL As String
        Dim UpitMB As String = ""

        SessionUpit()
        SelectSQL = Session("UpitDelovodnik")
        UslovWHERE()

        If Session("WhereSQL") = DBNull.Value.ToString() Or Trim(Session("WhereSQL")) = "" Then
            Session("WhereSQL") = ""
        End If
        WhereSQL = Session("WhereSQL")

        Session("UpitDelovodnik") = SelectSQL + WhereSQL

        'lblPoruka3.Text = Session("UpitDelovodnik")

        'Ponovo poziva ReportViewer!!!!
        ReportViewer1.LocalReport.Refresh()


    End Sub
    Protected Sub SessionUpit()
        Dim SelectSQL As String
        Dim PO As String = DajPO(Trim(Me.txtID_Korisnika.Text()))
        If PO = "200" Then
            SelectSQL = "SELECT [godina],[rbr],[podbroj],[PodOd3],[korisnik],dbo.ufnSrediDatumPrikaz([datumPrijema]) as datumPrijema,[DelovodniBroj],[tekst],dbo.ufnSrediDatumPrikaz([datumRazvoda]) as datumRazvoda, primedba, NazOrgJed FROM [dbo].[vDelovodnik]"
        Else
            SelectSQL = "SELECT [godina],[rbr],[podbroj],[PodOd3],[korisnik],dbo.ufnSrediDatumPrikaz([datumPrijema]) as datumPrijema,[DelovodniBroj],[tekst],dbo.ufnSrediDatumPrikaz([datumRazvoda]) as datumRazvoda, primedba, NazOrgJed FROM [dbo].[vDelovodnik]"
        End If

        Session("UpitDelovodnik") = SelectSQL
    End Sub
    Protected Sub UslovWHERE()
        Dim WhereSQL As String = ""
        Dim PO As String = DajPO(Trim(Me.txtID_Korisnika.Text()))
        Dim GODINA As String = Trim(Me.DDLGODINA.SelectedValue.ToString())
        Dim DatumPrijemaOD As String = ""
        Dim DatumPrijemaDO As String = ""

        'If txtDATUMPRIJEMAOD.Text <> "" Then
        '    DatumPrijemaOD = b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMAOD.Text()))
        'End If

        'If txtDATUMPRIJEMADO.Text <> "" Then
        '    DatumPrijemaDO = b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMADO.Text()))
        'End If

        'If chkAnketar.Checked = True Then
        '    Anketar = 1
        'Else
        '    Anketar = 0
        'End If

        Session("WhereSQL") = ""

        'PODOD3
        If PO <> "" And PO <> "0" Then
            If WhereSQL = "" Then
                WhereSQL = "(PodOd3 = N'" & PO & "')"
            Else
                WhereSQL = WhereSQL & " AND (PodOd3 = N'" & PO & "')"
            End If
        End If

        'GODINA DDL
        If GODINA <> "" And GODINA <> "0" Then
            If WhereSQL = "" Then
                WhereSQL = "(GODINA = N'" & GODINA & "')"
            Else
                WhereSQL = WhereSQL & " AND (GODINA = N'" & GODINA & "')"
            End If
        End If


        ''DATUMPUTOVANJA
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
    Private Sub PopuniCOMBO(ByVal PO As String)
        If PO = "200" Then

            Dim UpitGODINA As String = "SELECT DISTINCT GODINA FROM vDELOVODNIK WHERE (PODOD3 = '" & PO & "') ORDER BY GODINA desc"
            PopuniDDL_1KOLONA(DDLGODINA, UpitGODINA, "GODINA")


            'txtDATUMPRIJEMADO.Text = ""
            'txtDATUMPRIJEMAOD.Text = ""
            'txtDATUMPRIJEMADO.Visible = False

        Else

            Dim UpitGODINA As String = "SELECT DISTINCT GODINA FROM vDELOVODNIK WHERE (PODOD3 = '" & PO & "') ORDER BY GODINA desc"
            PopuniDDL_1KOLONA(DDLGODINA, UpitGODINA, "GODINA")


            'txtDATUMPRIJEMADO.Text = ""
            'txtDATUMPRIJEMAOD.Text = ""
            'txtDATUMPRIJEMADO.Visible = False

        End If
    End Sub
    Private Sub PopuniDDL(ddl As DropDownList, Upit As String, Tekst As String, Sifra As String)
        Dim dsDDL As DataSet = b.DajDS_IzUpita_Lokal(Upit, PISARNICAConnectionString)
        ddl.DataSource = dsDDL
        ddl.DataTextField = Tekst
        ddl.DataValueField = Sifra
        ddl.DataBind()
    End Sub

    Private Sub PopuniDDL_1KOLONA(ddl As DropDownList, Upit As String, Sifra As String)
        Dim dsDDL As DataSet = b.DajDS_IzUpita_Lokal(Upit, PISARNICAConnectionString)
        ddl.DataSource = dsDDL
        ddl.DataValueField = Sifra
        ddl.DataBind()
    End Sub

#End Region
#Region "TXT-COMBO-CHK CHANGE"
    Protected Sub DDLGODINA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLGODINA.SelectedIndexChanged
        PopuniTabeluMB()
    End Sub
#End Region
End Class