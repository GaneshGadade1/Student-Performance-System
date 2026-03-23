<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="common/navbar.jsp"/>

<style>

/* Video background */
#bgVideo {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -2;
}

/* Dark overlay */
.overlay {
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.65);
    z-index: -1;
}

/* Content */
.main-content {
    margin-top: 80px;
    color: white;
}

/* Glass table */
.glass-card {
    background: rgba(255,255,255,0.1);
    backdrop-filter: blur(10px);
    border-radius: 12px;
    padding: 20px;
}

/* Table styling */
.table th {
    background: rgba(0,0,0,0.7);
    color: white;
}

.table td {
    background: rgba(255,255,255,0.1);
    color: white;
}

/* Animation */
.fade-in {
    animation: fadeIn 1s ease-in;
}

@keyframes fadeIn {
    from {opacity:0; transform:translateY(20px);}
    to {opacity:1; transform:translateY(0);}
}

/* Badge styles */
.badge-good { background: #28a745; }
.badge-avg { background: #ffc107; color: black; }
.badge-bad { background: #dc3545; }

</style>

<!-- VIDEO -->
<video autoplay muted loop id="bgVideo">
<source src="${pageContext.request.contextPath}/resources/video/bg.mp4">
</video>

<div class="overlay"></div>

<div class="container main-content fade-in">

<div class="d-flex justify-content-between align-items-center mb-4">
<h2>My Performance Records</h2>

<a href="${pageContext.request.contextPath}/student/dashboard"
class="btn btn-light">
← Back
</a>
</div>

<div class="glass-card shadow">

<table class="table table-bordered text-center">

<thead>
<tr>
<th>ID</th>
<th>Attendance</th>
<th>Study Hours</th>
<th>Previous Marks</th>
<th>Predicted</th>
<th>Status</th>
</tr>
</thead>

<tbody>

<c:forEach var="r" items="${records}">

<tr>
<td>${r.recordId}</td>
<td>${r.attendance}</td>
<td>${r.studyHours}</td>
<td>${r.previousMarks}</td>
<td>${r.predictedMarks}</td>

<td>

<c:choose>

<c:when test="${r.readinessLevel == 'Excellent'}">
<span class="badge badge-good">Excellent</span>
</c:when>

<c:when test="${r.readinessLevel == 'Good'}">
<span class="badge badge-good">Good</span>
</c:when>

<c:when test="${r.readinessLevel == 'Average'}">
<span class="badge badge-avg">Average</span>
</c:when>

<c:otherwise>
<span class="badge badge-bad">Needs Improvement</span>
</c:otherwise>

</c:choose>

</td>

</tr>

</c:forEach>

</tbody>

</table>

</div>

</div>