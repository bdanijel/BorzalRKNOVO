Imports System.Data
Imports System.Web.Services
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class Grafikon3
    Inherits System.Web.UI.Page
    Dim b As New ADM_MM()
    Dim BORZALConnectionString As String = b.ConnString_BORZAL
    Dim ImaAdminPrava As Integer = 0
    Dim ImaSpoljniKorisnikPrava As Integer = 0



    Private Sub Poruka_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True


    End Sub

    <WebMethod()>
    Public Shared Function GetChartData() As List(Of Object)
        Dim query As String = "SELECT * FROM vPredatnicaGRAFIKON"
        Dim constr As String = ConfigurationManager.ConnectionStrings("BORZALConnectionString").ConnectionString
        Dim chartData As New List(Of Object)()
        chartData.Add(New Object() {"NAZIV", "UKUPNO"})
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(query)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        chartData.Add(New Object() {sdr("NAZIV"), sdr("UKUPNO")})
                    End While
                End Using
                con.Close()
                Return chartData
            End Using
        End Using
    End Function
End Class