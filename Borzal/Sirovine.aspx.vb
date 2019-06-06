Imports System.Data
Imports System.IO
Imports System.Drawing
Imports System.Diagnostics

Partial Class Sirovine
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim BORZALConnectionString As String = b.ConnString_BORZAL

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

        ImaPrava = b.ProveraKorisnikPosao(Session("ID_Korisnika"), Path.GetFileName(Request.PhysicalPath))

        If ImaPrava = 0 Then
            Response.Redirect(ResolveClientUrl("~/Default.aspx"), True)
        End If

        If Not Page.IsPostBack Then
            PopuniTabeluMB()
        End If
    End Sub
#Region "DUGMIĆI"
    Protected Sub btnPotvrdiSIROVINA_Click(sender As Object, e As EventArgs)
        SetPorukaUspesnoInvisible()
        SetPorukaNeuspesnoInvisible()
        SetPorukaSpisakGresakaInvisible()
        dajDefaultVrednosti()


        If ObaveznaPolja() = False Then
            Me.PorukaInfoNeuspesno.InnerText = "Molimo Vas da popunite sva označena polja."
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




            If InsertUpdateSIROVINA() = False Then
                Me.PorukaInfoNeuspesno.InnerText = "Došlo je do greške prilikom upisa u bazu."
                Exit Sub
            End If

            SetPorukaUspesnoVisible()
            Me.PorukaInfoUspesno.InnerHtml = "Podatak je uspešno unet!"

            IsprazniKontroleSirovina()

        End If


        SessionUpit()

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

#Region "INSERT/UPDATE"



    Protected Function InsertUpdateSIROVINA() As Boolean

        Dim UpitInsertUpdateSIROVINA As String = ""

        If ProveraPostojanjaZapisaSIROVINA(Me.txtID.Text) = 1 Then

            UpitInsertUpdateSIROVINA = "UPDATE SIROVINE " _
& " Set NAZIV = " & "N'" & Me.txtNaziv.Text & "' " _
& " Set JM = " & "N'" & Me.txtJM.Text & "' " _
& "  WHERE (id = " & Me.txtID.Text & ")"
        Else

            UpitInsertUpdateSIROVINA = "INSERT INTO SIROVINE (Naziv, JM) VALUES " _
& "(" & "N'" & Me.txtNaziv.Text & "'," _
& "N'" & Me.txtJM.Text & "') "

        End If

        Dim ret As Boolean = b.UpisPromenaBrisanje(UpitInsertUpdateSIROVINA, BORZALConnectionString)
        Return ret
    End Function

    Private Function ProveraPostojanjaZapisaSIROVINA(ByVal ID As String) As Integer
        Dim SIROVINASelect As String = ""
        Dim dsSIROVINASelect As New DataSet

        SIROVINASelect = "Select * FROM SIROVINE WHERE (ID = '" & ID & "')"
        dsSIROVINASelect = b.DajDS_IzUpita_Lokal(SIROVINASelect, BORZALConnectionString)

        Dim ret As Integer = dsSIROVINASelect.Tables(0).Rows.Count
        Return ret
    End Function

    Private Sub IsprazniKontroleSirovina()

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

        Me.lblPorukaGR.InnerHtml = poruka

        ret = b.Duplikat("Naziv", "Sirovine", Trim(Me.txtNaziv.Text))

        If ret = 0 Then
            rezultat = True
        Else
            Me.lblPorukaGR.Visible = True
            Me.lblPorukaGR.InnerHtml = "Postoji taj podatak"
            rezultat = False
        End If
        Return rezultat
    End Function
#End Region

