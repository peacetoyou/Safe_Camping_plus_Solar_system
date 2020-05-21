package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.BatteryDAO;
import com.model.BatteryDTO;



public class BatteryCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		BatteryDAO daoBT = new BatteryDAO();
		BatteryDTO dto = null;
		
		//베터리 충전량 데이터
		dto = daoBT.select();
		int bt_charge = dto.getBt_charge();
		int bt_uncharge = 100 - bt_charge;
		String battery_info = "";
		
		
		if(bt_charge >= 80) {
			battery_info = "enough";	
		} else if(bt_charge >= 50) {
			battery_info = "regular";	
		} else if(bt_charge < 50 && bt_charge >= 20) {
			battery_info = "low";	
		} else if(bt_charge < 20) {
			battery_info = "emergency";	
		}
		
		BatteryDTO dto2 = new BatteryDTO(bt_charge, bt_uncharge, battery_info);
		
		String jsonStr = gson.toJson(dto2);		
		out.print(jsonStr);		
	
	}

}
