
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
             html += "<div class='post' style='display: none;'  >" +
                                     "<div class='panel panel-info '>" +
                                     "<div class='panel-heading'>" & x("channel_post")("chat")("title") &
                                     "<a id='" & x("update_id") & "' class=' pull-right glyphicon glyphicon-star-empty pull-right ' aria-hidden='true'  aria-expanded='true' onClick=animation()>" +
                                     "</a>" +
                                     "<a  class='pull-right glyphicon glyphicon-envelope ml10' aria-expanded='true' data-toggle='modal' data-target='#myModal' >" +
                                         "<span class='label label-success numMessages' style='right: -4px; top:-6px'>4</span>" +
                                     "</a> </div>" +
                                     "<div id='cont" & x("update_id") & "' class='panel-body'>" & x("channel_post")("text") & "</div>" +
                                     "<div class='panel-footer' style='height: 40px;'> <span class='pull-right' >FEECHHAA</span></div></div>" +
                                     "</div>"
         End If
     Next
     Response.Write(html)
%>
