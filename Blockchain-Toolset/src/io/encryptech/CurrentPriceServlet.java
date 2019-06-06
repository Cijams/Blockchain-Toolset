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

@WebServlet("/CurrentPriceServlet")
public class CurrentPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

        @SuppressWarnings("resource")
    	@Override
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	    String out = "Failed to connect";
    		String URL = "https://blockchain.info/q/24hrprice";
        	try {
            	out = new Scanner(new URL(URL).openStream(), "UTF-8").useDelimiter("\\A").next();
        	} catch (Exception e) {
        		e.printStackTrace();
        	}
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(out);
    	}
}
