<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>



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
		
		if ( userId == null )
		{
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'Login.jsp'");
			script.println("<script>");
		}
		
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
		if (!userId.equals(bbs.getUserId())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'oto_bbs.jsp'");
			script.println("<script>");
		}
		
			else{
				if(request.getParameter("BbsTitle()") == null || request.getParameter("BbsContent()") == null ||
						request.getParameter("BbsTitle()").equals("") || request.getParameter("BbsTitle()").equals(""))
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("<script>");
			}
			else{
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.update(bbsId, request.getParameter("BbsTitle()"), request.getParameter("BbsContent()"));
				
				if ( result == -1 )
				{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패 하셨습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				
				else
				{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'oto_bbs.jsp'");
					script.println("</script>");
				}
				
			
			}
		}
		
	%>
</body>
</html>