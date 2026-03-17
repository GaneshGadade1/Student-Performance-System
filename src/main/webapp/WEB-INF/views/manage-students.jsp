<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<title>Manage Students</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-4">

<h3>Student List</h3>

<table class="table table-bordered">

<thead class="table-dark">
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Course</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<c:forEach var="s" items="${students}">

<tr>

<td>${s.id}</td>
<td>${s.name}</td>
<td>${s.email}</td>
<td>${s.course}</td>

<td>

<button class="btn btn-warning btn-sm"
onclick="editStudent('${s.id}','${s.name}','${s.email}','${s.course}')">
Edit
</button>

<a href="${pageContext.request.contextPath}/admin/students/delete/${s.id}"
class="btn btn-danger btn-sm">
Delete
</a>

</td>

</tr>

</c:forEach>

</tbody>

</table>

<!-- EDIT FORM -->

<div id="editForm" class="card mt-4 shadow" style="display:none;">

<div class="card-header bg-warning">
<h5>Edit Student</h5>
</div>

<div class="card-body">

<form action="${pageContext.request.contextPath}/admin/students/update" method="post">

<input type="hidden" name="id" id="editId">

<div class="mb-3">
<label>Name</label>
<input type="text" name="name" id="editName" class="form-control">
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" id="editEmail" class="form-control">
</div>

<div class="mb-3">
<label>Course</label>
<input type="text" name="course" id="editCourse" class="form-control">
</div>

<button class="btn btn-warning">Update</button>

</form>

</div>

</div>

</div>

<script>

function editStudent(id,name,email,course){

document.getElementById("editForm").style.display="block";

document.getElementById("editId").value=id;
document.getElementById("editName").value=name;
document.getElementById("editEmail").value=email;
document.getElementById("editCourse").value=course;

window.scrollTo(0,document.body.scrollHeight);

}

</script>

</body>
</html>