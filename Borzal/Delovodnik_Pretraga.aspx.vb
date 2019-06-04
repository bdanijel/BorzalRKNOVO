Imports System.Data
Imports System.IO
Imports System.Drawing
Imports System.Diagnostics

Partial Class Delovodnik_Pretraga
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim PISARNICAConnectionString As String = b.ConnString_PISARNICA
    'MOŽDA NEĆE TREBATI                                                                                                        
    Dim ImaAdminPrava As Integer = 0
    Dim ImaPrava As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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

        ImaPrava = b.ProveraKorisnikPosao(Session("korisnik_ID"), Path.GetFileName(Request.PhysicalPath))

        If ImaPrava = 0 Then
            Response.Redirect(ResolveClientUrl("~/Home.aspx"), True)
        End If

        If Not Page.IsPostBack Then
            PopuniCOMBO(PO)
            PopuniTabeluMB()
        End If
    End Sub

#Region "GENERISANJE MB"
    Protected Sub ResetClick(Source As Object, E As EventArgs)
        Dim PO As String = DajPO(Trim(Me.txtID_Korisnika.Text))
        PopuniCOMBO(PO)
        SessionUpit()
    End Sub
    Private Function DajPO(ByVal ID_Korisnika As String) As String
        Dim PO As String = ""
        Dim UpitPO As String = "SELECT PodOd3 FROM v_AdresarZaposlenih WHERE (idenr = '" & ID_Korisnika & "')"
        PO = b.DajScalarSTR_IzUpita_LOKAL(UpitPO, PISARNICAConnectionString)
        Return PO
    End Function
    Private Sub PopuniTabeluMB()
        Dim SelectSQL, WhereSQL As String
        Dim UpitMB As String = ""
        MBListaTitle.InnerHtml = "Списак редова у деловоднику"

        SessionUpit()
        SelectSQL = Session("UpitMB")
        UslovWHERE()

        'lblPoruka1.text = "UslovWHERE = " & Session("WhereSQL")

        If Session("WhereSQL") = DBNull.Value.ToString() Or Trim(Session("WhereSQL")) = "" Then
            Session("WhereSQL") = ""
        End If
        WhereSQL = Session("WhereSQL")

        Session("UpitMB") = SelectSQL + WhereSQL

        Me.gvMB.EmptyDataText = "Без података"
        Me.gvMB.DataBind()
    End Sub
    Protected Sub SessionUpit()
        Dim SelectSQL As String
        Dim PO As String = DajPO(Trim(Me.txtID_Korisnika.Text()))
        If PO = "200" Then
            'ako BG želi da vidi sve
            SelectSQL = "SELECT GODINA, RBR, PODBROJ, PODOD3, TEKST, PRIMEDBA, DATUMPRIJEMA, KLASIFIKACIONIBROJID, KLASIFIKACIONIBROJ, DELOVODNIBROJ, POPISAKATA, AKTIVANPOPISAKATA, PREUZEO,INDLINKZADOKUMENT,LINKZADOKUMENT FROM vDELOVODNIK WHERE PODOD3 = " & PO
        Else
            SelectSQL = "SELECT GODINA, RBR, PODBROJ, PODOD3, TEKST, PRIMEDBA, DATUMPRIJEMA, KLASIFIKACIONIBROJID, KLASIFIKACIONIBROJ, DELOVODNIBROJ, POPISAKATA, AKTIVANPOPISAKATA, PREUZEO,INDLINKZADOKUMENT,LINKZADOKUMENT FROM vDELOVODNIK  WHERE PODOD3 = " & PO
        End If

        Session("UpitMB") = SelectSQL

    End Sub
    Protected Sub UslovWHERE()
        Dim WhereSQL As String = ""
        Dim PO As String = DajPO(Trim(Me.txtID_Korisnika.Text()))
        'Dim PodOd2ID As String = Trim(Me.DDLPO.SelectedValue.ToString())
        Dim GODINA As String = Trim(Me.DDLGODINA.SelectedValue.ToString())
        Dim KLASIFIKACIONIBROJID As String = Trim(Me.DDLKLASIFIKACIONIBROJID.SelectedValue.ToString())
        Dim tekst As String = Trim(Me.DDLTEKST.SelectedValue.ToString())
        Dim PRIMEDBA As String = Trim(Me.DDLPRIMEDBA.SelectedValue.ToString())
        Dim ORGJEDID As String = Trim(Me.DDLORGJEDID.SelectedValue.ToString())
        Dim NAMENJENO As String = Trim(Me.DDLNAMENJENO.SelectedValue.ToString())
        Dim DatumPrijemaOD As String = ""
        Dim DatumPrijemaDO As String = ""
        Dim PopisAkata As String
        Dim Preuzeo As String
        Dim INDLinkZaDokument As String
        Dim Racun As String

        If txtDATUMPRIJEMAOD.Text <> "" Then
            DatumPrijemaOD = b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMAOD.Text()))
        End If

        If txtDATUMPRIJEMADO.Text <> "" Then
            DatumPrijemaDO = b.DajDatumIzStringa(Trim(Me.txtDATUMPRIJEMADO.Text()))
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

        If chkRacun.Checked = True Then
            Racun = 1
        Else
            Racun = 0
        End If


        Session("WhereSQL") = ""


        'PODOD3
        If PO <> "" And PO <> "0" Then
            If WhereSQL = "" Then
                WhereSQL = "(PodOd3 = N'" & PO & "')"
            Else
                WhereSQL = WhereSQL & " AND (PodOd3 = N'" & PO & "')"
            End If
        End If

        'godina DDL
        If GODINA <> "" And GODINA <> "0" Then
            If WhereSQL = "" Then
                WhereSQL = "(GODINA = '" & GODINA & "')"
            Else
                WhereSQL = WhereSQL & " AND (GODINA = '" & GODINA & "')"
            End If
        End If
        'KLASIFIKACIONIBROJID DDL
        If KLASIFIKACIONIBROJID <> "" And KLASIFIKACIONIBROJID <> "0" Then
            If WhereSQL = "" Then
                WhereSQL = "(KLASIFIKACIONIBROJID = '" & KLASIFIKACIONIBROJID & "')"
            Else
                WhereSQL = WhereSQL & " AND (KLASIFIKACIONIBROJID = '" & KLASIFIKACIONIBROJID & "')"
            End If
        End If
        'TEKST - OPIS DDL
        If tekst <> "" And tekst <> "0" Then
            If WhereSQL = "" Then
                WhereSQL = "(tekst = N'" & tekst & "')"
            Else
                WhereSQL = WhereSQL & " AND (tekst = N'" & tekst & "')"
            End If
        End If
        'PRIMEDBA DDL
        If PRIMEDBA <> "" And PRIMEDBA <> "0" And PRIMEDBA <> "NULL" Then
            If WhereSQL = "" Then
                WhereSQL = "(PRIMEDBA = N'" & PRIMEDBA & "')"
            Else
                WhereSQL = WhereSQL & " AND (PRIMEDBA = N'" & PRIMEDBA & "')"
            End If
        End If
        'ORGJEDID DDL
        If ORGJEDID <> "" And ORGJEDID <> "0" And ORGJEDID <> "NULL" Then
            If WhereSQL = "" Then
                WhereSQL = "(ORGJEDID = N'" & ORGJEDID & "')"
            Else
                WhereSQL = WhereSQL & " AND (ORGJEDID = N'" & ORGJEDID & "')"
            End If
        End If
        'NAMENJENO DDL
        If NAMENJENO <> "" And NAMENJENO <> "0" And NAMENJENO <> "NULL" Then
            If WhereSQL = "" Then
                WhereSQL = "(NAMENJENO = N'" & NAMENJENO & "')"
            Else
                WhereSQL = WhereSQL & " AND (NAMENJENO = N'" & NAMENJENO & "')"
            End If
        End If
        'DATUMPRIJEMA
        If DatumPrijemaOD <> "" And DatumPrijemaOD <> "0" And DatumPrijemaOD <> "NULL" And DatumPrijemaDO <> "" And DatumPrijemaDO <> "0" And DatumPrijemaDO <> "NULL" Then
            If WhereSQL = "" Then
                WhereSQL = "(DATUMPRIJEMA >=  N'" & DatumPrijemaOD & "') AND (DATUMPRIJEMA <= N'" & DatumPrijemaDO & "')"
            Else
                WhereSQL = WhereSQL & " AND (DATUMPRIJEMA >=  N'" & DatumPrijemaOD & "') AND (DATUMPRIJEMA <= N'" & DatumPrijemaDO & "')"
            End If
        End If
        'PopisAkata CHKBOX
        If PopisAkata <> "" And PopisAkata <> "0" And PopisAkata <> "FALSE" Then
            If WhereSQL = "" Then
                WhereSQL = "(PopisAkata = " & PopisAkata & ")"
            Else
                WhereSQL = WhereSQL & " AND (PopisAkata = " & PopisAkata & ")"
            End If
        End If
        'Preuzeo CHKBOX
        If Preuzeo <> "" And Preuzeo <> "0" And Preuzeo <> "FALSE" Then
            If WhereSQL = "" Then
                WhereSQL = "(Preuzeo = " & Preuzeo & ")"
            Else
                WhereSQL = WhereSQL & " AND (Preuzeo = " & Preuzeo & ")"
            End If
        End If
        'INDLinkZaDokument CHKBOX
        If INDLinkZaDokument <> "" And INDLinkZaDokument <> "0" And INDLinkZaDokument <> "FALSE" Then
            If WhereSQL = "" Then
                WhereSQL = "(INDLinkZaDokument = " & INDLinkZaDokument & ")"
            Else
                WhereSQL = WhereSQL & " AND (INDLinkZaDokument = " & INDLinkZaDokument & ")"
            End If
        End If
        'Racun CHKBOX
        If Racun <> "" And Racun <> "0" And Racun <> "FALSE" Then
            If WhereSQL = "" Then
                WhereSQL = "(KlasifikacioniBrojID = '404') AND (rbr = '2')"
            Else
                WhereSQL = WhereSQL & " AND (KlasifikacioniBrojID = '404') AND (rbr = '2')"
            End If
        End If



        If WhereSQL <> "" Then
            Session("WhereSQL") = " AND (" & WhereSQL & ")"
        Else
            Session("WhereSQL") = ""
        End If



        'lblPoruka2.Text = "DatumOD = " & DatumPrijemaOD
        'lblPoruka3.Text = "DatumDO = " & DatumPrijemaDO


    End Sub
    Protected Sub gvMB_DataBound(sender As Object, e As EventArgs) Handles gvMB.DataBound
        If Me.gvMB.Rows.Count > 0 Then
            Me.gvMB.HeaderRow.Cells(1).Visible = False
            Me.gvMB.HeaderRow.Cells(2).Visible = False
            'Me.gvMB.HeaderRow.Cells(4).CssClass = "text-center width-30"
            'Me.gvMB.HeaderRow.Cells(5).CssClass = "text-center width-30"
            'Me.gvMB.HeaderRow.Cells(6).CssClass = "text-center width-30"
            'Me.gvMB.HeaderRow.Cells(7).CssClass = "text-center width-30"
        End If
    End Sub
    Protected Sub gvMB_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles gvMB.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            e.Row.Cells(1).Visible = False
            e.Row.Cells(2).Visible = False
            'e.Row.Cells(4).CssClass = "text-center width-30"
            'e.Row.Cells(5).CssClass = "text-center width-30"
            'e.Row.Cells(6).CssClass = "text-center width-30"
            'e.Row.Cells(7).CssClass = "text-center width-30"


            Dim Ikonica_DA As String = "<i class=""icon-checkmark3 text-info""></i>"
            Dim Ikonica_NE As String = "<i class=""icon-minus3 text-purple-300""></i>"


            Dim POPISAKATA As String = e.Row.Cells(11).Text
            Dim AktivanPopisAkata As String = e.Row.Cells(12).Text
            Dim PREUZET As String = e.Row.Cells(13).Text
            Dim PRILOG As String = e.Row.Cells(14).Text


            'POPISAKATA
            If POPISAKATA = "True" Then
                e.Row.Cells(11).Text = Ikonica_DA
            Else
                e.Row.Cells(11).Text = Ikonica_NE
            End If
            'AktivanPopisAkata
            If AktivanPopisAkata = "True" Then
                e.Row.Cells(12).Text = Ikonica_DA
            Else
                e.Row.Cells(12).Text = Ikonica_NE
            End If
            'PREUZET
            If PREUZET = "True" Then
                e.Row.Cells(13).Text = Ikonica_DA
            Else
                e.Row.Cells(13).Text = Ikonica_NE
            End If
            'PRILOG
            If PRILOG = "True" Then
                e.Row.Cells(14).Text = Ikonica_DA
            Else
                e.Row.Cells(14).Text = Ikonica_NE
            End If

            Dim btnMBIzmena As LinkButton = DirectCast(e.Row.Cells(0).FindControl("btnMBIzmena"), LinkButton)
            Dim SpanMBIzmena As HtmlGenericControl = DirectCast(e.Row.Cells(0).FindControl("SpanMBIzmena"), HtmlGenericControl)



            Dim IkonicaKraj_DA As String = "<i class=""icon-checkmark3 text-info""></i>"
            Dim IkonicaKraj_NE As String = "<i class=""icon-minus3 text-purple-300""></i>"
            'Dim IkonicaNePopunjavaZarade As String = "<span class=""text-SDG-12 text-semibold"">Н/У</span>"
            Dim IkonicaNePopunjavaZarade As String = "<i class=""icon-cross2 text-SDG-12""></i>"

            Dim btnExcelExport As LinkButton = TryCast(e.Row.FindControl("btnExcelExport"), LinkButton)
            If btnExcelExport IsNot Nothing Then
                smIzborMB.RegisterPostBackControl(btnExcelExport)
            End If

        End If
    End Sub
    Protected Sub gvMB_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvMB.RowCommand
        Dim index As Integer
        Dim row As GridViewRow
        If e.CommandName = "MBIzmena" Then
            index = Convert.ToInt32(e.CommandArgument)
            row = gvMB.Rows(index)

            'Dim GODINA As String = Me.gvMB.DataKeys(index).Value


            'Dim Godina As String = gvMB.SelectedDataKey.Value.ToString()
            Dim GODINA As String = Me.gvMB.DataKeys(index).Value
            Dim rbr As String = Me.gvMB.DataKeys(index).Values(1)
            Dim podbroj As String = Me.gvMB.DataKeys(index).Values(2)
            Dim podod3 As Integer = Me.gvMB.DataKeys(index).Values(3)
            'Dim Rbr As Integer = gvMB.SelectedDataKey(0).Values("rbr")
            'Dim PodBroj As Integer = gvMB.SelectedDataKey(0).Values("podbroj")
            'Dim PodOd As String = gvMB.SelectedDataKey(0).Values("podod").ToString()




            'String ProductID = gvMyGridView.DataKeys[gvr.RowIndex].Values["ProductID"].ToString()
            'String ItemID = gvMyGridView.DataKeys[gvr.RowIndex].Values["ItemID"].ToString()
            'String OrderID = gvMyGridView.DataKeys[gvr.RowIndex].Values["OrderID"].ToString()


            Session("GODINA_pretraga") = GODINA
            Session("Rbr_pretraga") = rbr
            Session("PodBroj_pretraga") = podbroj
            Session("PodOd3_pretraga") = podod3

            Response.Redirect("~/Delovodnik.aspx", True)
        ElseIf e.CommandName = "ExcelExport" Then
            index = Convert.ToInt32(e.CommandArgument)
            row = gvMB.Rows(index)
            Me.gvMB.SelectedIndex = index

            Dim GODINA As String = Me.gvMB.DataKeys(index).Value
            Dim rbr As String = Me.gvMB.DataKeys(index).Values(1)
            Dim podbroj As String = Me.gvMB.DataKeys(index).Values(2)
            Dim podod3 As Integer = Me.gvMB.DataKeys(index).Values(3)

            'Dim GODINA As String = Me.gvMB.DataKeys(index).Value
            EXCEL_Grid(GODINA, rbr, podbroj, podod3)

        End If
    End Sub
