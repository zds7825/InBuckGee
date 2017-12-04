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
                    <a class="nav-link" href="#">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>



<!-- Page Content -->
<div class="container">

    <!-- Portfolio Item Heading -->
    <h1 class="my-4">Weather Forecast
        <!--<small>Secondary Text</small>-->
    </h1>

    <!-- Portfolio Item Row -->
    <div class="row">

        <div class="col-md-8">

            <c:set var="currentweather" value="${sky4}" />

            <c:choose>
                <c:when test="${currentweather == '맑음'}">
                    <img src="/resources/img/Sun.PNG">
                </c:when>
                <c:when test="${currentweather == '구름조금'}">
                    ${currentweather}
                </c:when>
                <c:when test="${currentweather == '구름많음'}">
                    구름많음
                </c:when>
                <c:when test="${currentweather == '구름많고 비'}">
                    구름많고 비
                </c:when>
                <c:when test="${currentweather == '구름많고 눈'}">
                    구름많고 눈
                </c:when>
                <c:when test="${currentweather == '구름많고 비 또는 눈'}">
                    구름많고 비 또는 눈
                </c:when>
                <c:when test="${currentweather == '흐림'}">
                    흐림
                </c:when>
                <c:when test="${currentweather == '흐리고 비'}">
                    흐리고 비
                </c:when>
                <c:when test="${currentweather == '흐리고 눈'}">
                    흐리고 눈
                </c:when>
                <c:when test="${currentweather == '흐리고 비 또는 눈'}">
                    흐리고 비 또는 눈
                </c:when>
                <c:when test="${currentweather == '흐리고 낙뢰'}">
                    흐리고 낙뢰
                </c:when>
                <c:when test="${currentweather == '뇌우, 비'}">
                    뇌우, 비
                </c:when>
                <c:when test="${currentweather == '뇌우, 눈'}">
                    뇌우, 눈
                </c:when>
                <c:otherwise>
                    뇌우, 비 또는 눈
                </c:otherwise>
            </c:choose>
        </div>

        <div class="col-md-4">
            <h3 class="my-3">4시간 뒤</h3>
            <div>
                <li>날씨는 ${sky4}</li>
                <li>기온은 ${temp4}</li>
                <li>습도는 ${humidity4}</li>
                <li>강수확률은 ${rain4}</li>
            </div><h3 class="my-3">Project Details</h3>
            <ul>
                <li>Lorem Ipsum</li>
                <li>Dolor Sit Amet</li>
                <li>Consectetur</li>
                <li>Adipiscing Elit</li>
            </ul>
        </div>

    </div>
    <!-- /.row -->



</div>
<!-- /.container -->

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
