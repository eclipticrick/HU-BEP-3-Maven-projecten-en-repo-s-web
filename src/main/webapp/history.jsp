<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="nl.ecliptic.bep.friendspammer.MongoSaver" %>
<%@ page import="nl.ecliptic.bep.friendspammer.resources.HistoryRecord" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
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
    <% List<HistoryRecord> history = MongoSaver.getEmailHistory(); %>
    <% for(HistoryRecord historyRecord : history) { %>
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