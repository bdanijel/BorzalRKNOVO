Imports System.Data
Imports System.IO
Imports System.Drawing
Imports System.Diagnostics

Partial Class Sastavnica_Pretraga
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim BORZALConnectionString As String = b.ConnString_BORZAL
    'MOŽDA NEĆE TREBATI                                                                                                        
    Dim ImaAdminPrava As Integer = 0
    Dim ImaPrava As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Page.MaintainScrollPositionOnPostBack = True


        ImaPrava = b.ProveraKorisnikPosao(Session("ID_Korisnika"), Path.GetFileName(Request.PhysicalPath))

        If ImaPrava = 0 Then
            Response.Redirect(ResolveClientUrl("~/Default.aspx"), True)
        End If

        If Not Page.IsPostBack Then
            PopuniCOMBO()
            PopuniTabeluMB()
        End If
    End Sub

#Region "GENERISANJE MB"
    Protected Sub ResetClick(Source As Object, E As EventArgs)
        PopuniCOMBO()
        SessionUpit()
    End Sub
    Private Sub PopuniTabeluMB()
        Dim SelectSQL, WhereSQL As String
        Dim UpitMB As String = ""
        MBListaTitle.InnerHtml = "Spisak sastavnica"

        SessionUpit()
        SelectSQL = Session("UpitMB")
        UslovWHERE()

        'lblPoruka1.text = "UslovWHERE = " & Session("WhereSQL")

        If Session("WhereSQL") = DBNull.Value.ToString() Or Trim(Session("WhereSQL")) = "" Then
            Session("WhereSQL") = ""
        End If
        WhereSQL = Session("WhereSQL")

        Session("UpitMB") = SelectSQL + WhereSQL + " order by broj, rbr"

        Me.gvMB.EmptyDataText = "Bez podataka"
        Me.gvMB.DataBind()
    End Sub
    Protected Sub SessionUpit()
        Dim SelectSQL As String

        SelectSQL = "SELECT cast(BROJ as INT) AS BROJ, RBR," & Chr(34) & "Naziv proizvoda" & Chr(34) & " , " & Chr(34) & "Naziv sirovine" & Chr(34) & ", JM, KOLICINA FROM vSastavnica "


        Session("UpitMB") = SelectSQL

    End Sub
    Protected Sub UslovWHERE()
        Dim WhereSQL As String = ""

        Dim BROJ As String = Trim(Me.DDLBROJ.SelectedValue.ToString())

        Session("WhereSQL") = ""

        'BROJ DDL
        If BROJ <> "" And BROJ <> "0" Then
            If WhereSQL = "" Then
                WhereSQL = "(BROJ = '" & BROJ & "')"
            Else
                WhereSQL = WhereSQL & " AND (BROJ = '" & BROJ & "')"
            End If
        End If


        If WhereSQL <> "" Then
            Session("WhereSQL") = " WHERE (" & WhereSQL & ")"
        Else
            Session("WhereSQL") = ""
        End If


    End Sub
    Protected Sub gvMB_DataBound(sender As Object, e As EventArgs) Handles gvMB.DataBound
        If Me.gvMB.Rows.Count > 0 Then
            Me.gvMB.HeaderRow.Cells(0).Visible = True
            'Me.gvMB.HeaderRow.Cells(2).Visible = True
            'Me.gvMB.HeaderRow.Cells(4).CssClass = "text-center width-30"
            'Me.gvMB.HeaderRow.Cells(5).CssClass = "text-center width-30"
            'Me.gvMB.HeaderRow.Cells(6).CssClass = "text-center width-30"
            'Me.gvMB.HeaderRow.Cells(7).CssClass = "text-center width-30"
        End If
    End Sub
    Protected Sub gvMB_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles gvMB.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            e.Row.Cells(0).Visible = True
            'e.Row.Cells(2).Visible = False
            'e.Row.Cells(4).CssClass = "text-center width-30"
            'e.Row.Cells(5).CssClass = "text-center width-30"
            'e.Row.Cells(6).CssClass = "text-center width-30"
            'e.Row.Cells(7).CssClass = "text-center width-30"


            Dim Ikonica_DA As String = "<i class=""icon-checkmark3 text-info""></i>"
            Dim Ikonica_NE As String = "<i class=""icon-minus3 text-purple-300""></i>"


            Dim btnMBIzmena As LinkButton = DirectCast(e.Row.Cells(0).FindControl("btnMBIzmena"), LinkButton)
            Dim SpanMBIzmena As HtmlGenericControl = DirectCast(e.Row.Cells(0).FindControl("SpanMBIzmena"), HtmlGenericControl)



            Dim IkonicaKraj_DA As String = "<i class=""icon-checkmark3 text-info""></i>"
            Dim IkonicaKraj_NE As String = "<i class=""icon-minus3 text-purple-300""></i>"
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
            Dim BROJ As String = Me.gvMB.DataKeys(index).Value
            Dim RBR As Integer = Me.gvMB.DataKeys(index).Values(1)
            'Dim podbroj As String = Me.gvMB.DataKeys(index).Values(2)
            'Dim podod3 As Integer = Me.gvMB.DataKeys(index).Values(3)
            'Dim Rbr As Integer = gvMB.SelectedDataKey(0).Values("rbr")
            'Dim PodBroj As Integer = gvMB.SelectedDataKey(0).Values("podbroj")
            'Dim PodOd As String = gvMB.SelectedDataKey(0).Values("podod").ToString()




            'String ProductID = gvMyGridView.DataKeys[gvr.RowIndex].Values["ProductID"].ToString()
            'String ItemID = gvMyGridView.DataKeys[gvr.RowIndex].Values["ItemID"].ToString()
            'String OrderID = gvMyGridView.DataKeys[gvr.RowIndex].Values["OrderID"].ToString()


            Session("BROJ_SASTAVNICA_pretraga") = BROJ
            Session("RBR_SASTAVNICA_pretraga") = RBR
            'Session("Rbr_pretraga") = rbr
            'Session("PodBroj_pretraga") = podbroj
            'Session("PodOd3_pretraga") = podod3

            Response.Redirect("~/Sastavnica.aspx", True)
        ElseIf e.CommandName = "ExcelExport" Then
            index = Convert.ToInt32(e.CommandArgument)
            row = gvMB.Rows(index)
            Me.gvMB.SelectedIndex = index

            Dim ID As String = Me.gvMB.DataKeys(index).Value
            'Dim rbr As String = Me.gvMB.DataKeys(index).Values(1)
            'Dim podbroj As String = Me.gvMB.DataKeys(index).Values(2)
            'Dim podod3 As Integer = Me.gvMB.DataKeys(index).Values(3)

            'Dim GODINA As String = Me.gvMB.DataKeys(index).Value
            EXCEL_Grid(ID)

        End If
    End Sub
