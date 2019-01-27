<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="com.dongle.member.model.vo.ReportReason,com.dongle.gallery.model.vo.GalleryCommentJoin,java.util.*,com.dongle.member.model.vo.Member,com.dongle.gallery.model.vo.GalleryPath" %>
<%
	List<GalleryPath> gplist=(List)request.getAttribute("gplist");
	List<GalleryCommentJoin> gclist=(List)request.getAttribute("gclist");
	int groupNo = (int)request.getAttribute("groupNo");
	Member loginMember = (Member)session.getAttribute("loginMember");
	List<ReportReason> relist = (List)request.getAttribute("relist");
%>
	<link href="<%=request.getContextPath() %>/css/gallery_style.css" rel="stylesheet">
	<!-- 댓글창 시작 -->
	<div class="comment-editor">
		<ul>
			<%if(gclist.size()!=0){ %>
				<%for(GalleryCommentJoin g:gclist){ %>
					<%if(g.getGalCommentLevel()==1&&g.getGalCommentReportStatus().equals("N")){ %>
						<li class='level1' style="list-style:none;">
							<span class='ico_skin thumb_profile'>
								<img class='img_profile' src='<%=request.getContextPath()%>/images/group_profile/<%=g.getGroupMemberImageNewPath() %>'>
							</span>
							<span class='comment_box'>
								<span class='comment-writer'><%=g.getGroupMemberNickname()%></span>
								<span class='comment-date'>
									<%=g.getGalCommentDate() %>
									<p class='btn-comment-report' value='<%=g.getGalCommentNo()%>'  style='float:right;color:RGB(112,136,172);' >신고</p>
									<input type='hidden' class='comment-report-no' value='<%=g.getGalCommentNo()%>' >
									<input type='hidden' class='reportCommentNickName' value='<%=g.getGroupMemberNickname()%>' >
								</span>
								<br/>
								<span class='comment_content'>
									<%=g.getGalCommentContent() %>
									<%if(loginMember.getMemberId().equals("admin")||gclist.get(0).getMemberNo()==loginMember.getMemberNo()){ %>
										<button class='btn-delete' value='<%=g.getGalCommentNo()%>' style='float:right;color:RGB(112,136,172);' >삭제</button>
									<%} %>
									<button class='btn-reply' value='<%=g.getGalCommentNo()%>'>답글</button>
								</span>
							</span>
						</li>
					<%} 
					else if(g.getGalCommentLevel()==2&&g.getGalCommentReportStatus().equals("N")){%>
						<li class="level2" style="list-style:none;">
							<span class='ico_skin thumb_profile'>
								<img class='img_profile' src='<%=request.getContextPath()%>/images/member_img/<%=g.getGroupMemberImageNewPath() %>'>
							</span>
							<span class='comment_box'>
								<span class='comment-writer'><%=g.getGroupMemberNickname()%></span>
								<span class='comment-date'>
									<%=g.getGalCommentDate() %>
									<p class='btn-comment-report' style='float:right;color:RGB(112,136,172);' >신고</p>
									<input type='hidden' class='comment-report-no' value='<%=g.getGalCommentNo()%>' >
									<input type='hidden' class='reportCommentNickName' value='<%=g.getGroupMemberNickname()%>' >
								</span>
								<br/>
								<span class='comment_content'>
									<%=g.getGalCommentContent() %>
									<%if(loginMember.getMemberId().equals("admin")||gclist.get(0).getMemberNo()==loginMember.getMemberNo()){ %>
										<button class='btn-delete' value='<%=g.getGalCommentNo()%>' style='float:right;color:RGB(112,136,172);' >삭제</button>
									<%} %>
								</span>
							</span>
						</li>
					<%} %>
				<%} %>
			<%}%> 
		</ul>
		<input type="hidden" name="groupNo" id='groupNo' value="<%=gplist.get(0).getGroupNo() %>"/>
		<input type="hidden" name="galNo" id="galNo" value="<%=gplist.get(0).getGalNo() %>"/>
		<input type="hidden" name="galCommentWriterNo" id='galCommentWriterNo' value="<%=loginMember.getMemberNo() %>"/>
		<input type="hidden" name="galCommentLevel" id='galCommentLevel' value="1"/>
		<input type="hidden" name="galCommentRef" id='galCommentRef' value="0"/>
		<input type="hidden" name="albumCode" id='albumCode' value="<%=gplist.get(0).getAlbumCode()%>"/>
		<input type="hidden" name="galFileNo" id='galFileNo' value="<%=gplist.get(0).getGalFileNo()%>"/>
		<fieldset class='modal_comment'>
			<legend class='screen_out'>댓글쓰기 폼</legend>
			<div class='comment_write'>
				<label for='comment' class='lab_write screen_out'>내용</label>
				<textarea name="galCommentContent" id='galCommentContent' placeholder="소중한 댓글을 입력해주세요" tabindex='3' style='resize:none;box-sizing: border-box;width:100%;height:80;border:1px solid #fff;'></textarea>
			</div>
			<div class='comment_btn'>
				<button type="button" class='btn-insert'>입력</button>
			</div>
		</fieldset>
	</div>
