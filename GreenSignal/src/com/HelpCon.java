package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.tentInfoDAO;
import com.model.tentInfoDTO;
import com.model.HelpDAO;
import com.model.HelpDTO;

public class HelpCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		request.getParameter("id");			
		Gson gson = new Gson();
		
		HelpDAO dao = new HelpDAO();
		ArrayList<HelpDTO> list = dao.select();
		
		String jsonArr = gson.toJson(list);		
				
		response.setCharacterEncoding("UTF-8");		
		PrintWriter out = response.getWriter();
		out.print(jsonArr);

	}

}
