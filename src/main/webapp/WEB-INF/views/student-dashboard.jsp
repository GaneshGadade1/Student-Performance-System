<%@ page contentType="text/html;charset=UTF-8" %>

<style>
html, body {
    margin: 0;
    padding: 0;
    overflow-x: hidden;
}

/* wrapper */
#pageWrapper {
    transition: margin-left 0.3s;
}

/* video */
#bgVideo {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
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

/* content */
.main-content {
    text-align: center;
    margin-top: 100px;
    color: white;
}

/* animation */
.fade-in {
    animation: fadeIn 1s ease-in;
}

@keyframes fadeIn {
    from {opacity:0; transform:translateY(20px);}
    to {opacity:1; transform:translateY(0);}
}

/* menu button */
.menu-btn {
    position: fixed;
    top: 70px;
    left: 15px;
    z-index: 1000;
    transition: 0.3s;
}

/* glass card */
.glass-card {
    background: rgba(255,255,255,0.1);
    backdrop-filter: blur(12px);
    border-radius: 12px;
}
</style>

<div id="pageWrapper">

<jsp:include page="common/navbar.jsp"/>
<jsp:include page="common/student-sidebar.jsp"/>

<!-- VIDEO -->
<video autoplay muted loop id="bgVideo">
<source src="${pageContext.request.contextPath}/resources/video/bg.mp4">
</video>

<div class="overlay"></div>

<button onclick="toggleSidebar()" class="btn btn-dark menu-btn">☰</button>

<div class="main-content fade-in">

<h1>Student Dashboard</h1>

<div class="d-flex justify-content-center gap-3 mt-3">

<a href="${pageContext.request.contextPath}/student/performance"
class="btn btn-primary btn-lg shadow">Performance</a>

<a href="${pageContext.request.contextPath}/student/teachers"
class="btn btn-warning btn-lg shadow">Teachers</a>

</div>

<!-- ✅ ONLY CHART (NO CARDS NOW) -->
<div class="container mt-5" style="max-width:800px;">
    <div class="glass-card p-4 shadow">
        <h4 class="text-white mb-3">Performance Analytics</h4>
        <canvas id="performanceChart"></canvas>
    </div>
</div>

</div>
</div>

<!-- ✅ Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- ✅ Dynamic Chart from DB -->
<script>
fetch("${pageContext.request.contextPath}/student/chart-data")
.then(res => res.json())
.then(data => {

new Chart(document.getElementById('performanceChart'), {
    type: 'bar',
    data: {
        labels: ['Attendance', 'Study Hours', 'Previous Marks', 'Predicted'],
        datasets: [{
            label: 'Your Performance',
            data: [
                data.attendance,
                data.study,
                data.previous,
                data.predicted
            ],
            borderWidth: 2
        }]
    },
    options: {
        responsive: true
    }
});

})
.catch(err => console.log("Chart Error:", err));
</script>