<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Times New Roman', Times, serif;
            background-image: url(./all2.png);
      
      
            background-size: cover;
            background-position: center;
}

h1 {
    text-align: center;
}

form {
    margin-bottom: 20px;
}

label {
    display: inline-block;
    width: 150px;
    font-weight: bold;
}

input[type="text"],
input[type="email"],
input[type="tel"] {
    width: 250px;
    padding: 5px;
    margin-bottom: 10px;
}

input[type="submit"] {
    display: block;
    margin: 10px auto;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

table {
    width: 100%;
    border-collapse: collapse;
}

table th, table td {
    border: 1px solid #eff1d4;
    text-align: left;
    padding: 8px;
}

table th {
    background-color: #eff1d4;
}
button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
}

button:hover {
    opacity: 0.8;
}

    </style>
</head>
<body>
    <h1>Customers</h1>


    <table id="customerTable">
        <thead>
            <tr>
                <th>Customer Name</th>
                <th>Account Number</th>
                <th>Account Type</th>
                <th>Email</th>
                <th>Address</th>
                <th>Phone Number</th>
            </tr>
        </thead>
       <tbody>
                    <!-- Java code to iterate over customerResultSet and display customer details -->
                    <% 
                        try {
                            ResultSet customerRs = (ResultSet) request.getAttribute("customerResultSet");
                            while (customerRs.next()) {
                    %>
                    <tr>
                        <td><%= customerRs.getString("name") %></td>
                        <td><%= customerRs.getString("account_no") %></td>
                        <td><%= customerRs.getString("acc_type") %></td>
                        <td><%= customerRs.getString("email") %></td>
                        <td><%= customerRs.getString("address") %></td>
                        <td><%= customerRs.getString("mobile_no") %></td>
                    </tr>
                    <% 
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
    </table>
    <center>
     <a href="./admindashboard.html" ><button id="bt">Back</button></a>
</center>
    <script src="script.js"></script>
</body>
</html>