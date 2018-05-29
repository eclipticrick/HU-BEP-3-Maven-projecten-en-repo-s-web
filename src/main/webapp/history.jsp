<%@ page import="nl.ecliptic.bep.friendspammer.MongoSaver" %>
<%@ page import="nl.ecliptic.bep.friendspammer.resources.HistoryRecord" %>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java"
         contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Al verstuurde berichten!</title>
</head>
<body>
<p>Alle verstuurde berichten</p>
<table border="1">
    <thead>
    <tr>
        <td>Aan:</td>
        <td>Van:</td>
        <td>Onderwerp:</td>
        <td>Text:</td>
        <td>HTML:</td>
    </tr>
    </thead>
    <tbody>
    <%
       ArrayList<HistoryRecord> history = MongoSaver.getEmailHistory();
       for(HistoryRecord historyRecord : history) { %>
            <tr>
                <td><%= historyRecord.getTo() %></td>
                <td><%= historyRecord.getFrom() %></td>
                <td><%= historyRecord.getSubject() %></td>
                <td><%= historyRecord.getText() %></td>
                <td><%= historyRecord.getAsHtml() %></td>

            </tr>
            <% } %>
    </tbody>
</table>
</body>
</html>