package com.user.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name=req.getParameter("fullname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			//System.out.println(name+" "+email+" "+phone+" "+password+" "+check+" ");
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			if(check!=null)
			{
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getconn());
			boolean f2=	dao.checkUser(email);
			if(f2)
			{
				boolean f=dao.userRegister(us);
				if(f)
				{
					session.setAttribute("succmsg", "registration successfully");
					resp.sendRedirect("registration.jsp");
				}
				else
				{			
					session.setAttribute("errormsg", "Please check term & condition");
					resp.sendRedirect("registration.jsp");
				}
			}
			else
			{
				session.setAttribute("errormsg", "User Already exists try anothe email id");
				resp.sendRedirect("registration.jsp");
			}
			}
			else
			{
				session.setAttribute("errormsg", "registration unsuccessfully");
				resp.sendRedirect("registration.jsp");
			}
		} catch (Exception e) {
			
		}
	}

}
