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
                    <a class="nav-link" href="/test">Disaster</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/life">Life Enviroment</a>
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
            <!--<script src="http://maps.google.com/maps/api/js" type="text/javascript"></script>-->
            <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&callback=initMap"></script>

            <br/>
            <br/>
            <div id="map" style="height: 500px; width: 750px;">
            </div>
            <script type="text/javascript">
                var markersArray = [];
                var geocoder = new google.maps.Geocoder();
                var myIcon = new google.maps.MarkerImage("http://icons.iconarchive.com/icons/graphicloads/100-flat/256/warning-icon.png", null, null, null, new google.maps.Size(25,25));

                var map = new google.maps.Map(document.getElementById("map"), {
                    zoom: 7,
                    center: new google.maps.LatLng(36.7637768, 127.2816014),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });


                var lat = "${value}";
                //(성혁이 스트링변수).split(" ");

                var list= lat.split(" ");

                var left = [];//위도
                var right = [];//경도
                var j=0;
                var k=0;

                for(i = 0 ; i<list.length; i++){
                    if(i%2==0){
                        left[j]=list[i];
                        j++
                    }
                    else {
                        right[k]=list[i];
                        k++;
                    }
                }



                //var left = [37.592974, 36.7637768, 35.59121217];
                //var right = [127.016552, 127.2816014, 128.419189];

                //var btn2 = document.getElementById('btn2');
                //btn2.onclick = function(){
                    for(i =0 ; i < left.length; i++)
                    {
                        var addLatlng = new google.maps.LatLng(left[i], right[i]);
                        var addMarker = new google.maps.Marker ({position:addLatlng,icon: myIcon, title: '재난'});
                        addMarker.setMap(map);
                        getAddressCaution(addLatlng);
                    }


                //}

                function getAddressCaution(latlng) {

                    var marker = new google.maps.Marker({
                        position: latlng,
                        icon: myIcon,
                        map: map
                    });
                    marker.addListener('click', function() {
                        infowindow.open(map, marker);
                    });

                    geocoder.geocode({
                        latLng: latlng
                    }, function(results, status) {
                        if (results[0].geometry) {

                            var address = results[0].formatted_address;

                            new google.maps.InfoWindow({
                                content: "재난지역<br> " +  address
                                //content: address
                            }).open(map, marker);

                            // location.href = "receive.html?"+latLng;



                            var opt = $("<option value='" + latlng.toString() + "'>" + address + "</option>");
                            $("#markerList").append(opt);

                            markersArray.push(marker);
                        }
                        else if (status == google.maps.GeocoderStatus.ERROR) {
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

            </script>



        </div>



    </div>
    <!-- /.row -->



</div>
<!-- /.container -->
<br/>
<br/>

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