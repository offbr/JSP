<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int pno = Integer.parseInt(request.getParameter("pno")) + 1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>해피레고</title>
<link rel="shortcut icon" href="../../images/lego_32.ico">
</head>
<body>
<form action="insert_proc.jsp" method="post" enctype="multipart/form-data">
		상품번호 : <input type="text" name="p_no" value="<%=pno%>"><br>
      	상품명 : <input type="text"  name="p_name"><br>
      	가격 : <input type="text"  name="p_price"><br>
      	사이즈 : <select name="p_size"><option value="M">M</option><option value="L">L</option><option value="XL">XL</option></select><br>
      	재고(*3) : <input type="text"  name="p_stock"><br>
      	이미지(*jpg) : <input type="file" name="p_image"><br>
      	타입 : <input type="text"  name="p_type"><br>
      	설명 : <textarea rows="10" cols="40" name="p_content"></textarea><br>
      	<button type="submit">추가</button>
      	<button onClick="window.close()">닫기</button>
      	</form>
      	
</body>
</html>