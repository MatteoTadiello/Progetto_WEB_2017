<%--
 * Cinema Universe - Reservation System
 * Copyright (C) 2018 Domenico Stefani, Ivan Martini, Matteo Tadiello
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * See <http://www.gnu.org/licenses/>.
--%>
<%-- 
    Document   : admin
    Author     : ivan
--%>
<%@page import="it.unitn.disi.cinema.dataaccess.Beans.*"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@page import="java.util.StringTokenizer" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"  crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/cinema.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Zona Admin - incassi</title>
  </head>
  <body class="collage">
    <jsp:include page='components/header.jsp'/>

    <div class="card margin-admin">
      <div class="card-body overflow-card">
        INCASSI DEI FILM
      </div>
    </div>
    <div class="card margin-admin">
      <div class="card-body overflow-card">
        <table class="table  table-striped">
          <thead class="thead-dark">
            <tr>
              <th scope="col">Film</th>
              <th scope="col">Incasso giornaliero</th>
              <th scope="col">Incasso totale</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${requestScope.film}" var="filmm">
              <c:set var="tot" value="tot${filmm.getId()}" />
              <c:set var="totGiorno" value="totGiorno${filmm.getId()}" />
              <tr>
                <td>${filmm.getTitolo()}</td>
                <td>${requestScope[totGiorno]}</td>
                <td>${requestScope[tot]}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <jsp:include page='components/footer.jsp'/>
  </body>
</html>
