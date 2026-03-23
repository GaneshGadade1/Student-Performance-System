<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* video */
#bgVideo {
    position: fixed;
    right: 0;
    bottom: 0;
    min-width: 100%;
    min-height: 100%;
    object-fit: cover;
    z-index: -2;
}

/* overlay */
.overlay {
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.65);
    z-index: -1;
}

/* navbar */
.navbar {
    z-index: 1000;
}

/* welcome text */
.welcome {
    margin-top: 40px;
    text-align: center;
    color: white;
}

.welcome h1 {
    font-weight: 700;
    text-shadow: 2px 2px 10px rgba(0,0,0,0.7);
}

.welcome h2 {
    color: #4dabf7;
    font-weight: 600;
    text-shadow: 2px 2px 10px rgba(0,0,0,0.7);
}

/* login box */
.login-box {
    margin-top: 30px;
}

/* card */
.card {
    border-radius: 15px;
    overflow: hidden;
}

/* animation */
.fade-in {
    animation: fadeIn 1s ease-in;
}

@keyframes fadeIn {
    from {opacity:0; transform:translateY(20px);}
    to {opacity:1; transform:translateY(0);}
}

</style>

</head>

<body>

<!-- 🎥 VIDEO -->
<video autoplay muted loop id="bgVideo">
<source src="${pageContext.request.contextPath}/resources/video/bg.mp4">
</video>

<div class="overlay"></div>

<!-- 🔝 NAVBAR -->
<nav class="navbar navbar-dark bg-dark px-3">
    
    <span class="navbar-brand fw-bold">StudentPredict</span>

    <div>
        <a class="nav-link d-inline text-white" href="#">Home</a>

        <a class="nav-link d-inline text-white"
           data-bs-toggle="modal" data-bs-target="#aboutModal">
           About
        </a>

        <a class="nav-link d-inline text-white"
           data-bs-toggle="modal" data-bs-target="#contactModal">
           Contact
        </a>
    </div>

</nav>

<!-- 🌟 WELCOME -->
<div class="welcome fade-in">
    <h1>Welcome to</h1>
    <h2>Student Performance System</h2>
</div>

<!-- 🔐 LOGIN -->
<div class="container login-box fade-in">

<div class="row justify-content-center">

<div class="col-md-4">

<div class="card shadow">

<div class="card-header bg-primary text-white text-center">
<h4>Student Prediction Login</h4>
</div>

<div class="card-body">

<form action="${pageContext.request.contextPath}/login" method="post">

<!-- ✅ CSRF -->
<input type="hidden"
name="${_csrf.parameterName}"
value="${_csrf.token}"/>

<div class="mb-3">
<input type="text" name="username" class="form-control" placeholder="Enter Email" required>
</div>

<div class="mb-3">
<input type="password" name="password" class="form-control" placeholder="Enter Password" required>
</div>

<div class="d-grid">
<button class="btn btn-primary">Login</button>
</div>

</form>

<hr>

<div class="text-center">
<p class="text-muted">Don't have an account?</p>

<a href="${pageContext.request.contextPath}/register"
class="btn btn-success w-100">
Register
</a>

</div>

</div>

</div>

</div>

</div>

</div>

<!-- 📌 ABOUT MODAL -->
<div class="modal fade" id="aboutModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header bg-dark text-white">
        <h5>About System</h5>
        <button class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body text-center">
        <p>
          Student Performance Prediction System using AI.<br>
          Helps students analyze performance and improve results.
        </p>
      </div>

    </div>
  </div>
</div>

<!-- 📌 CONTACT MODAL -->
<div class="modal fade" id="contactModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header bg-dark text-white">
        <h5>Contact Us</h5>
        <button class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body text-center">
        <p>Email: support@test.com</p>
        <p>Phone: 9876543210</p>
      </div>

    </div>
  </div>
</div>

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>