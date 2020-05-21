package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.ReservationDAO;

public class DeleteCon implements iCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		int id = Integer.parseInt(request.getParameter("id"));
		ReservationDAO dao = new ReservationDAO();

		int cnt = dao.delete(id);
		if (cnt > 0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		
		int cnt2 = dao.delete2(id);
		if (cnt2 > 0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}

		response.sendRedirect("reservation.jsp");
	}
}
