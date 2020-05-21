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
import com.model.BatteryDAO;
import com.model.BatteryDTO;
import com.model.EDataDAO;
import com.model.EDataDTO;
import com.model.ProDayDTO;
import com.model.ProMonthDTO;
import com.model.RealtimeDAO;
import com.model.RealtimeDTO;
import com.model.SolarDTO;
import com.model.UseDTO;
import com.model.UseDataDAO;

public class Electricity implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String keyword = request.getParameter("keyword");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();		
		Gson gson = new Gson();
		
		// 오늘 날짜 데이터 가져오기
		GregorianCalendar today = new GregorianCalendar();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("MM");
		SimpleDateFormat format3 = new SimpleDateFormat("dd");
		SimpleDateFormat format4 = new SimpleDateFormat("HH");
		String strDate = format1.format(today.getTime());
		String strMonth = format2.format(today.getTime());
		String strDay = format3.format(today.getTime());
		String strTime = format4.format(today.getTime());
		
		
		String sun_realtime="", sun_day="", sun_month="";
		String street_lamp="", tent="", toilet="", office="";
		ArrayList<EDataDTO> list;
		ArrayList<UseDTO> listUse;		
		EDataDAO dao = new EDataDAO();
		
		RealtimeDAO daoRT = new RealtimeDAO();
		RealtimeDTO dtoRT = null;
		
		
				
			//실시간 생산 데이터(sun_realtime) - 이 데이터는 실제 측정 데이터임. 아두이노에서 전송되는 데이터.
			dtoRT = daoRT.select();
			String realtime = dtoRT.getCr_watt() + "";
			
			//오늘 생산량 데이터(sun_day)
			strDate = "2020-04-27"; // 실제 날짜 입력시에는 이 줄을 삭제하면 됨
			list = dao.select("proTime", strDate);		
			int sumDay = 0;
			for(int i = 0; i < list.size(); i++) {
				sumDay += list.get(i).getCr_curr();
			}
			int day = Integer.parseInt(strDay);
			ProDayDTO dtoDay = new ProDayDTO(day, sumDay);
			
			//이번달 생산량 데이터(sun_month)
			strMonth = "2020-04";
			list = dao.select("proDay", strMonth);
			int sumMonth = 0;
			for(int i = 0; i < list.size(); i++) {
				sumMonth += list.get(i).getCr_curr();
			}
//			int month = Integer.parseInt(strMonth);  // 실제 날짜 입력시에는 이 줄 살리고, 아래줄 주석 처리하기
			int month = Integer.parseInt("04");
			ProMonthDTO dtoMonth = new ProMonthDTO(month, sumMonth);
			
			
			//전송할  데이터 3가지(solar_pro.html 상단)
			sun_realtime = realtime;
			sun_day = dtoDay.getCurr()+"";
			sun_month = dtoMonth.getCurr()+"";
		
				
		SolarDTO solarDTO = new SolarDTO(sun_realtime, sun_day, sun_month, street_lamp, tent, toilet, office);
		ArrayList<SolarDTO> listSolar = new ArrayList<SolarDTO>();
		listSolar.add(solarDTO);
		String jsonStr = gson.toJson(solarDTO);
		out.print(jsonStr);
		
		
	}

}
