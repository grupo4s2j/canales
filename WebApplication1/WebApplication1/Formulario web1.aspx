<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Formulario web1.aspx.vb" Inherits="WebApplication1.Formulario_web1" %>

<%@ Import Namespace="System.Globalization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div id="cont" class="fill toggler">
        <div id="addCont"></div>
    </div>
    
     
    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><small class="pull-right ml10">45 comments</small> Comments</h4>
        </div>
        <div class="modal-body">
        
            <div class="row">
                <div class="col-md-12">
                    
              
                    <div class="form-group">
                    <label for="comment">Your Comment</label>
                    <textarea name="comment" id="comment" class="form-control" rows="3"></textarea>
                    
                    </div>
                     <button type="button" id="addComment" class="btn btn-default mb10">Send</button>
                    
          
                        
                   <div class="comments-list">
                        <div id="add"></div>
                       <div class="media">
                           <p class="pull-right"><small>5 days ago</small></p>
                            
                            <div class="media-body">
                                
                            <!--  <h4 class="media-heading user_name">Baltej Singh</h4>-->
                              Wow! this is really great.
                              
                              <p><small><a href="">Like</a> - <a href="">Share</a></small></p>
                            </div>
                          </div>
                       <div class="media">
                           <p class="pull-right"><small>5 days ago</small></p>
                            
                            <div class="media-body">
                                
                             <!-- <h4 class="media-heading user_name">Baltej Singh</h4>-->
                              Wow! this is really great.
                              
                              <p><small><a href="">Like</a> - <a href="">Share</a></small></p>
                            </div>
                          </div>
                       <div class="media">
                           <p class="pull-right"><small>5 days ago</small></p>
                            
                            <div class="media-body">
                                
                             <!-- <h4 class="media-heading user_name">Baltej Singh</h4>-->
                              Wow! this is really great.
                              
                              <p><small><a href="">Like</a> - <a href="">Share</a></small></p>
                            </div>
                          </div>
                       <div class="media">
                           <p class="pull-right"><small>5 days ago</small></p>
                            
                            <div class="media-body">
                                
                              <!--<h4 class="media-heading user_name">Baltej Singh</h4>-->
                              Wow! this is really great.
                              
                              <p><small><a href="">Like</a> - <a href="">Share</a></small></p>
                            </div>
                          </div>
                   </div>
                    
                    
                    
                </div>
            </div>
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

    <script>
        $('#addComment').click(function () {
          
            html = $.trim($('#comment').val());
            html = '<div class="media"><p class="pull-right"><small>5 days ago</small></p><div class="media-body">'+html+'<p><small><a href="">Like</a> - <a href="">Share</a></small></p></div></div>';
            $(html).insertAfter($('#add'));
               
        });
        $(document).ready(function () {
            seeChollos();
           // programarAviso();
            //console.log("ready!");
            // AJJAX SCROLLL
            var win = $(window);

            // Each time the user scrolls
            win.scroll(function () {
                // End of the document reached?
                if ($(document).height() - win.height() == win.scrollTop()) {
                    $('#loading').show();

                    $.ajax({
                        url: 'ajax.aspx',
                        dataType: 'html',
                        success: function (html) {
                           
                            $('#cont').append(html);
                           // $('#loading').hide();
                            //alert(html);
                        }
                    });
                }
            });

        });
        function animation(num ) {
            var value = $(".numNotifi").text();
            value = +value + +1;
            $(".numNotifi").text(value);
           var classes= $("#" + num).attr('class');
           var arr_calsses = classes.split(" ");
           if (arr_calsses.indexOf("glyphicon-star-empty") != -1) {
               $("#" + num).removeClass("glyphicon-star-empty")
               $("#" + num).addClass("glyphicon-star");
               document.cookie = document.cookie + "," + num
           } else {
               $("#" + num).removeClass("glyphicon-star")
               $("#" + num).addClass("glyphicon-star-empty");
               var cookies = document.cookie;
               var arr_cookies = cookies.split(",");
               var position = arr_calsses.indexOf("glyphicon-star-empty");
               arr_cookies.splice(position);
               var str_cookies = arr_cookies.toString();
               document.cookie = str_cookies
           }

          
        };
        function programarAviso() {
             
            setTimeout(function () {

                html = "<div class='post' style='display: none;'  >" +
                                        "<div class='panel panel-info '>" +
                                        "<div class='panel-heading'>Titulooooo" +
                                        "<a id='' class=' pull-right glyphicon glyphicon-star-empty pull-right ' aria-hidden='true'  aria-expanded='true' onClick=animation()>" +
                                        "</a>" +
                                        "<a  class='pull-right glyphicon glyphicon-envelope ml10' aria-expanded='true' data-toggle='modal' data-target='#myModal' >" +
                                            "<span class='label label-success numMessages' style='right: -4px; top:-6px'>4</span>" +
                                        "</a> </div>" +

                                        "<div class='panel-body'>TEXTOOOOOOOO</div>" +
                                        "<div class='panel-footer' style='height: 40px;'> <span class='pull-right' >FEECHHAA</span></div></div>" +
                                        "</div>";
                $(html).insertAfter($('#addCont')).slideDown("fast");
                programarAviso();
            }, 5000); // 3000ms = 3s  
           
        }
        
        function timeConverter(UNIX_timestamp) {
            var a = new Date(UNIX_timestamp * 1000);
            var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            var year = a.getFullYear();
            var month = months[a.getMonth()];
            var date = a.getDate();
            var hour = a.getHours();
            var min = a.getMinutes();
            var sec = a.getSeconds();
            var time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec;
            return time;
        }
        
        function seeChollos() {
            
          
            $.getJSON('https://api.telegram.org/bot330074881:AAGZcL6d7_zTxBWkp3lBfmQmZUWwwzUPRv8/getUpdates', function (data) {
                data.result.reverse();
                var html = "";
                data.result.forEach(function(x) {
                    //console.log(x);
                    if (x.hasOwnProperty("channel_post")) {
                        nDateTime = timeConverter(x.channel_post.date);
                        html += "<div class='post' >" +
                        "<div class='panel panel-info '>" +
                        "<div class='panel-heading'>" + x.channel_post.chat.title+
                        "<a id='" + x.update_id + "' class=' pull-right glyphicon glyphicon-star-empty pull-right ' aria-hidden='true'  aria-expanded='true' onClick=animation(" + x.update_id+ ")>" +
                        "</a>" +
                        "<a  class='pull-right glyphicon glyphicon-envelope ml10' aria-expanded='true' data-toggle='modal' data-target='#myModal' >" +
                            "<span class='label label-success numMessages' style='right: -4px; top:-6px'>4</span>" +
                        "</a> </div>" +
                      
                        "<div class='panel-body'>" + x.channel_post.text + "</div>"+
                        "<div class='panel-footer' style='height: 40px;'> <span class='pull-right' >" + nDateTime + "</span></div></div>"+
                        "</div>";
                    }

                });
                html = '<div id="addCont"></div>' + html;
                    $('#cont').html(html)

                var cookies = document.cookie;
                var arr_cookies = cookies.split(",");
                $(".post").each(function () {
                    var a = $(this).find(".panel .panel-heading a");
                    a_id = a.attr("id");
                    if (arr_cookies.indexOf(a_id) != -1) {
                        $("#" + a_id).removeClass("glyphicon-star-empty")
                        $("#" + a_id).addClass("glyphicon-star");
                    }
                });
            });
            programarAviso()
        }

       
    </script>
    <style>
        #imaginary_container{
    padding-top:7px; 
}
.stylish-input-group .input-group-addon{
    background: white !important; 
}
.stylish-input-group .form-control{
	border-right:0; 
	box-shadow:0 0 0; 
	border-color:#ccc;
}
.stylish-input-group button{
    border:0;
    background:transparent;
}
        .ml10 {
                margin-right: 10px;
        }
         .mb10 {
                margin-bottom: 10px;
        }
        .user_name{
    font-size:14px;
    font-weight: bold;
}
.comments-list .media{
    border-bottom: 1px dotted #ccc;
}
.numMessages {
            position: absolute;
            top: 9px;
            right: 7px;
            text-align: center;
            font-size: 9px;
            padding: 2px 3px;
            line-height: .9;
        }
.fill {
  padding:10px;
    column-count: 5;
   
}
.fill .post {
    margin: 0;
    -webkit-column-break-inside: avoid; /* Chrome, Safari */
    page-break-inside: avoid;           /* Theoretically FF 20+ */
    break-inside: avoid-column;         /* IE 11 */
                    
}
    </style>
</asp:Content>
