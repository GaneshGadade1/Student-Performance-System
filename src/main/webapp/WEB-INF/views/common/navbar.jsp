<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
<div class="container-fluid">

<!-- Logo -->
<a class="navbar-brand fw-bold" href="#">StudentPredict</a>

<!-- Toggle (Mobile) -->
<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarNav">

<ul class="navbar-nav me-auto">

<!-- Home -->
<li class="nav-item">
<a class="nav-link active" href="${pageContext.request.contextPath}/">
<i class="bi bi-house"></i> Home
</a>
</li>

<!-- Dropdown -->
<li class="nav-item dropdown">

<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
<i class="bi bi-info-circle"></i> Info
</a>

<ul class="dropdown-menu shadow">

<li>
<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#aboutModal">
<i class="bi bi-file-earmark-text"></i> About
</a>
</li>

<li>
<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#contactModal">
<i class="bi bi-envelope"></i> Contact
</a>
</li>

</ul>

</li>

</ul>

<!-- Right Side -->
<c:choose>

<c:when test="${pageContext.request.userPrincipal != null}">
<a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">
<i class="bi bi-box-arrow-right"></i> Logout
</a>
</c:when>

<c:otherwise>
<a href="${pageContext.request.contextPath}/login" class="btn btn-light">
Login
</a>
</c:otherwise>

</c:choose>

</div>

</div>
</nav>

<!-- ================= MODALS ================= -->

<!-- ABOUT MODAL -->
<div class="modal fade" id="aboutModal">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content shadow">

<div class="modal-header bg-primary text-white">
<h5 class="modal-title">About</h5>
<button class="btn-close" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">
<p>
This system predicts student performance using analytics and machine learning concepts.
It helps students track their readiness and improve learning outcomes.
</p>
</div>

</div>
</div>
</div>

<!-- CONTACT MODAL -->
<div class="modal fade" id="contactModal">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content shadow">

<div class="modal-header bg-success text-white">
<h5 class="modal-title">Contact</h5>
<button class="btn-close" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">
<p><i class="bi bi-envelope"></i> support@studentpredict.com</p>
<p><i class="bi bi-telephone"></i> 9876543210</p>
</div>

</div>
</div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Animation -->
<style>
.modal-content {
    animation: fadeIn 0.4s ease-in;
}

@keyframes fadeIn {
    from {opacity: 0; transform: scale(0.9);}
    to {opacity: 1; transform: scale(1);}
}
</style>