<%if(relist!=null){ %>
		<form id='reportFrm' name="reportFrm">
	         <input type="hidden" id="report1" name="report1" value="<%=relist.get(0).getReportCode()%>">
	         <input type="hidden" id="reason1" name="reason1" value="<%=relist.get(0).getReportReason()%>">
	         <input type="hidden" id="report2" name="report2" value="<%=relist.get(1).getReportCode()%>">
	         <input type="hidden" id="reason2" name="reason2" value="<%=relist.get(1).getReportReason()%>">
	         <input type="hidden" id="report3" name="report3" value="<%=relist.get(2).getReportCode()%>">
	         <input type="hidden" id="reason3" name="reason3" value="<%=relist.get(2).getReportReason()%>">
	         <input type="hidden" id="report4" name="report4" value="<%=relist.get(3).getReportCode()%>">
	         <input type="hidden" id="reason4" name="reason4" value="<%=relist.get(3).getReportReason()%>">
	         <input type="hidden" id="report5" name="report5" value="<%=relist.get(4).getReportCode()%>">
	         <input type="hidden" id="reason5" name="reason5" value="<%=relist.get(4).getReportReason()%>">
	         <input type="hidden" id="report6" name="report6" value="<%=relist.get(5).getReportCode()%>">
	         <input type="hidden" id="reason6" name="reason6" value="<%=relist.get(5).getReportReason()%>">
	         <input type="hidden" id="report7" name="report7" value="<%=relist.get(6).getReportCode()%>">
	         <input type="hidden" id="reason7" name="reason7" value="<%=relist.get(6).getReportReason()%>">
	         
          	 <input type="hidden" id="reportNickName" name="reportNickName" value="">
	         <input type="hidden" id="reportGalNo" name="reportGalNo" value="<%=gplist.get(0).getGalNo()%>">
	         <input type="hidden" id="reportGroupNo" name="reportGroupNo" value="<%=groupNo%>">
	         <input type="hidden" id="reportMemberNo" name="reportMemberNo" value="<%=gplist.get(0).getMemberNo()%>">
	      	 <input type="hidden" id="reportAlbumCode" name="reportAlbumCode" value="<%=gplist.get(0).getAlbumCode()%>">
	      	 <input type="hidden" id="reportCommentNo" name="reportCommentNo" value=""/>
	      	 <input type="hidden" id="reportCommentNo" name="selectRecode" value=""/>
	      </form>
      <%} %>
