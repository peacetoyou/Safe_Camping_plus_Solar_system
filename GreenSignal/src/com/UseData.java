package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.EDataDAO;
import com.model.EDataDTO;
import com.model.ProDayDTO;
import com.model.ProTimeDTO;
import com.model.UseDTO;
import com.model.UseDataDAO;

public class UseData implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String strJson = null;

		GregorianCalendar today = new GregorianCalendar();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("HH");
		String strDate = format1.format(today.getTime());
		String strTime = format2.format(today.getTime());

 
		strDate = "2020-04-27";		
		UseDTO dto;
		UseDataDAO dao = new UseDataDAO();
		ArrayList<UseDTO> list = dao.select(strDate, strTime);

		strJson = gson.toJson(list);
		out.print(strJson);
	}
		

}


