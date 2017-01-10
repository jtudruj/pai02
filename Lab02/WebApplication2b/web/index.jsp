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
        <div>
            <%= new java.util.Date() %>
        </div>
        <div>
            <% 
                DateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd");
                Date now = new Date();
                String actualDate = dateFormat.format(now);
            %>
            <%= actualDate %>
            <h1>Hello JSP!</h1>
        </div>
        <%! public Integer serverVisitCounter = 0; %>
        <%            
            final String COOKIE_LAST_VISIT = "lastVisitDateTime";
            final String COOKIE_ALL_VISITS_COUNTER = "allVisitsCounter";
            final String COOKIE_SESSION_VISITS_COUNTER = "sessionVisitsCounter";
            final String COOKIE_LAST_SESSION_ID = "lastSessionId";
            Cookie[] cookies = request.getCookies();

            String lastVisitDate = "";
            Integer sessionVisitCounter = 0;
            Integer allVisitsCounter = 0;
            String actualSessionId = session.getId();
            String lastSessionId = "";
            /*
            getValuesFromCookies
            */
            if (cookies != null) {
                for(int i=0; i < cookies.length; i++) {
                    Cookie c = cookies[i];
                    if (COOKIE_LAST_VISIT.equals(c.getName())) {
                        lastVisitDate = c.getValue();
                    }
                    if (COOKIE_ALL_VISITS_COUNTER.equals(c.getName())) {
                        allVisitsCounter = Integer.parseInt(c.getValue());
                    }
                    if (COOKIE_SESSION_VISITS_COUNTER.equals(c.getName())) {
                        sessionVisitCounter = Integer.parseInt(c.getValue());
                    }
                    if (COOKIE_LAST_SESSION_ID.equals(c.getName())) {
                        lastSessionId = c.getValue();
                    }
                }
            }

            /*
            increment visit coounters
            */

            allVisitsCounter++;
            if (lastSessionId.equals(actualSessionId)) {
                sessionVisitCounter++;
            } else {
                sessionVisitCounter = 1;
            }
            serverVisitCounter++;
            
            /*
            save new values to cookies
            */
            Cookie c = new Cookie(COOKIE_LAST_VISIT, actualDate);
            c.setMaxAge(60 * 24 * 3600);
            c.setPath("/");
            response.addCookie(c);
            
            response.addCookie(new Cookie(COOKIE_SESSION_VISITS_COUNTER, sessionVisitCounter.toString()));
            
            Cookie cc = new Cookie(COOKIE_ALL_VISITS_COUNTER, allVisitsCounter.toString());
            cc.setMaxAge(60 * 24 * 3600);
            cc.setPath("/");
            response.addCookie(cc);
            
            response.addCookie(new Cookie(COOKIE_LAST_SESSION_ID, actualSessionId));
            
            /*
            setup info to print
            */
            String info = "Witaj pierwszy raz na stronie!";
            if (!lastVisitDate.equals("")) {
                info = "<p>Ostatnia wizyta: " + lastVisitDate + "</p>" +
                "<p>Odwiedzin w sesji: " + sessionVisitCounter.toString() + "</p>" +
                "<p>Wszystkich odwiedzin z tej przeglądarki: " + allVisitsCounter + "</p>" +
                "<p>Wszystkich odwiedzin na serwerze: " + serverVisitCounter + "</p>";
                /* + 
                "<p>ID ostatniej sesji: " + lastSessionId + "</p>" +
                "<p>ID aktualnej sesji: " + actualSessionId + "</p>";
                */
            }
        %>
        <div>
            <%= info %>
        </div>
    </body>
</html>
