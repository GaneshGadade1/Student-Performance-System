<jsp:include page="common/navbar.jsp"/>

<div class="container mt-4">

<h3>Teachers</h3>

<table class="table">

<c:forEach var="t" items="${teachers}">
<tr>
<td>${t.name}</td>
<td>${t.subject}</td>
</tr>
</c:forEach>

</table>

</div>