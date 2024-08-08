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

@WebServlet("/adminlogin")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        res.setContentType("text/html");
        String name = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        try (Connection con = DriverManager.getConnection("jdbc:mysql:///bank", "root", "changeme");
                PreparedStatement ps = con.prepareStatement("select * from admin where name=? and password=?");
                PreparedStatement customerPs = con.prepareStatement("select name, account_no, acc_type, email, address, mobile_no from customer");) {
            ps.setString(1, name);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ResultSet customerRs = customerPs.executeQuery();
                req.setAttribute("customerResultSet", customerRs);
                RequestDispatcher dispatcher = req.getRequestDispatcher("admindashboard.html");
                dispatcher.forward(req, res);
            } else {
                out.println("<script>alert('Invalid Customer Name and Password');window.location.href='adminlogin.html';</script>");
            }
        } catch (SQLException se) {
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
