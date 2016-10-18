<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피레고</title>
<link href='http://fonts.googleapis.com/css?family=Play:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="../../css/common.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/content.css"  media="screen">
<link rel="stylesheet" type="text/css" href="../../css/base.css" media="screen">
<link rel="shortcut icon" href="../../images/lego_32.ico">
<script>
function checkFrm() {
	var f = document.qnaFrm;
	if (f.b_id.value == "") {
		alert("이름을 입력하세요.");
		f.b_id.focus();
		return;
	}

	if (f.b_mail1.value == "") {
		alert("이메일을 입력해 주세요.");
		f.b_mail1.focus();
		return;
	}

	if (f.b_mail2.value == "" && f.b_mail3.value == "") {
		alert("이메일을 입력해 주세요.");
		f.b_mail2.focus();
		return;
	}

	if (f.b_mail2.value != "") {
		var b_mail = f.b_mail1.value + "@" + f.b_mail2.value;

		if (!(b_mail) == 1) { //정규표현식 확인
			alert("이메일 형식이 틀립니다.");
			f.b_mail2.focus();
			return;
		}
	}

	if (f.b_phone2.value == "") {
		alert("휴대폰을 입력해 주세요.");
		f.b_phone2.focus();
		return;
	}

	if (f.b_phone3.value == "") {
		alert("휴대폰을 입력해 주세요.");
		f.b_phone3.focus();
		return;
	}

	if (f.b_pass.value == "") {
		alert("비밀번호를 입력해 주세요.");
		f.b_pass.focus();
		return;
	}

	if (f.b_passOk.value == "") {
		alert("비밀번호를 입력해 주세요.");
		f.b_passOk.focus();
		return;
	}

	if (f.b_pass.value != f.b_passOk.value) {
		alert("입력한 비밀번호가 서로 틀립니다.");
		f.b_pass.focus();
		return;
	}
	if (f.b_title.value == "") {
		alert("제목을 입력하세요.");
		f.b_title.focus();
		return;
	}
	f.submit();
}

function setEmail() {
	var f = document.qnaFrm;
	f.b_mail2.value = f.b_mail3.value;
}
</script>
</head>
<body>

<!-- header -->
<%@ include file="../../header.jsp" %>
<!-- //header -->

<article class="sub_visual sub01">
    <h3 class="big_title">커뮤니티</h3>
    <h4 class="sub_title">해피레고를 찾아주셔서 감사합니다.</h4>
</article>

<!-- container -->
<section id="container">
<!-- contents -->
<section id="contents" class="icon_sub nomember">
	<p class="icon_title"><img src="../../images/icon_community.png" alt=""/></p>

<!-- sub_tab -->   
<div class="sub_tab review_tab">
	<ul>
		<li class="actived"><a href="qnaList.jsp" title="Q&A" class="letter">Q&amp;A</a></li>
		<li><a href="../faq/faqList.jsp" title="자주묻는질문">자주묻는질문</a></li>
		<li class="last"><a href="../notice/noticeList.jsp" title="공지사항">공지사항</a></li>
	</ul>
</div>
<!-- //sub_tab -->

<!-- default_con -->
<div class="default_con">

<form name="qnaFrm" method="post" action="qnaWriteProc.jsp">
	<div class="review_write">
		<table class="i_table">
			<colgroup>
				<col class="i_t_01">
				<col class="i_t_02">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><em class="color_01">*</em> 작성자</th>
					<td><input type="text" name="b_id" maxlength="100" id="" class="type_02"></td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 이메일</th>
					<td>
						<p class="email_wrap">
							<input type="text" name="b_mail1" maxlength="25" value="" id="" class="email_01">
							<span class="char">@</span> 
							<input type="text" name="b_mail2" maxlength="25" value="" id="" class="email_02">
								<select class="email_03 i_select" name="b_mail3" onchange="setEmail()">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="empas.com">empas.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="freechal.com">freechal.com</option>
								<option value="lycos.co.kr">lycos.co.kr</option>
								<option value="korea.com">korea.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmir.com">hanmir.com</option>
								<option value="paran.com">paran.com</option>
							</select>
						</p>
					</td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 휴대폰</th>
					<td>
						<p class="phone_wrap">
							<select class="number_01 i_select" name="b_phone1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<span class="under">-</span> 
							<input type="text" name="b_phone2" maxlength="4" value="" id="" class="number_02"> 
							<span class="under">-</span> 
							<input type="text" name="b_phone3" maxlength="4" value="" id="" class="number_02">
						</p>
					</td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 비밀번호</th>
					<td><input type="password" name="b_pass" maxlength="15" id="" class="type_01"></td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 비밀번호 확인</th>
					<td><input type="password" name="b_passOk" maxlength="15" id="" class="type_01"></td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 제목</th>
					<td>
					<input type="text" name="b_title" maxlength="100" id="" class="type_02"> 
					<input type="hidden" name="issecret" value="1" />
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td><textarea name="b_content" id="ir1" style="height: 600px;"></textarea></td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
	<div class="btn_list">
		<a href="javascript:checkFrm();" title="등록" class="type02">등록</a> 
		<a href="javascript:history.back();" title="취소" class="type01">취소</a>
	</div>

</div>
<!-- //default_con -->
</section>
<!-- //contents -->
</section>
<!-- //container -->


<!-- footer -->
<%@ include file="../../footer.jsp" %>
<!-- //footer -->

</body>
</html>