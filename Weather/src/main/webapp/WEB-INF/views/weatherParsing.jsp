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
<<<<<<< HEAD
            <c:set var="currentweather" value="${sky4}"/>
            <c:choose>
                <c:when test="${currentweather eq '맑음'}">
                    <center><img src="/resources/img/weather/sun.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '구름조금'}">
                    <center><img src="/resources/img/weather/smallcloud.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '구름많음'}">
                    <center><img src="/resources/img/weather/bigcloud.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '구름많고 비'}">
                    <center><img src="/resources/img/weather/bigcloudrain.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '구름많고 눈'}">
                    <center><img src="/resources/img/weather/bigcloudsnow.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '구름많고 비 또는 눈'}">
                    <center><img src="/resources/img/weather/bigcloudrainsnow.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '흐림'}">
                    <center><img src="/resources/img/weather/blur.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '흐리고 비'}">
                    <center><img src="/resources/img/weather/blurrain.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '흐리고 눈'}">
                    <center><img src="/resources/img/weather/blursnow.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '흐리고 비 또는 눈'}">
                    <center><img src="/resources/img/weather/blurrainsnow.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '흐리고 낙뢰'}">
                    <center><img src="/resources/img/weather/blurthunder.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '뇌우, 비'}">
                    <center><img src="/resources/img/weather/thunderrain.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '뇌우, 눈'}">
                    <center><img src="/resources/img/weather/thundersnow.PNG" width="400" height="400"></center>
                </c:when>

                <c:when test="${currentweather eq '뇌우, 비 또는 눈'}">
                    <center><img src="/resources/img/weather/thunderrainsnow.PNG" width="400" height="400"></center>
                </c:when>

                <c:otherwise>
                    아무것도 아님
                </c:otherwise>
            </c:choose>
=======









>>>>>>> 6f49909d1bd46f8c737bd121e49aecde25d140eb
        </div>

        <div class="col-md-4">
            <h3 class="my-3">4시간 뒤</h3>
            <div>
                <li>날씨는 ${sky4}</li>
                <li>기온은 ${temp4}</li>
                <li>습도는 ${humidity4}</li>
                <li>강수확률은 ${rain4}</li>
            </div>
            <h3 class="my-3">7시간 뒤</h3>
            <div>
                <li>날씨는 ${sky7}</li>
                <li>기온은 ${temp7}</li>
                <li>습도는 ${humidity7}</li>
                <li>강수확률은 ${rain7}</li>
            </div>
            <h3 class="my-3">10시간 뒤</h3>
            <div>
                <li>날씨는 ${sky10}</li>
                <li>기온은 ${temp10}</li>
                <li>습도는 ${humidity10}</li>
                <li>강수확률은 ${rain10}</li>
            </div>
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
