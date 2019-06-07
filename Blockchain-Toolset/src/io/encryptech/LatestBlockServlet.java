package io.encryptech;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class LatestBlock
 */
@WebServlet("/LatestBlockServlet")
public class LatestBlockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<String> list;
	
    @SuppressWarnings("resource")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    list = new ArrayList<>();
	    String out = "Failed to connect";
		String URL = "https://blockchain.info/latestblock";
    	try {
        	out = new Scanner(new URL(URL).openStream(), "UTF-8").useDelimiter("\\A").next();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
		String[] data = out.toString().split(",");

    	list.add(data[1]);
    	list.add(data[3]);

    	
        String json = new Gson().toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}
}
