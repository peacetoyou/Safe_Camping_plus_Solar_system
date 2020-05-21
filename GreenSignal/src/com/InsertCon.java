package com;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.model.MemberDTO;
import com.model.ReservationDAO;

import com.model.ReservationDTO;

public class InsertCon implements iCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		int id = Integer.parseInt(request.getParameter("id"));
		int deck_num = Integer.parseInt(request.getParameter("deck_num"));
		String in_date = request.getParameter("in_date");
		String out_date = request.getParameter("out_date");

		if (name == null || tel == null || id < 0 || deck_num < 0 || in_date == null || out_date == null) {
			response.sendRedirect("reservation.jsp");
		}
		
		ReservationDTO dto = new ReservationDTO(name, tel, id, deck_num, in_date, out_date);
		ReservationDAO dao = new ReservationDAO();
		MemberDTO dto2 = new MemberDTO(id, tel, deck_num);

		int cnt = dao.sendMsg(dto);
		int cnt2 = dao.sendMsg2(dto2);

		if (cnt > 0 && cnt2 > 0) {
			response.sendRedirect("reservation.jsp");
		}
	}

}