let httpRequest = null;

function startMethod() {
	httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = resultProcess;
	httpRequest.open("GET", "ajaxExam02.xml", true);
	httpRequest.send();
}

function resultProcess() {
	if(httpRequest.readyState == 4 && httpRequest.status == 200){
		var subject = httpRequest.responseXML.getElementsByTagName("subject");
		var tr, td;
		
		for (var i = 0; i < subject.length; i++) {
			var codeNumber = subject.item(i).getElementsByTagName("codeNumber").item(0).firstChild.nodeValue;
			var titleName = subject.item(i).getElementsByTagName("titleName").item(0).firstChild.nodeValue;
			var roomNumber = subject.item(i).getElementsByTagName("roomNumber").item(0).firstChild.nodeValue;
			
			tr = document.createElement("tr");
			
			for(var j=0; j<subject.item(i).childNodes.length; j++){
				if(subject.item(i).childNodes[j].firstChild != null){
					td = document.createElement("td");
					td.appendChild(subject.item(i).childNodes[j].firstChild);
					tr.appendChild(td);
				}
			}
			document.getElementById("resultDisplay").appendChild(tr);
		}
	}
}