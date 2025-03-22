<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="KrishiSadhana.Administrator.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        .sidebar {
            min-width: 230px;
            height: 100vh;
            background-color: #2c3e50;
            color: white;
        }

            .sidebar a {
                text-decoration: none;
                color: #fff;
                padding: 12px;
                display: block;
                border-radius: 5px;
            }

                .sidebar a.active {
                    background-color: #007bff;
                }

                .sidebar a:hover {
                    background-color: rgba(255, 255, 255, 0.1);
                }

        .content {
            flex-grow: 1;
            padding: 20px;
            overflow-y: auto;
        }

        .header {
            background-color: #2c3e50;
            padding: 10px 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logout-btn {
            background-color: white;
            color: black;
            border-radius: 5px;
            padding: 5px 10px;
            border: none;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #212529;
            color: white;
            padding: 15px 20px;
            font-weight: 600;
            font-size: 24px;
            border-bottom: solid 3px rgb(108 117 125);
        }

        .container-fluid {
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #212529;
            color: white;
            height: 100vh;
            padding: 20px 0;
        }

            .sidebar a {
                text-decoration: none;
                color: #fff;
                padding: 12px 20px;
                display: block;
                border-radius: 5px;
            }

                .sidebar a.active {
                    background-color: #007bff;
                }

                .sidebar a:hover {
                    background-color: rgba(255, 255, 255, 0.1);
                }

        .content {
            flex-grow: 1;
            padding: 20px;
            overflow-y: auto;
        }

        .col-lg-12.ms-auto.p-4.overflow-hidden {
            max-height: 500px; /* Adjust the height as needed */
            overflow-y: auto; /* Enables vertical scrollbar if content overflows */
            overflow-x: hidden; /* Prevent horizontal scrollbar */
        }
    </style>
</head>
<body>

    <!-- Top bar -->
    <!-- Header Section -->
    <div class="header">
        <img src="../assets/Images/Logo.png" height="50" width="130" />
        <a class="btn btn-sm logout-btn" href="Logout.aspx">LOG OUT</a>
    </div>


    <!-- Starting sidebar -->
    <!-- Main Layout -->
    <div class="d-flex">
        <!-- Sidebar Section -->
        <div class="sidebar d-flex flex-column col-lg-2 p-3">
            <h4 class="mb-4 text-light">ADMIN PANEL</h4>


            <a href="Dashboard.aspx" class="active">Dashboard</a>
            <a href="Categoreis.aspx">Categoreis</a>
            <a href="Products.aspx">Products</a>
            <a href="Orders.aspx">Orders</a>
            <a href="Vehicles_Orders.aspx">Vehicles Orders</a>
            <a href="Doctors.aspx">Doctors</a>
            <a href="User_Queries.aspx">User Queries</a>
            <a href="Vehicles.aspx">Vehicles</a>
            <a href="Users.aspx">Users</a>
            <a href="AllAdmins.aspx">Admins</a>


        </div>

        <!-- Content Section -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 ms-auto p-4 overflow-hidden">
                </div>
            </div>
        </div>
    </div>



    <!-- Bootstrap Scripts -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
