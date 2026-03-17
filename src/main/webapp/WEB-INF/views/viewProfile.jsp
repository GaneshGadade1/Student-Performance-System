<!DOCTYPE html>
<html>
<head>

<title>Student Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<nav class="navbar navbar-dark bg-primary">
<div class="container-fluid">

<span class="navbar-brand">Student Profile</span>

<span class="text-white">
Welcome ${pageContext.request.userPrincipal.name}
</span>

<a href="${pageContext.request.contextPath}/student/dashboard"
class="btn btn-light btn-sm">
Back
</a>

</div>
</nav>


<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow">

<div class="card-header bg-success text-white text-center">
<h4>My Profile</h4>
</div>

<div class="card-body">

<table class="table table-bordered">

<tr>
<th>Name</th>
<td>${student.name}</td>
</tr>

<tr>
<th>Email</th>
<td>${student.email}</td>
</tr>

<tr>
<th>Course</th>
<td>${student.course}</td>
</tr>

<tr>
<th>Student ID</th>
<td>${student.id}</td>
</tr>

</table>

</div>

</div>

</div>

</div>

</div>

</body>
</html>