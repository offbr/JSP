var xhr;
var checkFirst = loopSend = false;
var lastKeyword = "";

function start(){
	if (checkFirst == false){
		setTimeout("sendKeyword()", 1000);
		loopSend = true
	}
}

function sendKeyword(){
	if(loopSend == false) return;
	
	var keyWord = document.frm.keyword.value;
	
	if(keyWord == ""){
		lastKeyword = "";
		hide("suggest");
	}else if(keyWord != lastKeyword){
		lastKeyword = keyWord;
		
		if(keyWord != ""){
			var para = "keyword=" + keyWord;
			//alert(para);
			xhr = new XMLHttpRequest();
			xhr.open("post", "ajax10_ex.jsp", true)
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
						process();
						document.getElementById("disp").innerText="";
				}
			}
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send(para);
		}else{
			hide("suggest");
		}
	}
	setTimeout("sendKeyword()", 1000);
}

function process(){
	var datas = xhr.responseText;
	var parseData = JSON.parse(datas);
	
	var strlist = "";
	var arr = new Array(); 
	for (var i = 0; i < parseData.sawons.length; i++) {
		arr[i] = parseData.sawons[i].sawon_ibsail; 
	}
	// 중복값 제거
    var onelist = new Array(); //중복제거된 값
    var temp = new Array(); //빈값
    for(var i = 0; i < arr.length; i++) {
        temp[arr[i]] = 0;
    }
    for(var i in temp) {
        onelist.push(i);
    }
    
    for (var i = 0; i < onelist.length; i++) {
    	strlist += "<a href=\"javascript:func('" + onelist[i] + "')\">"+ onelist[i] +"</a><br/>";
	}
	/*for(i=0; i<arr.length-1; i++){
		   for(j=i; j<arr.length-1; j++){
			    if(arr[i] == arr[j+1]){
			    	//alert(arr[i] + "중복O" + arr[j+1]);
			    }else{
			    	alert(arr[i] + "중복X" + arr[j+1]);
			   
			   	}
		  }
		   
	}*/	
	document.getElementById("suggestList").innerHTML = strlist;
	show("suggest");
}

function func(data){
	var datas = xhr.responseText;
	var parseData = JSON.parse(datas);
	
	var arr = new Array(); 
	for (var i = 0; i < parseData.sawons.length; i++) {
		arr[i] = parseData.sawons[i].sawon_name; 
	}
	// 중복값 제거
    var onelist = new Array(); //중복제거된 값
    var temp = new Array(); //빈값
    for(var i = 0; i < arr.length; i++) {
        temp[arr[i]] = 0;
    }
    for(var i in temp) {
        onelist.push(i);
    }
    
    var strlist = "<option selected>선택</option>";
    for (var i = 0; i < onelist.length; i++) {
    	strlist += "<option value=" + onelist[i] + ">" + onelist[i]  + "</option>";
	}

	document.getElementById("combo").innerHTML = strlist;
	loopSend = checkFirst = false;
	lastKeyword = "";
	frm.keyword.value = "";
	frm.keyword.focus();
	hide("suggest");
}

function golist(data){
	var datas = xhr.responseText;
	var parseData = JSON.parse(datas);
	
	var strlist = "<h3>관리고객</h3>";
		strlist += "<table border='1'><tr><th>고객번호</th><th>고객명</th><th>주민번호</th><th>고객전화</th></tr>";
	var no = "";
	for (var i = 0; i < parseData.sawons.length; i++) {
		if(data.value == parseData.sawons[i].sawon_name) no = parseData.sawons[i].sawon_no;
	
		if(no == parseData.sawons[i].gogek_damsano){
			strlist += "<tr>";
			strlist += "<td>" + parseData.sawons[i].gogek_damsano + "</td>";
			strlist += "<td>" + parseData.sawons[i].gogek_name + "</td>";
			strlist += "<td>" + parseData.sawons[i].gogek_jumin + "</td>";
			strlist += "<td>" + parseData.sawons[i].gogek_tel + "</td>";
			strlist += "</tr>";
		}
	}
	strlist += "</table>";
	document.getElementById("disp").innerHTML = strlist;
	//frm.combo.value = "";
}

function hide(ele){ //검색어 숨기기
	var e = document.getElementById(ele);
	if(e) e.style.display = "none";
}

function show(ele){ //검색어 보이기
	var e = document.getElementById(ele);
	if(e) e.style.display = "";
}

