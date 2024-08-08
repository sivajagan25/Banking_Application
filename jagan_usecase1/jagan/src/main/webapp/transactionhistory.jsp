<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.register.Transaction" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <style>
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
        h1 {
            padding-left: 40%;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .download-link {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        button:hover {
            background-color: red;
        }
        body {
            font-family: 'Times New Roman', Times, serif;
            background-image: url(./all2.png);
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body>
    <a href="#" class="download-link" onclick="downloadTableData()"><button>Download</button></a>
    <h1>Transaction History</h1>
    <table id="transaction-table">
        <tr>
            <th>Transaction Type</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>

        <% 
            List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
            for (Transaction transaction : transactions) {
        %>
            <tr>
                <td><%= transaction.getTransactionType() %></td>
                <td><%= transaction.getAmount() %></td>
                <td><%= transaction.getDate() %></td>
            </tr>
        <% } %>
    </table>
    <center>
        <form action="back" method="post" id="emailForm">
            <input type="hidden" name="account_no" value="<%= request.getAttribute("account_no") %>">
            <button type="submit">Back</button><br>
        </form>
    </center>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.14/jspdf.plugin.autotable.min.js"></script>
    <script>
        async function downloadTableData() {
            const { jsPDF } = window.jspdf;

            const doc = new jsPDF();
            const table = document.getElementById("transaction-table");
            const rows = table.getElementsByTagName("tr");

            const data = [];
            for (let i = 0; i < rows.length; i++) {
                const cells = rows[i].getElementsByTagName(i === 0 ? "th" : "td");
                const row = [];
                for (let j = 0; j < cells.length; j++) {
                    row.push(cells[j].innerText);
                }
                data.push(row);
            }

            doc.autoTable({
                head: [data[0]],
                body: data.slice(1),
            });

            doc.save("transaction_data.pdf");
        }
    </script>
</body>
</html>
