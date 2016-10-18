function zipCheck(){ //우편번호
	url = "zipcheck.jsp?check=y";
	window.open(url,"zip","toolbar=no,width=350,height=300,top=200,left=300,status=yes,scrollbars=yes,menubar=no");
}

function idCheck(){ //아이디
	if(regForm.id.value == ""){
		alert("id를 입력하시오");
		regForm.id.focus();
		return;
	}else{ 
		url= "idcheck.jsp?id=" + regForm.id.value;
		window.open(url, "id", "width=300,height=150,top=100,left=150");
	}
}

function inputCheck(){ //보내기
	//입력자료 오류검사 필요. 정규표현식생략
	document.regForm.submit();
}

//쇼핑몰 로그인 후 자신의 정보 수정시
function memberUpdate(){
	//입력자료 오류검사 필요. 정규표현식생략
	document.updateForm.submit();
}

function memberUpdateCancel(){
	location.href = "../guest/guest_index.jsp";
}

function memberDelete(){
	alert("회원탈퇴는 죽음을 부름!!!");
}
//관리자에서 회원정보 수정시 membermanager
function memUpdate(id){
	//alert(id);
	document.updateFrm.id.value = id;
	document.updateFrm.submit();
}
//관리자용 회원정보 수정 memberupdate2
function memberUpdateAdmin(){
	document.updateFormAdmin.submit();
}
//관리자용 회원정보 수정 memberupdate2
function memberUpdateCancelAdmin(){
	location.href = "membermanager.jsp"
}
//관리자용 상품처리시 productmanager or 고객용 상품목록 productlist
function productDetail(no){ 
	//alert(no);
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}//관리자용 상품수정시 productdetail
function productUpdate(no){
	document.updateFrm.no.value = no;
	document.updateFrm.submit();
}//관리자용 상품삭제시 productdetail
function productDelete(no){
	if(confirm("정말 삭제하시겠습니까?")){
		document.deleteFrm.no.value = no;
		document.deleteFrm.submit();		
	}
}

//카트 처리용 (고객)
function cartUpdate(form){
	form.flag.value = "update";
	form.submit();
}
function cartDeletedate(form){
	form.flag.value = "delete";
	form.submit();
}

//주문 처리시 (관리자용)
function orderDetail(no){
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

//주문 처리시 (관리자용)
function orderUpdate(form){
	document.detailFrm.flag.value = "update";
	form.submit();
}

function orderDelete(form){
	document.detailFrm.flag.value = "delete";
	form.submit();
}












