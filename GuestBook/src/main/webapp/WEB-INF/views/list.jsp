<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html ng-app>
<head>
	<title>Home</title>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/angular.js"></script>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
		
	$(document).ready(function(){

	});
	
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
<form action ="write.do" method="post">

<div id="guestWrite">
	<p class="writerInfo">
		<label for="name">Name</label>
		<input name="name" type="text" value="">
	</p>
	<p class="writerInfo">
		<label for="password">Password</label>
		<input name="pwd" type="password" maxlength="8" value="">
	</p>
	<p class="writerInfo">
		<label for="email">E-mail</label>
		<input name="email" class="email" type="text">
	</p>
	<p>
		<textarea name="contents" rows="6" cols="50"> </textarea>
	</p>
	<p style="float: right">
		<input id="btnSubmit" type="submit" value="저장">
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
