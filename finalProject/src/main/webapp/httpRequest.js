var httpRequest = null;

function getXMLHttpRequest() {
	return new XMLHttpRequest();
}


function sendRequest(url, params, callback, method) {
	httpRequest = getXMLHttpRequest();	
	console.log(url);
	console.log(params);
	console.log(callback);
	console.log(method);
	
	// get인지 post인지
	var httpMethod = method;
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}		
	
	// parameter 
	var httpParams = (params == null || params == '') ? null : params;
	
	// url
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // post 방식으로 데이터 전송시 필수 속성 - 생략시 데이터 전송 불가
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod == 'POST' ? httpParams : null); // post 방식이면 httpParams를 전달, 아니면 null
}


