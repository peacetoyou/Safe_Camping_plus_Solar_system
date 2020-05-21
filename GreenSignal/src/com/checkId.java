package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkId")
public class checkId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 안드로이드에서 접속 입력된 값을 기준으로 DB 와 데이터 값을 비교
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String ck_id = request.getParameter("id");
		if (ck_id != null) {
			idDAO dao = new idDAO();
			String dbid = dao.ckDBid(ck_id);

			if (ck_id.equals(dbid)) {
				HttpSession session = request.getSession();
				session.setAttribute("ckid", dbid);
			}
		}

	}

}
