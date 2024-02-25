<?php 
	session_start();
    include '../koneksi.php';
	if($_SESSION['Level']==""){
        header("location:../login.php?pesan=gagal");
      } elseif($_SESSION['Level']=="Admin"){
        header("location:../admin/admin.php?pesan=gagal");
      } elseif($_SESSION['Level']=="Petugas"){
        header("location:../petugas/petugas.php?pesan=gagal");
      }
 
	?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>ProjectPMT</title>
        <link rel="icon" type="icon" href="../../dist/dist/img/logo_app.png">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../dist/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">

        <a class="navbar-brand ps-3" href="user.php">Project PMT</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="../logout.php">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Menu Utama</div>
                            <a class="nav-link" href="user.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-house-chimney"></i></div>
                                Home
                            </a>
                            <a class="nav-link collapsed" href="kategori.php" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                                Kategori
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="kategori.php">Kategori</a>
                                    <a class="nav-link" href="buku.php">Semua</a>
                                    <a class="nav-link" href="fiksi.php">Fiksi</a>
                                    <a class="nav-link" href="non-fiksi.php">Non-Fiksi</a>
                                    <a class="nav-link" href="agama.php">Agama</a>
                                    <a class="nav-link" href="panduan.php">Panduan</a>
                                    <a class="nav-link" href="gaya_hidup.php">Gaya Hidup</a>
                                    <a class="nav-link" href="anak_anak.php">Anak - Anak</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="buku.php" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Buku
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="peminjaman.php">
                                        Peminjaman
                                    </a>
                                    </a><a class="nav-link collapsed" href="Koleksi.php">
                                        Koleksi
                                    </a>
                                    </a><a class="nav-link collapsed" href="histori.php">
                                        Histori
                                    </a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Masuk Sebagai:</div>
                        Pengguna
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <a class="fas fa-house-chimney"></a>
                        <h1 class="mt-1">Home</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Data Terkini</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">
                                    <?php 
                                        echo mysqli_num_rows(mysqli_query($connection, "SELECT * FROM Kategoribuku"));
                                    ?> 
                                        Total Kategori
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="buku.php">Lihat Detail</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-info text-white mb-4">
                                    <div class="card-body">
                                    <?php 
                                        echo mysqli_num_rows(mysqli_query($connection, "SELECT * FROM buku"));
                                    ?> 
                                        Total Buku
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="buku.php">Lihat Detail</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                    <?php
                                        include '../koneksi.php'; 
                                        $UserID = $_SESSION['UserID'];
                                        echo mysqli_num_rows(mysqli_query($connection, "SELECT * FROM peminjaman LEFT JOIN user ON user.UserID = peminjaman.UserID WHERE peminjaman.UserID = '$UserID'"));
                                    ?> 
                                        Total Peminjaman
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="peminjaman.php">Lihat Detail</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-secondary text-white mb-4">
                                    <div class="card-body">
                                    <?php 
                                        echo mysqli_num_rows(mysqli_query($connection, "SELECT * FROM koleksipribadi LEFT JOIN user ON user.UserID = koleksipribadi.UserID = '$UserID'"));
                                    ?> 
                                        Total Koleksi Pribadi
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="koleksi.php">Lihat Detail</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>               
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Project PMT</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../../dist/js/datatables-simple-demo.js"></script>
    </body>
</html>
