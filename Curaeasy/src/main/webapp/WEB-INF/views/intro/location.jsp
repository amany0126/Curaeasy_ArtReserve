<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>지도</title>
    <!-- 발급받은앱키 : 853de28739e34ecec13c85230e86b4c4 -->

    <style>
        .screen_out {display:block;overflow:hidden;position:absolute;left:-9999px;width:1px;height:1px;font-size:0;line-height:0;text-indent:-9999px}
        .wrap_content {overflow:hidden;height:100%; width: 65%; margin : auto; }
        .wrap_map {width:50%;height:300px;float:left;position:relative}
        .wrap_roadview {width:50%;height:300px;float:left;position:relative}
        .wrap_button {position:absolute;left:15px;top:12px;z-index:2}
        .btn_comm {float:left;display:block;width:70px;height:27px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/sample_button_control.png) no-repeat}
        .btn_linkMap {background-position:0 0;}
        .btn_resetMap {background-position:-69px 0;}
        .btn_linkRoadview {background-position:0 0;}
        .btn_resetRoadview {background-position:-69px 0;}

        .wrap_content2 {
            margin : auto;
            height:330px; width: 1250px;
        }
        .Information{
            background: #fff;
            display: flex;
            flex-wrap: wrap;
            text-align: center;
            margin-bottom: auto;
            width: 100%; height: 100px;;
            max-width: 100%;
            margin: 0 auto;
            list-style-type: none;
        }
        .Information>li { width: 33.3%; margin : auto;}

        #title {
            margin:auto;
            background-color: gray; color:white;
            text-align: center;
            width : 500px; height: 50px;
            font-family :Verdana, Geneva, Tahoma, sans-serif;
            display: list-item;
            text-align: -webkit-match-parent;
            unicode-bidi: isolate;
        }
        .parking_box {
            background: url(https://inartplatform.kr/img/location_ico07.png) no-repeat left 40px center #f4f4f4;
            background-position: left 20px center;
            padding: 20px 20px 20px 100px;
            margin-top: 20px;
            background-size: 50px;
        }
        .parking_box>ul {
            list-style-type : square;
        }

    </style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>

    <div>
        <h1 id="title"> CURAEASY ART PLATFORM </h1>
    </div>

    <h2 style="text-align:center;">오시는길</h2>
    <hr style="height: 5px; background-color:#333;"> <br>
    <div class="wrap_content">
        <div class="wrap_map">
            <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
            <div class="wrap_button">
                <a href="javascript:;" class="btn_comm btn_linkMap" target="_blank" onclick="moveKakaoMap(this)"><span class="screen_out">지도 크게보기</span></a> <!-- 지도 크게보기 버튼입니다 -->
                <a href="javascript:;" class="btn_comm btn_resetMap" onclick="resetKakaoMap()"><span class="screen_out">지도 초기화</span></a> <!-- 지도 크게보기 버튼입니다 -->
            </div>
        </div>
        <div class="wrap_roadview">
            <div id="roadview" style="width:100%;height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
            <div class="wrap_button">
                <a href="javascript:;" class="btn_comm btn_linkRoadview" target="_blank" onclick="moveKakaoRoadview(this)"><span class="screen_out">로드뷰 크게보기</span></a> <!-- 로드뷰 크게보기 버튼입니다 -->
                <a href="javascript:;" class="btn_comm btn_resetRoadview" onclick="resetRoadview()"><span class="screen_out">로드뷰 크게보기</span></a> <!-- 로드뷰 리셋 버튼입니다 -->
            </div>
        </div> 

        <ul class="Information">
            <li>
                <img src="https://inartplatform.kr/img/location_ico01.png" alt style="width:28px;">
                <strong>LOCATION</strong>
                <span>인천 중구 제물량로 218번길 3</span>
            </li>
            <li>
                <img src="https://inartplatform.kr/img/location_ico02.png" alt style="width:28px;">
                <strong>TEL</strong>
                <span>010-7732-8035</span>
            </li>
            <li>
                <img src="https://inartplatform.kr/img/location_ico03.png" alt style="width:28px;">
                <strong>FAX</strong>
                <span>032-158-1588</span>
            </li>
        </ul>

        <div class="parking_box">
            <strong class="parking_title">주차안내</strong>
            <ul>
                <li>큐레이지아트플랫폼 단지 내 주차공간이 마련되어 있지 않습니다.</li>
                <li>가급적 대중교통을 이용해주시고, 자가용 이용 시 인근 공영주차장을 이용해주시기 바랍니다.</li>
            </ul>
        </div>

        <div class="wrap_content2" >
            <hr>
            <table style="width:100%;">
                <tr style="height:50px;">
                    <th style="width:30%;">버스</th>
                    <td style="width:70%; text-align: center;">517 | 519 | 521 | 307</td>
                </tr>
                <tr>
                    <th style="width:30%;">지하철</th>
                    <td style="width:70%; text-align: center;">1호선 | 수인분당 | 인천역</td>
                </tr>
            </table>
        </div>
    </div>

    <!-- 카카오맵 내가 발급받은 키값 -->
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=853de28739e34ecec13c85230e86b4c4"></script>
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapCenter = new kakao.maps.LatLng(37.47289754094072, 126.61978944141647), // 지도의 중심 좌표
        mapOption = {
            center: mapCenter, // 지도의 중심 좌표
            level: 2 // 지도의 확대 레벨
        };
    
    // 지도를 표시할 div랑 지도 옵션으로 지도생성
    var map = new kakao.maps.Map(mapContainer, mapOption);
    
    // 지도에 올릴 마커생성
    var mMarker = new kakao.maps.Marker({
        position: mapCenter, // 지도의 중심좌표 올리기
        map: map // 생성하면서 지도에 올릭ㅇ
    });
    
    // 지도에 올릴 장소명 인포윈도우
    var mLabel = new kakao.maps.InfoWindow({
        position: mapCenter, // 지도의 중심좌표에 올리기
        content: 'CURAEASY' // 인포윈도우 내부에 들어갈 컨텐츠
    });
    mLabel.open(map, mMarker); // 지도에 올리면서, 두번째 인자로 들어간 마커 위에 올라가게 설정
    
    
    var rvContainer = document.getElementById('roadview'); // 로드뷰를 표시할 div
    var rv = new kakao.maps.Roadview(rvContainer); // 로드뷰 객체 생성
    var rc = new kakao.maps.RoadviewClient(); // 좌표를 통한 로드뷰의 panoid를 추출하기 위한 로드뷰 help객체 생성
    var rvResetValue = {} //로드뷰의 초기화 값을 저장할 변수
    rc.getNearestPanoId(mapCenter, 50, function(panoId) {
        rv.setPanoId(panoId, mapCenter);//좌표에 근접한 panoId를 통해 로드뷰 실행
        rvResetValue.panoId = panoId;
    });
    
    // 로드뷰 초기화 이벤트
    kakao.maps.event.addListener(rv, 'init', function() {
    
        // 로드뷰에 올릴 마커를 생성
        var rMarker = new kakao.maps.Marker({
            position: mapCenter,
            map: rv //map 대신 rv(로드뷰 객체)로 설정하면 로드뷰에 올리기
        });
    
        // 로드뷰에 올릴 장소명 인포윈도우를 생성
        var rLabel = new kakao.maps.InfoWindow({
            position: mapCenter,
            content: 'CURAEASY'
        });
        rLabel.open(rv, rMarker);
    
        // 로드뷰 마커가 중앙에 오게 로드뷰의 viewpoint 조정
        var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져오기
        
        // 마커의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출
        var viewpoint = projection.viewpointFromCoords(rMarker.getPosition(), rMarker.getAltitude());
        rv.setViewpoint(viewpoint); //로드뷰에 뷰포인트를 설정
    
        //각 뷰포인트 값을 초기화를 위해 저장해놓기
        rvResetValue.pan = viewpoint.pan;
        rvResetValue.tilt = viewpoint.tilt;
        rvResetValue.zoom = viewpoint.zoom;
    });
    
    //지도 이동 이벤트 핸들러
    function moveKakaoMap(self){
        
        var center = map.getCenter(), 
            lat = center.getLat(),
            lng = center.getLng();
    
        self.href = 'https://map.kakao.com/link/map/' + encodeURIComponent('CURAEASY') + ',' + lat + ',' + lng; //Kakao 지도로 보내는 링크
    }
    
    //지도 초기화 이벤트 핸들러
    function resetKakaoMap(){
        map.setCenter(mapCenter); //지도를 초기화 했던 값으로 다시 셋팅
        map.setLevel(mapOption.level);
    }
    
    //로드뷰 이동 이벤트 핸들러
    function moveKakaoRoadview(self){
        var panoId = rv.getPanoId(); //현 로드뷰의 panoId값을 가져오기
        var viewpoint = rv.getViewpoint(); //현 로드뷰의 viewpoint(pan,tilt,zoom)값을 가져오기
        self.href = 'https://map.kakao.com/?panoid='+panoId+'&pan='+viewpoint.pan+'&tilt='+viewpoint.tilt+'&zoom='+viewpoint.zoom; //Kakao 지도 로드뷰로 보내는 링크
    }
    
    //로드뷰 초기화 이벤트 핸들러
    function resetRoadview(){
        //초기화를 위해 저장해둔 변수를 통해 로드뷰를 초기상태로 돌리기
        rv.setViewpoint({
            pan: rvResetValue.pan, tilt: rvResetValue.tilt, zoom: rvResetValue.zoom
        });
        rv.setPanoId(rvResetValue.panoId);
    }
    </script>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>
