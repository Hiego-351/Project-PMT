<?php 
	session_start();
 
	if($_SESSION['Level']==""){
		header("location:../login.php?pesan=gagal");
	} elseif($_SESSION['Level']=="User"){
        header("location:../user/user.php?pesan=gagal");
    } elseif($_SESSION['Level']=="Petugas"){
        header("location:../petugas/petugas.php?pesan=gagal");
    }
 
	?>
<?php
include '../koneksi.php';

if(isset($_POST['update']))
{   
    $KategoriID = $_POST['KategoriID'];
    $NamaKategori = $_POST['NamaKategori'];

    $data = mysqli_query($connection, "CALL Ubah_Kategori('$KategoriID', '$NamaKategori')");

    header("location: kategori.php");
}
?>

<?php

$KategoriID = $_GET['id'];

$data = mysqli_query($connection, "SELECT * FROM kategoribuku WHERE KategoriID='$KategoriID'");

while($r = mysqli_fetch_array($data))
{
    $NamaKategori = $r['NamaKategori'];

?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="icon" href="../../dist/dist/img/logo_app.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <title>Halaman Ubah Kategori</title>
  </head>

  <body>

    <div class="container" style="margin-top: 80px">
      <div class="row">
        <div class="col-md-8 offset-md-2">
          <div class="card">
            <div class="card-header">
            <img src="" alt="" width="72" height="72">
              Ubah Kategori
            </div>
            <div class="card-body">
              <form method="post">
                <div class="form-group">
                  <label>Nama Kategori</label>
                  <input type="text" name="NamaKategori" placeholder="Nama" class="form-control" value="<?php echo $NamaKategori;?>" required>
                </div>
                
                <input type="hidden" name="KategoriID" value="<?php echo $_GET['id'];?>">
                <button type="submit" class="btn btn-success" name="update">SIMPAN</button>
                <button type="reset" class="btn btn-info">RESET</button>
                <a class="btn btn-primary" href="kategori.php">BATAL</a>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  </body>
</html>
<?php 
} 
?>
