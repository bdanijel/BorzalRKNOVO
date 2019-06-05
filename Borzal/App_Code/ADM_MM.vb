Imports System.Data
Imports System.Data.SqlClient
Imports System.Net
Imports System.DirectoryServices

Public Class ADM_MM
    Public ConnString_SPRLJ As String = getConnStr("SPRLJConnectionString")
    Public ConnString_SPR As String = getConnStr("SPRConnectionString")
    Public ConnString_PISARNICA As String = getConnStr("PISARNICAConnectionString")
    Public ConnString_BORZAL As String = getConnStr("BORZALConnectionString")

    Private Declare Function inet_addr Lib "wsock32.dll" (ByVal s As String) As Integer
    Private Declare Function SendARP Lib "iphlpapi.dll" (ByVal DestIP As Integer, ByVal SrcIP As Integer, ByRef pMACAddr As Integer, ByRef PhyAddrLen As Integer) As Integer
    Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByRef dst As Byte, ByRef src As Integer, ByVal bcount As Integer)
    Dim dbEntLib As Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase
    Public Function DajDS_IzUpita_Lokal(ByVal Upit As String, ByVal konekcija As String) As DataSet
        Dim ResultSet As DataSet = RunQuery(Upit, konekcija)
        Dim rrrr As Integer = ResultSet.Tables.Count
        Return ResultSet
    End Function
    Public Function RunQuery(ByVal QueryString As String, ByVal konekcija As String) As DataSet
        'Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(konekcija).ConnectionString
        Dim ConnectionString As String = konekcija
        Dim DBConnection As SqlConnection = New SqlConnection(ConnectionString)
        Dim DBAdapter As SqlDataAdapter

        Dim ResultsDataSet As DataSet = New DataSet

        Try

            ' Run the query and create a DataSet.
            DBAdapter = New SqlDataAdapter(QueryString, DBConnection)
            DBAdapter.SelectCommand.CommandTimeout = 5000
            DBAdapter.Fill(ResultsDataSet)

            ' Close the database connection.
            DBConnection.Close()

        Catch ex As Exception

            ' Close the database connection if it is still open.
            If DBConnection.State = ConnectionState.Open Then

                DBConnection.Close()

            End If

            Dim poruka As String = "Unable to connect to the database."

        End Try

        Return ResultsDataSet

    End Function

    Public Function UpisPromenaBrisanje_SP_Local(ByVal ImeSP As String, ByVal konekcija As String, ByVal Parametri() As Object) As String
        UpisPromenaBrisanje_SP_Local = "ERROR"
        Try
            dbEntLib = New Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase(konekcija)
            Dim ret As Int32 = dbEntLib.ExecuteNonQuery(ImeSP, Parametri)
            UpisPromenaBrisanje_SP_Local = "OK"
        Catch ex As Exception
            UpisPromenaBrisanje_SP_Local = ex.Message
        End Try

        Return UpisPromenaBrisanje_SP_Local

        '=======================================
        'UPOTREBA
        '=======================================
        'Public ConnString_BB As String = getConnStr("BBConnectionString")
        'Public Function ArhivaLogovanjaInsert(ByVal ID_Session As String, ByVal IP_Korisnika As String, ByVal ZaposlenID As String, ByVal Status As Boolean) As Integer
        '    Dim DatumVreme As String
        '    Dim sp_Name As String = "ADM_LogovanjeArhiva_Insert"
        '    DatumVreme = DajDatumVreme()
        '    Dim parametriPL() As Object = New Object() {ID_Session, IP_Korisnika, ZaposlenID, DatumVreme, Status}
        '    Dim ret As Int32 = wsOpsti.SP_ExecuteNonQuery(sp_Name, ConnString_BB, parametriPL)
        '    Return ret
        'End Function
        '=======================================

    End Function
    Function KoJe_AD(ByVal korisnik As String) As String
        Dim uslov_pretrage As String
        Dim arg(2) As String 'parsiramo sistemsku vrednost User.Identity.Name
        Dim ID As String = "-1"
        arg = Split(korisnik, "\")
        If (arg.Length > 1) Then
            'logovao se sa STATSRB\nalog
            uslov_pretrage = "(sAMAccountName=" & arg(1) & ")"
        Else
            'pošto nije na
            arg = Split(korisnik, "@")
            uslov_pretrage = "(userPrincipalName=" & arg(0) & ")"
        End If

        'Iz AD dobijamo kompletne podatke za nalog sa kojim se logovao korisnik
        Dim dirSearcher As DirectorySearcher = New DirectorySearcher(uslov_pretrage)
        Dim srAccountName As SearchResult
        'Dim valColl As ResultPropertyValueCollection
        srAccountName = dirSearcher.FindOne

        Dim propName As String
        propName = "physicalDeliveryOfficeName" 'U ovom parametru se nalazi ID zaposlenog

        If srAccountName IsNot Nothing Then
            Dim userACU As String = srAccountName.Properties(propName)(0)
            userACU = userACU.Trim()

            Dim l As Integer = userACU.Length()

            If Len(userACU) >= 4 Then
                'poruka = "OK postoji korisnik i lozinka"
                ID = userACU.Substring(0, 4)
            Else
                'poruka = "Nije upisan ZaposlenID u physicalDeliveryOfficeName"
                ID = "-1"
            End If
        End If

        Return (ID)
    End Function

    Public Function ProveraKorisnikPosao(ByVal ID_Korisnika As String, ByVal PosaoURL As String) As Integer
        Dim ds As New DataSet
        Dim ImaPrava As Integer = 0
        Dim upit As String = "SELECT idenr FROM v_ADM_Veza_Korisnik_Posao WHERE (idenr = '" & ID_Korisnika & "') and (PosaoURL = '" & PosaoURL & "')"
        ds = DajDS_IzUpita_Lokal(upit, ConnString_BORZAL)
        If ds.Tables.Count > 0 Then
            If ds.Tables(0).Rows.Count > 0 Then
                ImaPrava = ds.Tables(0).Rows.Count
            End If
        End If
        Return ImaPrava
    End Function
    Public Function ProveraSpoljnogKorisnika(ByVal ID_Korisnika As String) As Integer
        Dim ds As New DataSet
        Dim ImaPrava As Integer = 0
        Dim upit As String = "SELECT ID_Korisnika FROM LISTA_SpoljniKorisnici WHERE (ID_Korisnika = '" & ID_Korisnika & "')"
        ds = DajDS_IzUpita_Lokal(upit, ConnString_BORZAL)
        If ds.Tables.Count > 0 Then
            If ds.Tables(0).Rows.Count > 0 Then
                ImaPrava = ds.Tables(0).Rows.Count
            End If
        End If
        Return ImaPrava
    End Function
    Public Function ImaLiNalogZaMB(ByVal MB As String) As Integer
        Dim ds As New DataSet
        Dim ImaNalog As Integer = 0
        Dim upit As String = "SELECT DISTINCT MB FROM Veza_ADRESAR_SpoljniKorisnik WHERE (MB = '" & MB & "')"
        ds = DajDS_IzUpita_Lokal(upit, ConnString_SPRLJ)
        If ds.Tables.Count > 0 Then
            If ds.Tables(0).Rows.Count > 0 Then
                ImaNalog = ds.Tables(0).Rows.Count
            End If
        End If
        Return ImaNalog
    End Function

    Public Function ProveraPostojanjaMB_Baza(ByVal MB As String) As Integer
        Dim Postoji As Integer = 0
        Dim ds As New DataSet
        Dim upit As String = "SELECT MB FROM SPR2010.dbo.SPRPJ WHERE (MB = '" & MB & "')"
        ds = DajDS_IzUpita_Lokal(upit, ConnString_SPRLJ)
        If ds.Tables.Count > 0 Then
            Postoji = ds.Tables(0).Rows.Count
        End If
        Return Postoji
    End Function



    Private Function ProveraPoljaZaZahtev(ByVal VrednostStara As String, ByVal VrednostNova As String) As String
        Dim Vrednost As String = ""
        If Not IsDBNull(VrednostNova) Or VrednostNova <> "" Or VrednostNova <> "&nbsp;" Then
            If VrednostStara = VrednostNova Then
                Vrednost = VrednostStara
            Else
                Vrednost = VrednostNova
            End If
        Else
            Vrednost = VrednostStara
        End If
        Return Vrednost
    End Function


    Public Function ProveraNalogaKorisnika(ByVal Nalog As String) As String
        Dim DaLiJeTajKorisnik As String = ""
        Dim UpitKorisnik As String = "SELECT ID_Korisnika FROM LISTA_SpoljniKorisnici WHERE (Nalog = '" & Nalog & "')"
        Dim dsKorisnik As New DataSet
        dsKorisnik = DajDS_IzUpita_Lokal(UpitKorisnik, ConnString_SPRLJ)
        If dsKorisnik.Tables.Count > 0 Then
            If dsKorisnik.Tables(0).Rows.Count > 0 Then
                If Not IsDBNull(dsKorisnik.Tables(0).Rows(0).Item("ID_Korisnika")) Or dsKorisnik.Tables(0).Rows(0).Item("ID_Korisnika").ToString() = "" Then
                    DaLiJeTajKorisnik = dsKorisnik.Tables(0).Rows(0).Item("ID_Korisnika").ToString()
                End If
            End If
        End If
        Return DaLiJeTajKorisnik
    End Function



    Public Function DajPO(ByVal MB As String) As String
        Dim PO As String = ""
        Dim UpitPO As String = "SELECT PodOd2ID FROM ADRESAR_MB WHERE (MB = '" & MB & "')"
        PO = DajScalarSTR_IzUpita_LOKAL(UpitPO, ConnString_SPRLJ)
        Return PO
    End Function




    '*********************** DATUMI ********************************
    Public Function DajDatumVreme14() As String
        Dim DatumVreme As String = ""
        DatumVreme = DatumVreme + Now.Year().ToString
        DatumVreme = DatumVreme + formatiraj(Now.Month().ToString)
        DatumVreme = DatumVreme + formatiraj(Now.Day().ToString)
        DatumVreme = DatumVreme + formatiraj(Now.Hour().ToString)
        DatumVreme = DatumVreme + formatiraj(Now.Minute().ToString)
        DatumVreme = DatumVreme + formatiraj(Now.Second().ToString)

        Return DatumVreme
    End Function
    Public Function DajDatumVreme() As String
        Dim DatumVreme As String = ""
        DatumVreme = DatumVreme + Now.Year().ToString
        DatumVreme = DatumVreme + formatiraj(Now.Month().ToString)
        DatumVreme = DatumVreme + formatiraj(Now.Day().ToString) + "_"

        DatumVreme = DatumVreme + formatiraj(Now.Hour().ToString)
        DatumVreme = DatumVreme + formatiraj(Now.Minute().ToString)

        Return DatumVreme
    End Function
    Public Function FormatDatuma_PRIKAZ(ByVal datum As String) As String
        Dim ret As String
        Dim separator As String = "."
        If datum <> "" Then
            ret = Right(datum, 2) + separator + Mid(datum, 5, 2) + separator + Left(datum, 4) + separator
        Else
            ret = ""
        End If
        Return ret
    End Function
    Public Function FormatDatuma14_PRIKAZ(ByVal datum As String) As String
        Dim ret As String
        Dim separator As String = "."
        If datum <> "" Then
            ret = Mid(datum, 7, 2) + separator + Mid(datum, 5, 2) + separator + Left(datum, 4) + separator
        Else
            ret = ""
        End If
        Return ret
    End Function
    Public Function FormatDatuma_PRIKAZ_2(ByVal datum As String) As String
        '2018-08-12 17:17:00; 8/12/2018 5:23:00
        Dim ret As String
        Dim separator As String = "."
        If datum <> "" Then
            ret = formatiraj(Mid(datum, 3, 2)) + separator + formatiraj(Left(datum, 1)) + separator + Mid(datum, 6, 4) + separator
        Else
            ret = ""
        End If
        Return ret
    End Function
    Public Function FormatDatuma_PRIKAZ_3(ByVal datum As String) As String
        '2018-10-19 00:00:00.000; 19.10.2018.

        'Datum: 4/23/2019 12:00:00 AM
        'Datum: 10/19/2018 12:00:00 AM
        'Datum: 4/23/2019 12:00:00 AM
        Dim ret As String
        Dim separator As String = "."
        If datum <> "" Then
            Dim TestArray() As String = Split(datum, "/")
            ret = formatiraj(TestArray(1)) + separator + formatiraj(TestArray(0)) + separator + Left(TestArray(2), 4) + separator
        Else
            ret = ""
        End If
        Return ret
    End Function
    'Public Function FormatDatuma_PRIKAZ_DANIJEL(ByVal datum As DATE) As String
    '    '2018-10-19 00:00:00.000; 19.10.2018.

    '    'Datum: 4/23/2019 12:00:00 AM
    '    'Datum: 10/19/2018 12:00:00 AM
    '    'Datum: 4/23/2019 12:00:00 AM
    '    Dim ret As String


    '    Dim separator As String = "."
    '    If datum <> DateTime.MinValue Then
    '        Dim dan = Day(datum)
    '        Dim mesec = Month(datum)
    '        Dim godina = Year(datum)

    '        ret = formatiraj(dan) & separator & formatiraj(mesec) & separator & godina & separator
    '    Else
    '        ret = ""
    '    End If
    '    Return ret
    'End Function

    Public Function FormatDatuma_BAZA(ByVal datum As String) As String
        Dim retSplit As String() = Split(datum, ".")
        Dim ret As String
        If datum <> "" Then
            ret = retSplit(2) + retSplit(1) + retSplit(0)
        Else
            ret = ""
        End If
        Return ret
    End Function
    Public Function DajDatumIzStringa(ByVal datum As String) As Date
        Dim pattern As String = Trim("yyyyMMdd")
        Dim ret As Date
        If datum <> "" Then
            datum = FormatDatuma_BAZA(datum)
            ret = Date.ParseExact(datum, pattern, Nothing)
        Else
            ret = ""
        End If
        Return ret
    End Function
    Public Function DajDatumVreme_Local() As String
        'Dim cts As String = ConfigurationManager.ConnectionStrings("conn_AnketariEvidencija").ConnectionString
        Dim SqlConn As New SqlConnection(ConnString_PISARNICA)

        Dim cmd1 As New SqlCommand("ADM_DatumVreme", SqlConn)
        Dim rowsAffected1 As Integer

        cmd1.CommandType = CommandType.StoredProcedure

        Dim ParameterDV As SqlParameter = cmd1.Parameters.Add("@DatumVreme", SqlDbType.Char, 14)
        Dim DatumVreme As String

        ParameterDV.Direction = ParameterDirection.Output
        SqlConn.Open()

        rowsAffected1 = cmd1.ExecuteNonQuery()
        DatumVreme = ParameterDV.Value
        SqlConn.Close()

        Return DatumVreme

    End Function
    Public Function srediDatum() As String
        Dim ret As String = ""
        Dim mesec As String = Now().Month.ToString
        If Len(mesec) = 1 Then
            mesec = "0" + mesec
        End If
        Dim dan As String = Now().Day.ToString
        If Len(dan) = 1 Then
            dan = "0" + dan
        End If
        ret = Now().Year.ToString + mesec + dan
        Return ret
    End Function
    Public Function SrediDatum(ByVal datum As Date) As String
        Dim ret As String = Year(datum).ToString + Month(datum).ToString.PadLeft(2, "0") + Day(datum).ToString.PadLeft(2, "0")
        Return ret
    End Function
    Public Function SrediDatumPeriod(ByVal Datum As String) As String
        'Dim ret As String = Year(datum).ToString + Month(datum).ToString.PadLeft(2, "0") + Day(datum).ToString.PadLeft(2, "0")
        Dim retSplit As String() = Split(Datum, ".")
        Dim ret As String = retSplit(2) + retSplit(1) + retSplit(0)
        Return ret
    End Function
    Public Function srediDatumVreme() As String
        Dim ret As String = ""
        Dim mesec As String = Now().Month.ToString
        If Len(mesec) = 1 Then
            mesec = "0" + mesec
        End If
        Dim dan As String = Now().Day.ToString
        If Len(dan) = 1 Then
            dan = "0" + dan
        End If
        Dim sat As String = Now().Hour.ToString
        If Len(sat) = 1 Then
            sat = "0" + sat
        End If
        Dim minut As String = Now().Minute.ToString
        If Len(minut) = 1 Then
            minut = "0" + minut
        End If
        Dim sekund As String = Now().Second.ToString
        If Len(sekund) = 1 Then
            sekund = "0" + sekund
        End If
        ret = Now().Year.ToString + mesec + dan + sat + minut + sekund
        Return ret
    End Function
    Public Function SrediMesec(ByVal Mesec As String) As String
        Dim Mesec2 As String = "00"
        Select Case Mesec
            Case "1"
                Mesec2 = "01"
            Case "2"
                Mesec2 = "02"
            Case "3"
                Mesec2 = "03"
            Case "4"
                Mesec2 = "04"
            Case "5"
                Mesec2 = "05"
            Case "6"
                Mesec2 = "06"
            Case "7"
                Mesec2 = "07"
            Case "8"
                Mesec2 = "08"
            Case "9"
                Mesec2 = "09"
            Case "10", "11", "12"
                Mesec2 = Mesec
            Case Else
                Mesec2 = "00"
        End Select
        Return Mesec2
    End Function
    Public Function getDatum() As String
        Dim datum As String
        datum = formatiraj(Now.Year.ToString) + formatiraj(Now.Month.ToString) + formatiraj(Now.Day.ToString) + formatiraj(Now.Hour.ToString) + formatiraj(Now.Minute.ToString) + formatiraj(Now.Second.ToString)
        Return datum
    End Function
    Public Function formatiraj(ByVal cifra As String) As String
        Dim broj As String = cifra
        If broj.Length = 1 Then
            broj = "0" + broj
        End If
        Return broj
    End Function
    Public Function DajScalarSTR_IzUpita_LOKAL(ByVal Upit As String, ByVal konekcija As String) As String
        Dim RezultatSTR As String = ""
        Using Conn As New SqlConnection(konekcija)
            Using Cmd As New SqlCommand()
                Cmd.CommandText = Upit
                Cmd.Connection = Conn
                Conn.Open()
                'here execute scalar will get first column’s first cell value
                RezultatSTR = Convert.ToString(Cmd.ExecuteScalar())
                If String.IsNullOrEmpty(RezultatSTR) Then
                    RezultatSTR = "No record found!"
                End If
                Conn.Close()
            End Using
        End Using
        Return RezultatSTR
    End Function

    Public Function DajIDKorisnika(ByVal length As Integer) As String
        'Get the GUID
        Dim guidResult As String = System.Guid.NewGuid().ToString()

        'Remove the hyphens
        guidResult = guidResult.Replace("-", String.Empty)

        'Make sure length is valid
        If length <= 0 OrElse length > guidResult.Length Then
            Throw New ArgumentException("Length must be between 1 and " & guidResult.Length)
        End If

        'Return the first length bytes
        Return guidResult.Substring(0, length)
    End Function
    Public Function FStoreProcedureRUN_VracaString(ImeSP As String, BRPAR As Integer) As String
        Return "u izradi"
    End Function
    Public Function NewUserInsert() As String
        Dim datum As String = getDatum()
        dbEntLib = New Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase(ConnString_SPR)
        Dim UserID As String = dbEntLib.ExecuteScalar("InsertNewUser", datum).ToString
        Return UserID
    End Function

    Private Function DajDS_IzUpita_Lokal_NE(ByVal Upit As String, ByVal konekcija As String) As DataSet
        Dim ResultSet As DataSet = RunQuery(Upit, konekcija)
        Dim rrrr As Integer = ResultSet.Tables.Count
        Return ResultSet
    End Function
    Private Function DajDS_SP_Lokal(ImeSP As String, konekcija As String, Parametri() As Object) As DataSet
        Dim dbEntLib As Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase
        Dim ResultsDataSet As DataSet = New DataSet
        Dim poruka As String = ""
        Try
            dbEntLib = New Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase(konekcija)
            ResultsDataSet = dbEntLib.ExecuteDataSet(ImeSP, Parametri)
            poruka = "OK"
        Catch ex As Exception
            poruka = ex.Message
        End Try

        Return ResultsDataSet

    End Function
    Public Function DajDS_SP(ImeSP As String, konekcija As String, Parametri() As Object) As DataSet
        Dim ResultSet As DataSet
        ResultSet = DajDS_SP_Lokal(ImeSP, konekcija, Parametri)
        Return ResultSet
    End Function

    Public Sub UpdateMailStatus(PoslatiMejlID As Integer, EMAIL As String, MB As String, RezultatSlanjaMaila As String, Napomena As String)
        Dim upit As String = "UPDATE ADRESAR_MB SET EMAIL='" & EMAIL & "' WHERE MB='" & MB & "'"
        Dim rrr As Boolean = UpisPromenaBrisanje(upit, ConnString_SPRLJ)

        If PoslatiMejlID <> -1 Then
            Dim Upit_UpdateADM_SlanjeMejlovaArhiva As String = "UPDATE ADM_SlanjeMejlovaArhiva SET RezultatSlanjaMaila='" & RezultatSlanjaMaila & "', Napomena=N'" & Napomena & "' WHERE (PoslatiMejlID =" & PoslatiMejlID & ")"
            Dim rrr2 As String = UpisPromenaBrisanje(Upit_UpdateADM_SlanjeMejlovaArhiva, ConnString_SPRLJ)
        End If
    End Sub
    Public Sub UpdateMailStatus_NG(PoslatiMejlID As Integer, EMAIL As String, MB As String, RezultatSlanjaMaila As String, Napomena As String)
        Dim upit As String = "UPDATE ADM_ADRESAR_MB_Novo SET EMAIL='" & EMAIL & "' WHERE MB='" & MB & "'"
        Dim rrr As Boolean = UpisPromenaBrisanje(upit, ConnString_SPRLJ)

        If PoslatiMejlID <> -1 Then
            Dim Upit_UpdateADM_SlanjeMejlovaArhiva As String = "UPDATE ADM_SlanjeMejlovaArhiva_NG SET RezultatSlanjaMaila='" & RezultatSlanjaMaila & "', Napomena=N'" & Napomena & "' WHERE (PoslatiMejlID =" & PoslatiMejlID & ")"
            Dim rrr2 As String = UpisPromenaBrisanje(Upit_UpdateADM_SlanjeMejlovaArhiva, ConnString_SPRLJ)
        End If
    End Sub
    Public Function UpisPromenaBrisanje(ByVal Upit As String, ByVal konekcija As String) As Boolean
        Dim retSTR As String = UpisPromenaBrisanje_Lokal(Upit, konekcija)
        Dim ret As Boolean = False
        If retSTR = "OK" Then ret = True
        Return ret
    End Function

    Private Function UpisPromenaBrisanje_Lokal(ByVal Upit As String, ByVal konekcija As String) As String
        UpisPromenaBrisanje_Lokal = "ERROR"
        'Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(konekcija).ConnectionString
        Dim ConnectionString As String = konekcija

        Using SqlConn As New SqlConnection(ConnectionString)
            Dim command As New SqlCommand(Upit, SqlConn)
            ' -1 neuspelo 
            ' 1 uspelo
            Try
                If command.Connection.State = ConnectionState.Closed Then command.Connection.Open()
                command.ExecuteNonQuery()
                UpisPromenaBrisanje_Lokal = "OK"
            Catch ex As Exception
                UpisPromenaBrisanje_Lokal = ex.Message
                Return UpisPromenaBrisanje_Lokal
                Exit Function
            Finally
                command.Connection.Close()
            End Try
            Return UpisPromenaBrisanje_Lokal

        End Using
    End Function
    Public Function BrisanjeNepozeljnihZnakova(ByVal naziv As String) As String

        naziv = Replace(naziv, "'", "")

        Return naziv
    End Function
    Public Function BrisanjeNepozeljnihZnakovaMAIL(ByVal naziv As String) As String

        naziv = Replace(naziv, " ", "")
        naziv = Replace(naziv, "'", "")

        Return naziv
    End Function

    Public Function Konverzija_u_CYR(ByVal naziv As String) As String

        naziv = BrisanjeNepozeljnihZnakova(naziv)
        naziv = Trim(naziv)

        naziv = Replace(naziv, "Dž", "Џ")
        naziv = Replace(naziv, "DŽ", "Џ")
        naziv = Replace(naziv, "Đ", "Ђ")
        naziv = Replace(naziv, "Ž", "Ж")
        naziv = Replace(naziv, "Ć", "Ћ")
        naziv = Replace(naziv, "Č", "Ч")
        naziv = Replace(naziv, "Š", "Ш")

        naziv = Replace(naziv, "dž", "џ")
        naziv = Replace(naziv, "đ", "ђ")
        naziv = Replace(naziv, "ž", "ж")
        naziv = Replace(naziv, "ć", "ћ")
        naziv = Replace(naziv, "č", "ч")
        naziv = Replace(naziv, "š", "ш")

        naziv = Replace(naziv, "Dj", "Ђ")
        naziv = Replace(naziv, "Zh", "Ж")
        naziv = Replace(naziv, "Lj", "Љ")
        naziv = Replace(naziv, "LJ", "Љ")
        naziv = Replace(naziv, "Nj", "Њ")
        naziv = Replace(naziv, "NJ", "Њ")
        naziv = Replace(naziv, "Th", "Ћ")
        naziv = Replace(naziv, "Ch", "Ч")
        naziv = Replace(naziv, "Dz", "Џ")
        naziv = Replace(naziv, "Sh", "Ш")

        naziv = Replace(naziv, "dj", "ђ")
        naziv = Replace(naziv, "zh", "ж")
        naziv = Replace(naziv, "lj", "љ")
        naziv = Replace(naziv, "nj", "њ")
        naziv = Replace(naziv, "th", "ћ")
        naziv = Replace(naziv, "ch", "ч")
        naziv = Replace(naziv, "dz", "џ")
        naziv = Replace(naziv, "sh", "ш")

        naziv = Replace(naziv, "A", "А")
        naziv = Replace(naziv, "B", "Б")
        naziv = Replace(naziv, "V", "В")
        naziv = Replace(naziv, "G", "Г")
        naziv = Replace(naziv, "D", "Д")
        naziv = Replace(naziv, "E", "Е")
        naziv = Replace(naziv, "Z", "З")
        naziv = Replace(naziv, "I", "И")
        naziv = Replace(naziv, "J", "Ј")
        naziv = Replace(naziv, "K", "К")
        naziv = Replace(naziv, "L", "Л")
        naziv = Replace(naziv, "M", "М")
        naziv = Replace(naziv, "N", "Н")
        naziv = Replace(naziv, "O", "О")
        naziv = Replace(naziv, "P", "П")
        naziv = Replace(naziv, "R", "Р")
        naziv = Replace(naziv, "S", "С")
        naziv = Replace(naziv, "T", "Т")
        naziv = Replace(naziv, "U", "У")
        naziv = Replace(naziv, "F", "Ф")
        naziv = Replace(naziv, "H", "Х")
        naziv = Replace(naziv, "C", "Ц")

        naziv = Replace(naziv, "a", "а")
        naziv = Replace(naziv, "b", "б")
        naziv = Replace(naziv, "v", "в")
        naziv = Replace(naziv, "g", "г")
        naziv = Replace(naziv, "d", "д")
        naziv = Replace(naziv, "e", "е")
        naziv = Replace(naziv, "z", "з")
        naziv = Replace(naziv, "i", "и")
        naziv = Replace(naziv, "j", "ј")
        naziv = Replace(naziv, "k", "к")
        naziv = Replace(naziv, "l", "л")
        naziv = Replace(naziv, "m", "м")
        naziv = Replace(naziv, "n", "н")
        naziv = Replace(naziv, "o", "о")
        naziv = Replace(naziv, "p", "п")
        naziv = Replace(naziv, "r", "р")
        naziv = Replace(naziv, "s", "с")
        naziv = Replace(naziv, "t", "т")
        naziv = Replace(naziv, "u", "у")
        naziv = Replace(naziv, "f", "ф")
        naziv = Replace(naziv, "h", "х")
        naziv = Replace(naziv, "c", "ц")

        naziv = Replace(naziv, "wеб", "web")
        naziv = Replace(naziv, "Wеб", "Web")
        naziv = Replace(naziv, "WЕБ", "WEB")
        naziv = Replace(naziv, "ЦВ-а", "CV-a")
        naziv = Replace(naziv, "ИПА", "IPA")
        naziv = Replace(naziv, "регионал", "regional")
        naziv = Replace(naziv, "<бр />", "<br />")
        naziv = Replace(naziv, "</б>", "</b>")
        naziv = Replace(naziv, "<б>", "<b>")

        'YUSCI
        naziv = Replace(naziv, "X", "Џ")
        naziv = Replace(naziv, "\", "Ђ")
        naziv = Replace(naziv, "@", "Ж")
        naziv = Replace(naziv, "]", "Ћ")
        naziv = Replace(naziv, "^", "Ч")
        naziv = Replace(naziv, "[", "Ш")
        naziv = Replace(naziv, "Q", "Љ")
        naziv = Replace(naziv, "W", "Њ")

        naziv = Replace(naziv, "x", "џ")
        naziv = Replace(naziv, "|", "ђ")
        naziv = Replace(naziv, "`", "ж")
        naziv = Replace(naziv, "}", "ћ")
        naziv = Replace(naziv, "~", "ч")
        naziv = Replace(naziv, "{", "ш")
        naziv = Replace(naziv, "q", "љ")
        naziv = Replace(naziv, "w", "њ")

        Return naziv
    End Function
    Public Function Konverzija_u_LAT(ByVal naziv As String) As String

        naziv = BrisanjeNepozeljnihZnakova(naziv)
        naziv = Trim(naziv)

        naziv = Replace(naziv, "Џ", "Dž")
        naziv = Replace(naziv, "Џ", "DŽ")
        naziv = Replace(naziv, "Ђ", "Đ")
        naziv = Replace(naziv, "Ж", "Ž")
        naziv = Replace(naziv, "Ћ", "Ć")
        naziv = Replace(naziv, "Ч", "Č")
        naziv = Replace(naziv, "Ш", "Š")

        naziv = Replace(naziv, "џ", "dž")
        naziv = Replace(naziv, "ђ", "đ")
        naziv = Replace(naziv, "ж", "ž")
        naziv = Replace(naziv, "ћ", "ć")
        naziv = Replace(naziv, "ч", "č")
        naziv = Replace(naziv, "ш", "š")

        'naziv = Replace(naziv, "Ђ", "Dj")
        'naziv = Replace(naziv, "Ж", "Zh")
        'naziv = Replace(naziv, "Љ", "Lj")
        naziv = Replace(naziv, "Љ", "LJ")
        naziv = Replace(naziv, "Њ", "Nj")
        'naziv = Replace(naziv, "Њ", "NJ")
        'naziv = Replace(naziv, "Ћ", "Th")
        'naziv = Replace(naziv, "Ch", "Ч")
        'naziv = Replace(naziv, "Dz", "Џ")
        'naziv = Replace(naziv, "Sh", "Ш")

        'naziv = Replace(naziv, "dj", "ђ")
        'naziv = Replace(naziv, "zh", "ж")
        naziv = Replace(naziv, "љ", "lj")
        naziv = Replace(naziv, "њ", "nj")
        'naziv = Replace(naziv, "th", "ћ")
        'naziv = Replace(naziv, "ch", "ч")
        'naziv = Replace(naziv, "dz", "џ")
        'naziv = Replace(naziv, "sh", "ш")

        naziv = Replace(naziv, "А", "A")
        naziv = Replace(naziv, "Б", "B")
        naziv = Replace(naziv, "В", "V")
        naziv = Replace(naziv, "Г", "G")
        naziv = Replace(naziv, "Д", "D")
        naziv = Replace(naziv, "Е", "E")
        naziv = Replace(naziv, "З", "Z")
        naziv = Replace(naziv, "И", "I")
        naziv = Replace(naziv, "Ј", "J")
        naziv = Replace(naziv, "К", "K")
        naziv = Replace(naziv, "Л", "L")
        naziv = Replace(naziv, "М", "M")
        naziv = Replace(naziv, "Н", "N")
        naziv = Replace(naziv, "О", "O")
        naziv = Replace(naziv, "П", "P")
        naziv = Replace(naziv, "Р", "R")
        naziv = Replace(naziv, "С", "S")
        naziv = Replace(naziv, "Т", "T")
        naziv = Replace(naziv, "У", "U")
        naziv = Replace(naziv, "Ф", "F")
        naziv = Replace(naziv, "Х", "H")
        naziv = Replace(naziv, "Ц", "C")

        naziv = Replace(naziv, "а", "a")
        naziv = Replace(naziv, "б", "b")
        naziv = Replace(naziv, "в", "v")
        naziv = Replace(naziv, "г", "g")
        naziv = Replace(naziv, "д", "d")
        naziv = Replace(naziv, "е", "e")
        naziv = Replace(naziv, "з", "z")
        naziv = Replace(naziv, "и", "i")
        naziv = Replace(naziv, "ј", "j")
        naziv = Replace(naziv, "к", "k")
        naziv = Replace(naziv, "л", "l")
        naziv = Replace(naziv, "м", "m")
        naziv = Replace(naziv, "н", "n")
        naziv = Replace(naziv, "о", "o")
        naziv = Replace(naziv, "п", "p")
        naziv = Replace(naziv, "р", "r")
        naziv = Replace(naziv, "с", "s")
        naziv = Replace(naziv, "т", "t")
        naziv = Replace(naziv, "у", "u")
        naziv = Replace(naziv, "ф", "f")
        naziv = Replace(naziv, "х", "h")
        naziv = Replace(naziv, "ц", "c")

        Return naziv
    End Function
    Public Function Konverzija_u_ENG(ByVal naziv As String) As String

        naziv = BrisanjeNepozeljnihZnakova(naziv)
        naziv = Trim(naziv)

        naziv = Replace(naziv, "Џ", "DZ")
        naziv = Replace(naziv, "Ђ", "DJ")
        naziv = Replace(naziv, "Ж", "Z")
        naziv = Replace(naziv, "Ћ", "C")
        naziv = Replace(naziv, "Ч", "C")
        naziv = Replace(naziv, "Ш", "S")
        naziv = Replace(naziv, "Њ", "NJ")
        naziv = Replace(naziv, "Љ", "LJ")

        naziv = Replace(naziv, "џ", "dz")
        naziv = Replace(naziv, "ђ", "dj")
        naziv = Replace(naziv, "ж", "z")
        naziv = Replace(naziv, "ћ", "c")
        naziv = Replace(naziv, "ч", "c")
        naziv = Replace(naziv, "ш", "s")
        naziv = Replace(naziv, "њ", "nj")
        naziv = Replace(naziv, "љ", "lj")

        naziv = Replace(naziv, "А", "A")
        naziv = Replace(naziv, "Б", "B")
        naziv = Replace(naziv, "В", "V")
        naziv = Replace(naziv, "Г", "G")
        naziv = Replace(naziv, "Д", "D")
        naziv = Replace(naziv, "Е", "E")
        naziv = Replace(naziv, "З", "Z")
        naziv = Replace(naziv, "И", "I")
        naziv = Replace(naziv, "Ј", "J")
        naziv = Replace(naziv, "К", "K")
        naziv = Replace(naziv, "Л", "L")
        naziv = Replace(naziv, "М", "M")
        naziv = Replace(naziv, "Н", "N")
        naziv = Replace(naziv, "О", "O")
        naziv = Replace(naziv, "П", "P")
        naziv = Replace(naziv, "Р", "R")
        naziv = Replace(naziv, "С", "S")
        naziv = Replace(naziv, "Т", "T")
        naziv = Replace(naziv, "У", "U")
        naziv = Replace(naziv, "Ф", "F")
        naziv = Replace(naziv, "Х", "H")
        naziv = Replace(naziv, "Ц", "C")

        naziv = Replace(naziv, "а", "a")
        naziv = Replace(naziv, "б", "b")
        naziv = Replace(naziv, "в", "v")
        naziv = Replace(naziv, "г", "g")
        naziv = Replace(naziv, "д", "d")
        naziv = Replace(naziv, "е", "e")
        naziv = Replace(naziv, "з", "z")
        naziv = Replace(naziv, "и", "i")
        naziv = Replace(naziv, "ј", "j")
        naziv = Replace(naziv, "к", "k")
        naziv = Replace(naziv, "л", "l")
        naziv = Replace(naziv, "м", "m")
        naziv = Replace(naziv, "н", "n")
        naziv = Replace(naziv, "о", "o")
        naziv = Replace(naziv, "п", "p")
        naziv = Replace(naziv, "р", "r")
        naziv = Replace(naziv, "с", "s")
        naziv = Replace(naziv, "т", "t")
        naziv = Replace(naziv, "у", "u")
        naziv = Replace(naziv, "ф", "f")
        naziv = Replace(naziv, "х", "h")
        naziv = Replace(naziv, "ц", "c")

        Return naziv
    End Function


    Public Function ProveraAdminDozvole(ByVal ID_AdminKorisnika As String) As Integer
        Dim ds As New DataSet
        Dim ImaPrava As Integer = 1

        ds = DajDS_IzUpita_Lokal("Select * from vADM_Veza_Korisnik_Posao Where ID_AdminKorisnika = '" & ID_AdminKorisnika & "'", ConnString_PISARNICA)
        If ds.Tables(0).Rows.Count > 0 Then
            ImaPrava = 1
        Else
            ImaPrava = 0
        End If

        Return ImaPrava
    End Function



    Public Function VratiIkonicuFajla(ByVal ekstenzija As String) As String
        Dim ResultSet As DataSet = RunQuery("SELECT * FROM IkoniceFajla Where ekstenzija = '" & ekstenzija & "'", ConnString_SPRLJ)
        Dim ImageURL As String
        ImageURL = ""
        If ResultSet.Tables(0).Rows.Count > 0 Then
            ImageURL = ResultSet.Tables(0).Rows(0).Item("ImageURL")
        Else
            ImageURL = "Resursi/ikone/male/gif.gif"
        End If

        Return ImageURL
    End Function
    Public Function CountCharacter(ByVal value As String, ByVal ch As Char) As Integer
        Dim cnt As Integer = 0
        For Each c As Char In value
            If c = ch Then
                cnt += 1
            End If
        Next
        Return cnt
    End Function
    Public Function ProveraFormataBrojaTelefona(ByVal BrojTelefona As String) As Int16
        Dim NeispravanBrojTelefona As Integer = 0
        Dim i As Integer
        Dim karakter As Char
        Dim DozvoljeniZnaci As String = "0123456789=()-/ "

        If BrojTelefona.Length() >= 5 Then
            For i = 0 To BrojTelefona.Length() - 1
                karakter = BrojTelefona.Substring(i, 1)
                If InStr(1, DozvoljeniZnaci, karakter) = 0 Then
                    NeispravanBrojTelefona = 1
                    Exit For
                End If
            Next
        End If

        Return NeispravanBrojTelefona
    End Function
    Public Function IsValidEmailFormat(ByVal inputEmail As String) As Integer

        Dim result As Boolean = True
        Dim ImaGreske As Integer = 0

        If Not String.IsNullOrEmpty(inputEmail) Then

            Dim pattern As String = "^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" + "\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" + ".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"


            Dim match As RegularExpressions.Match = RegularExpressions.Regex.Match(inputEmail, pattern)
            result = match.Success
        End If

        If result = False Then ImaGreske = 1

        Return ImaGreske
    End Function
    Public Function IsValidURL(ByVal inputURL As String) As Integer

        Dim result As Boolean = True
        Dim ImaGreske As Integer = 0

        If Not String.IsNullOrEmpty(inputURL) Then

            'Dim pattern As String = " ^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$"
            'Dim pattern As String = "^(?:http:\/\/)?(?:(?:[a-z0-9][\w\-]*[a-z0-9]*\.)*(?:(?:(?:(?:[a-z0-9][\w\-]*[a-z0-9]*)(?:\.[a-z0-9]+)?)|(?:(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)))(?::[0-9]+)?))?(?:(?:(?:\/(?:[\w`~!$=;\-\+\.\^\(\)\|\{\}\[\]]|(?:%\d\d))+)*\/(?:[\w`~!$=;\-\+\.\^\(\)\|\{\}\[\]]|(?:%\d\d))*)(?:\?[\^#]+)?(?:#[a-z0-9]\w*)?)?$"
            'Dim pattern As String = "http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"

            '*** DODALA 02.10.2018.***'
            Dim pattern As String = "(http(s)?://)?([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?"
            Dim match As RegularExpressions.Match = RegularExpressions.Regex.Match(inputURL, pattern)
            result = match.Success
        End If

        If result = False Then ImaGreske = 1

        Return ImaGreske
    End Function
    Public Function IsValid_TekstPolje(ByVal TekstPolja As String, ByVal minDuzina As Int16, ByVal maxDuzina As Int16) As Integer

        Dim result As Boolean = True
        Dim ImaGreske As Integer = 0

        If Not String.IsNullOrEmpty(TekstPolja) Then

            Dim pattern As String = "([a-zA-Z0-9_.@-]{" & minDuzina.ToString() & "," & maxDuzina.ToString() & "})$"

            Dim match As RegularExpressions.Match = RegularExpressions.Regex.Match(TekstPolja, pattern)
            result = match.Success
        End If

        If result = False Then ImaGreske = 1

        Return ImaGreske
    End Function
    Public Function IsValidIPAddress(ByVal strIPAddress As String) As Boolean
        On Error GoTo Handler
        Dim varAddress As Object, n As Long, lCount As Long
        varAddress = Split(strIPAddress, ".", , vbTextCompare)
        '// 
        If IsArray(varAddress) Then
            For n = LBound(varAddress) To UBound(varAddress)
                lCount = lCount + 1
                varAddress(n) = CByte(varAddress(n))
            Next
            '// 
            IsValidIPAddress = (lCount = 4)
        End If
        '// 
Handler:
    End Function
    Public Sub ExportToExcel(ByVal ds As DataSet, ByVal izbaci As Integer, ByVal Zag As String)

        Dim red As DataRow
        Dim kol As DataColumn
        Dim dt As DataTable
        Dim sb As StringBuilder = New StringBuilder()

        sb.Append("<?xml version='1.0'?>").AppendLine()
        sb.Append("<?mso-application progid='Excel.Sheet'?>").AppendLine()
        sb.Append("<Workbook xmlns='urn:schemas-microsoft-com:office:spreadsheet'").AppendLine()
        sb.Append("xmlns:o='urn:schemas-microsoft-com:office:office'").AppendLine()
        sb.Append("xmlns:x='urn:schemas-microsoft-com:office:excel'").AppendLine()
        sb.Append("xmlns:ss='urn:schemas-microsoft-com:office:spreadsheet'").AppendLine()
        sb.Append("xmlns:html='http://www.w3.org/TR/REC-html40'>").AppendLine()
        sb.Append("").AppendLine()

        sb.Append("<Styles>").AppendLine()

        'STIL ZAGLAVLJA
        Dim strZag As String
        Dim strZagStyles As String
        strZag = My.Computer.FileSystem.ReadAllText(Zag)
        Dim StylesPoc As Integer = strZag.IndexOf("<Styles>", StringComparison.OrdinalIgnoreCase)
        Dim StylesKraj As Integer = strZag.LastIndexOf("</Styles>", StringComparison.OrdinalIgnoreCase)
        strZagStyles = strZag.Trim.Substring(StylesPoc, StylesKraj - StylesPoc)
        strZagStyles = strZagStyles.Replace("<Styles>", "")
        strZagStyles = strZagStyles.Replace("</Styles>", "")

        '''''''''
        sb.Append(strZagStyles)
        sb.Append("</Styles>").AppendLine()

        'ZAGLAVLJE
        Dim strTab As String
        Dim TabPoc As Integer = strZag.IndexOf("<Column", StringComparison.OrdinalIgnoreCase)
        If TabPoc < 0 Then
            TabPoc = strZag.IndexOf("<Row", StringComparison.OrdinalIgnoreCase)
        End If
        Dim TabKraj As Integer = strZag.IndexOf("</Table>", StringComparison.OrdinalIgnoreCase)
        strTab = strZag.Trim.Substring(TabPoc, TabKraj - TabPoc)
        strTab.Replace("</Table>", "")
        '''''''''

        'WORKSHEET OPTIONS
        Dim strWO As String
        Dim WOPoc As Integer = strZag.IndexOf("<WorksheetOptions", StringComparison.OrdinalIgnoreCase)
        Dim WOKraj As Integer = strZag.IndexOf("</WorksheetOptions>", StringComparison.OrdinalIgnoreCase)

        If WOPoc < 0 Or WOKraj < 0 Then
            strWO = ""
        Else
            strWO = strZag.Trim.Substring(WOPoc, WOKraj - WOPoc) & "</WorksheetOptions>"
        End If


        Dim j As Integer = 0
        sb.Append("<Worksheet ss:Name='" & "x" & (j + 1).ToString & "'>").AppendLine()
        sb.Append("<Table>").AppendLine()
        'kopiraj zaglavlje     
        sb.Append(strTab)
        'kraj kopiraj zaglavlje


        Dim pom As String = ""
        Dim tip As String
        For i As Integer = 0 To ds.Tables.Count - 1
            dt = ds.Tables(i)
            'pisi ds
            For Each red In dt.Rows
                sb.Append("<Row>").AppendLine()
                For Each kol In dt.Columns
                    sb.Append("<Cell>").AppendLine()
                    pom = "<Data ss:Type='"
                    tip = red(kol.ColumnName).GetType.ToString().Trim
                    If tip = "System.Decimal" Or tip = "System.Int32" Then
                        pom = pom & "Number"
                    Else
                        pom = pom & "String"
                    End If
                    pom = pom & "'>"
                    sb.Append(pom)
                    sb.Append(red(kol.ColumnName).ToString())
                    sb.Append("</Data>")
                    sb.AppendLine()
                    sb.Append("</Cell>").AppendLine()
                Next
                sb.Append("</Row>").AppendLine()
            Next
            'kraj pisi ds

            'If i <> ns(j) - 1 Then
            'Else
            '    'pisi ds
            '    For Each red In dt.Rows
            '        sb.Append("<Row>").AppendLine()
            '        For Each kol In dt.Columns
            '            sb.Append("<Cell>").AppendLine()
            '            pom = "<Data ss:Type='"
            '            tip = red(kol.ColumnName).GetType.ToString().Trim
            '            If tip = "System.Decimal" Or tip = "System.Int32" Then
            '                pom = pom & "Number"
            '            Else
            '                pom = pom & "String"
            '            End If
            '            pom = pom & "'>"
            '            sb.Append(pom)
            '            sb.Append(red(kol.ColumnName).ToString())
            '            sb.Append("</Data>")
            '            sb.AppendLine()
            '            sb.Append("</Cell>").AppendLine()
            '        Next
            '        sb.Append("</Row>").AppendLine()
            '    Next
            'kraj pisi ds

            'daj nov sheet
            'If (i = ds.Tables.Count - 1 And j = UBound(ns)) Then
            'Else
            '    j = j + 1

            '    sb.Append("</Table>").AppendLine()
            '    sb.Append(strWO).AppendLine()
            '    sb.Append("</Worksheet>").AppendLine()
            '    sb.Append("<Worksheet ss:Name='" & "x" & (j + 1).ToString & "'>").AppendLine()
            '    sb.Append("<Table>").AppendLine()
            '    'kopiraj zaglavlje     
            '    sb.Append(strTab)
            '    'kraj kopiraj zaglavlje
            'End If
            'End If
        Next



        sb.Append("</Table>").AppendLine()
        sb.Append(strWO).AppendLine()
        sb.Append("</Worksheet>").AppendLine()
        sb.Append("</Workbook>").AppendLine()

        HttpContext.Current.Response.Clear()
        HttpContext.Current.Response.AddHeader("content-disposition", String.Format("attachment; filename={0}", "Export.xls"))
        HttpContext.Current.Response.ContentType = "application/ms-excel"

        HttpContext.Current.Response.Write(sb.ToString())
        HttpContext.Current.Response.End()

        'Response.ClearHeaders()
        'Response.AppendHeader("Content-Disposition", "attachment; filename=TRT.xml")
        'Response.AppendHeader("Content-Length", sb.Length.ToString())
        'Response.ContentType = "text/csv"
        'Response.Write(sb.ToString())
        'Response.End()
    End Sub
    Public Sub ExportToExcel2(ByVal ds As DataSet, ByVal izbaci As Integer, ByVal Zag As String)

        Dim red As DataRow
        Dim kol As DataColumn
        Dim dt1 As DataTable
        Dim dt2 As DataTable
        Dim sb As StringBuilder = New StringBuilder()

        sb.Append("<?xml version='1.0'?>").AppendLine()
        sb.Append("<?mso-application progid='Excel.Sheet'?>").AppendLine()
        sb.Append("<Workbook xmlns='urn:schemas-microsoft-com:office:spreadsheet'").AppendLine()
        sb.Append("xmlns:o='urn:schemas-microsoft-com:office:office'").AppendLine()
        sb.Append("xmlns:x='urn:schemas-microsoft-com:office:excel'").AppendLine()
        sb.Append("xmlns:ss='urn:schemas-microsoft-com:office:spreadsheet'").AppendLine()
        sb.Append("xmlns:html='http://www.w3.org/TR/REC-html40'>").AppendLine()
        sb.Append("").AppendLine()

        sb.Append("<Styles>").AppendLine()

        'STIL ZAGLAVLJA
        Dim strZag As String
        Dim strZagStyles As String
        strZag = My.Computer.FileSystem.ReadAllText(Zag)
        Dim StylesPoc As Integer = strZag.IndexOf("<Styles>", StringComparison.OrdinalIgnoreCase)
        Dim StylesKraj As Integer = strZag.LastIndexOf("</Styles>", StringComparison.OrdinalIgnoreCase)
        strZagStyles = strZag.Trim.Substring(StylesPoc, StylesKraj - StylesPoc)
        strZagStyles = strZagStyles.Replace("<Styles>", "")
        strZagStyles = strZagStyles.Replace("</Styles>", "")

        '''''''''
        sb.Append(strZagStyles)
        sb.Append("</Styles>").AppendLine()

        'ZAGLAVLJE
        Dim strTab As String
        Dim TabPoc As Integer = strZag.IndexOf("<Column", StringComparison.OrdinalIgnoreCase)
        If TabPoc < 0 Then
            TabPoc = strZag.IndexOf("<Row", StringComparison.OrdinalIgnoreCase)
        End If
        Dim TabKraj As Integer = strZag.IndexOf("</Table>", StringComparison.OrdinalIgnoreCase)
        strTab = strZag.Trim.Substring(TabPoc, TabKraj - TabPoc)
        strTab.Replace("</Table>", "")
        '''''''''

        'WORKSHEET OPTIONS
        Dim strWO As String
        Dim WOPoc As Integer = strZag.IndexOf("<WorksheetOptions", StringComparison.OrdinalIgnoreCase)
        Dim WOKraj As Integer = strZag.IndexOf("</WorksheetOptions>", StringComparison.OrdinalIgnoreCase)

        If WOPoc < 0 Or WOKraj < 0 Then
            strWO = ""
        Else
            strWO = strZag.Trim.Substring(WOPoc, WOKraj - WOPoc) & "</WorksheetOptions>"
        End If


        Dim j As Integer = 0
        sb.Append("<Worksheet ss:Name='" & "x" & (j + 1).ToString & "'>").AppendLine()
        sb.Append("<Table>").AppendLine()
        'kopiraj zaglavlje     
        sb.Append(strTab)
        'kraj kopiraj zaglavlje


        Dim pom As String = ""
        Dim tip As String
        dt1 = ds.Tables(0)
        'pisi dt1
        For Each red In dt1.Rows
            sb.Append("<Row>").AppendLine()
            For Each kol In dt1.Columns
                sb.Append("<Cell ss:StyleID=""s106"">").AppendLine()
                pom = "<Data ss:Type='"
                tip = red(kol.ColumnName).GetType.ToString().Trim
                If tip = "System.Decimal" Or tip = "System.Int32" Then
                    pom = pom & "Number"
                Else
                    pom = pom & "String"
                End If
                pom = pom & "'>"
                sb.Append(pom)
                sb.Append(red(kol.ColumnName).ToString())
                sb.Append("</Data>")
                sb.AppendLine()
                sb.Append("</Cell>").AppendLine()
            Next
            sb.Append("</Row>").AppendLine()
        Next

        dt2 = ds.Tables(1)
        'pisi dt2
        For Each red In dt2.Rows
            sb.Append("<Row>").AppendLine()
            For Each kol In dt2.Columns
                sb.Append("<Cell>").AppendLine()
                pom = "<Data ss:Type='"
                tip = red(kol.ColumnName).GetType.ToString().Trim
                If tip = "System.Decimal" Or tip = "System.Int32" Then
                    pom = pom & "Number"
                Else
                    pom = pom & "String"
                End If
                pom = pom & "'>"
                sb.Append(pom)
                sb.Append(red(kol.ColumnName).ToString())
                sb.Append("</Data>")
                sb.AppendLine()
                sb.Append("</Cell>").AppendLine()
            Next
            sb.Append("</Row>").AppendLine()
        Next
        'kraj pisi ds

        sb.Append("</Table>").AppendLine()
        sb.Append(strWO).AppendLine()
        sb.Append("</Worksheet>").AppendLine()
        sb.Append("</Workbook>").AppendLine()

        HttpContext.Current.Response.Clear()
        HttpContext.Current.Response.AddHeader("content-disposition", String.Format("attachment; filename={0}", "Export.xls"))
        HttpContext.Current.Response.ContentType = "application/ms-excel"

        HttpContext.Current.Response.Write(sb.ToString())
        HttpContext.Current.Response.End()
    End Sub
    Public Function getConnStr(ByVal keyName As String) As String
        Dim s As String = ""
        Dim s_default As String = ""

        ' Get the connectionStrings.
        Dim connectionStrings As System.Configuration.ConnectionStringSettingsCollection = System.Configuration.ConfigurationManager.ConnectionStrings

        ' Get the collection enumerator.
        Dim connectionStringsEnum As IEnumerator = connectionStrings.GetEnumerator()

        ' Loop through the collection and 
        ' display the connectionStrings key, value pairs.
        Dim i As Integer = 0
        While connectionStringsEnum.MoveNext()
            Dim name As String = connectionStrings(i).Name
            If (connectionStrings(name).Name.CompareTo(keyName) = 0) Then
                s = connectionStrings(name).ConnectionString
                Return s
            Else
                'ako nije nadjen kljuc, onda uzimamo default-ni
                Dim _def As String = "conn_default"
                's_default = connectionStrings(_def).ConnectionString
                's = s_default
            End If

            i += 1
        End While

        Return s
    End Function


    Private Function KreirajUpitOpstine(ByVal opstina As String, ByVal jezik As String) As String
        Dim naziv As String
        Dim opstine As String

        Select Case jezik
            Case "srCyr"
                naziv = "nOps_Cir"
                opstine = Konverzija_u_CYR(opstina)
            Case "srLat"
                naziv = "nOps_Lat"
                opstine = Konverzija_u_LAT(opstina)
            Case "en"
                naziv = "nOps_Lat"
                opstine = opstina
            Case Else
                naziv = "nOps_Cir"
                opstine = Konverzija_u_CYR(opstina)
        End Select
        Dim SQLUpit As String = "select Ops," + naziv + " from dbo.vSifarnik_Opstine where " + naziv + " Like N'%" & opstine & "%'"

        Return SQLUpit
    End Function

    Public Function GetMAC(IP As String) As String
        Dim inet As Integer
        Dim b(6) As Byte
        Dim pMACAddr As Integer
        Dim i As Short
        Dim sResult As String = ""

        inet = inet_addr(IP)
        If SendARP(inet, 0, pMACAddr, 6) = 0 Then
            CopyMemory(b(0), pMACAddr, 6)
            For i = 0 To 5
                sResult = sResult & Microsoft.VisualBasic.Right("0" & Hex(b(i)), 2)
                If i < 5 Then sResult &= "-"
            Next
        End If
        Return sResult
    End Function
    Public Function GetDeviceType() As String
        Dim userAgent As String = HttpContext.Current.Request.UserAgent.ToLower()
        Return userAgent
    End Function
    Public Function isMobileBrowser_V1() As Boolean
        'GETS THE CURRENT USER CONTEXT
        Dim context As HttpContext = HttpContext.Current

        'FIRST TRY BUILT IN ASP.NT CHECK
        If context.Request.Browser.IsMobileDevice Then
            Return True
        End If
        'THEN TRY CHECKING FOR THE HTTP_X_WAP_PROFILE HEADER
        If context.Request.ServerVariables("HTTP_X_WAP_PROFILE") IsNot Nothing Then
            Return True
        End If
        'THEN TRY CHECKING THAT HTTP_ACCEPT EXISTS AND CONTAINS WAP
        If context.Request.ServerVariables("HTTP_ACCEPT") IsNot Nothing AndAlso context.Request.ServerVariables("HTTP_ACCEPT").ToLower().Contains("wap") Then
            Return True
        End If
        'AND FINALLY CHECK THE HTTP_USER_AGENT 
        'HEADER VARIABLE FOR ANY ONE OF THE FOLLOWING
        If context.Request.ServerVariables("HTTP_USER_AGENT") IsNot Nothing Then
            Dim rfr As String = context.Request.ServerVariables("HTTP_USER_AGENT")
            'Create a list of all mobile types
            Dim mobiles As String() = {"midp", "j2me", "avant", "docomo", "novarra", "palmos",
            "palmsource", "240x320", "opwv", "chtml", "pda", "windows ce",
            "mmp/", "blackberry", "mib/", "symbian", "wireless", "nokia",
            "hand", "mobi", "phone", "cdm", "up.b", "audio",
            "SIE-", "SEC-", "samsung", "HTC", "mot-", "mitsu",
            "sagem", "sony", "alcatel", "lg", "eric", "vx",
            "NEC", "philips", "mmm", "xx", "panasonic", "sharp",
            "wap", "sch", "rover", "pocket", "benq", "java",
            "pt", "pg", "vox", "amoi", "bird", "compal",
            "kg", "voda", "sany", "kdd", "dbt", "sendo",
            "sgh", "gradi", "jb", "dddi", "moto", "iphone"}

            'Loop through each item in the list created above 
            'and check if the header contains that text
            For Each s As String In mobiles
                If context.Request.ServerVariables("HTTP_USER_AGENT").ToLower().Contains(s.ToLower()) Then
                    Return True
                End If
            Next
        End If

        Return False
    End Function
    Public Function IsMobileBrowser_V2() As String
        Dim context As HttpContext = HttpContext.Current
        Dim userAgent As String = context.Request.ServerVariables("HTTP_USER_AGENT")
        Dim OS As New Regex("(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino", RegexOptions.IgnoreCase Or RegexOptions.Multiline)
        Dim device As New Regex("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-", RegexOptions.IgnoreCase Or RegexOptions.Multiline)
        Dim device_info As String = String.Empty

        If OS.IsMatch(userAgent) Then
            device_info = OS.Match(userAgent).Groups(0).Value
        End If

        If device.IsMatch(userAgent.Substring(0, 4)) Then
            device_info += device.Match(userAgent).Groups(0).Value
        End If
        Return device_info

        ' If Not String.IsNullOrEmpty(device_info) Then

        'Response.Redirect(Convert.ToString("Mobile.aspx?device_info=") & device_info)

        ' End If
    End Function
    Public Function GetIP4Address() As String
        Dim IP4Address As String = String.Empty

        For Each IPA As IPAddress In Dns.GetHostAddresses(HttpContext.Current.Request.UserHostAddress)
            If IPA.AddressFamily.ToString() = "InterNetwork" Then
                IP4Address = IPA.ToString()
                Exit For
            End If
        Next

        If IP4Address <> String.Empty Then
            Return IP4Address
        End If

        For Each IPA As IPAddress In Dns.GetHostAddresses(Dns.GetHostName())
            If IPA.AddressFamily.ToString() = "InterNetwork" Then
                IP4Address = IPA.ToString()
                Exit For
            End If
        Next

        Return IP4Address
    End Function
    Public Function Duplikat(ByVal polje As String, ByVal tabela As String, ByVal podatak As String) As Boolean
        Dim dsUpit As DataSet
        Dim Upit As String = "SELECT * FROM " & tabela & " WHERE " & polje & "= '" & podatak & "'"
        dsUpit = DajDS_IzUpita_Lokal(Upit, ConnString_BORZAL)
        Dim broj As Integer = dsUpit.Tables(0).Rows.Count
        If broj > 0 Then
            Return True
        Else Return False
        End If
    End Function


End Class
