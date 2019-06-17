Imports System.Data
Partial Class NadgledanjeDnevno
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim BORZALConnectionString As String = b.ConnString_BORZAL
    Dim ImaAdminPrava As Integer = 0
    Dim ImaSpoljniKorisnikPrava As Integer = 0



    Private Sub Poruka_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True

        'If Session("ID_Korisnika") = Nothing Then
        '    Session("ID_Korisnika") = Me.txtID_Korisnika.Text.ToString()
        'End If

        'If Session("ID_Korisnika") = Nothing Or Trim(Session("ID_Korisnika")) = "" Or Session("ID_Korisnika") = "-1" Then
        '    Session.Add("MorasSeLogovat", 2)
        '    Response.Redirect(ResolveClientUrl("~/LogOut.aspx"), True)
        'Else
        '    Me.txtID_Korisnika.Text = Session("ID_Korisnika")
        'End If


        'ImaSpoljniKorisnikPrava = b.ProveraSpoljnogKorisnika(Trim(Me.txtID_Korisnika.Text()))

        'If ImaAdminPrava = 0 Then
        '    Response.Redirect(ResolveClientUrl("~/LogOut.aspx"), True)
        'End If

        'GenerisiTabeleGrafikone()
        If Not Page.IsPostBack Then
            Me.BrojIzvestaja.InnerText = b.DajScalarSTR_IzUpita_LOKAL("SELECT COUNT(*) AS BrojPopunjenihIzvestaja FROM vPREDATNICA", BORZALConnectionString)
            GenerisiDataSet()
        End If
    End Sub
    'Private Sub GenerisiTabeleGrafikone()
    '    Dim SP_BrojIzvestajaPoDanima As String = "usp_ADM_IZV_MB_PO_PoDanima"
    '    Dim dsUpitBrojIzvestajaPoDanima As New DataSet
    '    Me.tBrojIzvestajaPoDanima.InnerHtml = DajTabeluZaGrafikon(SP_BrojIzvestajaPoDanima)
    'End Sub
#Region "UPITI"
    Private Sub GenerisiDataSet()
        'BROJ IZVESTAJA PO DANIMA
        Dim SP_BrojIzvestajaPoDanima As String = "sp_Utroseno"
        Dim BrojIzvestajaPoDanimaString As String = ""
        Dim dsBrojIzvestajaPoDanima As DataSet = New DataSet

        dsBrojIzvestajaPoDanima = DajDataSetSP(SP_BrojIzvestajaPoDanima)
        If (dsBrojIzvestajaPoDanima Is Nothing) Then
            Return
        Else
            BrojIzvestajaPoDanimaString = GetJSON(dsBrojIzvestajaPoDanima.Tables(0))
            Me.txtJSON_BrojIzvestajaPoDanima.Text = BrojIzvestajaPoDanimaString
        End If
    End Sub
    Private Function DajDataSetSP(ByVal SP As String) As DataSet
        Dim P() As Object = New Object() {}
        Dim ds As DataSet = New DataSet
        ds = b.DajDS_SP(SP, BORZALConnectionString, P)
        Return ds
    End Function
    Private Function DajDataSetUpit(ByVal Upit As String) As DataSet
        Dim ds As DataSet = New DataSet
        ds = b.DajDS_IzUpita_Lokal(Upit, BORZALConnectionString)
        Return ds
    End Function
    Public Function GetJSON(ByVal dt As DataTable) As String
        Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
        serializer.MaxJsonLength = Integer.MaxValue

        Dim rows As New List(Of Dictionary(Of String, Object))()
        Dim row As Dictionary(Of String, Object) = Nothing
        For Each dr As DataRow In dt.Rows
            row = New Dictionary(Of String, Object)()
            For Each dc As DataColumn In dt.Columns
                row.Add(dc.ColumnName.Trim(), dr(dc))
            Next
            rows.Add(row)
        Next
        Return serializer.Serialize(rows)
    End Function
    Private Function DajTabelu(ByVal SP As String, ByVal PO As String, ByVal ODDAT As String, ByVal ApsolutnaVrednost As String, ByVal Procenat As String) As String
        Dim dsRezultat As New DataSet
        Dim sbRezultat As New StringBuilder
        Dim P() As Object = New Object() {}
        dsRezultat = b.DajDS_SP(SP, BORZALConnectionString, P)
        If dsRezultat.Tables.Count > 0 Then
            If dsRezultat.Tables(0).Rows.Count > 0 Then
                For i = 0 To dsRezultat.Tables(0).Rows.Count - 1
                    sbRezultat.Append("<tr><th>" & dsRezultat.Tables(0).Rows(i).Item(PO) & "</th><th>" & dsRezultat.Tables(0).Rows(i).Item(ODDAT) & "</th><td class=""width-15per text-right text-semibold font-family-Roboto"">" & dsRezultat.Tables(0).Rows(i).Item(ApsolutnaVrednost) & "</td><td class=""width-15per text-right text-semibold font-family-Roboto"">" & dsRezultat.Tables(0).Rows(i).Item(Procenat) & "</td></tr>")
                Next
            End If
        End If
        Return sbRezultat.ToString()
    End Function
    Private Function DajTabeluZaGrafikon(ByVal SP As String) As String
        Dim dsRezultat As New DataSet
        Dim sbRezultat As New StringBuilder
        Dim P() As Object = New Object() {}
        dsRezultat = b.DajDS_SP(SP, BORZALConnectionString, P)
        If dsRezultat.Tables.Count > 0 Then
            sbRezultat.Append(ConvertDataTableToHTML(dsRezultat.Tables(0)))
            'If dsRezultat.Tables(0).Rows.Count > 0 Then
            '    For i = 0 To dsRezultat.Tables(0).Rows.Count - 1
            '        sbRezultat.Append(ConvertDataTableToHTML(dsRezultat.Tables(0)))
            '        'sbRezultat.Append("<tr><th>" & dsRezultat.Tables(0).Rows(i).Item(Naziv) & "</th><td>" & dsRezultat.Tables(0).Rows(i).Item(ApsolutnaVrednost) & "</td></tr>")
            '    Next
            'End If
        End If
        Return sbRezultat.ToString()
    End Function
    Public Function ConvertDataTableToHTML(dt As DataTable) As String
        Dim html As String = "<table id='TabelaPoDanima' class='table table-bordered table-xxs'>"
        'add header row
        html += "<thead><tr class='bg-inverse bg-primary-700'>"
        For i As Integer = 0 To dt.Columns.Count - 1
            html += "<th>" + dt.Columns(i).ColumnName + "</th>"
        Next
        html += "</tr></thead><tbody>"
        'add rows
        Dim tbodyRow As String = ""
        For i As Integer = 0 To dt.Rows.Count - 1
            html += "<tr>"
            'Dim count As Integer = dt.Select("[Месни одбор] ='" + dt.Rows(i)(0).ToString() + "'").Count()
            For j As Integer = 0 To dt.Columns.Count - 1
                'If j < 1 Then
                '    If tbodyRow <> dt.Rows(i)(0).ToString() Then
                '        html += "<td class='text-semibold font-family-Roboto valign-top' rowspan='" + count.ToString() + "'>" + dt.Rows(i)(j).ToString() + "</td>"
                '    End If
                '    Continue For
                'End If
                html += "<td class=""width-5per text-right"">" + dt.Rows(i)(j).ToString() + "</td>"
            Next
            tbodyRow = dt.Rows(i)(0).ToString()
            html += "</tr>"
        Next
        html += "</tbody></table>"
        Return html
    End Function
#End Region
End Class
