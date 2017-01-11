<%-- 
    Document   : header
    Created on : Jan 11, 2017, 1:04:39 AM
    Author     : linuxlite
--%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div style="background-color: lightblue">
            
            <% 
                DateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd");
                Date now = new Date();
                String actualDate = dateFormat.format(now);
            %>
           Dzisiaj jest: <%= actualDate %> Witaj ponownie.
            
        </div>
    </body>
</html>
