<%@ page language="java"
	contentType="application/xhtml+xml; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="ngs" uri="http://github.com/lindenb/ngsproject/tags"%>

<jsp:include page="/WEB-INF/jsp/xhtml-header.jsp"/>
<head>
<title>$#}</title>
<u:head/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css?r=<%= java.lang.System.currentTimeMillis() %>"/>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/navbar.jsp" />
<jsp:include page="/WEB-INF/jsp/messages.jsp"/>


<div class="box1"><h2>Samples</h2>
<table>
<thead>
	<tr>
		<th>Samples</th>
	</tr>
	</thead>
<tbody>
	<c:forEach var="i" items="${ ngs:filter(pageContext.request,samples)}">
		<tr>
			<td><u:sample-href sample="${i}"/></td>
		</tr>
	</c:forEach>
</tbody>
</table>
</div>

</body>
</html>