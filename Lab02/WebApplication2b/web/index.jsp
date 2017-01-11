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
        <div><jsp:include page="header.jsp"/></div>
        <div style="background-color: lightgreen">
    <!--
    =========================KALKULATOR RATY=========================
    !-->
        <%! double calculationResul = 0; 
            String sk = "";
            String spr = "";
            String sn = "";
        %>  

        <%
            if (request.getParameter("k") != null) {
                sk = request.getParameter("k");
            }
            if (request.getParameter("pr") != null) {
                spr = request.getParameter("pr");
            }
            if (request.getParameter("n") != null) {
                sn = request.getParameter("n");
            }
        %>
    <div>
        <h3>Kalkulator rat</h3>
        <form action="index.jsp">
            <p>Kwota poyczki: <input type="number" step="0.1" name="k" value="<%= sk %>"></p>
            <p>Oprocentowanie roczne: <input type="number" step="0.1" name="pr" value="<%= sn %>"></p>
            <p>Liczba rat: <input type="number" step="0.1" name="n" value="<%= sn %>"></p>
            <p><input type="submit" value="Oblicz"></p>
        </form>


        <%
            if (request != null && request.getParameter("k") != null && request.getParameter("pr") != null && request.getParameter("n") != null) {
                float k, p, pr, n;
                k = Float.parseFloat(request.getParameter("k"));
                pr = Float.parseFloat(request.getParameter("pr"));
                n = Float.parseFloat(request.getParameter("n"));

                p = pr/12;

                calculationResul = (k*p) / (1 - (1/Math.pow((1+p), n)));
            }

        %>

        Miesieczna rata splaty: <span style="background-color: yellow"><%= calculationResul %></span>
    </div>
</div>
        
        <div>
            <div><jsp:include page="footer.jsp"/></div>
        </div>
    </body>
</html>
