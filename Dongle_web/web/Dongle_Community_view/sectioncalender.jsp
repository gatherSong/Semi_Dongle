<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
/* body{
  background-color: #F5F1E9;
} */
#calendar{
  margin-left: auto;
  margin-right: auto;
  margin-top: 10%;
  width: 650px !important;
  font-family: 'Lato', sans-serif;


}
#calendar_weekdays div{
  display:inline-block;
  vertical-align:top;
}
#calendar_content, #calendar_weekdays, #calendar_header{
  position: relative;
  width: 650px !important;
  overflow: hidden;
  float: left;
  z-index: 10;

}
#calendar_weekdays div, #calendar_content div{
  width:92.57px!important;
  height: 70px!important;
  overflow: hidden;
  text-align: center;
  background-color: #FFFFFF;
  color: #787878;
}
#calendar_content div{
  width: 102.6px!important;
}

#calendar_content{
  -webkit-border-radius: 0px 0px 12px 12px;
  -moz-border-radius: 0px 0px 12px 12px; 
  border-radius: 0px 0px 12px 12px;
  
  
}
#calendar_content div{
  float: left;
}
#calendar_content div:hover{
  background-color: #F8F8F8;
}
#calendar_content div.blank{
  background-color: #E8E8E8;
}
#calendar_header, #calendar_content div.today{
  zoom: 1;
  filter: alpha(opacity=70);
  opacity: 0.7;
}
#calendar_content div.today{
  color: #FFFFFF;
}
#calendar_header{
  width: 100%;
  height: 37px;
  text-align: center;
  background-color: #FF6860;
  padding: 18px 0;
  -webkit-border-radius: 12px 12px 0px 0px;
  -moz-border-radius: 12px 12px 0px 0px; 
  border-radius: 12px 12px 0px 0px;
}
#calendar_header h1{
  font-size: 1.5em;
  color: #FFFFFF;
  float:left;
  width:70%;
}
i[class^=icon-chevron]{
  color: #FFFFFF;
  float: left;
  width:15%;
  border-radius: 50%;
}
</style>


<meta charset="UTF-8">
<title>Insert title here</title>

	       <!-- 캘린더 관련 스크립트(외부 데이터 포함) -->

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src="js/index.js"></script>
    
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
        <link rel="stylesheet" href="css/style.css">
        
            <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Bungee" rel="stylesheet">
        
     
</head>
<body>
<section>
		<div class="main center"
			style='width: 684px; height: 1000px; background-color: rgb(255, 255, 255); border: 1px solid black;'>
			
		             <div id="calendar">
                    <div id="calendar_header"><i class="icon-chevron-left"></i>
                        <h1></h1><i class="icon-chevron-right"></i>
                    </div>
                    <div id="calendar_weekdays"></div>
                    <div id="calendar_content" type="button" class="btn btn-lg" data-toggle="modal" data-target="#myModal"></div>
                    <br><br><br><br><br><br>
                                          <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" >
        
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        
        

        
        <div class="modal-body">

        <span id="before_total" ></span> 
        <br>
        
        모은 총 회비 : <span id="cast1"></span> <input type="text" name="text" id="text1">
        <br>

        
        총 사용 금액 : <span id="cast2"></span> <input type="text" name="text" id="text2">
        <br>

         ---------------------------------------------------------------------
         <br>

        남은 회비 : <span id="cast3"></span>
        <button class="btn" onclick="input3()">입력</button>
        
        <button  class="btn" onclick="rec()">영수증보기</button>
        <div id="receipt">
          <img src="http://image.kmib.co.kr/online_image/2018/0114/611211110012048428_1.jpg"></p>
        </div>


        </div>
        

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

		</div>

	</section>
	




<script>
$(function(){
    function c(){p();
    var e=h();
    var r=0;
    var u=false;
    l.empty();
    while(!u)
    {
        if(s[r]==e[0].weekday)
        {
            u=true
        }else{
            l.append('<div class="blank"></div>');r++}
    }
    
    for(var c=0;c<42-r;c++)
    {
        if(c>=e.length)
        {
            l.append('<div class="blank" ></div>')
        }else{
            var v=e[c].day;
            var m=g(new Date(t,n-1,v))?"<div class='today' id='tt'>":"<div id='tt'>";
            l.append(m+""+v+"</div>")

        }

    }           
    //------------------------------------------- 
    $('#calendar_content #tt').click(function(){
        var day_text=$(this)[0].innerHTML;
        console.log(day_text);
        if(!$('.blank'))
        {
            return day_text;
        }
    });

    //------------------------------------------- 
    
        var y=o[n-1];
        a.css("background-color",y).find("h1").text(i[n-1]+" "+t);
        f.find("div").css("color",y);
        l.find(".today").css("background-color",y);
        d()}
        
        
        function h(){var e=[];
            for(var r=1;r<v(t,n)+1;r++)
            {
                e.push({day:r,weekday:s[m(t,n,r)]})
            }
            return e
        }
        
        function p(){f.empty();
            for(var e=0;e<7;e++)
            {
                f.append("<div>"+s[e].substring(0,3)+"</div>")
            }}
            
        function d(){var t;var n=$("#calendar").css("width",e+"px");
        
        n.find(t="#calendar_weekdays, #calendar_content").css("width",e+"px").find("div").css({width:e/7+"px",height:e/7+"px","line-height":e/7+"px"});
        
        n.find("#calendar_header").css({height:e*(1/7)+"px"}).find('i[class^="icon-chevron"]').css("line-height",e*(1/7)+"px")
        }
        
        function v(e,t){
            return(new Date(e,t,0)).getDate()
        }
        
        function m(e,t,n){
            return(new Date(e,t-1,n)).getDay()
        }
        
        function g(e){
            return y(new Date)==y(e)
        }
        
        function y(e){
            return e.getFullYear()+"/"+(e.getMonth()+1)+"/"+e.getDate()
        }
        
        function b(){
            var e=new Date;t=e.getFullYear();
            n=e.getMonth()+1}var e=480;
            var t=2013;
            var n=9;
            var r=[];
            var i=["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"];
            var s=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
            var o=["#16a085","#1abc9c","#c0392b","#27ae60","#FF6860","#f39c12","#f1c40f","#e67e22","#2ecc71","#e74c3c","#d35400","#2c3e50"];
            var u=$("#calendar");
            var a=u.find("#calendar_header");
            var f=u.find("#calendar_weekdays");
            var l=u.find("#calendar_content");b();c();
            a.find('i[class^="icon-chevron"]').on("click",function(){
                var e=$(this);var r=function(e){
                    n=e=="next"?n+1:n-1;
                    if(n<1)
                    {
                        n=12;t--
                    }else if(n>12){
                        n=1;t++}c()};
                        if(e.attr("class").indexOf("left")!=-1)
                        {
                            r("previous")
                        }else{r("next")}
                    })})

</script>
</body>
</html>                               