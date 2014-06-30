<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html>
<head>
	<title>Home</title>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/script.util.js"></script>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#hidIdx").val(${idx});
		getGuestInfo();
	
	});// end ready
	
	// 글 정보 가져오기 
	function getGuestInfo()
	{
		var params="idx="+${idx};
		
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
	</script>
</head>



<body style="text-align:center">
<h1>
내용 수정 
</h1>
<form action ="modify.do" method="post">

<textarea name="contents" id="txtContents" rows="10" style="width:400px;"></textarea>
<input type="hidden" name="idx" id="hidIdx" />
<input type="submit" value="저장" onclick="opener.location.reload();window.close();"/>

</form>


</body>
</html>
