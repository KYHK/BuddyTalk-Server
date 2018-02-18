<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1 minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	
<title>학생상담센터</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="css/view.css">
<script src="js/jquery.min.js"></script>
<script src="js/indigo.min.js"></script>
</head>


<body>
<%
		String userId = null;
		if (session.getAttribute("userId") != null )
		{
			userId = (String) session.getAttribute("userId");
		}
%>

       

	<div id="wrap">
        <header class="header cfixed">
        <h1 class="logo">
        <a href="main3.jsp">
            <img src="images/p-images/logo.png" alt="">
        </a>
        </h1>
       		<%
				if( userId == null )
				{
			%>
            <nav>
            
            <ul class="gnb">
        
            	
                    <li><a href="main3.jsp">홈으로</a></li>
                    <li><a href="people.jsp">조직안내</a></li>
                    
                   <li><a href="oto_bbs.jsp">게시판</a></li>
                    
					<li><a href="Gallery.jsp">갤러리</a></li>
					
					<li class="navi"><a>계정<sapn class="caret"></sapn></a>
					<div class="ssub">
					<ul>
						<li><a href="Login.jsp">로그인</a></li>
						<li><a href="javascript:void(window.open('RegisterCreate.jsp', '회원가입','width=#, height=#'))">회원가입</a></li>
					</ul>
					</div>
					</li>
				
			</ul>	
			
            </nav>
			<%
			}
			else
			{
			%>
           <nav>
            
            <ul class="gnb">
        
            	
                    <li><a href="main3.jsp">홈으로</a></li>
                    <li><a href="people.jsp">조직안내</a></li>
                    
                   <li><a href="oto_bbs.jsp">게시판</a></li>
                    
					<li><a href="Gallery.jsp">갤러리</a></li>
					
					<li class="navi"><a>계정<sapn class="caret"></sapn></a>
					<div class="ssub">
					<ul>
						<li><a href="LogoutAction.jsp">로그아웃</a></li>
						<li><a href="javascript:void(window.open('RegisterCreate.jsp', '회원가입','width=#, height=#'))">회원정보변경</a></li>
					</ul>
					</div>
					</li>
				
			</ul>	
			
            </nav>
                  			
        <%
			}
		%>
            <span class="menu-toggle-btn">
                <span></span>
                <span></span>
                <span></span>
            </span>
            			
  

        </header>
	




<!-- 게시물 리스트 보여주기 -->
<div class="container">
	<div class="row">
		<form method="post" action="writeAction.jsp">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>

				<tr>
					<th colspan="2" style="background-color: #white; text-align:center;">게시판 글쓰기 양식</th>
				</tr>
			</thead>	
				<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="제목" name="bbsTitle" maxlength="50"></td>
				</tr>
			
				<tr>
					<td><textarea class="form-control" placeholder="내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
				</tr>
				</tbody>		
		</table>
		
		
		<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
	</div>
</div>
	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>



</body>
</html>