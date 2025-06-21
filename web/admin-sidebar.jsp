
<!-- Custom CSS -->
<style>
    /* Sidebar style */
    .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        height: 100%;
        width: 11%;
        background-color: #343a40;
        padding-top: 56px;
        z-index: 1;
        transition: width 0.3s;
    }

    .sidebar ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }

    .sidebar li {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);  
    }

    .sidebar a {
        color: #f8f9fa;
        text-decoration: none;
    }

    .sidebar a:hover {
        color: #007bff;
    }

    /* Main content style */
    .main-content {
        padding-left: 11%;
        margin-left: 5%;
        margin-right: 5%;
    }
    .sidebar {
        display: flex;
        flex-direction: column;
        height: 100vh;
    }

    .sidebar ul.logout {
        margin-top: auto;
    }
</style>

<!-- Sidebar -->
<nav class="sidebar">
    <ul>
        <li><a href="dashboard"><i class="fas fa-tachometer-alt mr-2"></i>Dashboard</a></li>
        <li><a href="settingUser"><i class="fas fa-users mr-2"></i>Customers</a></li>
        <li><a href="settingService"><i class="fas fa-users mr-2"></i>Services</a></li>
        <li><a href="appointments"><i class="fas fa-users mr-2"></i>Appointments</a></li>
        <li><a href="setting"><i class="fas fa-cog mr-2"></i>Settings</a></li>
        <li><a href="workSchedule"><i class="fas fa-cog mr-2"></i>Work Schedule</a></li>
         <li><a href="admin-revenueReport.jsp"><i class="fas fa-cog mr-2"></i>Revenue report</a></li>
    </ul>
    <ul class="logout">
        <li class="text-light"><i class="fas fa-users mr-2"></i>${sessionScope.user.fullname}</li>
        <li><a href="../logout"><i class="fas fa-sign-out-alt mr-2"></i>Logout</a></li>
    </ul>
</nav>
