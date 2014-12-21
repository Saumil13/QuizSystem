<!-- #include file="inc/inc_settings.asp" -->
<!DOCTYPE html>
<html lang="en">
<% QuizID = NumberControl(request.querystring("ID"))
Set rs = conn.execute("Select * from Quizzes Where ID = "&QuizID&" and Active = 1 ")
if rs.eof or not LoginControl() then 
Response.redirect "Default.asp?H=0"
end if
CreatedBy = MemberName(rs("MemberID"))
Title = rs("Title")
QuizTime = rs("Time")
rs.close : set rs = nothing

%>
  <head>
    <!-- #include file="inc/-head.asp" -->
    <script src="js/icheck.js"></script>
    <script>
      $(document).ready(function(){
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
        });
      });
    </script>
	<script language="javascript"> 
var sayilacak_saat=0; 
var sayilacak_dakika=0; 
var sayilacak_saniye=<%=QuizTime%>; 


var zaman=(sayilacak_dakika*3600 )+(sayilacak_dakika*60 )+sayilacak_saniye+1; 
function geri_say(){ 
zaman=zaman-1; 
kalan_saat=Math.floor(zaman/3600 ); 
kalan_dakika=Math.floor((zaman%3600 )/60 ); 
kalan_saniye=zaman%60; 

var yeni_zaman="";
var suredurum = 1;
if(kalan_dakika>0 || kalan_saniye>0 || kalan_saat>0 ){ 
yeni_zaman=kalan_dakika+":"+kalan_saniye; 
if(kalan_dakika==0 && kalan_saat==0 && kalan_saniye>0 ){yeni_zaman="<font style='font-size:18px;color:red;'>"+yeni_zaman+"</font>";} 
}else{ 
yeni_zaman="0";
suredurum=0;
}//if dakika 0 ise sonu 

document.getElementById('kalan_zaman' ).innerHTML=yeni_zaman;
document.getElementById('suredurum').value = suredurum;

if(zaman>0 ){setTimeout("geri_say();",1000 );} 

}//fonksiyon geri_say sonu 
window.onload=geri_say; 
</script> 
  </head>
  
  <body>
<%
LoginGate()
%>
    <div class="container">
      <!-- #include file="inc/-modal.asp" -->
      <!-- Static navbar -->
      <!-- #include file="inc/-navigation.asp" -->
 
      <div class="content-area">
        <div class="row">
          <div class="col-md-8 leftsidebar">
            <h2><%=Title%></h2>
			<Form action = "process.asp?i=CalcQuiz&ID=<%=QuizID%>" Method="Post">
			<input type="hidden" name="suredurum" id="suredurum" value="">
            <div class="questions">
					<% Set rs = Conn.Execute("Select * from Questions Where QuizID = "&QuizID&" and Active = 1 ")
			
				counter = 1
				%>
				
				<% do while not rs.eof %>
              <p><span>Q<%=counter%>)</span><%=rs("Question")%> (<i><%=rs("Difficulty")%> points</i>)</p>
			  <% Set rsalt = Conn.Execute("Select * from Options Where QuesionID = "&rs("ID")&" ")
					do while not rsalt.eof %>
              <div class="input-group">
                <label><input type="radio" id="square-radio-1" name="Ans<%=counter%>" value="<%=rsalt("ID")%>"> <%=rsalt("Name")%></label>
              </div>
			   
			  <% rsalt.movenext : loop : rsalt.close : Set rsalt = Nothing %>
			  <hr>
				<%counter=counter+1 : rs.movenext : loop : rs.close : Set rs = Nothing %>
			  
			<input type="hidden" name="cevapsayisi" value="<%=counter-1%>">
	
			<button type="submit" class="btn btn-success">Submit Quiz</button>  
            </div>
			</form>
          </div>
          <div class="col-md-4 rightsidebar">
            <h4><%=Session("Name")%>&nbsp;<%=Session("SurName")%> </h4>
            <p>Duration : <span id='kalan_zaman'></span></p>
            <p>This Quiz Created By : <%=CreatedBy%></p>
          </div>
        </div>
      </div>
      <!-- #include file="inc/-footer.asp" -->
    </div>
    <!-- /container -->
  </body>
</html>