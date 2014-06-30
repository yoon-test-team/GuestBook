<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html>
<head>
	<title>Home</title>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/script.util.js"></script>

	<link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
	var get = getRequest();
	
	$(document).ready(function(){
		
		$("#hidIdx").val(get['idx']);
		
		$("#btnChk").click(function(){
			var params="idx="+get['idx'] + "&pwd=" + $("#txtPwd").val();

			$.ajax({
				type:"POST",
				url:"/guestbook/chkPassword.do",
				dataType:"text",
				data:params,
				success:function(result){
					if(result < 1)
					{
						alert('비밀번호가 일치 하지 않습니다');
						$("#txtPwd").focuson();
					}
					else if(result > 0)
					{
						$("#chkForm").submit();
					}
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}); // end click
		
	});// end ready
	
	
	
	
	</script>
</head>



<body style="text-align:center;">
<h1>
비밀번호 확인   
</h1>

<form id="chkForm" action="modify" method="post">
	<input type="hidden" name="idx" id="hidIdx" />
	<input type="password" name="pwd" id="txtPwd" />
	<input type="button" id="btnChk" value="확인" />
</form>
</body>
</html>
