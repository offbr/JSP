var xhr, ele, onoff=true;

function choice(element){
	onoff = element;
	//alert(onoff);
}

function goFunc(element){
	ele = element;
	//console.log(ele.id);
	if(onoff == true){
		aa = "ajax8_exXML.jsp";	
		
		xhr = new XMLHttpRequest();
		xhr.open("post", aa, true);
		xhr.onreadystatechange = function(){ //콜백
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					var datas = xhr.responseXML;
					//alert(datas);
					var gogekNode = datas.getElementsByTagName("gogek");
					var gogek_nameNode = datas.getElementsByTagName("gogek_name");
					var gogek_telNode = datas.getElementsByTagName("gogek_tel");
					var sawon_nameNode = datas.getElementsByTagName("sawon_name");
					var buser_telNode = datas.getElementsByTagName("buser_tel");
					
					var str = "<table border='1'><tr><th>고객명</th><th>고객전화</th><th>관리직원명</th><th>부서전화</th></tr>";
					for (var i = 0; i < gogekNode.length; i++) {
						str += "<tr>";
						str += "<td>" + gogek_nameNode[i].firstChild.nodeValue + "</td>";
						str += "<td>" + gogek_telNode[i].firstChild.nodeValue + "</td>";
						str += "<td>" + sawon_nameNode[i].firstChild.nodeValue + "</td>";
						str += "<td>" + buser_telNode[i].firstChild.nodeValue + "</td>";
						str += "</tr>";
					}
					str += "</table>";
					document.getElementById("dispXML").innerHTML = str;
				}else{
					alert("post 요청 실패: " + xhr.status);
				}
			}
		}
	}else if(onoff == false){
		aa = "ajax8_exJSON.jsp";
		dispJSON = document.getElementById("dispJSON");
		popupJSON = document.getElementById("popupJSON");
		
		xhr = new XMLHttpRequest();
		xhr.open("post", aa, true);
		xhr.onreadystatechange = function(){ //콜백
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					var datas = xhr.responseText;
					var parseData = JSON.parse(datas);

					var str = "<table border='1'><tr><th>고객명</th><th>고객전화</th><th>관리직원명</th><th>부서전화</th></tr>";
					for (var i = 0; i < parseData.gogeks.length; i++) {
						str += "<tr>";
						str += "<td>" + parseData.gogeks[i].gogek_name + "</td>";
						str += "<td>" + parseData.gogeks[i].gogek_tel + "</td>";
						str += "<td>" + parseData.gogeks[i].sawon_name + "</td>";
						str += "<td>" + parseData.gogeks[i].buser_tel + "</td>";
						str += "</tr>";
					}
					str += "</table>";
					document.getElementById("dispJSON").innerHTML = str;
				}else{
					alert("post 요청 실패: " + xhr.status);
				}
			}
		}
	}
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("who=" + ele.id); //get도 이렇게 담겨서 가지만 url 파일명뒤에 붙어서 간다
}

function clsFunc(){
	if(onoff == true){
		document.getElementById("dispXML").innerText = "";		
	}else{
		document.getElementById("dispJSON").innerText = "";		
	}
}

















