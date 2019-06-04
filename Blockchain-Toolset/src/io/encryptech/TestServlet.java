package io.encryptech;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.google.gson.Gson;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final int SIZE = 33;
	List<String> list;

    @SuppressWarnings("resource")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    list = new ArrayList<>();
	    String blockNumber = request.getParameter("blockNumber");
	    String out = "Failed to connect";
	    
	    list = new ArrayList<>();
	    String URL = "https://api.blockcypher.com/v1/btc/main/blocks/" + blockNumber+"";
	   
    	try {
        	out = new Scanner(new URL(URL).openStream(), "UTF-8").useDelimiter("\\A").next();
    	} catch (Exception e) {
    		e.printStackTrace();
    		URL = "https://blockchain.info/block-height/" + blockNumber + "?format=json";
        	out = new Scanner(new URL(URL).openStream(), "UTF-8").useDelimiter("\\A").next();
    	}
		String[] data = out.toString().split(",");
		for(int i = 0; i < data.length; i++)
			list.add(data[i]);
		
		for(int i = 0; i < data.length; i++)
			StringUtils.capitalize(data[i].replaceAll("[^\\p{IsDigit}\\p{IsAlphabetic}]", ""));

        String json = new Gson().toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}
    
    
    
    


        @SuppressWarnings("resource")
    	@Override
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	    list = new ArrayList<>();
    	    String blockNumber = 579119+"";
    	    String out = "Failed to connect";

    		 String URL = "https://blockchain.info/block-height/" + blockNumber + "?format=json";
    	    
    	    //String URL = "https://api.blockcypher.com/v1/btc/main/blocks/" + blockNumber+"";
    	   
    	   
        	try {
            	out = new Scanner(new URL(URL).openStream(), "UTF-8").useDelimiter("\\A").next();
        	} catch (Exception e) {
        		e.printStackTrace();
        	}
    		String[] data = out.toString().split(",");
    		for(int i = 0; i < data.length; i++)
    			list.add(data[i]);

            String json = new Gson().toJson(list);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
    	}
    

    private void addStrToList(String str) {
    	String data[] = str.split(":");
    	data[0] = strFormat(data[0]);
    	data[1] = strFormat(data[1]);
        list.add(data[0]);
        list.add(data[1]);
    }
    
    private String strFormat(String str) {
    	return StringUtils.capitalize(str.replaceAll("[^\\p{IsDigit}\\p{IsAlphabetic}]", ""));
    }
}
