<%-- 
    Document   : info
    Created on : Apr 20, 2018, 12:29:28 AM
    Author     : matteo
--%>

<%@page import="it.unitn.disi.cinema.dataaccess.Beans.Prezzo"%>
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

        <title>Info page</title>
    </head>
	
    <body>
        
        
    <jsp:include page='components/header.jsp'/>
    
    
    
    <br>
    <br>
    <br>
	<br />
    <div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-12 ">
				<h5>Costi:</h5>
				<c:forEach items="${requestScope.prezzi}" var="prezzi">
					<p><b>${prezzi.getTipo()}:</b> ${prezzi.getPrezzo()}</p>
				</c:forEach>
					<hr>
				<h5>Informazioni:</h5>
				<p><b>Telefono:</b> +39 0123 123123</p>
				<p><b>Indirizzo:</b> Via La Vita E Tutto Quanto, 42 (UNIVERSO)</p>
				<p><b>Partita Iva: </b>01234561001<b> – C.F. </b>01234561001</p>
			</div>
			<div class="col-lg-6 col-md-12 ">
				<div id="map"></div>
			</div>
		</div>
        
    </div>
    
    <br>
    <br>
    <br>
	
    <jsp:include page='components/footer.jsp'/>
		
	<script>
      function initMap() {
        var olimpo = {lat: 40.088, lng: 22.358};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6,
          center: olimpo
        });
        var marker = new google.maps.Marker({
          position: olimpo,
          map: map
        });
      }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPY7IgJv-v0U6cYTLlr2WCjeq4m6CSbG8&callback=initMap"></script>
    </body>
</html>