#End Region
#Region "COMBO PRETRAGA"
    Private Sub PopuniCOMBO(ByVal PO As String)
        If PO = "200" Then
            Me.DDLGODINA.Enabled = True
            Dim UpitGODINA As String = "SELECT DISTINCT GODINA FROM vDELOVODNIK WHERE (PODOD3 = '" & PO & "') ORDER BY GODINA desc"
            PopuniDDL_1KOLONA(DDLGODINA, UpitGODINA, "GODINA")

            Dim UpitTEKST As String = "SELECT DISTINCT TEKST FROM vDELOVODNIK WHERE (PODOD3 = '" & PO & "') ORDER BY tekst"
            PopuniDDL_1KOLONA(DDLTEKST, UpitTEKST, "tekst")
            DDLTEKST.Items.Insert(0, New ListItem("- - Изаберите опис - -", "0"))

            Dim UpitPRIMEDBA As String = "SELECT DISTINCT PRIMEDBA FROM vDELOVODNIK WHERE (PODOD3 = '" & PO & "') ORDER BY PRIMEDBA"
            PopuniDDL_1KOLONA(DDLPRIMEDBA, UpitPRIMEDBA, "PRIMEDBA")
            DDLPRIMEDBA.Items.Insert(0, New ListItem("- - Изаберите примедбу - -", "0"))

            Me.DDLKLASIFIKACIONIBROJID.Enabled = True
            Dim UpitKLASIFIKACIONIBROJID As String = "SELECT KLASIFIKACIONIBROJID, KLASIFIKACIONIBROJ FROM v_SIF_COMBO_KLASIFIKACIONIBROJ ORDER BY KLASIFIKACIONIBROJ"
            PopuniDDL(DDLKLASIFIKACIONIBROJID, UpitKLASIFIKACIONIBROJID, "KLASIFIKACIONIBROJ", "KLASIFIKACIONIBROJID")
            DDLKLASIFIKACIONIBROJID.Items.Insert(0, New ListItem("- - Изаберите класификацију - -", "0"))

            Dim UpitORGJEDID As String = "SELECT ORGJEDID, NAZORGJED FROM v_SIF_COMBO_ORGJED ORDER BY NAZORGJED"
            PopuniDDL(DDLORGJEDID, UpitORGJEDID, "NAZORGJED", "ORGJEDID")
            DDLORGJEDID.Items.Insert(0, New ListItem("- - Изаберите орг.јединицу - -", "0"))

            Dim UpitNAMENJENO As String = "SELECT IDENR, IMEPREZIME FROM v_SIF_COMBO_NAMENJENO ORDER BY IMEPREZIME"
            PopuniDDL(DDLNAMENJENO, UpitNAMENJENO, "IMEPREZIME", "IDENR")
            DDLNAMENJENO.Items.Insert(0, New ListItem("- - Изаберите запосленог - -", "0"))

            chkPopisAkata.Checked = False
            chkPreuzeo.Checked = False
            chkINDLinkZaDokument.Checked = False

            txtDATUMPRIJEMADO.Text = ""
            txtDATUMPRIJEMAOD.Text = ""
            txtDATUMPRIJEMADO.Visible = False

        Else
            Me.DDLGODINA.Enabled = True
            Dim UpitGODINA As String = "SELECT DISTINCT GODINA FROM vDELOVODNIK WHERE (PODOD3 = '" & PO & "') ORDER BY GODINA desc"
            PopuniDDL_1KOLONA(DDLGODINA, UpitGODINA, "GODINA")

            Dim UpitTEKST As String = "SELECT DISTINCT TEKST FROM vDELOVODNIK WHERE (PODOD3 = '" & PO & "') ORDER BY tekst"
            PopuniDDL_1KOLONA(DDLTEKST, UpitTEKST, "tekst")
            DDLTEKST.Items.Insert(0, New ListItem("- - Изаберите опис - -", "0"))

            Dim UpitPRIMEDBA As String = "SELECT DISTINCT PRIMEDBA FROM vDELOVODNIK WHERE (PODOD3 = '" & PO & "') ORDER BY PRIMEDBA"
            PopuniDDL_1KOLONA(DDLPRIMEDBA, UpitPRIMEDBA, "PRIMEDBA")
            DDLPRIMEDBA.Items.Insert(0, New ListItem("- - Изаберите примедбу - -", "0"))

            Me.DDLKLASIFIKACIONIBROJID.Enabled = True
            Dim UpitKLASIFIKACIONIBROJID As String = "SELECT KLASIFIKACIONIBROJID, KLASIFIKACIONIBROJ FROM v_SIF_COMBO_KLASIFIKACIONIBROJ ORDER BY KLASIFIKACIONIBROJ"
            PopuniDDL(DDLKLASIFIKACIONIBROJID, UpitKLASIFIKACIONIBROJID, "KLASIFIKACIONIBROJ", "KLASIFIKACIONIBROJID")
            DDLKLASIFIKACIONIBROJID.Items.Insert(0, New ListItem("- - Изаберите класификацију - -", "0"))

            Dim UpitORGJEDID As String = "SELECT ORGJEDID, NAZORGJED FROM v_SIF_COMBO_ORGJED ORDER BY NAZORGJED"
            PopuniDDL(DDLORGJEDID, UpitORGJEDID, "NAZORGJED", "ORGJEDID")
            DDLORGJEDID.Items.Insert(0, New ListItem("- - Изаберите орг.јединицу - -", "0"))

            Dim UpitNAMENJENO As String = "SELECT IDENR, IMEPREZIME FROM v_SIF_COMBO_NAMENJENO ORDER BY IMEPREZIME"
            PopuniDDL(DDLNAMENJENO, UpitNAMENJENO, "IMEPREZIME", "IDENR")
            DDLNAMENJENO.Items.Insert(0, New ListItem("- - Изаберите запосленог - -", "0"))

            chkPopisAkata.Checked = False
            chkPreuzeo.Checked = False
            chkINDLinkZaDokument.Checked = False

            txtDATUMPRIJEMADO.Text = ""
            txtDATUMPRIJEMAOD.Text = ""
            txtDATUMPRIJEMADO.Visible = False

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

    Protected Sub DDLGODINA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLGODINA.SelectedIndexChanged, DDLKLASIFIKACIONIBROJID.SelectedIndexChanged, DDLTEKST.SelectedIndexChanged, DDLPRIMEDBA.SelectedIndexChanged, DDLORGJEDID.SelectedIndexChanged, DDLNAMENJENO.SelectedIndexChanged
        Me.PopuniTabeluMB()
    End Sub
    Protected Sub chkPopisAkata_CheckedChanged(sender As Object, e As EventArgs) Handles chkPopisAkata.CheckedChanged
        Me.PopuniTabeluMB()
    End Sub
    Protected Sub chkPreuzeo_CheckedChanged(sender As Object, e As EventArgs) Handles chkPreuzeo.CheckedChanged
        Me.PopuniTabeluMB()
    End Sub
    Protected Sub chkINDLinkZaDokument_CheckedChanged(sender As Object, e As EventArgs) Handles chkINDLinkZaDokument.CheckedChanged
        Me.PopuniTabeluMB()
    End Sub
    Protected Sub chkRacun_CheckedChanged(sender As Object, e As EventArgs) Handles chkRacun.CheckedChanged
        Me.PopuniTabeluMB()
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

