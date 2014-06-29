<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html>
<head>
	<title>Home</title>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
	var get = getRequest();
	var params="idx="+get['idx'] + "&pwd=" + $("#txtPwd").val() ;
	
	$(document).ready(function(){
		
		$("#btnChk").click(function(){
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

					}
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}); // end click
		
		getGuestInfo();
	});// end ready
	
	// 글 정보 가져오기 
	function getGuestInfo()
	{
		$.ajax({
			type:"POST",
			url:"/guestbook/select.do",
			dataType:"text",
			data:params,
			success:function(result){
				
				var contents = JSON.parse(result).results[0].contents;
				$("#txtContents").val(contents);
				
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});

		
	}
	//get Funtion
	function getRequest() {
	    if(location.search.length > 1) {
	        var get = new Object();
	        var ret = location.search.substr(1).split('&');
	        for(var i = 0; i < ret.length; i++) {
	            var r = ret[i].split('=');
	            get[r[0]] = r[1];
	        }
	        return get;
	    }else{
	        return false;
	    }
	}
	
	</script>
</head>



<body>
<h1>
비밀번호 확인   
</h1>

비밀번호 
<input type="password" id="txtPwd" />
<input type="button" id="btnChk" value="전송" />

<textarea id="txtContents">

</textarea>

</body>
</html>
