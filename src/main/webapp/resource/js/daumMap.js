	var map =null;
	function makeMap(coords) {
		var container = document.getElementById('map'); // # 지도를 담을 영역
		var options = { // # 지도 생성시 필요한 기본 옵션
				center : coords, // @ 지도의 중심 좌표
				level: 3 // @ 지도의 레벨(확대,축소 정도)
		}
		
		map = new daum.maps.Map(container, options); // # 지도 생성 및 객체 리턴
	}
	function showMap(addr) {
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addr2coord(addr, function(status, result) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		    	var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		    	makeMap(coords); // # 지도 생성 후
		    	makeMarker(coords,addr); // # 마커 생성
		     }
		})
	}
	
	function makeMarker(coords,info) {
		info = (info==null)?'맛집 위치':info;
		// 결과값으로 받은 위치를 마커로 표시합니다
		var marker = new daum.maps.Marker({
			map: map,
			position: coords
		});
	
		// 인포윈도우로 장소에 대한 설명을 표시합니다
		var infowindow = new daum.maps.InfoWindow({
			content: '<div style="width:150px;text-align:center;padding:6px 0;">'+info+'</div>'
		});
		infowindow.open(map, marker);
	
		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);
	}
	
	function setCenter(coords) { // # 해당 위치로 바로 이동
		// # 이동할 위도 경도 위치 생성하기
		var moveLatLon = new daum.maps.LatLng(x, y);
		// # 지도 중심 이동 시키기
		map.setCenter(coords);
	}
	
	function panTo(x,y) { // # 해당 위치로 부드럽게 이동
		// # 이동할 위도 경도 위치 생성
		var moveLatLon = new daum.maps.LatLng(x,y);
		
		// # 지도 중심을 부드럽게 이동
		// # 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동
		map.panTo(moveLatLon);
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