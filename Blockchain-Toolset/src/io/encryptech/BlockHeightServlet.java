package io.encryptech;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


@WebServlet("/BlockHeightServlet")
public class BlockHeightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final int SIZE = 33;

    @SuppressWarnings("resource")
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String out = "Failed to connect";
    	try {
        	out = new Scanner(new URL("https://blockchain.info/block-height/5?format=json").openStream(), "UTF-8").useDelimiter("\\A").next();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
		JSONArray jsonArray = null;
		JSONObject jsnobject = new JSONObject(out);
		jsonArray = jsnobject.getJSONArray("blocks");
		String[] data = jsonArray.toString().split(",");
    	
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
    	
        List<String> list = new ArrayList<>();
        String[] blockData = new String[SIZE];
        
        list.add(data[33]);		// height
        list.add(data[32]);		// hash
        list.add(data[1]);		// next block
        list.add(data[2]);		// prev block
        list.add(data[31]);		// time
        list.add(data[21]);		// btc
        
        String json = new Gson().toJson(list);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    	
    	/*
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(returnMe);
        */
    }
}
