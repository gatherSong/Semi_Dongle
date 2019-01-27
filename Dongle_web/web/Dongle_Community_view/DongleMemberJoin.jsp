<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <meta charset="UTF-8">

<%@ page import="com.dongle.member.model.vo.Member" %>

<%
   int groupNo=(int)request.getAttribute("groupNo");
   Member loginMember = (Member)session.getAttribute("loginMember");
%>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
#dongle_join{
            border: 6px solid #dddddd;
            width: 500px;
            height: 400px;
            margin-left: 100px;
            border-radius: 10px;

        }
        
       .image_p{
            border: 2px solid black;
            width: 150px;
            height: 150px;
            border-radius: 40px;
            margin-left: 155px;
            margin-top: 50px;
        }
        #dongle_nickname{
            width: 180px;
            height: 30px;
        }

        .subm{
           position: absolute;
           left: 315px;
           top: 500px;
        }
        
        #upfile{
            padding-left: 140px;
            padding-top: 10px;
        }
        
        #dongle_title{
           font-size: 40px;
            margin-left: 260px;
        }
        /* 등러가는 이미지 style 클래스명 */
        .selProductFile{
            width: 145px;
            height: 145px;
            border-radius: 40px;
            padding:3px;
        }
        
        #nickbox{
           display: inline-block;
        }
        
  
    </style>
    
	<script>
		function fn_enroll_validate(){
			
			if($('input[name=idValid]')[0].value=='0')
			{
				alert('아이디 중복체크를 해주세요!');
				return false;	
			}
			var nickname=$("#nickname");
			if(nickname.val().length<2)
			{
				alert("최소 2자리 이상 입력하세요!");
				nickname.focus();
				return false;
			}
			return true;			
		};
		
		
		//아이디 중복검사하기 : 팝업창을 띄워서 해보자~! 
		function fn_checkduplicate(){
			var nickname=$("#nickname").val().trim();
			if(!nickname || nickname.length<4)
			{
				alert("아이디를 2글자 이상 입력하세요~!");
				return;	
			}
			//팝업창에 대한 설정해주기!@
			var url="<%=request.getContextPath()%>/NicknameCheck";
			var title="checkdongleDuplicate";
			var shape="left=200px, top=100px, width=300px, height=200px";
			
			var popup=open("",title,shape);
			
			//현재페이지에 있는값을 새창으로 옮기는 작업~!
			checkdongleDuplicateFrm.nickname.value=nickname;
			//popup창에서 이 폼을 작동시키게 하는 구문!
			checkdongleDuplicateFrm.target=title;
			checkdongleDuplicateFrm.action=url;
			checkdongleDuplicateFrm.method="post";
			checkdongleDuplicateFrm.submit();		
			
			//window.open(url,"명칭/여는방식",shape)
      }
      
   
   </script>


<div id="dongle_title">동글 가입</div>
	<form name='dongleMemberUpdate' action="<%=request.getContextPath()%>/donglememberjoin" method="post" enctype="multipart/form-data">
		<section>
	    <div id="container">
	        <div id="dongle_join">
	            <div class="image_p"></div>
	            <input type="file" id="upfile" class="upfile" name="upfile" >
	            <div class="list">
	                <table id="nickbox">
	                    <tr>
	                        <th>닉네임 &nbsp;&nbsp;&nbsp;</th>
	                        <td>
	                            <input type="text" name="nickname" id="nickname" required/>
	                            <input type="button" value="중복검사" onclick="fn_checkduplicate();"/>
	                            <input type='hidden' name="idValid" value="0"/> 
	                            <input type='hidden' name="groupNo" value="<%=groupNo%>"/> 
	                            <input type='hidden' name="memberNo" value="<%=loginMember.getMemberNo()%>"/> 
	                        </td>
	                    </tr>
	                    <tr class="subm">
	                        <td colspan='2'>
	                            <input type="submit" onclick="return password_validate();" value="가입"/>
	                        </td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	    </div>
		</section>
	</form>
	<form action="" name="checkdongleDuplicateFrm">
			<input type="hidden" name="nickname"/>
		</form>	
	
	
<%-- 	<script>
	
	$('#upfile').click(function() {
	
		var upfile = $('#upfile').val();
		
	    $.ajax({
			url:"<%=request.getContextPath()%>/donglememberjoin",
			type:"post",
			data:{
				"upfile":upfile,
				},
			dataType:"html",
			success:function(data){																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																														
				$('#image_p').html(data);
			}
			})
		})
	</script> --%>
	
	
	<script type='text/javascript'>
	   //이미지 정보들을 담을 배열 선언
	   var sel_files = [];
	   
	   $(document).ready(function(){
	      $('#upfile').on('change', handleImgFileSelect);
	   });
	   
	   function fileUploadAction(){
	      console.log('fileUploadAction');
	      $('#upfile').trigger('click');
	   }
	   
	   function handleImgFileSelect(e){
	      //이미지 정보들을 초기화
	   sel_files = [];
	      $('.image_p').empty();
	      var files=e.target.files;
	      var filesArr=Array.prototype.slice.call(files);
	      
	      var index = 0;
	      filesArr.forEach(function(f){
	         if(!f.type.match("image.*")){
	            alert('확장자는 이미지 확장자만 가능합니다.');
	            return;
	         }
	         sel_files.push(f);
	         var reader = new FileReader();
	         reader.onload=function(e){
	            var html = "<img src='"+e.target.result+"' data-file='"+f.name+"' class='selProductFile' name='selProductFile' title='프로필이미지'>";
	            $(".image_p").append(html);
	            index++;
	         }
	         reader.readAsDataURL(f);
	         
	         
	      })
	   }
   </script>