<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<title>My Performance</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-primary">

<div class="container-fluid">

<span class="navbar-brand">
My Performance
</span>

<a href="${pageContext.request.contextPath}/student/dashboard"
class="btn btn-light">
Back
</a>

</div>

</nav>

<div class="container mt-4">

<h3 class="mb-4">My Performance Records</h3>

<table class="table table-bordered table-striped">

<thead class="table-dark">

<tr>
<th>Record ID</th>
<th>Attendance</th>
<th>Study Hours</th>
<th>Previous Marks</th>
<th>Predicted Marks</th>
<th>Readiness Level</th>
</tr>

</thead>

<tbody>

<c:if test="${empty records}">
<tr>
<td colspan="6" class="text-center text-muted">
No performance records available.
</td>
</tr>
</c:if>

<c:forEach var="r" items="${records}">

<tr>

<td>${r.recordId}</td>
<td>${r.attendance}</td>
<td>${r.studyHours}</td>
<td>${r.previousMarks}</td>
<td>${r.predictedMarks}</td>
<td>${r.readinessLevel}</td>

</tr>

</c:forEach>

</tbody>

</table>

</div>

</body>
</html>