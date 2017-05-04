Imports Database
Imports ClassLibrary1
Public Class Formulario_web1
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim con As New Conexion
        con.Abrir()
        Dim sql As String
        con.doSelect()

        ''We this to make an HTTP web request
        'Dim req As Net.HttpWebRequest = Net.WebRequest.Create("https://api.telegram.org/bot330074881:AAGZcL6d7_zTxBWkp3lBfmQmZUWwwzUPRv8/getUpdates")

        ''Make the web request and get the response
        'Dim response As Net.WebResponse = req.GetResponse

        'Dim stream As System.IO.Stream = response.GetResponseStream

        ''Prepare buffer for reading from stream
        'Dim buffer As Byte() = New Byte(1000) {}

        ''Data read from stream is gathered here
        'Dim data As New List(Of Byte)

        ''Start reading stream
        'Dim bytesRead = stream.Read(buffer, 0, buffer.Length)

        'Do Until bytesRead = 0
        '    For i = 0 To bytesRead - 1
        '        data.Add(buffer(i))
        '    Next

        '    bytesRead = stream.Read(buffer, 0, buffer.Length)
        'Loop


        ''Gets the JSON data
        'Debug.WriteLine(System.Text.Encoding.UTF8.GetString(data.ToArray))
        'Dim a = Json.JsonParser.FromJson(System.Text.Encoding.UTF8.GetString(data.ToArray))
        'obj = a
        'obj("result").Reverse()
        'response.Close()
        'stream.Close()

       

    End Sub





End Class