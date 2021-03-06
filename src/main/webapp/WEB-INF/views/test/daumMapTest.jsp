<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9f63f7a70411f9756f65fdec8b2face8&libraries=services"></script>
<!-- 구현 JavaScript -->
<script type="text/javascript">
	window.onload = function() {
		makeMap(33.450701, 126.570667);
		getXY('동작구 노량진 1동 231-158');
	}
	
	var map = null;

	function makeMap(x,y) {
		var container = document.getElementById('map'); // # 지도를 담을 영역
		var options = { // # 지도 생성시 필요한 기본 옵션
				center : new daum.maps.LatLng(x,y), // @ 지도의 중심 좌표
				level: 3 // @ 지도의 레벨(확대,축소 정도)
		}
		
		map = new daum.maps.Map(container, options); // # 지도 생성 및 객체 리턴
		//makeMarker(33.450701, 126.570667);
	}
	getXY('동작구 노량진 231-158');
	function getXY(addr) {
		
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addr2coord(addr, function(status, result) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	}
	
	function setCenter(x,y) { // # 해당 위치로 바로 이동
		// # 이동할 위도 경도 위치 생성하기
		var moveLatLon = new daum.maps.LatLng(x, y);
		// # 지도 중심 이동 시키기
		map.setCenter(moveLatLon);
	}
	
	function panTo(x,y) { // # 해당 위치로 부드럽게 이동
		// # 이동할 위도 경도 위치 생성
		var moveLatLon = new daum.maps.LatLng(x,y);
		
		// # 지도 중심을 부드럽게 이동
		// # 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동
		map.panTo(moveLatLon);
	}
	
	function makeMarker(x,y) { // # 마커 만들기 
		alert('x : '+x+"/ y : "+y);
		// # 마커가 표시될 위치 설정
		var markerPosition = new daum.maps.LatLng(x, y); 
		
		// # 마커를 생성
		var marker = new daum.maps.Marker({
			position: markerPosition
		})
		
		// # 마커가 지도에 표시되도록 설정
		marker.setMap(map);
		
	/* 	// # 인포 윈도우 설정하기 (마커 위에 뜨는 설명칸)
		var iwContent = '<div style="padding:5px;">인포윈도우</div>'
		var iwPosition = new daum.maps.LatLng(x,y);
		
		// # 인포윈도우 생성하기
		var infowindow = new daum.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});
		
		// # 마커 위에 인포윈도우 표시하기.
		infowindow.open(map,marker); // @ 두번째 파라미터 마커를 빼면 지도위에 표시. */
		return marker;
	}
	
	function makeInfoWindow(x,y,marker,content) {
		// # 인포 윈도우 설정하기 (마커 위에 뜨는 설명칸)
		var iwContent = '<div style="padding:5px;">'+content+'</div>'
		var iwPosition = new daum.maps.LatLng(x,y);
		
		// # 인포윈도우 생성하기
		var infowindow = new daum.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});
		
		// # 마커 위에 인포윈도우 표시하기.
		infowindow.open(map,marker); // @ 두번째 파라미터 마커를 빼면 지도위에 표시.
	}
	
	function removeMarker() { // # 마커 제거하기
		marker.setMap(null);	
	}
</script>
</head>
<body>
<h3>지도 테스트</h3>
<hr>
<div id="map" style="width: 500px; height: 400px;"></div>
<button onclick="setCenter(33.450701, 126.570667)">바로 이동</button>
<button onclick="panTo(33.450701, 126.570667)">부드러운 이동</button>
</body>
</html>