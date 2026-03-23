<div id="sidebar" class="sidebar">

<a href="${pageContext.request.contextPath}/student/dashboard">
<i class="bi bi-speedometer2"></i> Dashboard</a>

<a href="${pageContext.request.contextPath}/student/performance">
<i class="bi bi-graph-up"></i> Performance</a>

<a href="${pageContext.request.contextPath}/student/teachers">
<i class="bi bi-person-video3"></i> Teachers</a>

</div>

<style>
.sidebar {
    width: 250px;
    height: calc(100% - 56px);
    position: fixed;
    top: 56px;
    left: -250px;
    background: rgba(0,0,0,0.95);
    transition: 0.3s;
    z-index: 999;
}

.sidebar a {
    display: block;
    padding: 15px;
    color: white;
    font-size: 18px;
    text-decoration: none;
}

.sidebar a:hover {
    background: #444;
}
</style>

<script>
let isOpen = false;

function toggleSidebar(){
    let sidebar = document.getElementById("sidebar");
    let wrapper = document.getElementById("pageWrapper");
    let btn = document.querySelector(".menu-btn");

    if(!isOpen){
        sidebar.style.left = "0";
        wrapper.style.marginLeft = "250px";
        btn.style.left = "260px";
        isOpen = true;
    } else {
        sidebar.style.left = "-250px";
        wrapper.style.marginLeft = "0";
        btn.style.left = "15px";
        isOpen = false;
    }
}
</script>