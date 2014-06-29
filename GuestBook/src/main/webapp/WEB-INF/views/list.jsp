<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html>
<head>
	<title>Home</title>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
		
	$(document).ready(function(){

	});
	
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
	<p>
		<input id="btnSubmit"  type="submit" value="안부 남기기">
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
						<a title="modify" class="modify" href="#">&nbsp;<span>수정/삭제</span></a>
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
