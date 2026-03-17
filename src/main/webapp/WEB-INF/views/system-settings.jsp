<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<title>Prediction Settings</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.card{
    border-radius:10px;
}
</style>

</head>

<body class="bg-light">

<!-- Navbar -->

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">

<span class="navbar-brand">Prediction Settings</span>

<a href="${pageContext.request.contextPath}/admin/dashboard"
class="btn btn-light">
Back
</a>

</div>
</nav>

<!-- Page Content -->

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-8">

<div class="card shadow">

<div class="card-header bg-warning text-dark">
<h4 class="mb-0">Machine Learning Model Configuration</h4>
</div>

<div class="card-body">

<form action="${pageContext.request.contextPath}/admin/settings/update" method="post">

<div class="row mb-3">

<div class="col-md-6">

<label class="form-label">Attendance Weight</label>

<input type="number"
step="0.01"
name="attendanceWeight"
class="form-control"
value="${settings.attendanceWeight}">

</div>

<div class="col-md-6">

<label class="form-label">Study Hours Weight</label>

<input type="number"
step="0.01"
name="studyHoursWeight"
class="form-control"
value="${settings.studyHoursWeight}">

</div>

</div>


<div class="row mb-3">

<div class="col-md-6">

<label class="form-label">Previous Marks Weight</label>

<input type="number"
step="0.01"
name="previousMarksWeight"
class="form-control"
value="${settings.previousMarksWeight}">

</div>

<div class="col-md-6">

<label class="form-label">Intercept</label>

<input type="number"
step="0.01"
name="intercept"
class="form-control"
value="${settings.intercept}">

</div>

</div>


<div class="d-grid">

<button class="btn btn-warning btn-lg">

Update Settings

</button>

</div>

</form>

</div>

</div>

</div>

</div>

</div>

</body>
</html>