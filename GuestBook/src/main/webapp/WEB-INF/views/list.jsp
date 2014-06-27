<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html>
<head>
	<title>Home</title>
	<script src="resources/js/jquery-1.11.1.js"></script>
    <script type="text/javascript">
		
	$(document).ready(function(){
		
		alert('tt');
		
	});
	
	</script>
</head>



<body>
<h1>
GuestBook  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<table>
<!--  반복 구간 시작 -->
	<c:forEach var="article" items="${list }">	
	<tr>
		<td style="text-align: center;">test</td>
	</tr>
	</c:forEach>
<!--  반복 구간 끝 -->
</table>

</body>
</html>
