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

public class EData implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String keyword = request.getParameter("keyword");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String strJson = null;
		
		ArrayList<ProTimeDTO> protime = new ArrayList<ProTimeDTO>();
		ArrayList<ProDayDTO> proday = new ArrayList<ProDayDTO>();
		ProTimeDTO dtoTime;
		ProDayDTO dtoDay;

		GregorianCalendar today = new GregorianCalendar();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("MM");
		String strDate = format1.format(today.getTime());
		String strMonth = format2.format(today.getTime());

		
		// 태양광 전기 시간별(일일) 생산량 가져오기
		if (keyword.equals("proTime")) {
			strDate = "2020-04-29"; // 이 줄을 삭제 하면, 오늘 날짜 데이터를 가져옴

			EDataDAO eDataDAO = new EDataDAO();
			ArrayList<EDataDTO> list = eDataDAO.select(keyword, strDate);
			
			for (int i = 0; i < list.size(); i++) {
				int time = list.get(i).getCr_time();
				int curr = list.get(i).getCr_curr();
				dtoTime = new ProTimeDTO(time, curr);
				protime.add(dtoTime);
				strJson = gson.toJson(protime);

			}

		// 태양광 전기 일별(이번 월) 생산량 가져오기
		} else if (keyword.equals("proDay")) {
			strMonth = "202004"; // 이 줄을 삭제하면, 이번 달 데이터를 가져옴, 실제 데이터가 부족하여 F1 경기장 4월 태양광 생산량 데이터를 DB에 넣어 4월 데이터만 가져오게 함 
					
			EDataDAO eDataDAO = new EDataDAO();
			ArrayList<EDataDTO> list = eDataDAO.select(keyword, strMonth);
		
			int currSum=0 , count=0, day=0;
			for (int j = 0; j < list.size(); j++) {
				String d = list.get(j).getCr_date();
				day = Integer.parseInt(d.substring(8, 10));
				System.out.println(d);
				System.out.println(day);
				
				if(count == 0) {
					currSum += list.get(j).getCr_curr();
				} else {
					if(count%24 != 0) {
						currSum += list.get(j).getCr_curr();					
					} else {
						dtoDay = new ProDayDTO(day-1, currSum);
						proday.add(dtoDay);
						currSum = 0;
						currSum += list.get(j).getCr_curr();
					}
	
				}
							
				if(j == list.size()-1) {
					dtoDay = new ProDayDTO(day, currSum);
					proday.add(dtoDay);
				}				
				count++;
			}									
			strJson = gson.toJson(proday);
			
			
			
		// 태양광 전기 시간별(오늘) 사용량 가져오기
		} else if (keyword.equals("useTime")) {
			strDate = "2020-04-29";		// 이 줄을 없애면 오늘 데이터르르 가져옴	

			EDataDAO eDataDAO = new EDataDAO();
			ArrayList<EDataDTO> list = eDataDAO.select(keyword, strDate);
			for (int i = 0; i < list.size(); i++) {
				int time = list.get(i).getCr_time();
				int curr = list.get(i).getCr_curr();
				dtoTime = new ProTimeDTO(time, curr);
				protime.add(dtoTime);
				strJson = gson.toJson(protime);

			}

	    // 태양광 전기 일별(이번 월) 사용량 가져오기
		} else if (keyword.equals("useDay")) {
			strDate = strMonth;
			EDataDAO eDataDAO = new EDataDAO();
			ArrayList<EDataDTO> list = eDataDAO.select(keyword, strDate);

			int currSum=0 , count=0, day=0;
			for (int j = 0; j < list.size(); j++) {
				String d = list.get(j).getCr_date();
				day = Integer.parseInt(d.substring(8, 10));				
				
				if(count == 0) {
					currSum += list.get(j).getCr_curr();
				} else {
					if(count%24 != 0) {
						currSum += list.get(j).getCr_curr();					
					} else {
						dtoDay = new ProDayDTO(day-1, currSum);
						proday.add(dtoDay);
						currSum = 0;
						currSum += list.get(j).getCr_curr();
					}
	
				}
							
				if(j == list.size()-1) {
					dtoDay = new ProDayDTO(day, currSum);
					proday.add(dtoDay);
				}				
				count++;
			}
									
			strJson = gson.toJson(proday);
		} 

		out.print(strJson);

	}

}
