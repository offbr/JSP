<%@page import="mypage.business.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class = "happy.mybatis.ProcessDao" />
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	
 	String id = request.getParameter("g_id");
	GuestDto dto = processDao.myinfo(id);
	
	String str = dto.getG_mail();
	String substr = "@";
	String before = str.substring(0, str.indexOf(substr));
	String after = str.substring(str.indexOf(substr) + substr.length());

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "../../js/mypage.js"></script>
<script type="text/javascript">
function checkFrm(){
	var mail = document.updatefrm.mail1.value + "@" + document.updatefrm.mail2.value;
	document.updatefrm.g_mail.value = mail;
	var phone = document.updatefrm.phone1.value + "-" + document.updatefrm.phone2.value + "-" + document.updatefrm.phone3.value
	document.updatefrm.g_phone.value = phone;
	document.updatefrm.submit();
}
function deleteFrm(){
	if(confirm("정말 탈퇴 하시겠습니까?")){
		document.deleteFrm.submit();
	}
}

</script>
</head>
<body>

<div class="default_con">

<form name="updatefrm" method="post" action="updateproc.jsp">
	<div class="review_write">
		<table class="i_table">
			<colgroup>
				<col class="i_t_01">
				<col class="i_t_02">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><em class="color_01">*</em> ID</th>
					<td><%=dto.getG_id()%></td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 이름</th>
					<td><%=dto.getG_name()%></td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 이메일</th>
					<td>
						<p class="email_wrap">
							<input type="text" name="mail1" maxlength="25" value="<%=before%>" id="" class="email_01">
							<span class="char">@</span> 
							<input type="text" name="mail2" maxlength="25" value="<%=after%>" id="" class="email_02">
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
							<select class="number_01 i_select" name="phone1">
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<span class="under">-</span> 
							<input type="text" name="phone2" maxlength="4" value="<%=dto.getG_phone().substring(4, 8)%>" id="" class="number_02"> 
							<span class="under">-</span> 
							<input type="text" name="phone3" maxlength="4" value="<%=dto.getG_phone().substring(9, 13)%>" id="" class="number_02">
						</p>
					</td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 비밀번호</th>
					<td><input type="password" name="g_pass" maxlength="15" id="" class="type_01"></td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 비밀번호 확인</th>
					<td><input type="password" name="g_checkpass" maxlength="15" id="" class="type_01"></td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 우편번호</th>
					<td>
					<input type="text" name="zipcode" id="" class="type_01" size="10" value="<%=dto.getZipcode()%>" readonly="readonly"> 
					<input type = "button" id = "upzip" value  ="우편번호검색">
					</td>
				</tr>
				<tr>
					<th scope="row"><em class="color_01">*</em> 주소</th>
					<td>
					<input type="text" name="g_address" maxlength="100" value="<%=dto.getG_address() %>" class="type_02"> 
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<input type="hidden" name="g_id" value="<%=dto.getG_id()%>">
	<input type="hidden" name="g_name" value="<%=dto.getG_name()%>">
	<input type="hidden" name="g_mail">
	<input type="hidden" name="g_phone">
</form>
	<div class="btn_list">
		<a href="javascript:checkFrm();" title="등록" class="type02">등록</a> 
		<a href="javascript:history.back();" title="취소" class="type01">취소</a>
		<a href="javascript:deleteFrm();" title="탈퇴" class="type01">탈퇴</a>
	</div>
</div>
<!-- //default_con -->
<form action="deleteproc.jsp" method="post" name="deleteFrm">
<input type="hidden" name="g_id" value="<%=dto.getG_id()%>">
</form>
</body>
</html>




