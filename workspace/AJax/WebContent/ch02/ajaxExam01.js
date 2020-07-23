let httpRequest = null;
function startMethod(){
	httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = resultProcess;
	httpRequest.open("GET", "ajaxExam01.xml", true);
	httpRequest.send(null);
}

function resultProcess(){
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			document.getElementById("displayArea").innerHTML = httpRequest.responseText;
			document.getElementById("displayArea").style.display="block";
			//document.getElementById("displayArea").style.visibility = "visible";
		}
	}
}