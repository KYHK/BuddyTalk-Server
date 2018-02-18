<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>
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
		// 페이지 조회를 1로 잡아줌
		int pageNumber = 1;
		if  (request.getParameter("pageNumber") != null)
		{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
					<th style="background-color: #white; text-align:center;">번호</th>
					<th style="background-color: #white; text-align:center;">제목</th>
					<th style="background-color: #white; text-align:center;">작성자</th>
					<th style="background-color: #white; text-align:center;">작성일</th>
				</tr>
			</thead>	
				<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for ( int i = 0; i < list.size(); i++ )
					{
						
				%>
				<tr>
					<td><%= list.get(i).getBbsId() %></td>
					<td><a href="view.jsp?bbsId=<%= list.get(i).getBbsId() %>"><%= list.get(i).getBbsTitle().replaceAll("","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&lt;").replaceAll("\n","<br>") %></a></td>
					<td><%= list.get(i).getUserId() %></td>
					<td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) +"시"+list.get(i).getBbsDate().substring(14,16)+"분" %></td>
				</tr>
				<%
					}
				%>
				</tbody>		
		</table>
		<%
			if(pageNumber != 1)
			{
				
		%>
			<a href="oto_bbs.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-success btn-arrow-left">이전</a>
		<%
			}
			if(bbsDAO.nextPage(pageNumber+1))
			{
				
		%>
			<a href="oto_bbs.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-success btn-arrow-left">다음</a>
		<%
			}
		%>
		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</form>
	</div>
</div>
	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>



</body>
</html>