#Region "EXCEL EXPORT"
    Protected Sub EXCEL_Grid(ByVal GODINA As Integer, ByVal rbr As Integer, ByVal podbroj As Integer, ByVal podod3 As String)

        Dim ZaposlenID = Trim(Me.txtID_Korisnika.Text())
        Dim i As Integer = 0
        Dim c As Integer = 0
        Dim r As Integer = 0



        Dim IzvestajNaziv As String = GODINA & "GOD_" & rbr & "RBR_" & podod3 & "PODOD3" & "_" & DateTime.Now.ToString("yyyyMMdd_HHmm") & ".xls"
        Dim UpitExcel As String = "SELECT GODINA,PODOD3,delovodnibroj,rbr,podbroj,klasifikacionibrojid, klasifikacionibroj,datumprijema,tekst, primedba, posiljaoc, iznos,orgjedid, nazorgjed, namenjeno,imeprezime,datumrazvoda,PREUZEOKO,DATUMPREUZEO,KLASIFIKACIONIBROJ,SMER FROM a__EXCEL_PregledDelovodnik WHERE (GODINA = '" & GODINA & "') AND (RBR = '" & rbr & "')  AND (PODOD3 = '" & podod3 & "') ORDER BY godina,rbr,podbroj"

        Dim dsExcel As DataSet = b.DajDS_IzUpita_Lokal(UpitExcel, PISARNICAConnectionString)

        If (dsExcel Is Nothing) Then
            Me.gvExcel.EmptyDataText = "Без података"
            Return
        Else
            Me.gvExcel.DataSource = dsExcel
            Me.gvExcel.DataBind()
        End If

        If Me.gvExcel.Rows.Count > 0 Then
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=" & IzvestajNaziv)
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"
            Response.ContentEncoding = Encoding.Unicode
            Response.BinaryWrite(Encoding.Unicode.GetPreamble())
            Using sw As New StringWriter()
                Dim hw As New HtmlTextWriter(sw)
                hw.Write("<style type=""text/css"">caption { font-family: Arial Narrow, sans-serif; color: #333333; font-size: 14pt; font-weight: bold; text-align: left; white-space: nowrap;}</style>")
                'To Export all pages
                Me.gvExcel.AllowPaging = False
                Me.gvExcel.AllowSorting = False
                Me.gvExcel.HeaderRow.Cells(0).Visible = False
                Me.gvExcel.Caption = "<h4>" & GODINA & "GOD_" & rbr & "RBR_" & podod3 & "PODOD3" & "_" & DateTime.Now.ToString("dd.MM.yyyy.") & "</h4>"
                Me.gvExcel.CaptionAlign = TableCaptionAlign.Left

                Me.gvExcel.DataBind()
                'ZAŠTO OVO???
                'b.ArhivaExcelHome(MB, ZaposlenID)

                For Each cell As TableCell In gvExcel.HeaderRow.Cells
                    Dim header As GridViewRow = gvExcel.HeaderRow
                    header.Cells(1).Style.Add("width", "250px")
                    header.Cells(2).Style.Add("width", "250px")
                    header.Cells(3).Style.Add("width", "250px")
                    header.Cells(4).Style.Add("width", "250px")
                    header.Cells(6).Style.Add("width", "250px")
                    cell.Style.Add("background-color", "#1976D2;")
                    cell.Style.Add("vertical-align", "middle")
                    cell.Style.Add("text-Underline", "None")
                    cell.Style.Add("color", "#FFFFFF")
                    cell.Style.Add("text-wrap", "none")
                    cell.Style.Add("word-wrap", "normal")
                    cell.Style.Add("border", "thin solid #ffffff")
                    cell.Style.Add("font-family", "Arial Narrow")
                    cell.Style.Add("font-size", "10pt")
                    cell.Style.Add("height", "25pt")
                    cell.Style.Add("width", "80px")
                    cell.Wrap = True
                Next
                For Each row As GridViewRow In gvExcel.Rows
                    row.Font.Name = "Arial Narrow"
                    For Each cell As TableCell In row.Cells
                        If row.RowIndex Mod 2 = 0 Then
                            cell.Style.Add("background-color", "#ECEFF1")
                        Else
                            cell.Style.Add("background-color", "#FFFFFF")
                        End If
                        For c = 0 To row.Cells.Count - 1
                            cell = row.Cells(c)
                            cell.Style.Add("vertical-align", "top")
                            cell.Style.Add("text-wrap", "none")
                            cell.Style.Add("word-wrap", "normal")
                            cell.Style.Add("border", "thin solid #dddddd")
                            cell.Style.Add("font-family", "Arial Narrow")
                            cell.Style.Add("font-size", "10pt")
                            cell.Wrap = True
                            If c = 4 Then
                                cell.Style.Add("font-weight", "bold")
                            ElseIf c = 7 Then
                                cell.Style.Add("font-family", "Arial")
                                cell.Style.Add("font-weight", "bold")
                                cell.Style.Add("background-color", "#B0BEC5")
                                cell.Style.Add("border", "thin solid #FFFFFF")
                                cell.CssClass = "textmode numbermode"
                                cell.Style.Add("width", "80px")
                                'ElseIf c = 8 Or c = 9 Or c = 10 Then
                                '    cell.Style.Add("font-family", "Arial")
                                '    cell.Style.Add("background-color", "#CFD8DC")
                                '    cell.Style.Add("border", "thin solid #FFFFFF")
                                '    cell.CssClass = "textmode numbermode"
                                '    cell.Style.Add("width", "80px")
                            Else
                                cell.CssClass = "textmode"
                            End If
                        Next
                    Next
                Next
                Me.gvExcel.RenderControl(hw)
                'style to format numbers to string
                Dim style As String = "<style> .textmode { mso-number-format:\@; } .numbermode { mso-number-format:0; } </style>"
                Response.Write(style)
                Response.Output.Write(sw.ToString())
                Response.Flush()
                Response.[End]()
            End Using
        End If
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As System.Web.UI.Control)
    End Sub
    Protected Sub gvExcel_DataBound(sender As Object, e As EventArgs) Handles gvExcel.DataBound
        If Me.gvExcel.Rows.Count > 0 Then
            Me.gvExcel.HeaderRow.Cells(0).Visible = False
        End If
        RowSpanToGridView(gvExcel)
    End Sub
    Protected Sub gvExcel_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles gvExcel.RowDataBound
        Dim VRPROMENE As String = ""
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Visible = False

            'If e.Row.Cells(12).Text = "I" Then
            '    VRPROMENE = "Измена"
            'ElseIf e.Row.Cells(12).Text = "N" Then
            '    VRPROMENE = "Нова"
            'ElseIf e.Row.Cells(12).Text = "B" Then
            '    VRPROMENE = "Брисање"
            'Else
            '    VRPROMENE = ""
            'End If
            'e.Row.Cells(12).Text = VRPROMENE
        End If
    End Sub
    Public Sub RowSpanToGridView(ByVal gv As GridView)
        Dim CellText As String = ""
        Dim CellTextPrevious As String = ""

        For i As Integer = gv.Rows.Count - 1 To 1 Step -1
            Dim row As GridViewRow = gv.Rows(i)
            Dim previousRow As GridViewRow = gv.Rows(i - 1)
            'For j As Integer = 0 To row.Cells.Count - 1
            For j As Integer = 0 To 2
                If j = 1 Then
                    CellText = DirectCast(row.Cells(1).FindControl("LJ"), HtmlGenericControl).InnerHtml()
                    CellTextPrevious = DirectCast(previousRow.Cells(1).FindControl("LJ"), HtmlGenericControl).InnerHtml()
                ElseIf j = 2 Then
                    CellText = DirectCast(row.Cells(2).FindControl("Adresa"), HtmlGenericControl).InnerHtml()
                    CellTextPrevious = DirectCast(previousRow.Cells(2).FindControl("Adresa"), HtmlGenericControl).InnerHtml()
                Else
                    CellText = row.Cells(j).Text()
                    CellTextPrevious = previousRow.Cells(j).Text
                End If
                If CellText = CellTextPrevious Then
                    If CellText <> "&nbsp;" Then
                        If previousRow.Cells(j).RowSpan = 0 Then
                            If row.Cells(j).RowSpan = 0 Then
                                previousRow.Cells(j).RowSpan += 2
                            Else
                                previousRow.Cells(j).RowSpan = row.Cells(j).RowSpan + 1
                            End If
                            row.Cells(j).Visible = False
                        End If
                    End If
                End If
            Next
        Next
    End Sub

#End Region
End Class