<script>
	/* 댓글 신고하기 */
	$(document).ready(function(){
		$('.btn-comment-report').click(function(e){
			 var reportWin=window.open("<%=request.getContextPath()%>/views/gallery/galleryReport.jsp","reportWin","width=500, height=300, top=200,left=500, menubar=no, status=no, toolbar=no");
			 var reportCommentNo=$(this).siblings('input.comment-report-no').val();
			 var reportCommentNickName=$(this).siblings('input.reportCommentNickName').val();
			 document.getElementById('reportCommentNo').value=reportCommentNo;
			 document.getElementById('reportNickName').value=reportCommentNickName;
		});
		
	});
	/* 대댓글 쓰기 함수*/
	$(function(){
		var eventflag;
		$('.btn-reply').on('click',function(e){
			console.log($(this));
			<%if(loginMember!=null){%>
				eventflag=true;
				var div=$("<div class='recomment_content'></div>");
				var html="";
				html+="<input type='hidden' name='groupNo' value='<%=groupNo %>'/>"
				html+="<input type='hidden' name='galNo' value='<%=gplist.get(0).getGalNo()%>'/>";
				html+="<input type='hidden' name='galCommentWriterNo' value='<%=loginMember.getMemberNo()%>'/>";
				html+="<input type='hidden' name='galCommentLevel' value='2'/>";
				html+="<input type='hidden' name='albumCode' value='<%=gplist.get(0).getAlbumCode()%>'/>";
				html+="<input type='hidden' name='galFileNo' value='<%=gplist.get(0).getGalFileNo()%>'/>";
				html+="<input type='hidden' name='galCommentRef2' value='"+$(this).val()+"'/>";
				html+="<fieldset class='modal_comment'>";
				html+="<div class='comment_write'>";
				html+="<textarea name='galCommentContent' id='galCommentContent' placeholder='소중한 댓글을 입력해주세요' tabindex='3' style='resize:none;box-sizing: border-box;width:100%;height:80;border:1px solid #fff;'></textarea>";
				html+="</div>";
				html+="<div class='comment_btn'>";
				html+="<button value='"+$(this).val()+"' type='button' class='btn-insert1' style='float:right;width:65px;height:28px;font-size:14px;line-height:15px;border-radius: 20px;border:none;background-color:white;'>입력</button>";
				html+="</div>"
				html+="</fieldset>"
				div.html(html);
				div.insertAfter($(this).parent().parent().parent()).children("span").slideDown(800);
				/* 연결된 이벤트 삭제 */
				$(this).off('click');
				/* 빈공간 누르면 display바뀌는 것 */
 				/* $('.recomment_content').click(function(){
					if(eventflag)
					{
						$(this).css('display','none');
						eventflag=false;
						return;
					}
				}) */ 
				
				div.find('button.btn-insert1').click(function(e){
					if(<%=loginMember==null%>)
					{
					 	fn_loginAlert();
						e.preventDefault();
						return;
					}
					var len=($(this).parent().find()).siblings('textarea').val().trim().length;
					if(len==0)
					{
						e.preventDefault();
					} 
					$.ajax({
						url:"<%=request.getContextPath()%>/gallery/commentInsert",
						data:{"groupNo":$('#groupNo').val(),
							"galNo":$('#galNo').val(),
							"galCommentWriterNo":$('#galCommentWriterNo').val(),
							"galCommentLevel":2,
							"galCommentRef":$(this).val(),
							"albumCode":$('#albumCode').val(),
							"galFileNo":$('#galFileNo').val(),
							"galCommentContent":$('#galCommentContent').val(),
						},
						type:"post",
						success:function(data){
							if(data!=null)
							{	
								alert('댓글 등록 완료!');
								$('.comment-editor').html(data);
							}
							else
							{
								alert('댓글 등록에 실패하였습니다');
							}
						},
						error:function(request){console.log(request);}
					})
				});
				div.find("textarea").focus();
			<%}%>
		});
		function fn_loginAlert()
		{
			alert('로그인 후 이용할 수 있습니다.');
		}

		
		/* 댓글 등록 */
		$(function(){
			$('#btn-insert').click(function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/gallery/commentInsert",
					data:{"groupNo":$('#groupNo').val(),
						"galNo":$('#galNo').val(),
						"galCommentWriterNo":$('#galCommentWriterNo').val(),
						"galCommentLevel":$('#galCommentWriterNo').val(),
						"galCommentRef":$('#galCommentLevel').val(),
						"albumCode":$('#albumCode').val(),
						"galFileNo":$('#galFileNo').val(),
						"galCommentContent":$('#galCommentContent').val(),
					},
					type:"post",
					success:function(data){
						if(data!=null)
						{	
							alert('댓글 등록 완료!');
							$('.comment-editor').html(data);
						}
						else
						{
							alert('댓글 등록에 실패하였습니다');
						}
					},
					error:function(request){console.log(request);}
				});					
			});
		});
	});
</script>