/**
 * @author Administrator
 */
function createXMLHTTP(){
	if(window.XMLHttpRequest){
		return new window.XMLHttpRequest();
	}else{
		return new ActiveXObjec("Microsoft.XMLHTTP");
	}
}

function updateTime(){
	var xmlHttp = createXMLHTTP();
	xmlHttp.open("POST","QueryTime.aspx",true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.onreadystatechange = function() {
		if(xmlHttp.readyState == 4) {
			if(xmlHttp.status == 200) {
				var label = document.getElementById("lblTime");
   				var xmlDoc = xmlHttp.responseXML;
				var now = xmlDoc.getElementsByTagName("now")[0].getAttribute("value");
				var minutes = xmlDoc.getElementsByTagName("minutes")[0].getAttribute("value");
					label.innerText = now + " £”‡ ±º‰(' + minutes + ')∑÷";
			}
		}
	}
	xmlHttp.send(null);
}

function beginTime(){
	var handler = function(){
		
	updateTime();
	beginTime();
	}
	window.setTimeout(handler,1000);
}