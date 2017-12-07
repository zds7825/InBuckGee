<%--
  Created by IntelliJ IDEA.
  User: SEO
  Date: 2017-12-07
  Time: 오후 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>InBuckGee Weather Center</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/fortfolio/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/fortfolio/css/portfolio-item.css" rel="stylesheet">

    <title>Api 소개</title>
    <link type="text/css" rel="stylesheet" href="/resources/css/bootstrap.min.css" media="screen">
    <link type="text/css" rel="stylesheet" href="/resources/css/font-awesome.min.css" media="screen">
    <link type="text/css" rel="stylesheet" href="/resources/css/main.css" media="screen">
    <link type="text/css" rel="stylesheet" href="/resources/css/simple-sidebar.css" media="screen">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/main.js"></script>

</head>
<body >

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/">InBuckGee</a>
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
    <div class="wrapper text-center" style="margin-top: 10%;">
        <div style="font-size:2em;">
            <strong>InBuckGee Weather Center OpenAPI</strong><br>
        </div>

        <div>
            <strong><p style="font-size:1.3em">날씨 검색 및 실시간 지진 정보 통합 API</p></strong><br>
            <p style="font-size:1.2em"><strong>설명</strong></p><p>원하는 곳(위도, 경도)의 날씨를 확인할 수 있고, 실시간 지진 정보를 제공</p>
            <p style="font-size:1.2em"><strong>URL</strong></p><p> http://wsc00001.us-east-2.elasticbeanstalk.com/getApiByMap/ <strong>위도</strong> / <strong>경도</strong></p>
            <br><br><br>
            <p style="font-size:1.2em"><strong>출력 결과</strong></p>

            <strong><p>Input Item</p></strong>
            <p>double Lat : 검색 지점의 위도 &nbsp&nbsp double Lon : 검색 지점의 경도</p>
            <p> </p>

            <strong><p>Output(Weather_Now)</p></strong>
            <p>String sky : 날씨 정보 &nbsp&nbsp String rain : 강수 확률</p>
            <p>String temperature : 기온 &nbsp&nbsp String humidity : 습도</p>
            <p> </p>

            <strong><p>Output(Weather_After 4, 7, 10)</p></strong>
            <p>String sky : 날씨 정보 &nbsp&nbsp String rain : 강수 확률</p>
            <p>String temperature : 기온 &nbsp&nbsp  String humidity : 습도</p>
            <p> </p>

            <strong><p>Output(Earthquake_Location)</p></strong>
            <p>String lon : 경도 &nbsp&nbsp String lat : 위도</p>
            <p> </p>

            <strong><p>Output(Life_Dust)</p></strong>
            <p>String dust : 미세 먼지 정도</p>
            <p> </p>

            <strong><p>Output(Life_Ultra)</p></strong>
            <p>String Suggestion : 자외선 정도   String Strength : 자외선 강도</p>
            <p> </p>

            <a href="/getApiByMap/36.763776/127.2816014">Please pinch InBuckGee.</a>
        </div>
        <br><br><br><br>
    </div>
</div>
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