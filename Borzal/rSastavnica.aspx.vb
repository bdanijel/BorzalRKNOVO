Imports System.Data
Imports System.Globalization
Imports System.IO
Imports Microsoft.Reporting.WebForms

Partial Class rSastavnica
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
        PopuniCOMBO()
        SessionUpit()
    End Sub
    Private Sub PopuniTabeluMB()
        Dim SelectSQL, WhereSQL As String
        Dim UpitMB As String = ""

        SessionUpit()
        SelectSQL = Session("UpitSastavnica")
        UslovWHERE()

        If Session("WhereSQL") = DBNull.Value.ToString() Or Trim(Session("WhereSQL")) = "" Then
            Session("WhereSQL") = ""
        End If
        WhereSQL = Session("WhereSQL")



        Session("UpitSastavnica") = SelectSQL + WhereSQL + " ORDER BY BROJ2,BROJ, RBR"

        ReportViewer1.LocalReport.Refresh()


    End Sub
    Protected Sub SessionUpit()
        Dim SelectSQL As String
        Dim DatumPrijemaOD As String = ""
        Dim DatumPrijemaDO As String = ""

        SelectSQL = "SELECT *,DATALENGTH(BROJ) as broj2 FROM vSASTAVNICA"

        Session("UpitSastavnica") = SelectSQL
    End Sub
    Protected Sub UslovWHERE()
        Dim WhereSQL As String = ""
        Dim DatumPrijemaOD As String = ""
        Dim DatumPrijemaDO As String = ""

        'Dim BROJ As String = Trim(Me.DDLBROJ.SelectedValue.ToString())

        ''BROJ DDL
        'If BROJ <> "" And BROJ <> "0" Then
        '    If WhereSQL = "" Then
        '        WhereSQL = "(BROJ = '" & BROJ & "')"
        '    Else
        '        WhereSQL = WhereSQL & " AND (BROJ = '" & BROJ & "')"
        '    End If
        'End If

        Session("WhereSQL") = ""

        If WhereSQL <> "" Then
            Session("WhereSQL") = " WHERE (" & WhereSQL & ")"
        Else
            Session("WhereSQL") = ""
        End If

    End Sub
#Region "COMBO PRETRAGA"
    Private Sub PopuniCOMBO()

        'Dim UpitBROJ As String = "SELECT DISTINCT BROJ FROM vSASTAVNICA ORDER BY BROJ"
        'PopuniDDL_1KOLONA(DDLBROJ, UpitBROJ, "BROJ")
        'DDLBROJ.Items.Insert(0, New ListItem("- - Izaberite broj sastavnice - -", "0"))


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

    'Private Sub DDLBROJ_TextChanged(sender As Object, e As EventArgs) Handles DDLBROJ.TextChanged
    '    PopuniTabeluMB()
    'End Sub

#End Region
End Class