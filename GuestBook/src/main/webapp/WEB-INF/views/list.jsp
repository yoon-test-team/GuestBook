<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html ng-app>
<head>
	<title>Home</title>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/angular.js"></script>
	<script src="resources/js/script.util.js"></script>
	
	<link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
		
	$(document).ready(function(){

		$("#btnSubmit").click(function(){
			
			if ($("#txtName").val().length < 1){
				alert('이름을 입력해주세요.');
				$("#txtName").focuson();
			}
			
			if ($("#txtPwd").val().length < 1){
				alert('비밀번호를 입력해주세요.');
				$("#txtPwd").focuson();
			}
			
			if ($("#txtMail").val().length < 1){
				alert('메일주소를 입력해주세요.');
				$("#txtMail").focuson();
			}
			
			if ($("#txtContents").val().length < 1){
				alert('내용을 입력해주세요.');
				$("#txtContents").focuson();
			}
			
			
			
			
			
			
			// 이메일 유효성 검사 
			var email = $("#txtMail").val();
			if(!IsEmail(email))
			{
				alert('이메일 형식이 일치하지 않습니다.');
				return false;
			}
			$("#writeForm").submit();
			
		});
		
	});
	
	// 수정 버튼 클릭시 
	function openCheckPwd(idx)
	{
		window.open("/guestbook/check?idx="+idx,
					"EventFrame",
					"menubar=no,width=430,height=360,toolbar=no");
	}
	
	</script>
</head>



<body>
<h1>
GuestBook  
</h1>
<form id="writeForm" action ="write.do" method="post">

<div id="guestWrite">
	<p class="writerInfo">
		<label for="name">Name</label>
		<input id="txtName" name="name" type="text" value="" maxlength="255" >
	</p>
	<p class="writerInfo">
		<label for="password">Password</label>
		<input id="txtPwd" name="pwd" type="password" maxlength="255" value="">
	</p>
	<p class="writerInfo">
		<label for="email">E-mail</label>
		<input id="txtMail" name="email" class="email" type="text">
	</p>
	<p>
		<textarea id="txtContents" name="contents" rows="6" cols="50"> </textarea>
	</p>
	<p style="float: right">
		<input id="btnSubmit" type="button" value="저장">
	</p>
</div>

<div id="guestList">
	<ol>
		<c:forEach var="item" items="${list }">	
			<li id='${item.idx}'>
			<div class="guest_general">
				<p class="ctrlGuest">
					<span class="name">${item.name}</span>
					<span class="date">${item.regdate}</span>
					<span class="control"> 
						<a title="modify" class="modify" href="#" onclick="openCheckPwd(${item.idx});">&nbsp;<span>수정</span></a>
					</span>
				</p>
				<p class="desc">
					${item.contents }
				</p>
			</div>
			</li>
		</c:forEach>
	</ol>
</div>
</form>

</body>
</html>
