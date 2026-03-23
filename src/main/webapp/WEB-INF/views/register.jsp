<!DOCTYPE html>
<html>
<head>
<title>Register</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-5">

<div class="card shadow">

<div class="card-header bg-success text-white text-center">
<h4>Student Registration</h4>
</div>

<div class="card-body">

<form action="${pageContext.request.contextPath}/registerStudent" method="post">

<input type="hidden"
name="${_csrf.parameterName}"
value="${_csrf.token}"/>

<div class="mb-3">
<label>Name</label>
<input type="text" name="name" class="form-control" required>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="mb-3">
<label>Course</label>
<input type="text" name="course" class="form-control" required>
</div>

<div class="mb-3">
<label>Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<button class="btn btn-success w-100">Register</button>

</form>
<hr>

<div class="text-center">
Already have an account? 
<a href="${pageContext.request.contextPath}/login">Login</a>
</div>

</div>

</div>

</div>

</div>

</div>

</body>
</html>