package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserRegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userId = request.getParameter("userId");
		String userPassword1 = request.getParameter("userPassword1");
		String userPassword2 = request.getParameter("userPassword2");
		String userName = request.getParameter("userName");
		String userDepartment_num = request.getParameter("userDepartment_num");
		String userDepartment = request.getParameter("userDepartment");
		String userPhone_num = request.getParameter("userPhone_num");
		String userEmail = request.getParameter("userEmail");
		
		if(userId == null || userId.equals("") || userPassword1 == null || userPassword1.equals("") || userPassword2 == null || userPassword2.equals("")
					  || userName == null || userName.equals("") || userDepartment_num == null || userDepartment_num.equals("") || userDepartment == null
					  || userDepartment.equals("") || userPhone_num == null || userPhone_num.equals("") || userEmail == null || userEmail.equals(""))
		{
			request.getSession().setAttribute("messageType", "오류메세지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
			response.sendRedirect("RegisterCreate.jsp");
			return;
		}
				
		if (!userPassword1.equals(userPassword2))
		{
			request.getSession().setAttribute("messageType", "오류메세지");
			request.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다.");
			response.sendRedirect("RegisterCreate.jsp");
			return;
		}
		int result = new UserDAO().register(userId, userPassword1, userName, userDepartment_num, userDepartment, userPhone_num, userEmail);
		if( result == 1 )
		{
			request.getSession().setAttribute("messageType", "성공메세지");
			request.getSession().setAttribute("messageContent", "회원가입에  성공하셨습니다.");
			response.sendRedirect("RegisterCreate.jsp");
			return;
		}
		else
		{
			request.getSession().setAttribute("messageType", "오류메세지");
			request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
			response.sendRedirect("RegisterCreate.jsp");
			return;
		}
	}
}
