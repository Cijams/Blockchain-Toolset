package io.encryptech;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	final int SIZE = 33;
	private static final long serialVersionUID = 1L;
   
	
	
	
	
	@SuppressWarnings("resource")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    List<String> list = new ArrayList<>();


	    
	    String out = "Failed to connect";
    	try {
        	out = new Scanner(new URL("https://blockchain.info/block-height/5?format=json").openStream(), "UTF-8").useDelimiter("\\A").next();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
		JSONArray jsonArray = null;
		JSONObject jsnobject = new JSONObject(out);
		jsonArray = (JSONArray) jsnobject.getJSONArray("blocks");
		String[] data = jsonArray.toString().split(",");
    	
        List<String> list1 = new ArrayList<>();
        String[] blockData = new String[SIZE];
        
        String height[] = data[33].split(":");
        height[0] = height[0].replaceAll("[^\\p{IsDigit}\\p{IsAlphabetic}]", "");
        height[1] = height[1].replaceAll("[^\\p{IsDigit}\\p{IsAlphabetic}]", "");
        
        
        list1.add(height[0]);		// height
        list1.add(height[1]);
       // list1.add(data[32]);		// hash
       // list1.add(data[1]);		// next block
       // list1.add(data[31]);		// time
      //  list1.add(data[21]);		// btc

       
        String json = new Gson().toJson(list1);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}
}
