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
<table>

	<c:forEach var="article" items="${list }">	
	<tr>
		<td style="text-align: center;">${article.writer }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>
