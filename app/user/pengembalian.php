<?php 
	session_start();
	if($_SESSION['Level']==""){
		header("location:../login.php?pesan=gagal");
	  } elseif($_SESSION['Level']=="Admin"){
		header("location:../admin/admin.php?pesan=gagal");
	  } elseif($_SESSION['Level']=="Petugas"){
		header("location:../petugas/petugas.php?pesan=gagal");
	  }
	?>

<?php
    include '../koneksi.php';
    if(isset($_POST['Kembalikan'])) {   
		$BukuID = $_POST['BukuID'];
        $KategoriID = $_POST['KategoriID'];
		$Cover = $r['Cover']; 
        $Judul = $_POST['Judul'];
        $Penulis = $_POST['Penulis'];
        $Penerbit = $_POST['Penerbit'];
        $TahunTerbit = $_POST['TahunTerbit'];
        $Stok = $_POST['Stok'];
		
	} 
?>
<?php
	$UserID = $_SESSION['UserID'];
    $id = $_GET['id'];
    $data = mysqli_query($connection, "SELECT * FROM peminjaman LEFT JOIN buku ON buku.BukuID = peminjaman.BukuID WHERE PeminjamanID=$id");
    while($Result = mysqli_fetch_array($data)) {
        $KategoriID = $Result['KategoriID'];
        $Cover = $Result['Cover']; 
        $Judul = $Result['Judul'];
        $Penulis = $Result['Penulis'];
        $Penerbit = $Result['Penerbit'];
        $TahunTerbit = $Result['TahunTerbit'];
        $Stok = $Result['Stok'];
?>

<!doctype html>
<html lang="en">
  <head>
  	<title>Project PMT</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="icon" type="icon" href="../../dist/dist/img/logo_app.png">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="../../scripts/css/style.css">

	</head>
	<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Halaman Pengembalian</h2>

					<div class="form-group">
						<img src="../../dist/dist/img/<?php echo $Cover; ?>" width="120px">
                	</div>

					<div class="row justify-content-center h3 mb-3 font-weight-normal">
                	</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">
						<div class="text-wrap p-4 p-lg-5 text-center align-items-center order-md-last">
						<div class="text w-100">
					<form action="pengembalian_proses.php" method="post" class="signin-form">
					<div class="form-group mb-3">
		            	<label for="text">Tahun Terbit</label>
		              <input type="text" class="form-control" name="TahunTerbit" value="<?php echo $Result['TahunTerbit'] ?>" readonly>
		            </div>

					<div class="form-group mb-3">
		            	<label for="text">Stok</label>
		              <input type="number" class="form-control" name="Jumlah" value="<?php echo $Result['Jumlah'] ?>" readonly>
		            </div>

					<div class="form-group mb-3">
            		  <label for="text">Tanggal Pengembalian</label>
            		 	<input type="date" class="form-control" name="TanggalPengembalian" value="<?php echo date('Y-m-d'); ?>" readonly/>
						<input type="date" name="TanggalPeminjaman" value="<?php echo $Result['TanggalPeminjaman'] ?>" hidden="hidden" readonly/>
            		  	<input type="hidden" value="Dikembalikan" name="StatusPeminjaman" readonly/>
						<input type="hidden" name="UserID" value="<?php echo $UserID ?>" readonly>
            		  	<input type="hidden" name="BukuID" value="<?php echo $Result['BukuID'] ?>" readonly/>
						<input type="hidden" name="PeminjamanID" value="<?php echo $Result['PeminjamanID'] ?>" readonly/>
         			 </div>
				</div>

			      </div>
						<div class="login-wrap p-4 p-lg-5">
			      	<div class="d-flex">
							
			      	</div>
							<form action="pengembalian_proses.php" method="post" class="signin-form">
			      		<div class="form-group mb-3">
			      			<label for="name">Judul</label>
			      			<input type="text" class="form-control" name="Judul" value="<?php echo $Result['Judul'] ?>" readonly>
			      		</div>

		            <div class="form-group mb-3">
		            	<label for="text">Penulis</label>
		              <input type="text" class="form-control" name="Penulis" value="<?php echo $Result['Penulis'] ?>" readonly>
		            </div>

					<div class="form-group mb-3">
		            	<label for="text">Penerbit</label>
		              <input type="text" class="form-control" name="Penerbit" value="<?php echo $Result['Penerbit'] ?>" readonly>
		            </div>

		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary submit px-3" value="Kembalikan">Kembalikan</button>
		            </div>

						  <div class="form-group">
		            	<a class="form-control btn btn-danger submit px-3" href="peminjaman.php" value="Kembalikan">Batal</a>
		            </div>

		          </form>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="../../scripts/js/jquery.min.js"></script>
  <script src="../../scripts/js/popper.js"></script>
  <script src="../../scripts/js/bootstrap.min.js"></script>
  <script src="../../scripts/js/main.js"></script>
	</body>
</html>
<?php 
	}
?>
