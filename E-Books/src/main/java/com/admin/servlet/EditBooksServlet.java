package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int id=Integer.parseInt(req.getParameter("id"));
		String bookName = req.getParameter("bname");
		String author = req.getParameter("author");
		String price = req.getParameter("price");
		String status = req.getParameter("status");
		BookDtls b=new BookDtls();
		b.setBookId(id);
		b.setBookName(bookName);
		b.setAuthor(author);
		b.setPrice(price);
		b.setStatus(status);
		
		BookDAOImpl dao=new BookDAOImpl(DBConnect.getconn());
		boolean f=dao.updateEditBooks(b);
		HttpSession session =req.getSession();
		
		
		if(f)
		{
			session.setAttribute("succmsg", "Book Updated Successfully");
			resp.sendRedirect("admin/all_book.jsp");
		}
		else
		{
			session.setAttribute("errormsg", "Book not Updated Successfully");
			resp.sendRedirect("admin/all_book.jsp");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		
	}
}
}