#End Region
#Region "COMBO PRETRAGA"
    Private Sub PopuniCOMBO()


        Dim UpitBROJ As String = "SELECT DISTINCT BROJ FROM vSASTAVNICA ORDER BY BROJ"
        PopuniDDL_1KOLONA(DDLBROJ, UpitBROJ, "BROJ")
        DDLBROJ.Items.Insert(0, New ListItem("- - Izaberite broj sastavnice - -", "0"))

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

    Protected Sub DDLBROJ_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLBROJ.SelectedIndexChanged
        Me.PopuniTabeluMB()
    End Sub
#End Region

#Region "EXCEL EXPORT"
    Protected Sub EXCEL_Grid(ByVal ID As Integer)


        Dim i As Integer = 0
        Dim c As Integer = 0
        Dim r As Integer = 0



        Dim IzvestajNaziv As String = "SASTAVNICA" & "_" & DateTime.Now.ToString("yyyyMMdd_HHmm") & ".xls"
        Dim UpitExcel As String = "SELECT ID_PROIZVOD,BROJ,RBR,ID_SIROVINA,JM,KOLICINA FROM SASTAVNICA"

        Dim dsExcel As DataSet = b.DajDS_IzUpita_Lokal(UpitExcel, BORZALConnectionString)

        If (dsExcel Is Nothing) Then
            Me.gvExcel.EmptyDataText = "Bez podataka"
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
                Me.gvExcel.Caption = "<h4>" & "SASTAVNICA_" & "_" & DateTime.Now.ToString("dd.MM.yyyy.") & "</h4>"
                Me.gvExcel.CaptionAlign = TableCaptionAlign.Left

                Me.gvExcel.DataBind()

                For Each cell As TableCell In gvExcel.HeaderRow.Cells
                    Dim header As GridViewRow = gvExcel.HeaderRow
                    header.Cells(0).Style.Add("width", "50px")
                    header.Cells(1).Style.Add("width", "150px")
                    cell.Style.Add("background-color", "#1976D2;")
                    cell.Style.Add("vertical-align", "middle")
                    cell.Style.Add("text-Underline", "None")
                    cell.Style.Add("color", "#FFFFFF")
                    cell.Style.Add("text-wrap", "none")
                    cell.Style.Add("word-wrap", "normal")
                    cell.Style.Add("border", "thin solid #ffffff")
                    cell.Style.Add("font-family", "Arial Narrow")
                    cell.Style.Add("font-size", "12pt")
                    cell.Style.Add("height", "25pt")
                    cell.Style.Add("width", "150px")
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
                            cell.CssClass = "textmode"
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
            Me.gvExcel.HeaderRow.Cells(0).Visible = True
        End If
        RowSpanToGridView(gvExcel)
    End Sub
    Protected Sub gvExcel_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles gvExcel.RowDataBound
        Dim VRPROMENE As String = ""
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Visible = True
        End If
    End Sub
    Public Sub RowSpanToGridView(ByVal gv As GridView)
        Dim CellText As String = ""
        Dim CellTextPrevious As String = ""

        For i As Integer = gv.Rows.Count - 1 To 1 Step -1
            Dim row As GridViewRow = gv.Rows(i)
            Dim previousRow As GridViewRow = gv.Rows(i - 1)
            'For j As Integer = 0 To row.Cells.Count - 1
            'For j As Integer = 0 To 2
            '    If j = 1 Then
            '        CellText = DirectCast(row.Cells(1).FindControl("LJ"), HtmlGenericControl).InnerHtml()
            '        CellTextPrevious = DirectCast(previousRow.Cells(1).FindControl("LJ"), HtmlGenericControl).InnerHtml()
            '    ElseIf j = 2 Then
            '        CellText = DirectCast(row.Cells(2).FindControl("Adresa"), HtmlGenericControl).InnerHtml()
            '        CellTextPrevious = DirectCast(previousRow.Cells(2).FindControl("Adresa"), HtmlGenericControl).InnerHtml()
            '    Else
            '        CellText = row.Cells(j).Text()
            '        CellTextPrevious = previousRow.Cells(j).Text
            '    End If
            '    If CellText = CellTextPrevious Then
            '        If CellText <> "&nbsp;" Then
            '            If previousRow.Cells(j).RowSpan = 0 Then
            '                If row.Cells(j).RowSpan = 0 Then
            '                    previousRow.Cells(j).RowSpan += 2
            '                Else
            '                    previousRow.Cells(j).RowSpan = row.Cells(j).RowSpan + 1
            '                End If
            '                row.Cells(j).Visible = False
            '            End If
            '        End If
            '    End If
            'Next
        Next
    End Sub

#End Region
End Class
