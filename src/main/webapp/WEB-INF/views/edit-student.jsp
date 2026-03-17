<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<title>Edit Student</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="card shadow">

<div class="card-header bg-warning">
<h4>Edit Student</h4>
</div>

<div class="card-body">

<form action="${pageContext.request.contextPath}/admin/students/update" method="post">

<input type="hidden" name="id" value="${student.id}">

<div class="mb-3">
<label>Name</label>
<input type="text" name="name" class="form-control" value="${student.name}" required>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control" value="${student.email}" required>
</div>

<div class="mb-3">
<label>Course</label>
<input type="text" name="course" class="form-control" value="${student.course}" required>
</div>

<button class="btn btn-warning">Update</button>

<a href="${pageContext.request.contextPath}/admin/students" class="btn btn-secondary">
Cancel
</a>

</form>

</div>

</div>

</div>

</body>
</html>