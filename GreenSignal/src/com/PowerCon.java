package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.PowerDAO;
import com.model.PowerDTO;

public class PowerCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();

		String powerItem,powerState;
		powerItem = request.getParameter("powerItem");
		powerState = request.getParameter("powerState");
		
		PowerDAO dao = new PowerDAO();

		if (powerItem != null) {
			int cnt = dao.update(powerItem, powerState);
			if (cnt > 0) {
				System.out.println("스위치 값 변경 성공");
			} else {
				System.out.println("스위치 값 변경 실패");
			}
			
		} else {
			PowerDTO dto = null;
			ArrayList<PowerDTO> list = new ArrayList<PowerDTO>();
			list = dao.select();
			if (list != null) {
				String strJson = gson.toJson(list);
				out.print(strJson);
			}
		}
	}
}
