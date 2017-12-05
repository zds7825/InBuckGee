<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 정현스키
  Date: 2017-12-03
  Time: 오후 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Portfolio Item - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/fortfolio/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/fortfolio/css/portfolio-item.css" rel="stylesheet">

</head>

<body>



<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">InBuckGee</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/weather">Weather Forecast</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/test">Disaster</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/life">Life Enviroment</a>
                </li>
            </ul>
        </div>
    </div>
</nav>



<div class="container">

        <!-- Portfolio Item Heading -->
        <h1 class="my-4">Weather Forecast
            <!--<small>Secondary Text</small>-->
        </h1>

        <!-- Portfolio Item Row -->
        <div class="row">

            <div class="col-md-8">
                <c:set var="value" value="${dustData}"/>
                <c:choose>
                    <c:when test="${value eq '좋음'}">
                        <img src="/resources/images/dust_good.jpg" width="400" height="200">
                        <p></p>
                    </c:when>

                    <c:when test="${value eq '보통'}">
                        <img src="/resources/images/dust_normal.jpg" width="400" height="200">
                        <p></p>
                    </c:when>

                    <c:when test="${value eq '매우나쁨'}">
                        <img src="/resources/images/dust_worst.jpg" width="400" height="200">
                        <p></p>
                    </c:when>

                    <c:otherwise>
                        <img src="/resources/images/dust_bad.jpg" width="400" height="200">
                        <p></p>
                    </c:otherwise>


                </c:choose>

            </div>

            <div class="col-md-4">
                <h3 class="my-3">미세먼지</h3>
                <div>
                    <li>${dustData}</li>
                </div>
                <h3 class="my-3">자외선 지수</h3>
                <div>
                    <li>${ultraData}</li>
                </div>
            </div>
        </div>
        <!-- /.row -->



</div>
<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="/resources/fortfolio/vendor/jquery/jquery.min.js"></script>
<script src="/resources/fortfolio/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
