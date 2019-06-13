Imports System.Data
Imports System.Globalization
Imports System.IO
Imports Microsoft.Reporting.WebForms

Partial Class rProizvod
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
        Dim SelectSQL As String
        Dim UpitMB As String = ""

        SessionUpit()
        SelectSQL = Session("UpitProizvod")
        'UslovWHERE()

        'If Session("WhereSQL") = DBNull.Value.ToString() Or Trim(Session("WhereSQL")) = "" Then
        '    Session("WhereSQL") = ""
        'End If
        'WhereSQL = Session("WhereSQL")


        Session("UpitProizvod") = SelectSQL

        ReportViewer1.LocalReport.Refresh()


    End Sub
    Protected Sub SessionUpit()
        Dim SelectSQL As String
        Dim DatumPrijemaOD As String = ""
        Dim DatumPrijemaDO As String = ""

        SelectSQL = "SELECT ID,NAZIV FROM PROIZVOD"

        Session("UpitProizvod") = SelectSQL
    End Sub
    Protected Sub UslovWHERE()
        Dim WhereSQL As String = ""
        Dim DatumPrijemaOD As String = ""
        Dim DatumPrijemaDO As String = ""

        Session("WhereSQL") = ""

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
End Class