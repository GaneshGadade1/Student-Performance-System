<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<nav class="navbar navbar-dark bg-primary">
<div class="container-fluid">

<span class="navbar-brand">Student Dashboard</span>

<span class="text-white">
Welcome ${pageContext.request.userPrincipal.name}
</span>

<a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Logout</a>

</div>
</nav>

<div class="container mt-4">

<div class="row">

<!-- PERFORMANCE -->
<div class="col-md-4">

<div class="card shadow">
<div class="card-body text-center">

<h5 class="card-title">My Performance</h5>
<p>Check your academic prediction</p>

<a href="${pageContext.request.contextPath}/student/performance"
class="btn btn-primary">
View
</a>

</div>
</div>

</div>


<!-- UPDATE PROFILE -->
<div class="col-md-4">

<div class="card shadow">
<div class="card-body text-center">

<h5 class="card-title">Update Profile</h5>
<p>Update your details</p>

<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#updateModal">
Update Profile
</button>

</div>
</div>

</div>


<!-- VIEW PROFILE -->
<div class="col-md-4">

<div class="card shadow">
<div class="card-body text-center">

<h5 class="card-title">View Profile</h5>
<p>See your personal information</p>

<a href="${pageContext.request.contextPath}/student/viewProfile"
class="btn btn-info">
View Profile
</a>

</div>
</div>

</div>

</div>

</div>


<!-- UPDATE PROFILE MODAL -->

<div class="modal fade" id="updateModal">

<div class="modal-dialog">

<div class="modal-content">

<div class="modal-header">
<h5 class="modal-title">Update Profile</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">

<form id="updateForm">

<div class="mb-3">
<label>Name</label>
<input type="text" id="name" class="form-control">
</div>

<div class="mb-3">
<label>Course</label>
<input type="text" id="course" class="form-control">
</div>

<div class="mb-3">
<label>Email</label>
<input type="text" id="email" class="form-control">
</div>

<div class="mb-3">
<label>Password</label>
<input type="password" id="password" class="form-control">
</div>

<button type="submit" class="btn btn-success w-100">Update</button>

</form>

<div id="msg" class="mt-3 text-success"></div>

</div>

</div>

</div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>

document.getElementById("updateForm").addEventListener("submit", function(e){

e.preventDefault();

const data = new URLSearchParams();

data.append("name", document.getElementById("name").value);
data.append("course", document.getElementById("course").value);
data.append("email", document.getElementById("email").value);
data.append("password", document.getElementById("password").value);

fetch("${pageContext.request.contextPath}/student/updateProfile",
{
method:"POST",
body:data
})
.then(res=>res.text())
.then(msg=>{
document.getElementById("msg").innerHTML = msg;
});

});

</script>

</body>
</html>