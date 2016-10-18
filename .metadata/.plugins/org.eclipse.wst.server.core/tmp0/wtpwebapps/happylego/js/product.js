$(document).ready(function(){

	
	$(".t0").click(function(){
	
		$("#div").load("sel.jsp?type="); //load <-- AJAX 처리 메소드
		$("#div").hide().load("sel.jsp",function(){
			$(this).fadeIn();
		});
	});
	  $(".t1").click(function(){
		  	
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=씨티",function(){
				$(this).fadeIn();
			});
		});
	  $(".t2").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=넥소나이츠",function(){
				$(this).fadeIn();
			});
		});
	  $(".t3").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=마인크래프트",function(){
				$(this).fadeIn();
			});
		});
	  $(".t4").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=아키텍처",function(){
				$(this).fadeIn();
			});
		});
	  $(".t5").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=프렌즈",function(){
				$(this).fadeIn();
			});
		});
	  $(".t6").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=닌자고",function(){
				$(this).fadeIn();
			});
		});
	  $(".t7").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=히어로팩토리",function(){
				$(this).fadeIn();
			});
		});
	  $(".t8").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=스타워즈",function(){
				$(this).fadeIn();
			});
		});
	  $(".t9").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=듀플로",function(){
				$(this).fadeIn();
			});
		});
	  $(".t10").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=크리에이터",function(){
				$(this).fadeIn();
			});
		});
	  $(".t11").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=테크닉",function(){
				$(this).fadeIn();
			});
		});
	  $(".t12").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=주니어",function(){
				$(this).fadeIn();
			});
		});
	  $(".t13").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=디즈니프린세스",function(){
				$(this).fadeIn();
			});
		});
	  $(".t14").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=슈퍼히어로",function(){
				$(this).fadeIn();
			});
		});
	  $(".t15").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=키마의전설",function(){
				$(this).fadeIn();
			});
		});
	  
	  $(".t16").click(function(){
			$("#div").load("sel.jsp"); //load <-- AJAX 처리 메소드
			$("#div").hide().load("sel.jsp?type=엘프",function(){
				$(this).fadeIn();
			});
		});
	  
	});
