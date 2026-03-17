<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.card:hover{
transform:scale(1.03);
transition:0.3s;
}
</style>

</head>

<body class="bg-light">

<!-- Navbar -->

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">

<span class="navbar-brand fw-bold">Admin Dashboard</span>

<span class="text-white">
Welcome ${pageContext.request.userPrincipal.name}
</span>

<a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">
Logout
</a>

</div>
</nav>

<!-- Dashboard Content -->

<div class="container mt-5">

<div class="row g-4 justify-content-center">

<!-- Manage Students -->

<div class="col-md-4">

<div class="card shadow text-center p-3">

<div class="card-body">

<h4 class="card-title text-primary">Manage Students</h4>

<p class="card-text">
Add, edit and manage student data
</p>

<a href="${pageContext.request.contextPath}/admin/students"
class="btn btn-primary w-100">

Open

</a>

</div>

</div>

</div>

<!-- View Reports -->

<div class="col-md-4">

<div class="card shadow text-center p-3">

<div class="card-body">

<h4 class="card-title text-success">View Reports</h4>

<p class="card-text">
Student performance analytics
</p>

<a href="${pageContext.request.contextPath}/admin/reports"
class="btn btn-success w-100">
Open
</a>

</div>

</div>

</div>

<!-- Future Feature -->

<div class="col-md-4">

<div class="card shadow text-center p-3">

<div class="card-body">

<h4 class="card-title text-warning">System Settings</h4>

<p class="card-text">
Manage system configuration
</p>

<a href="${pageContext.request.contextPath}/admin/settings" class="btn btn-warning w-100">

Open

</a>

</div>

</div>

</div>

</div>

</div>

</body>
</html>