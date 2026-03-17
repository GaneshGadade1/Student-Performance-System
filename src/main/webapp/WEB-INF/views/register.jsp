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

<div class="mb-3">
<label class="form-label">Name</label>
<input type="text" name="name" class="form-control" required>
</div>

<div class="mb-3">
<label class="form-label">Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="mb-3">
<label class="form-label">Course</label>
<input type="text" name="course" class="form-control" required>
</div>

<div class="mb-3">
<label class="form-label">Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<div class="d-grid">
<button type="submit" class="btn btn-success">Register</button>
</div>

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