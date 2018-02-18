<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.UserDTO" scope="page"/>
<jsp:setProperty name="user" property="userId"/>
<jsp:setProperty name="user" property="userPassword"/>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
		String userId = null;
		if ( session.getAttribute("userId") != null )
		{
			userId = (String) session.getAttribute("userId");
		}
		
		if ( userId != null )
		{
			session.setAttribute("userId", user.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인된 계정입니다.')");
			script.println("location.href = 'main2.jsp'");
			script.println("<script>");
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserId(), user.getUserPassword());
		
		if ( result == 1 )
		{
			session.setAttribute("userId", user.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인에 성공 하셨습니다.')");
			script.println("location.href = 'main3.jsp'");
			script.println("</script>");
		}
		
		if ( result == 0 )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		if ( result == -1 )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디가 존재하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		else if ( result == -2 )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB에 오류가 발생하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>