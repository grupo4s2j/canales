Imports Database
Imports Conexion
Public Class Formulario_web1
    Inherits System.Web.UI.Page
    Public obj

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim con As New Conexion.Conexion
        'We this to make an HTTP web request
        Dim req As Net.HttpWebRequest = Net.WebRequest.Create("https://api.telegram.org/bot330074881:AAGZcL6d7_zTxBWkp3lBfmQmZUWwwzUPRv8/getUpdates")

        'Make the web request and get the response
        Dim response As Net.WebResponse = req.GetResponse

        Dim stream As System.IO.Stream = response.GetResponseStream

        'Prepare buffer for reading from stream
        Dim buffer As Byte() = New Byte(1000) {}

        'Data read from stream is gathered here
        Dim data As New List(Of Byte)

        'Start reading stream
        Dim bytesRead = stream.Read(buffer, 0, buffer.Length)

        Do Until bytesRead = 0
            For i = 0 To bytesRead - 1
                data.Add(buffer(i))
            Next

            bytesRead = stream.Read(buffer, 0, buffer.Length)
        Loop


        'Gets the JSON data
        Debug.WriteLine(System.Text.Encoding.UTF8.GetString(data.ToArray))
        Dim a = Json.JsonParser.FromJson(System.Text.Encoding.UTF8.GetString(data.ToArray))
        obj = a
        obj("result").Reverse()



        response.Close()
        stream.Close()

        For Each x In obj("result")
            If x.ContainsKey("channel_post") Then
                Dim fecha = x("channel_post")("date")
                Dim texto = x("channel_post")("text")
                Dim canal = x("channel_post")("chat")("title")
                Dim id = x("update_id")
                Dim nTimestamp As Double = fecha
                Dim nDateTime As System.DateTime = New System.DateTime(1970, 1, 1, 0, 0, 0, 0)
                fecha = nDateTime.AddSeconds(nTimestamp)
                Try

                    ' con.doQuery("delete  from post")
                    Dim sql = " select * from post where idPost=" & id
                    Dim reader = con.doSelect(sql)
                    If reader.HasRows Then

                    Else
                        sql = "insert into Post (idPost , Canal,  Fecha, Texto) values ('" & id & "', '" & canal & "' ,'" & fecha & "','" & texto & "')"
                        con.doQuery(sql)
                    End If

                Catch ex As Exception
                    MsgBox(ex.ToString())
                End Try
            End If
        Next

       

    End Sub





End Class