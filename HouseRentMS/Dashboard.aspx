<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HouseRentMS.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />


    <title>Dashboard</title>
    <style>
    .small-carousel {
        max-height: 300px;
        overflow: hidden;
    }

    .small-carousel img {
        height: 100%;
        width:100%;
        object-fit: cover;
    }
</style>


</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
    <a href="Login.aspx" class="navbar-brand">Dream Home</a>
    <div class="d-flex justify-content-end mt-2 m-lg-3">
    <asp:Label ID="lblLoggedUser" runat="server" CssClass="text-white fw-bold"></asp:Label>
    </div>
    </nav>
     
    <form id="form1" runat="server">
        <div class="dashboard-container">

            <h2 class="text-primary text-center mb-4 ">House Rental Management System</h2>


            <div class="d-flex flex-wrap justify-content-center gap-3 mb-5">
                <asp:Button ID="btnManageHouses" runat="server" Text="Manage Houses" CssClass="btn" OnClick="btnManageHouses_Click" Width="329px" />
                <asp:Button ID="btnManageUsers" runat="server" Text="Manage Tenants" CssClass="btn" OnClick="btnManageUsers_Click" Width="255px" />
                <asp:Button ID="btnViewBookings" runat="server" Text="View Bookings" CssClass="btn" OnClick="btnViewBookings_Click" Width="252px" />
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn" OnClick="btnLogout_Click" Width="154px" />
            </div>
        </div>

             <div class="row g-4 justify-content-center">
            <!-- Summary Cards -->
            <div class="col-md-6 col-xl-3 m-lg-2">
                <div class="card text-white bg-primary h-100">
                    <div class="card-body d-flex align-items-center">
                        <i class="bi bi-house-fill display-4 me-3"></i>
                        <div>
                            <h5 class="card-title">Houses</h5>
                            <h3 class="card-text" id="lblHouseCount">1230</h3>
                            <div class="progress" style="height:5px;">
                                <div class="progress-bar bg-light" style="width: 75%"></div>
                            </div>

                            <small>60% of target</small>
                        </div>
                    </div>
                </div>
            </div>

                 <div class="col-md-6 col-xl-3 m-lg-2">
                     <div class="card text-white bg-success h-100">
                         <div class="card-body d-flex align-items-center">
                             <i class="bi bi-people-fill display-4 me-3"></i>
                             <div>
                                 <h5 class="card-title">Owners</h5>
                                 <h3 class="card-text" id="lblUsers">1000+</h3>
                                 <div class="progress" style="height: 5px;">
                                     <div class="progress-bar bg-light" style="width: 60%"></div>
                                 </div>
                                 <small>60% of goal</small>
                             </div>
                         </div>
                     </div>
                 </div>

                 <div class="col-md-6 col-xl-3 m-lg-2">
                     <div class="card text-white bg-danger h-100">
                         <div class="card-body d-flex align-items-center">
                             <i class="bi bi-people-fill display-4 me-3"></i>
                             <div>
                                 <h5 class="card-title">Tenants</h5>
                                 <h3 class="card-text" id="lblRevenue">1000+</h3>
                                 <div class="progress" style="height: 5px;">
                                     <div class="progress-bar bg-light" style="width: 60%"></div>
                                 </div>
                                 <small>60% of goal</small>
                             </div>
                         </div>
                     </div>
                 </div>

             </div>

        <!-- Carousel -->
        <div id="demo" class="carousel slide" data-bs-ride="carousel">

            <!-- Indicators/dots -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>

            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/house1.png" class="d-block w-100" alt="House 1">
                </div>
                <div class="carousel-item">
                    <img src="img/house2.jpg" class="d-block w-100" alt="House 2">
                </div>
                <div class="carousel-item">
                    <img src="img/house3.jpg" class="d-block w-100" alt="House 3">
                </div>
            </div>

            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </form>
</body>
</html>
