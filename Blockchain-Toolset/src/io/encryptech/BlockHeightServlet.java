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

@WebServlet("/BlockHeightServlet")
public class BlockHeightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final int SIZE = 33;
	List<String> list;

    @SuppressWarnings("resource")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    list = new ArrayList<>();
	    String blockNumber = request.getParameter("blockNumber");
	    String out = "Failed to connect";
	    String URL = "https://blockchain.info/block-height/" + blockNumber + "?format=json";
	   // String URL = "https://api.blockcypher.com/v1/btc/main/blocks/" + blockNumber;
    	try {
        	out = new Scanner(new URL(URL).openStream(), "UTF-8").useDelimiter("\\A").next();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
		JSONArray jsonArray = null;
		JSONObject jsnobject = new JSONObject(out);
		jsonArray = (JSONArray) jsnobject.getJSONArray("blocks");
		String[] data = jsonArray.toString().split(",");
		
		addStrToList(data[33]);
		addStrToList(data[32]);
		addStrToList(data[31]);
        
       // list1.add(data[32]);		// hash
       // list1.add(data[1]);		// next block
       // list1.add(data[31]);		// time
      //  list1.add(data[21]);		// btc

        String json = new Gson().toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}
    
    
    
    


        @SuppressWarnings("resource")
    	@Override
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	    list = new ArrayList<>();
    	    String blockNumber = 59000+"";
    	    String out = "Failed to connect";

    		// String URL = "https://blockchain.info/block-height/" + blockNumber + "?format=json";
    	    
    	    String URL = "https://api.blockcypher.com/v1/btc/main/blocks/" + blockNumber+"";
    	   
    	   
        	try {
            	out = new Scanner(new URL(URL).openStream(), "UTF-8").useDelimiter("\\A").next();
        	} catch (Exception e) {
        		e.printStackTrace();
        	}
    		JSONArray jsonArray = null;
    		JSONObject jsnobject = new JSONObject(out);
    	//	jsonArray = (JSONArray) jsnobject.getJSONArray("blocks");
    		String[] data = out.toString().split(",");
    		for(int i = 0; i < data.length; i++)
    			addStrToList(data[i]+"");
    		

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
