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
import com.model.tentSensorDAO;
import com.model.tentSensorDTO;

public class SensorCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();  		 
                  
          tentSensorDAO tidao = new tentSensorDAO();
		  ArrayList<tentSensorDTO> list = tidao.selectSen();
		  String jsonArr = gson.toJson(list);
        
		  response.setCharacterEncoding("UTF-8");
		  
		  PrintWriter out = response.getWriter();
		  out.print(jsonArr);

	}

}
