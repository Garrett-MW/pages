
<%-- Document : OpenOrders 
Created on : Sep 25, 2024, 12:23:10 PM 
Author : garrett
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Open Orders</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link rel="stylesheet" href="styles.css">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Teko:wght@300..700&display=swap" rel="stylesheet">
            <style>
                table {
                    margin: auto;
                    text-align: center;
                    border: 4px solid black;
                    border-collapse: collapse;
                    width: 75%;
                }

                table,
                th,
                td {
                    border: 2px solid black;
                }

                caption {
                    font-size: 30px;
                    font-weight: bolder;
                }

                #container {
                    margin-top: 2%;
                }
            </style>
        </head>

        <body>
            <header>
                <h1>Office Pro</h1>
                <nav>
                    <ul>
                        <li><a href="products.html" class="button">Products</a></li>
                        <li class="nav-item">
                            <!-- Placeholder for dropdown or additional nav items -->
                        </li>
                        <li><a href="checkout.html" class="button">Checkout</a></li>
                        <li><a href="order.html" class="button">Order</a></li>
                    </ul>
                </nav>

                <!-- Search Form -->
                <form id="search-form" action="search_results.html" method="get"
                    aria-label="Search for office products">
                    <input type="search" id="search-query" name="query" placeholder="Search products..."
                        aria-label="Search products" required>
                    <button type="submit" class="button">Search</button>
                </form>
            </header>

            <section class="office-supplies">
                <h2>Open Orders</h2>
                <img src="images/supplies.jpg" alt="Office Supplies" class="supplies-image">
            </section>
            <div id="container">
                <% try{ Class.forName("net.ucanaccess.jdbc.UcanaccessDriver"); Connection
                    con=DriverManager.getConnection("jdbc:ucanaccess:///Users/garrett/Desktop/AdvancedProjectSystems/OfficeSupply.mdb");
                    Statement st=con.createStatement(); String sql="select * from Order where orderFulfilled = 0" ; //0
                    represent false **unfulfilled** ResultSet rs=st.executeQuery(sql); if(rs.next()==false){%>
                    <h1>All Orders Fulfilled!!</h1>
                    <% //if all orders fulfilled display message instead of table }else{%>
                        <table>
                            <caption>Open Orders Table</caption>
                            <tr>
                                <th>Order #</th>
                                <th>Account ID</th> <!<!-- Table Headers -->
                                    <th>Status</th>
                            </tr>
                            <% do{%>
                                <tr>
                                    <td>
                                        <%rs.getString(5);%>
                                    </td> <!-- Order Id column -->
                                    <td>
                                        <%rs.getString(1);%>
                                    </td> <!-- Account ID column -->
                                    <td>
                                        <%rs.getString(4);%>
                                    </td> <!-- Fulfilled column -->
                                </tr>
                                <%}while(rs.next());%>
                        </table>
                        <% //use do while loop to print all orders into table that are unfulfilled } con.close();
                            }catch(Exception e){System.out.println(e);} %>
            </div>
            <footer>
                <p>&copy; 2024 Office Pro. All rights reserved.</p>
            </footer>
        </body>

        </html>