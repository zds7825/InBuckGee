<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agency - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <!-- Custom fonts for this template -->
    <link rel="stylesheet" type="text/css" href="<c:out value='${pageContext.request.contextPath}'/>/resources/vendor/font-awesome/css/font-awesome.min.css">    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="<c:out value='${pageContext.request.contextPath}'/>/resources/css/agency.min.css">

</head>

<body id="page-top">

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">InBuckGee</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ml-auto">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#services">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#portfolio">Detail Index</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#about">Team</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Header -->
<header class="masthead">
    <div class="container">
        <div class="intro-text">
            <div class="intro-lead-in">Welcome To InBuckGee Weather Center!</div>
            <div class="intro-heading">현재의 날씨는 ${name} </div>
            <div class="intro-heading">현재의 온도는 ${tc}℃ </div>
            <div class="intro-heading">현재의 습도는 ${humidity}% </div>
            <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">Tell Me More</a>
        </div>
    </div>
</header>

<!-- Services -->
<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading text-uppercase">Services</h2>
                <h3 class="section-subheading text-muted">Our website gives you weather information.</h3>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <img src="/resources/img/weatherinformation.png" width = 128 height = 128>
            </span>
                <h4 class="service-heading">Weather Information</h4>
                <p class="text-muted">Provides today's weather information.</p>
            </div>
            <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <img src="/resources/img/earthquakeinformation.png" width = 128 height = 128>
            </span>
                <h4 class="service-heading">Real-time earthquake information</h4>
                <p class="text-muted">Provide Real-time earthquake information.</p>
            </div>
            <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <img src="/resources/img/dustinformation.png" width = 128 height = 128>
            </span>
                <h4 class="service-heading">Living Environment</h4>
                <p class="text-muted">Our website provides information about the living environment.</p>
            </div>
        </div>
    </div>
</section>

<!-- Portfolio Grid -->
<section class="bg-light" id="portfolio">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading text-uppercase">Detail Index</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="/resources/img/portfolio/WeatherInformation.jpg" width=350 height= 197  alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>날씨 정보</h4>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="/resources/img/portfolio/Real-TimeEarthquake.jpg" width=350 height= 197  alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>실시간 지진 정보</h4>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a class="portfolio-link" data-toggle="modal" href="#portfolioModal3">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="/resources/img/portfolio/FineDust.jpg"  width=350 height= 197 alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>미세 먼지</h4>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a class="portfolio-link" data-toggle="modal" href="#portfolioModal4">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="/resources/img/portfolio/UltraViolet.jpg" width=350 height= 197  alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>자외선 지수</h4>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a class="portfolio-link" data-toggle="modal" href="#portfolioModal5">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img class="img-fluid" src="/resources/img/portfolio/SensibleTemperature.jpg" width=350 height= 197  alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>체감온도</h4>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="/resources/img/portfolio/Discomport.png" width=350 height= 197 alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>불쾌지수</h4>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- About -->
<section id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading text-uppercase">Team</h2>
                <h3 class="section-subheading text-muted">Introduce our team.</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="timeline">
                    <li>
                        <div class="timeline-image">
                            <img class="rounded-circle img-fluid" src="/resources/img/about/Kwon.jpg" alt="">
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>권지현</h4>
                                <h4 class="subheading">2012136011</h4>
                            </div>
                            <div class="timeline-body">
                                <p class="text-muted">학과 : 컴퓨터 공학부
                                <br> 연락처 : 010-2377-5749
                                <br> 이메일 : hoos5749@gmail.com</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <img class="rounded-circle img-fluid" src="/resources/img/about/Park.jpg" alt="">
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>박정현</h4>
                                <h4 class="subheading">2012136051</h4>
                            </div>
                            <div class="timeline-body">
                                <p class="text-muted">학과 : 컴퓨터 공학부
                                <br> 연락처 : 010-9290-0048
                                <br> 이메일 : zds7525@koreatech.ac.kr</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image">
                            <img class="rounded-circle img-fluid" src="/resources/img/about/Seo.jpg" alt="">
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>서성혁</h4>
                                <h4 class="subheading">2012136061</h4>
                            </div>
                            <div class="timeline-body">
                                <p class="text-muted">학과 : 컴퓨터 공학부
                                <br> 연락처 : 010-6623-4850
                                <br> 이메일 : tjtjdgur34@gmail.com</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <img class="rounded-circle img-fluid" src="/resources/img/about/Jo.jpg" alt="">
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>조인선</h4>
                                <h4 class="subheading">2012136127</h4>
                            </div>
                            <div class="timeline-body">
                                <p class="text-muted"> 학과 : 컴퓨터 공학부
                                <br> 연락처 : 010-4724-7837
                                <br> 이메일 : goastis@koreatech.ac.kr</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Contact form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="js/agency.min.js"></script>

</body>

</html>
