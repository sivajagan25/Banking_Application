<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
         body {
            font-family: 'Times New Roman', Times, serif;
            background-image: url(./all.png);
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9); 
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
           
        }

        h2 {
            color: #333; 
            
            
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 15px 30px;
            cursor: pointer;
            margin: 10px;
            font-size: 16px;
            border-radius: 15px;
        }

        button:hover {
            background-color: #0056b3;
        }
         #btn{
    background-color: #4CAF50;
    color: white;
    padding:10px;
    border: none;
    cursor: pointer;
    border-radius: 10px;
}
#btn:hover{
            background-color: red;
        }
        .logout{
            margin-left: 110%;
            margin-top: 0px;
            
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
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

table th {
    background-color: #f2f2f2;
}
        
    </style>

    <!-- Add your head content here -->
</head>
<body>
    <div class="container">
        <div class="logout">  
            <a href="./frontlogin.html">
                <button id="btn">LogOut</button>
            </a>
        </div>
        <h2>Customer Management</h2>
        <a href="./createuser.html" ><button>Create Customer</button></a>
        <a href="./viewuser.jsp" ><button>View Customer</button></a>
        <a href="./deleteuser.html" ><button>Delete Customer</button></a>
        <a href="./modifyuser.jsp" ><button>Modify Customer</button></a>
        <div>
            <h1>Customer Details</h1>
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
        </div>
    </div>
</body>
</html>
