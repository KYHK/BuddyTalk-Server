<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>학생상담센터</title>
<link rel="stylesheet" type="text/css" href="css/view.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" href="css/custom.css">
</head>

<body>
<div id="wrap">
        <header class="header cfixed">
        <h1 class="logo">
        <a href="main3.jsp">
            <img src="images/p-images/logo.png" alt="">
        </a>
        </h1>
       		
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
	
	  		<span class="menu-toggle-btn">
                <span></span>
                <span></span>
                <span></span>
            </span>
            			
  

        </header>
 </div>
	
	
	<div class="container">

		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style ="padding-top : 30px;">
				<form method="post" action="LoginAction.jsp">
				 	<h3 style="text-align : center;">로그인 화면</h3>
				 	<div class="form-group">
				 		<input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20">
				 	</div>
				 	<div class="form-group">
				 		<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				 	</div>
				 	<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/indigo.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>