package com.servlet.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewall")
public class viewall extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        res.setContentType("text/html");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        try (Connection con = DriverManager.getConnection("jdbc:mysql:///bank", "root", "changeme");
                PreparedStatement customerPs = con.prepareStatement("select name, account_no, acc_type, email, address, mobile_no from customer");) {

            	ResultSet customerRs = customerPs.executeQuery();
                req.setAttribute("customerResultSet", customerRs);
                RequestDispatcher dispatcher = req.getRequestDispatcher("viewall.jsp");
                dispatcher.forward(req, res);
        }
         catch (SQLException se) {
            out.println(se.getMessage());
            se.printStackTrace();
        } catch (Exception e) {
            out.println(e.getMessage());
            e.printStackTrace();
        }

        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
