
 <%    
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
             html += "<div class='post'>"
             html += "<div class='panel panel-info'>"
             html += "<div class='panel-heading'>" & x("channel_post")("chat")("title") &
                           "<a class='pull-right ' aria-expanded='true'>" &
                           "<i id='" & x("update_id") & "' class='glyphicon glyphicon-star-empty pull-right ' aria-hidden='true'></i></a>" &
                           "<a  class='pull-right ml10' aria-expanded='true' >" &
                           "<i  class='glyphicon glyphicon-envelope' ></i><span   data-toggle='modal' data-target='#exampleModal' class='label label-success numNotifi' style='right: 48px;'>4</span></div></a>"
             html += "<div class='panel-body'>" & x("channel_post")("text") & "</div>"
             html += "</div>"
             html += "</div>"
         End If
     Next
     Response.Write(html)
%>
