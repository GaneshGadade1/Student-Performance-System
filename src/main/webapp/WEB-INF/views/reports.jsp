<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<title>Performance Reports</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<!-- Navbar -->

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">

<span class="navbar-brand">Performance Reports</span>

<a href="${pageContext.request.contextPath}/admin/dashboard"
class="btn btn-light">
Back
</a>

</div>
</nav>


<div class="container mt-4">

<!-- Search + Add -->

<div class="d-flex justify-content-between align-items-center mb-3">

<h3>Search Student Report</h3>

<a href="${pageContext.request.contextPath}/admin/performance/add"
class="btn btn-primary">
Add Performance Record
</a>

</div>


<!-- Search Form -->

<form method="get"
action="${pageContext.request.contextPath}/admin/reports">

<div class="row g-2">

<div class="col-md-4">

<input type="text"
id="searchBox"
name="name"
value="${name}"
class="form-control"
placeholder="Search by student name">

</div>

<div class="col-md-2">

<button class="btn btn-success w-100">
Search
</button>

</div>

</div>

</form>

<hr>

<!-- Table -->

<h4 class="mb-3">Performance Records</h4>

<table class="table table-bordered table-striped">

<thead class="table-dark">

<tr>
<th>Record ID</th>
<th>Student ID</th>
<th>Student Name</th>
<th>Attendance</th>
<th>Study Hours</th>
<th>Previous Marks</th>
<th>Predicted Marks</th>
<th>Readiness Level</th>
<th>Action</th>
</tr>

</thead>

<tbody id="recordsTable">

<c:if test="${empty records}">
<tr>
<td colspan="9" class="text-center text-muted">
No performance records found.
</td>
</tr>
</c:if>

<c:forEach var="r" items="${records}">

<tr>

<td>${r.recordId}</td>
<td>${r.studentId}</td>
<td>${r.studentName}</td>
<td>${r.attendance}</td>
<td>${r.studyHours}</td>
<td>${r.previousMarks}</td>
<td>${r.predictedMarks}</td>
<td>${r.readinessLevel}</td>

<td>

<a href="${pageContext.request.contextPath}/admin/performance/delete/${r.recordId}"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete this performance record?')">

Delete

</a>

</td>

</tr>

</c:forEach>

</tbody>

</table>


<!-- Pagination -->

<nav>
<ul class="pagination justify-content-center">

<c:if test="${currentPage > 1}">
<li class="page-item">
<a class="page-link"
href="${pageContext.request.contextPath}/admin/reports?page=${currentPage-1}&name=${name}">
Previous
</a>
</li>
</c:if>


<c:forEach begin="1" end="${totalPages}" var="i">

<li class="page-item ${i == currentPage ? 'active' : ''}">

<a class="page-link"
href="${pageContext.request.contextPath}/admin/reports?page=${i}&name=${name}">

${i}

</a>

</li>

</c:forEach>


<c:if test="${currentPage < totalPages}">
<li class="page-item">
<a class="page-link"
href="${pageContext.request.contextPath}/admin/reports?page=${currentPage+1}&name=${name}">
Next
</a>
</li>
</c:if>

</ul>
</nav>


</div>


<!-- AJAX LIVE SEARCH -->

<script>

const searchBox = document.getElementById("searchBox");

searchBox.addEventListener("input", function(){

let keyword = this.value.trim();

fetch("${pageContext.request.contextPath}/admin/reports/search?name=" + encodeURIComponent(keyword))

.then(response => response.json())

.then(data => {

let table = document.getElementById("recordsTable");

table.innerHTML = "";

if(data.length === 0){

table.innerHTML = `
<tr>
<td colspan="9" class="text-center text-muted">
No performance records found
</td>
</tr>
`;

return;

}

data.forEach(r => {

let row = `
<tr>
<td>${r.recordId}</td>
<td>${r.studentId}</td>
<td>${r.studentName}</td>
<td>${r.attendance}</td>
<td>${r.studyHours}</td>
<td>${r.previousMarks}</td>
<td>${r.predictedMarks}</td>
<td>${r.readinessLevel}</td>
<td>
<a href="${pageContext.request.contextPath}/admin/performance/delete/${r.recordId}"
class="btn btn-danger btn-sm">
Delete
</a>
</td>
</tr>
`;

table.insertAdjacentHTML("beforeend", row);

});

})

.catch(err => console.log(err));

});

</script>


</body>
</html>