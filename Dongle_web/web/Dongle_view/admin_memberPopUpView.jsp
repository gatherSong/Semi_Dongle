<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dongle.member.model.vo.Member"%>
<%
	Member m = (Member) request.getAttribute("member");
	String id=m.getMemberId();
	String name=m.getMemberName();
	String ssn=m.getSsn();
	String phone=m.getPhone();
	String address=m.getAddress();
	String email=m.getEmail();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div id="memberview-container">
		<table width="450" border="0" cellspacing="0" cellpadding="0"
			class="grey12">
			<tr>
				<td style="padding: 20px 0 0 0">
					<table width="420" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td
								style="padding: 15px; border-top: 2px #cccccc solid; border-right: 2px #cccccc solid; border-bottom: 2px #cccccc solid; border-left: 2px #cccccc solid;">
								<form name="memberFrm" id="memberFrm" method="post"
									onclick="return fn_update_validate();">
									<input type="hidden" name="isAdmin" value="true">
									<table width="380" border="0" cellspacing="1" class="regtable">
										<tr>
											<td width="100" height="25" bgcolor="#f4f4f4">아이디</td>
											<td width="130"><input type="text" placeholder="4글자이상"
												name="userId" id="userId_" value='<%=id%>' required
												readonly>
										</tr>
										<tr>
											<td height="25" bgcolor="#f4f4f4">이름</td>
											<td><input type="text" id="userName" name="userName"
												value='<%=name%>' required></td>
										</tr>
										<tr>
											<td height="25" bgcolor="#f4f4f4">생년월일</td>
											<td><input type="text" id="age" name="age"
												placeholder="931230" value='<%=ssn%>' required></td>
										</tr>
										<tr>
											<td height="25" bgcolor="#f4f4f4">휴대폰</td>
											<td><input type="tel" id="phone" name="phone"
												maxlength="11" placeholder="(-없이)01012345678"
												value='<%=phone%>' required></td>
										</tr>
										<tr>
											<td height="25" bgcolor="#f4f4f4">주소</td>
											<td><input type="text" id="address" name="address"
												value='<%=address%>' required></td>
										</tr>
										<tr>
											<td height="25" bgcolor="#f4f4f4">이메일</td>
											<td><input type="email" id="email" name="email"
												placeholder="db123@dfd.com" value='<%=email%>' required>
											</td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
					</table>
					<table border="0" align="right" cellpadding="0" cellspacing="0">
						<tr>
							<td height="40" style="display: inline">
								<div class='find_btn' style="margin: 10px 100px 0 0">
									<button type="button" class="btn btn-default"
										onclick="fn_update_member();">정보수정</button>
									<button type="button" class="btn btn-default"
										onclick="fn_update_password();">비밀번호 변경</button>
									<button type="button" class="btn btn-default"
										onclick="confirmDelete();">탈퇴</button>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
<script>
		function fn_update_password(){
			var url="<%=request.getContextPath()%>/updatePassword?userId=<%=id%>";
			var title="updatePassword";
			var status="left=200px, top=200px, width=400px, height=210px";
			var popUp=open(url,title,status);
		}
		

		function fn_update_validate(){
			
			return true;
		}
		//회원정보수정했을때 동작
		function fn_update_member(){
			
			var frm=$('#memberFrm');
			
			var url="<%=request.getContextPath()%>/memberUpdate";
			frm.attr('action',url);
			
			frm.submit();
		}
	
		//회원 탈퇴
		
		function confirmDelete(){
			
			var dele=$('#memberFrm');
			
			var url="<%=request.getContextPath()%>/memberDeleteEnd";
			dele.attr('action',url);
			
			dele.submit();
		}
	
</script>
</html>