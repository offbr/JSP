$(document).ready(function() {
	
	//var reg_id = /[A-Za-z0-9]{6,12}$/; // 영문 숫자 6~12글자
	var reg_id = /[A-Za-z0-9]{2,12}$/; // 영문 숫자 6~12글자
	//var reg_pass = /^.*(?=.{10,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;	//영문숫자 혼합 10~20글자 이하
	var reg_pass = /[A-Za-z0-9]{2,12}$/;
	var reg_name = /[가-힇]{2,10}$/;	//이름 한글만 2~10글자
	var reg_phone = /^[0-9]{2,3}-[0-9]{4}-[0-9]{4}$/;
	var reg_mail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	$("#joinfrm").css("display","none");

	$('.toggle').on('click', function() {
		$('.container').stop().addClass('active');
		$("#joinfrm").show("slow");
	});

	$('.close').on('click', function() {
		$('.container').stop().removeClass('active');
		$("#joinfrm").css("display","none");
	});
	
	
	//id check
	
	$("#idcheck").on("click", function(){
		if(joinfrm.g_id.value == ""){
			alert("id를 입력하시오");
			return;
		}else if(!reg_id.test(joinfrm.g_id.value)){
			alert("id는 2~10글자 영문/숫자만가능")
		}else{
			url = "idcheck.jsp?id=" + joinfrm.g_id.value;
			window.open(url, "id", "toolbar = no, width = 400, height = 300, top = 200, left = 300");
			
		}
		
	});
	
	//id check2
	$("#checkok").on("click", function(){
		if($("#g_id").val() == ""){
			alert("id입력행");
			joinfrm.id.focus();
			return;
		}else{
			url = "idcheck.jsp?id=" + $("#g_id").val();
			window.open(url, "id", "toolbar = no, width = 400, height = 300, top = 200, left = 300");
		}
	});
	
	//login button
	$("#login").on("click", function(){	
		if(!reg_id.test($("#g_id").val())){
			alert("id는 영문/숫자 2~12글자만 허용합니다");
			$("#g_id").focus();
			return false;
		}else if(!reg_pass.test($("#g_pass").val())){
			alert("비밀번호는 영문/숫자 2~20글자 이하");
			$("#g_pass").focus();
			return false;
		}else{
			location.href = "loginproc.jsp";
			loginfrm.submit();
		}
	});
	
	//join button
	$("#join").on("click", function(){		
		location.href = "join.jsp";
	});
	
	//joinframe button
	$("#joinok").on("click", function(){
		
		if(!reg_id.test(joinfrm.g_id.value)){
			alert("id는 영문/숫자 2~12글자만 허용합니다");
			$("#g_id").focus();
			return false;
		}else if(!reg_pass.test(joinfrm.g_pass.value)){
			alert("비밀번호는 영문/숫자 2~20글자 이하");
			$("#g_pass").focus();
			return false;
		}else if(joinfrm.g_pass.value != joinfrm.g_checkpass.value){
			alert("비밀번호가 일치하지않습니다.");
			$("#g_pass").focus();
			return false;
		}else if(!reg_name.test($("#g_name").val())){
			alert("이름은 한글만 2~10글자 허용");
			$("#g_name").focus();
			return false;
		}else if(!reg_phone.test(joinfrm.g_phone.value)){
			alert("핸드폰형식을 제대로 입력해주세요 \n 010-????-????");
			$("#g_phone").focus();
			return false;
		}else if(!reg_mail.test(joinfrm.g_mail.value)){
			alert("제대로된 이메일 형식을 입력해주세요 \n ?????@????.???");
			$("#g_mail").focus();
			return false;
		}
	
		joinfrm.submit();
	
		
	});
	//zipcode button
	$('#zip').click( function(){
		url = "zipcheck.jsp?check=y";
		
		window.open(url, "zip", "toolbar = no, width = 400, height = 300, top = 200, left = 300, status = yes, scrolbars = yes, menubar = no");

	});
	
	//update zibutton
	$("#upzip").click(function(){
		url = "zipcheck.jsp?check=d";
		
		window.open(url, "zip", "toolbar = no, width = 400, height = 300, top = 200, left = 300, status = yes, scrolbars = yes, menubar = no");
	})
	
	//update
	$("#update").click(function(){
		if(confirm("정말 수정하시겠습니까?")){
			updatefrm.action = "updateproc.jsp";
			updatefrm.submit();
		}
	});
	
	//delete
	$("#delete").click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
			updatefrm.action = "deleteproc.jsp";
			updatefrm.submit();
		}
	});
	
	$("#logout").on("click", function(){
	      if(confirm("정말 로그아웃하시겠습니까?")){
	         location.href = "logout.jsp";
	      }
	   })
	
});


 