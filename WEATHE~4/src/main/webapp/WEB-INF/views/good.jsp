<%--
  Created by IntelliJ IDEA.
  User: 정현스키
  Date: 2017-12-05
  Time: 오전 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Google Map 의 클릭한 좌표값을 알아내자</title>
</head>

<body>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

<!--<script src="http://maps.google.com/maps/api/js" type="text/javascript"></script>-->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCj6RnmePJ2nfKzSeeBPWhtybad9fT_B00"></script>
<div>
    <form action="#" onsubmit="getLatLng(document.getElementById('address').value); return(false);">
        주소/건물：
        <input id="address" style="width:400px;" type="text" value="">
        <input type="submit" value="검색" style="width: 80px;">
        <button onclick="resetSearch()" style="width: 80px;">체크 리셋</button>
        <input type="button" id="btn" value="날씨 검색" style="width: 80px;"/>
    </form>
</div>
<div id="map" style="height: 500px; width: 750px;">
</div>
<script type="text/javascript">
    var markersArray = [];

    var map = new google.maps.Map(document.getElementById("map"), {
        zoom: 7,
        center: new google.maps.LatLng(36.7637768, 127.2816014),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    google.maps.event.addListener(map, 'click', function (mouseEvent) {
        getAddress(mouseEvent.latLng);
        var btn = document.getElementById('btn');
        btn.onclick = function(){
            location.href = "receive.html?"+mouseEvent.latLng;
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

                    var opt = $("<option value='" + latlng.toString() + "'>" + address + "</option>");
                    $("#markerList").append(opt);

                    //markersArray.push(marker);
                }
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
        var myIcon = new google.maps.MarkerImage("https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-search-strong-128.png", null, null, null, new google.maps.Size(35,35));
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
                        var address = results[r].formatted_address;

                        new google.maps.InfoWindow({
                            content: address + "<br> 검색된 좌표 = " + latlng.toString()
                        }).open(map, new google.maps.Marker({
                            position: latlng,
                            icon : myIcon,
                            map: map
                        }));
                        var btn = document.getElementById('btn');
                        btn.onclick = function(){
                            location.href = "receive.html?"+latlng.toString();
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
</body>

<div id="map_canvas" style="width:100%; height:100%"></div>
</html>