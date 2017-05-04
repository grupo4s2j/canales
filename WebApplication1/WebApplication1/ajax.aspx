
 <%      
     Dim con As New Conexion.Conexion     
     Dim req As Net.HttpWebRequest = Net.WebRequest.Create("https://api.telegram.org/bot330074881:AAGZcL6d7_zTxBWkp3lBfmQmZUWwwzUPRv8/getUpdates")
     Dim responses As Net.WebResponse = req.GetResponse
     Dim stream As System.IO.Stream = responses.GetResponseStream
     Dim buffer As Byte() = New Byte(1000) {}
     Dim data As New List(Of Byte)
     Dim bytesRead = stream.Read(buffer, 0, buffer.Length)
     Do Until bytesRead = 0
         For i = 0 To bytesRead - 1
             data.Add(buffer(i))
         Next
         bytesRead = stream.Read(buffer, 0, buffer.Length)
     Loop
     Dim obj
     Dim a = Json.JsonParser.FromJson(System.Text.Encoding.UTF8.GetString(data.ToArray))
     obj = a
     obj("result").Reverse()
     responses.Close()
     stream.Close()
     Dim html = ""
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
             
             html += "<div class='post' style='display: none;'  >" +
                                     "<div class='panel panel-info '>" +
                                     "<div class='panel-heading'>" & canal &
                                     "<a id='" & id & "' class=' pull-right glyphicon glyphicon-star-empty pull-right ' aria-hidden='true'  aria-expanded='true' onClick=animation()>" +
                                     "</a>" +
                                     "<a  class='pull-right glyphicon glyphicon-envelope ml10' aria-expanded='true' data-toggle='modal' data-target='#myModal' >" +
                                         "<span class='label label-success numMessages' style='right: -4px; top:-6px'>4</span>" +
                                     "</a> </div>" +
                                     "<div id='cont" & id & "' class='panel-body'>" &texto & "</div>" +
                                     "<div class='panel-footer' style='height: 40px;'> <span class='pull-right' >" & fecha & "</span></div></div>" +
                                     "</div>"
           
         End If
     Next
    
     Response.Write(html)
    
%>
