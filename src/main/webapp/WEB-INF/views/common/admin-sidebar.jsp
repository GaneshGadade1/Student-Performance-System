<div id="sidebar" class="sidebar">
<a href="/admin/dashboard">Dashboard</a>
<a href="/admin/students">Students</a>
<a href="/admin/reports">Performance</a>
<a href="/admin/teachers">Teachers</a>
</div>

<style>
.sidebar{width:0;position:fixed;height:100%;background:#111;transition:.3s}
.sidebar a{color:white;display:block;padding:10px}
</style>

<script>
function toggleSidebar(){
let s=document.getElementById("sidebar");
s.style.width=(s.style.width=="250px")?"0":"250px";
}
</script>