#Region "GENERISANJE MB"
    Protected Sub ResetClick(Source As Object, E As EventArgs)
        SessionUpit()
    End Sub

    Private Sub PopuniTabeluMB()
        Dim SelectSQL, WhereSQL As String
        Dim UpitMB As String = ""
        MBListaTitle.InnerHtml = "Spisak naziva sirovina"

        SessionUpit()
        SelectSQL = Session("UpitSIROVINA")
        UslovWHERE()

        'lblPoruka1.text = "UslovWHERE = " & Session("WhereSQL")

        If Session("WhereSQL") = DBNull.Value.ToString() Or Trim(Session("WhereSQL")) = "" Then
            Session("WhereSQL") = ""
        End If
        WhereSQL = Session("WhereSQL")

        Session("UpitSIROVINA") = SelectSQL + WhereSQL

        Me.gvSIROVINA.EmptyDataText = "Без података"
        Me.gvSIROVINA.DataBind()
    End Sub
    Protected Sub SessionUpit()
        Dim SelectSQL As String

        SelectSQL = "SELECT ID, NAZIV, JM FROM SIROVINE"

        Session("UpitSIROVINA") = SelectSQL

    End Sub
    Protected Sub UslovWHERE()
        Dim WhereSQL As String = ""




        Session("WhereSQL") = ""



        If WhereSQL <> "" Then
            Session("WhereSQL") = " WHERE (" & WhereSQL & ")"
        Else
            Session("WhereSQL") = ""
        End If



        'lblPoruka2.Text = "DatumOD = " & DatumPrijemaOD
        'lblPoruka3.Text = "DatumDO = " & DatumPrijemaDO


    End Sub
    Protected Sub gvSIROVINA_DataBound(sender As Object, e As EventArgs) Handles gvSIROVINA.DataBound
        If Me.gvSIROVINA.Rows.Count > 0 Then
            Me.gvSIROVINA.HeaderRow.Cells(1).Visible = True
            Me.gvSIROVINA.HeaderRow.Cells(2).Visible = True
            'Me.gvMB.HeaderRow.Cells(4).CssClass = "text-center width-30"
            'Me.gvMB.HeaderRow.Cells(5).CssClass = "text-center width-30"
            'Me.gvMB.HeaderRow.Cells(6).CssClass = "text-center width-30"
            'Me.gvMB.HeaderRow.Cells(7).CssClass = "text-center width-30"
        End If
    End Sub
    Protected Sub gvSIROVINA_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles gvSIROVINA.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            e.Row.Cells(1).Visible = True
            e.Row.Cells(2).Visible = True
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
            'Dim IkonicaNePopunjavaZarade As String = "<span class=""text-SDG-12 text-semibold"">Н/У</span>"
            Dim IkonicaNePopunjavaZarade As String = "<i class=""icon-cross2 text-SDG-12""></i>"

            Dim btnExcelExport As LinkButton = TryCast(e.Row.FindControl("btnExcelExport"), LinkButton)
            If btnExcelExport IsNot Nothing Then
                smIzborMB.RegisterPostBackControl(btnExcelExport)
            End If

        End If
    End Sub
    Protected Sub gvSIROVINA_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSIROVINA.RowCommand
        Dim index As Integer
        Dim row As GridViewRow
        If e.CommandName = "SIROVINAIzmena" Then
            index = Convert.ToInt32(e.CommandArgument)
            row = gvSIROVINA.Rows(index)

            Dim ID As String = Me.gvSIROVINA.DataKeys(index).Value
            Dim NAZIV As String = Me.gvSIROVINA.DataKeys(index).Values(1)
            'Dim podbroj As String = Me.gvMB.DataKeys(index).Values(2)
            'Dim podod3 As Integer = Me.gvMB.DataKeys(index).Values(3)

            Me.txtID.Text = ID
            Me.txtNaziv.Text = NAZIV

            'Response.Redirect("~/Delovodnik.aspx", True)
        ElseIf e.CommandName = "ExcelExport" Then
            index = Convert.ToInt32(e.CommandArgument)
            row = gvSIROVINA.Rows(index)
            Me.gvSIROVINA.SelectedIndex = index

            Dim ID As String = Me.gvSIROVINA.DataKeys(index).Value
            'Dim rbr As String = Me.gvMB.DataKeys(index).Values(1)
            'Dim podbroj As String = Me.gvMB.DataKeys(index).Values(2)
            'Dim podod3 As Integer = Me.gvMB.DataKeys(index).Values(3)

            EXCEL_Grid(ID)

        End If
    End Sub
#End Region


#Region "EXCEL EXPORT"
    Protected Sub EXCEL_Grid(ByVal ID As Integer)


        Dim i As Integer = 0
        Dim c As Integer = 0
        Dim r As Integer = 0



        Dim IzvestajNaziv As String = "SIROVINE_" & DateTime.Now.ToString("yyyyMMdd_HHmm") & ".xls"
        Dim UpitExcel As String = "SELECT ID, NAZIV, JM FROM SIROVINE ORDER BY ID"

        Dim dsExcel As DataSet = b.DajDS_IzUpita_Lokal(UpitExcel, BORZALConnectionString)

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
                Me.gvExcel.HeaderRow.Cells(0).Visible = True
                Me.gvExcel.Caption = "<h4>" & "TABELA SIROVINE_" & DateTime.Now.ToString("dd.MM.yyyy.") & "</h4>"
                Me.gvExcel.CaptionAlign = TableCaptionAlign.Left

                Me.gvExcel.DataBind()

                For Each cell As TableCell In gvExcel.HeaderRow.Cells
                    Dim header As GridViewRow = gvExcel.HeaderRow
                    header.Cells(0).Style.Add("width", "50px")
                    header.Cells(1).Style.Add("width", "250px")
                    'header.Cells(2).Style.Add("width", "250px")
                    'header.Cells(3).Style.Add("width", "250px")
                    'header.Cells(4).Style.Add("width", "250px")
                    'header.Cells(6).Style.Add("width", "250px")
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
        Next
    End Sub

#End Region
End Class
