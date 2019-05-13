<%@page import="sqliteConnector.sqliteConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.time.format.DateTimeFormatter"%>
   <%@page import="java.time.LocalDate"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="org.sqlite.*"%>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="ISO-8859-1">
<title>Veranstaltung Overview</title>
</head>
<body>
<div class="container">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="index.html">Hauptmen�</a> <a
				class="navbar-brand" href="lva_service.html">LVA Service</a> <a
				class="navbar-brand" href="pr�fungsservice.html">Pr�fungsservice</a>
			<a class="navbar-brand" href="raumservice.html">Raumservice</a> <a
				class="navbar-brand" href="veranstaltungsservice.html">Veranstaltungsservice</a>
		</nav>
<h3>
			<span class="badge badge-secondary">Alle Veranstaltungen </span>
		</h3>
<table class="table table-borderless"style="border-collapse: collapse;display: block;">
            <tr bgcolor = "#949494">
               <th>Bezeichnung</th>
               <th>Datum</th>
               <th>Uhrzeit</th>
               <th>Ort</th>
            </tr>
<% 
Connection conn = sqliteConnection.dbConnector();
String test = "";
Statement stat = conn.createStatement();
String service ="SELECT * from veranstaltung";
ResultSet rs1 = stat.executeQuery(service);


while (rs1.next()) {
	        test = rs1.getString(2);
		   out.print("<tr><td>" + rs1.getString(2) + "</td>\n");
		   out.print("<td>" + rs1.getString(3) + "</td>\n"); 
		   out.println("<td> " + rs1.getString(4) + "-"+rs1.getString(5)+"</td>\n");
		   out.print("<td>" + rs1.getString(7) + "</td>\n");
		   out.println("<td> <a href=veranstaltung_�ndern.jsp?id="+rs1.getString(1)+"> Edit</a></td>\n");
		   out.println("<td> <a href=veranstaltung_delete.jsp?id="+rs1.getString(1)+"> Delete</a></td>\n");
		   out.println("<td> <a href=teilnehmen.jsp?vid="+rs1.getString(1)+"> Teilnehmen</a></td>\n");
		   out.println("<td> <a href=teilnehmerliste.jsp?vid="+rs1.getString(1)+"> Teilnehmerliste</a></td></tr>\n");
}


%>
</table>
</div>
</body>
</html>