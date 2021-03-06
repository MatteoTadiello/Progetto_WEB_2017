<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.unitn.disi.cinema.dataaccess.Beans.*"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@page import="java.util.StringTokenizer" %>



<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="pageCurrent" value="${requestScope.pageCurrent}" />

<c:choose>
  <c:when test="${pageCurrent=='homepage'}">
    <c:set var="activeHomepage" value="active"></c:set>
  </c:when>
  <c:when test="${pageCurrent=='infopage'}">
    <c:set var="activeInfopage" value="active"></c:set>
  </c:when>
  <c:when test="${pageCurrent=='reservationpage'}">
    <c:set var="activeReservationpage" value="active"></c:set>
  </c:when>
</c:choose>


<link href="https://fonts.googleapis.com/css?family=Gugi" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<header class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand flex-row" style="font-family: 'Gugi', cursive;">CINEMA UNIVERSE</a>
</header>
<header class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <!--<header class="navbar navbar-expand navbar-dark bg-dark flex-column flex-md-row bd-navbar">-->



  <a class="navbar-brand flex-row" href="${context}" style="font-family: 'Gugi', cursive;">CINEMA UNIVERSE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ${activeHomepage}">
        <a class="nav-link" href="${context}">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <div class="form-inline" style="padding: .5rem">
          <a class="astext nav-link ${activeInfopage}" href="/cinema/info">Info</a>
        </div>
      </li>
    </ul>


    <ul class="navbar-nav my-2 my-lg-0">
      <c:choose>
        <c:when test="${sessionScope.email != null}">
          <c:set var="emailParts" value="${fn:split(sessionScope.email, '@')}" />
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <c:choose>
                <c:when test="${sessionScope.ruolo == 'admin'}">
                  <i class="fa fa-user"></i> <b>${emailParts[0]}</b> (${sessionScope.ruolo})
                </c:when>
                <c:otherwise>
                  <i class="fa fa-user"></i> <b>${emailParts[0]}</b>
                </c:otherwise>
              </c:choose>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="/cinema/lemieprenotazioni/${sessionScope.email}">Le mie prenotazioni</a>
              <div class="dropdown-divider"></div>

              <c:choose>
                <c:when test="${sessionScope.ruolo == 'admin'}">

                  <h3 class="dropdown-header"><b>Zona Admin</b></h3>

                  <form class="form-signin" id="form-admin-situazione" action="/cinema/" method="POST">
                    <input type="hidden" name="pageRequested" value="adminsituazione">
                    <a class="dropdown-item" onclick="document.getElementById('form-admin-situazione').submit();">Situazione delle programmazioni</a>
                  </form>

                  <form class="form-signin" id="form-admin-incassi" action="/cinema/" method="POST">
                    <input type="hidden" name="pageRequested" value="adminincassi">
                    <a class="dropdown-item" onclick="document.getElementById('form-admin-incassi').submit();">Incassi dei film</a>
                  </form>

                  <form class="form-signin" id="form-admin-clienti" action="/cinema/" method="POST">
                    <input type="hidden" name="pageRequested" value="adminclientitop">
                    <a class="dropdown-item" onclick="document.getElementById('form-admin-clienti').submit();">Lista clienti top</a>
                  </form>

                  <a class="dropdown-item" href="/cinema/prenotazione/">Gestione delle prenotazioni</a>

                  <div class="dropdown-divider"></div>

                  <div class="dropleft">
                    <a class="test dropdown-item">Modifica sala</a>
                    <ul class="dropdown-menu">
                      <li><a  class="dropdown-item" href="/cinema/admin/modificasala/1">Modifica Sala 1</a></li>
                      <li><a  class="dropdown-item" href="/cinema/admin/modificasala/2">Modifica Sala 2</a></li>
                      <li><a  class="dropdown-item" href="/cinema/admin/modificasala/3">Modifica Sala 3</a></li>
                      <li><a  class="dropdown-item" href="/cinema/admin/modificasala/4">Modifica Sala 4</a></li>
                    </ul>
                  </div>

                  <div class="dropdown-divider"></div>

                </c:when>
              </c:choose>

              <h3 class="dropdown-header"><b>Zona Utente</b></h3>
              <a class="dropdown-item disabled" href="#">Credito Residuo: €${sessionScope.credito}</a>       
              <form class="form-signin" id="form-logout-instance" action="/cinema/logout.do" method="POST">
                <a class="dropdown-item text-white bg-danger" href="#" onclick="document.getElementById('form-logout-instance').submit();">Logout</a>
              </form>
            </div>
          </li>   
        </c:when>
        <c:otherwise>
          <li>
            <form class="form-inline " action="/cinema/login.do" method="GET">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                <i class="fa fa-user"></i>
                Accedi
              </button>
            </form>
          </li>

          <li style="margin-left: 1rem">
          </li>

          <li>
            <form class="form-inline " action="/cinema/signup.do" method="GET">
              <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">
                <i class="fa fa-plus-circle"></i>
                Registrati
              </button>
            </form>
          </li>
        </c:otherwise>      
      </c:choose>
    </ul>
  </div>
</header>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
<script>
                  $(document).ready(function () {
                    $('.dropleft a.test').on("click", function (e) {
                      $(this).next('ul').toggle();
                      e.stopPropagation();
                      e.preventDefault();
                    });
                  });
</script>

