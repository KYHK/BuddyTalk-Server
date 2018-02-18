<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
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
		
		// 매개변수로 넘어온 bbsId 처리
		int bbsId = 0;
		if (request.getParameter("bbsId") != null)
		{
			bbsId = Integer.parseInt(request.getParameter("bbsId"));
		}
		if ( bbsId == 0 )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'oto_bbs.jsp'");
			script.println("<script>");
		} 
		Bbs bbs = new BbsDAO().getBbs(bbsId);
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
                    <li><a href="Notice.jsp">공지사항</a></li>
                    
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
                    <li><a href="Notice.jsp">공지사항</a></li>
                    
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
		
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>

				<tr>
					<th colspan="3" style="background-color: #white; text-align:center;">게시판 글 보기</th>
				</tr>
			</thead>	
				<tbody>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2"><%= bbs.getBbsTitle().replaceAll("","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&lt;").replaceAll("\n","<br>") %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><%= bbs.getUserId() %></td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) +"시"+bbs.getBbsDate().substring(14,16)+"분" %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll("","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&lt;").replaceAll("\n","<br>") %></td>
				</tr>
				</tbody>		 
		</table>
		<a href="oto_bbs.jsp" class="btn btn-primary">목록</a>
		<%
			if(userId != null && userId.equals(bbs.getUserId()))
			{
		%>
				<a href="update.jsp?bbsId=<%= bbsId %>" class="btn btn-plrimary">수정</a>
				<a onclick="return confirm('정말로삭제하시겠습니까?')"href="deleteAction.jsp?bbsId=<%= bbsId %>" class="btn btn-plrimary">삭제</a> 
		<%
			}
		%>

	</div>
</div>
	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>



</body>
</html>