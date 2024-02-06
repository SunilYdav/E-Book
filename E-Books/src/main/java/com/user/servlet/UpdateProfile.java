
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
@WebServlet("/update_profile")
public class UpdateProfile extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fullname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			HttpSession session=req.getSession();
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getconn());
			boolean f=dao.checkPassword(password, id);

			if(f)
			{
				boolean f2=dao.updateProfile(us);
				
				if(f2)
				{
					session.setAttribute("succmsg", "Update profile successfully");
					resp.sendRedirect("edit_profile.jsp");
				}
				else
				{			
					session.setAttribute("errormsg", "Something Wrong On Server");
					resp.sendRedirect("edit_profile.jsp");
				}
			}
			else
			{
				session.setAttribute("errormsg", "registration unsuccessfully");
				resp.sendRedirect("edit_profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}