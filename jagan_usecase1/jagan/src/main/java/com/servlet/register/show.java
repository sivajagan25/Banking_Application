package com.servlet.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.FileWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;



@WebServlet("/getweather")
public class show extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	
        String datetime = "19961103-11:00";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection con = DriverManager.getConnection("jdbc:mysql:///securin", "root", "changeme");
                PreparedStatement ps = con.prepareStatement("select * from new3 where datetime_utc=? ");) {
            ps.setString(1, datetime);

            ResultSet rs = ps.executeQuery();
          

            if (rs.next()) {
            	JSONObject jsonObject = new JSONObject();
            	
            	String conds = rs.getString("_conds");
            	String dewptm = rs.getString("_dewptm");
            	String fog = rs.getString("_fog");
            	String hail = rs.getString("_hail");
            	String  heatindexm= rs.getString("_heatindexm");
            	jsonObject.put("conds", conds);
                jsonObject.put("dewptm", dewptm);
                jsonObject.put("fog", fog);
                jsonObject.put("hail ", hail );
                jsonObject.put("heatindexm", heatindexm);
                FileWriter file = new FileWriter("C:/output.json");
                file.write(jsonObject.toString());
                file.close();
            	
            	System.out.println("conds:"+conds);
            	System.out.println("dewptm:"+dewptm);
            	System.out.println("fog:"+fog);
            	System.out.println("hail:"+hail);
            	System.out.println("heatindexm"+heatindexm);
            	
            } else {
            	System.out.println("no data found");
            	
            }
        } catch (SQLException se) {
            System.out.println(se.getMessage());
            se.printStackTrace();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

        // Close the stream
        System.out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

