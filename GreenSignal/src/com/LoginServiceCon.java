package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.LoginDAO;
import com.model.LoginDTO;

public class LoginServiceCon implements iCommand {
   
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("EUC-KR");

      String email = request.getParameter("email");
      String pw = request.getParameter("pw");

      LoginDTO dto = new LoginDTO(email, pw);
      LoginDAO dao = LoginDAO.getDAO();
      LoginDTO info = dao.login(dto);
      

      if (info != null) {
         HttpSession session = request.getSession();
         session.setAttribute("info", info);   
         System.out.println("로그인 성공");
      response.sendRedirect("index.jsp");
      }else {
         response.setCharacterEncoding("UTF-8");
         response.sendRedirect("login.jsp");
         System.out.println("로그인 실패");
      }

   }

}