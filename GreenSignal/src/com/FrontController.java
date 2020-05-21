package com;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
   HashMap<String, iCommand> map = null;
  
   @Override
   public void init() throws ServletException {
      map = new HashMap<String, iCommand>();
      map.put("Electricity.do", new Electricity());
      map.put("Battery.do", new BatteryCon());
      map.put("EData.do", new EData());
      map.put("UseData.do", new UseData());
      map.put("PowerCon.do", new PowerCon());
      map.put("TimeCon.do", new TimeCon());
      map.put("SensorCon.do", new SensorCon());
      map.put("CampCon.do", new CampCon());
      map.put("LoginServiceCon.do", new LoginServiceCon());
      map.put("HelpCon.do", new HelpCon());
      map.put("InsertCon.do", new InsertCon());
      map.put("DeleteCon.do", new DeleteCon());

      
   }

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
    
      String requestURI = request.getRequestURI();
      String contextPath = request.getContextPath();
      String command = requestURI.substring(contextPath.length() + 1);

      iCommand com = map.get(command);
      com.execute(request, response);

   }

}