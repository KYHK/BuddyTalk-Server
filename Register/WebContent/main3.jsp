<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE Html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css"> 
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/custom.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<title>신한대학교 학생상담센터</title>

<link rel="stylesheet" type="text/css" href="css/view.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/default.css">
<script src="js/jquery.min.js"></script>
<script src="js/indigo.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



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
                    <li><a href="people.jsp">조직안내</a></li>
                    
                    <li><a href="oto_bbs.jsp">게시판</a></li>
                    
					<li><a href="Gallery.jsp">사진첩</a></li>
					
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


        <article class="slider">
            <img src="images/p-images/slide01.jpg" alt="">
        </article>
        <section class="content">
            <section class="display-section">
                <div class="container">
                    <h2 class="sec-tit"></h2>
                    
                </div>
            </section>
            <section class="promotion-section">
                <div class="container">
                    <ul class="promo-list">
                        <li>
                            <a href="main3.jsp">
                                <img src="images/s-images/promo01.png" alt="">
                                <h3>홈으로</h3>
                             
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/s-images/promo02.png" alt="">
                                <h3>조직안내</h3>
                               
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/s-images/promo03.png" alt="">
                                <h3>게시판 </h3>
                                
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/s-images/promo04.png" alt="">
                                <h3>사진첩</h3>
                             
                            </a>
                        </li>
                    </ul>
                </div>
            </section>
            <hr class="divider">
            <section class="work-section cfixed">
                <h2 class="sec-tit">게시판 모음</h2>
                <ul class="work-list">
                    <li>
                        <a href="oto_bbs.jsp">
                            <div class="info">
                                <h3>공지사항</h3>
                                <span>바로가기</span>
                                
                            </div>
                            <img src="images/p-images/work01.png" alt="">
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="info">
                                <h3>조직안내</h3>
                                <span>바로가기</span>
                            </div>
                            <img src="images/p-images/work02.png" alt="">
                        </a>
                    </li>                   
                
                    <li>
                        <a href="">
                            <div class="info">
                                <h3>자료실</h3>
                                <span>바로가기</span>
                            </div>
                            <img src="images/p-images/work07.png" alt="">
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="info">
                                <h3>오시는 길</h3>
                                <span>바로가기</span>
                            </div>
                            <img src="images/p-images/work08.png" alt="">
                        </a>
                    </li>
                </ul>
            </section>
           
          
        </section>



	<footer class="content">
		[480-701] 경기도 의정부시 호암로 95 신한대학교 호림관 1층 1100호 학생상담센터
		<p>Shinhan University, Howon 1-dong, Uijeongbu-si, Gyeonggi-do, Korea</p>
		<p>Tel. 031-870-3262~3 / Fax. 031-870-3269</p>
		<p>Copyright 2014 SHINHAN UNIVERSITY All Rights Reserved</p>
	</footer>
    </div>
    
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> 
<script src="js/script.js"></script>

</body>
</html>