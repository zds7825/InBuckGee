<%@ page import="java.net.URL" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONValue" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.net.MalformedURLException" %><%--
  Created by IntelliJ IDEA.
  User: 정현스키
  Date: 2017-12-02
  Time: 오전 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html lang="en">

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

</head>

<body>



<!-- Navigation -->
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
                    <a class="nav-link" href="/">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/life">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>



<!-- Page Content -->
<div class="container">

    <!-- Portfolio Item Heading -->
    <h1 class="my-4">Disaster
        <!--<small>Secondary Text</small>-->
    </h1>

    <!-- Portfolio Item Row -->
    <div class="row">

        <div class="col-md-8">
            <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

            <div id="map" style="height: 400px; width: 600px;">
            </div>
            <script type="text/javascript">
                var markersArray = [];

                var n1, n2;
                var map = new google.maps.Map(document.getElementById("map"), {
                    zoom: 7,
                    center: new google.maps.LatLng(36.7637768, 127.2816014),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });
                google.maps.event.addListener(map, 'click', function (mouseEvent) {
                    getAddress(mouseEvent.latLng);
                    var btn = document.getElementById('btn');
                    btn.onclick = function(){
                        alert(data[0])
                        System.out.println("test1");
                        temp= mouseEvent.latLng.split("(");
                        System.out.println("test2");
                        temp2 = temp[1].split(")");
                        System.out.println("test3");

                        data = temp2[0].split(",")
                        //data2 = data[1].substring(1, data[1].length);

                        System.out.println("test4");
                        //n1 = data[0];
                        //n2 = data2

                        //alert(data[1]);

                        alert(data[0])

                        location.href = "weather/"+data[0]+"/"+data[1];








                        //location.href = "receive.html?"+mouseEvent.latLng;

                    }
                });

                function getAddress(latlng) {

                    var geocoder = new google.maps.Geocoder();
                    geocoder.geocode({
                        latLng: latlng
                    }, function(results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            if (results[0].geometry) {

                                var address = results[0].formatted_address;

                                var marker = new google.maps.Marker({
                                    position: latlng,
                                    map: map
                                });

                                new google.maps.InfoWindow({
                                    content: address + "<br> 클릭된 좌표 = " + latlng
                                    //content: address
                                }).open(map, marker);

                                //location.href = "receive.html?"+latLng;

                                var opt = $("<option value='" + latlng.toString() + "'>" + address + "</option>");
                                $("#markerList").append(opt);

                                //markersArray.push(marker);
                            }
                        } else if (status == google.maps.GeocoderStatus.ERROR) {
                            alert("통신중 에러발생！");
                        } else if (status == google.maps.GeocoderStatus.INVALID_REQUEST) {
                            alert("요청에 문제발생！geocode()에 전달하는GeocoderRequest확인요！");
                        } else if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
                            alert("단시간에 쿼리 과다송신！");
                        } else if (status == google.maps.GeocoderStatus.REQUEST_DENIED) {
                            alert("이 페이지에는 지오코더 이용 불가! 왜??");
                        } else if (status == google.maps.GeocoderStatus.UNKNOWN_ERROR) {
                            alert("서버에 문제가 발생한거 같아요. 다시 한번 해보세요.");
                        } else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
                            alert("존재하지 않습니다.");
                        } else {
                            alert("??");
                        }
                    });

                }


                function changemap() {
                    var sm = $("#markerList option:selected").val().toString().replace(/[\(\)]/gi, '').split(",");
                    map.setCenter(new google.maps.LatLng(sm[0].trim(), sm[1].trim()));
                    map.setZoom(14);
                }
                function resetSearch()
                {
                    location.reload();
                }

                function getLatLng(place) {

                    var geocoder = new google.maps.Geocoder();
                    geocoder.geocode({
                        address: place,
                        region: 'ko'
                    }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            var bounds = new google.maps.LatLngBounds();

                            for (var r in results) {
                                if (results[r].geometry) {
                                    var latlng = results[r].geometry.location;
                                    bounds.extend(latlng);
                                    //var address = results[0].formatted_address.replace(/^日本, /, '');
                                    var address = results[r].formatted_address;

                                    new google.maps.InfoWindow({
                                        content: address + "<br> 검색된 좌표 = " + latlng.toString()
                                    }).open(map, new google.maps.Marker({
                                        position: latlng,
                                        map: map
                                    }));
                                    var btn = document.getElementById('btn');
                                    btn.onclick = function(){


                                        temp= latlng.toString().split("(");
                                        temp2 = temp[1].split(")");


                                        data = temp2[0].split(",")
                                        data2 = data[1].substring(1, data[1].length);



                                        n1 = data[0];
                                        n2 = data2



                                        location.href = "weather/"+n1+"/"+n2;
                                    }

                                    var opt = $("<option value='" + latlng.toString() + "'>" + address + "</option>");
                                    $("#markerList").append(opt);
                                    $("#addrList").append(slt);
                                }
                            }
                            map.fitBounds(bounds);
                        } else if (status == google.maps.GeocoderStatus.ERROR) {
                            alert("ERROR");
                        } else if (status == google.maps.GeocoderStatus.INVALID_REQUEST) {
                            alert("INVALID_REQUEST");
                        } else if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
                            alert("OVER_QUERY_LIMIT");
                        } else if (status == google.maps.GeocoderStatus.REQUEST_DENIED) {
                            alert("REQUEST_DENIED");
                        } else if (status == google.maps.GeocoderStatus.UNKNOWN_ERROR) {
                            alert("UNKNOWN_ERROR");
                        } else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
                            alert("ZERO_RESULTS");
                        } else {
                            alert("??");
                        }
                    });
                }
            </script>


            <div id="addrList">
                <select id="markerList" onchange="changemap()"><option selected="" value="">List</option></select>
            </div>

        </div>

        <div class="col-md-4">
            <h3 class="my-3">Enter Address</h3>
            <div>
                <form action="#" onsubmit="getLatLng(document.getElementById('address').value); return(false);">
                    <p>주소/건물 : <input id="address" style="width: 250px;" type="text" value=""></p>
                    <input type="submit" value="검색" style="width: 100px;">
                    <button onclick="resetSearch()" style="width: 100px;">체크 리셋</button>
                    <input type="button" id="btn" value="날씨 검색" style="width: 100px;"/>

                </form>
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
