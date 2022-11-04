<%-- 
    Document   : pruebapost_op
    Created on : 4 nov. 2022, 11:52:24
    Author     : COMPU06
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String dUan= request.getParameter("dato1");
            String dTu= request.getParameter("dato2");
            out.print("<p>dato1: " + dUan + "</p><br>");
            out.print("<p>dato2: " + dTu + "</p><br>");
        %>
    </body>
</html>
