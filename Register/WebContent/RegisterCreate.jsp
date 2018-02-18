<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css"> 
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/custom.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function registerCheckFunction()
	{
		var userId = $('#userId').val();
		$.ajax
		({
			type : 'POST',
			url  : './UserRegisterCheckServlet',
			data : { userId : userId },
			success : function (result)
			{
				if(result == 1)
				{
					$('#checkMessage').html('사용할수 있는 아이디 입니다.');
					$('#checkType').attr('class', 'modal-content panel-success');
				}
				else
				{
					$('#checkMessage').html('사용할수 없는 아이디 입니다.');
					$('#checkType').attr('class', 'modal-content panel-warning');
				}
				$('#checkModal').modal('show');
			}
		})
	}
	function passwordCheckFunction()
	{
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		if(userPassword1 != userPassword2)
		{
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		}
		else
		{
			$('#passwordCheckMessage').html('비밀번호가 서로 일치합니다!');
		}
	}
</script>
</head> 
<body> 
	<div class="container">
		<form method="post" action="./userRegister">
			<table class = "table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"><h4>회원등록양식</h4></th>
					</tr>
				</thead>
				<tbody>
				
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><input class="form-control" type="text" id="userId" name="userId" maxLength="20" placeholder="아이디를 입력해주세요."></td>
						<td style="width: 110px;"><button class="btn btn-primary" onclick="registerCheckFunction();" type="button">중복체크 </button>
					</tr>
					
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td colspan="2"><input class="form-control" type="password" onkeyup = "passwordCheckFunction();" id="userPassword1" name="userPassword1" maxLength="20" placeholder="비밀번호를 입력해주세요."></td>
					</tr>
					
					<tr>
						<td style="width: 110px;"><h5>비밀번호확인</h5></td>
						<td colspan="2"><input class="form-control" type="password" onkeyup = "passwordCheckFunction();" id="userPassword2" name="userPassword2" maxLength="20" placeholder="비밀번호를 재입력해주세요."></td>
					</tr>
					
					<tr>
						<td style="width: 110px;"><h5>이름</h5></td>
						<td colspan="2"><input class="form-control" type="text" id="userName" name="userName" maxLength="20" placeholder="이름을 입력해주세요."></td>
					</tr>
					
					<tr>
						<td style="width: 110px;"><h5>학번</h5></td>
						<td colspan="2"><input class="form-control" type="text" id="userDepartment_num" name="userDepartment_num" maxLength="20" placeholder="학번을 입력해주세요."></td>
					</tr>
					
					<tr>
						<td style="width: 110px;"><h5>학과</h5></td>
						<td colspan="2"><input class="form-control" type="text" id="userDepartment" name="userDepartment" maxLength="20" placeholder="학과를 입력해주세요."></td>
					</tr>
					
					<tr>
						<td style="width: 110px;"><h5>핸드폰</h5></td>
						<td colspan="2"><input class="form-control" type="text" id="userPhone_num" name="userPhone_num" maxLength="20" placeholder="핸드폰 번호를 입력해주세요."></td>
					</tr>
					
					<tr>
						<td style="width: 110px;"><h5>이메일</h5></td>
						<td colspan="2"><input class="form-control" type="email" id="userEmail" name="userEmail" maxLength="20" placeholder="이메일을 입력해주세요."></td>
					</tr>
					
					<tr>
						<td style="text-align: Left" colspan="3"><h5 style = "color : red;" id = "passwordCheckMessage"></h5><input class="btn btn-primary pull-right" type="submit" value="회원가입"> </td>
					</tr>
				</tbody>	
			</table>
		</form>
	</div>
	<%
		String messageContent = null;
		if(session.getAttribute("messageContent") != null)
		{
			messageContent = (String)session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") != null)
		{
			messageType = (String)session.getAttribute("messageType");
		}
		if (messageContent != null)
		{
			 
	%>
	<!-- 회원가입 성공 실패 안내메세지  -->
		<div class = "modal fade"	 id = "messageModal" tabindex = "-1" role = "dialog" aria-hidden = "true">
			<div class = "vertical-alignment-helper">
				<div class = "modal-dialog vertical-align-center">
					<div class = "modal-content
					<% if (messageType.equals("오류메세지")) out.println("panel-warning"); 
					else out.println("panel-success");
					%>">
						<div class = "modal-header panel-heading">
							<button type = "button" class = "close" data-dismiss="modal">
								<span aria-hidden = "true">&times;</span>
								<span class = "sr-only">Close</span>
							</button>
							
							<!-- div클래스가 닫히기 전 h태그로 모달 타이틀에다가 메세지 타입을 넣음 -->
							<h4 class = "modal-title">
								<%= messageType %>
							</h4>
							
						</div>
						
						<!-- 실제메세지 -->
						<div class = "modal-body">
							<%= messageContent %>
						</div>
						
						<!--  모달창 끌수있는 버튼  -->
						<div class = "modal-footer">
							<button type = "button" class = "btn btn-primary" data-dismiss = "modal"> 확인</button>
						</div>
						
					</div>
				</div>			
			</div>
		</div>
		
		<!-- 메세지 모달을 실행할수있게 만듬  -->
		<Script>
			$('#messageModal').modal("show");
		</Script>
	<% //한번 메세지가 출력된 다음에는 여러번 출력되지 않게 한번만 하도록 막아준다.
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
	
	<!-- ID중복체크  -->
	<div class = "modal fade"	 id = "checkModal" tabindex = "-1" role = "dialog" aria-hidden = "true">
			<div class = "vertical-alignment-helper">
				<div class = "modal-dialog vertical-align-center">
					<div id = "checkType" class = "modal-content panel-info">
					
						<div class = "modal-header panel-heading">
							<button type = "button" class = "close" data-dismiss="modal">
								<span aria-hidden = "true">&times;</span>
								<span class = "sr-only">Close</span>
							</button>
							
							<!-- div클래스가 닫히기 전 h태그로 모달 타이틀에다가 메세지 타입을 넣음 -->
							<h4 class = "modal-title">
								확인 메세지
							</h4>
							
						</div>
						
						<!-- 실제메세지 -->
						<div class = "modal-body" id="checkMessage">
						</div>
						
						<!--  모달창 끌수있는 버튼  -->
						<div class = "modal-footer">
							<button type = "button" class = "btn btn-primary" data-dismiss = "modal"> 확인</button>
						</div>
						
					</div>
				</div>			
			</div>
		</div>
</body>
</html>