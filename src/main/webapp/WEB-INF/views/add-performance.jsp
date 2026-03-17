<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<title>Add Performance</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="card shadow">

<div class="card-header bg-primary text-white">
<h4>Add Student Performance</h4>
</div>

<div class="card-body">

<form action="${pageContext.request.contextPath}/admin/performance/save"
method="post">

<!-- Student Dropdown -->

<div class="mb-3">

<label class="form-label">Select Student</label>

<select name="studentId" class="form-control" required>

<option value="">-- Select Student --</option>

<c:forEach var="s" items="${students}">

<option value="${s.id}">
${s.name} (${s.email})
</option>

</c:forEach>

</select>

</div>

<div class="mb-3">

<label>Attendance (%)</label>

<input type="number"
step="0.1"
name="attendance"
class="form-control"
required>

</div>

<div class="mb-3">

<label>Study Hours</label>

<input type="number"
step="0.1"
name="studyHours"
class="form-control"
required>

</div>

<div class="mb-3">

<label>Previous Marks</label>

<input type="number"
step="0.1"
name="previousMarks"
class="form-control"
required>

</div>

<button class="btn btn-success">
Save & Predict
</button>

<a href="${pageContext.request.contextPath}/admin/reports"
class="btn btn-secondary">
Cancel
</a>

</form>

</div>

</div>

</div>

</body>
</html>