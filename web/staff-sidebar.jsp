
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
    
    .sidebar li i{
        margin-right: 15px
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
<<<<<<< HEAD:web/staff-sidebar.jsp
        <li><a href="dashboard"><i class="fas fa-tachometer-alt mr-2"></i>Dashboard</a></li>
        <li><a href="appointments"><i class="fas fa-users mr-2"></i>Appointments</a></li>
        <li><a href="list-post"><i class="fas fa-images mr-2"></i>List Post</a></li>
=======
        <li><a href="dashboard"><i class="fas fa-chart-line mr-2"></i>Dashboard</a></li>
<!--        <li><a href="product"><i class="fas fa-tshirt mr-2"></i>Product</a></li>
        <li><a href="user"><i class="fas fa-user-friends mr-2"></i>Customers</a></li>
        <li><a href="feedback"><i class="fas fa-comments mr-2"></i>Feedbacks</a></li>
        <li><a href="slider"><i class="fas fa-images mr-2"></i>Sliders</a></li>-->
        <li><a href="/Spa/marketing/list-post"><i class="fas fa-images mr-2"></i>List Post</a></li>
        <li><a href="/Spa/admin/setting"><i class="fas fa-images mr-2"></i>Setting List</a></li>
>>>>>>> fb88026e09520bd5fee05972659aa477d4f718ff:web/marketing-sidebar.jsp
    </ul>
    <ul class="logout">
        <li class="text-light"><i class="fas fa-users mr-2"></i>${sessionScope.user.fullname}</li>
        <li><a href="../logout"><i class="fas fa-sign-out-alt mr-2"></i>Logout</a></li>
    </ul>
</nav>
