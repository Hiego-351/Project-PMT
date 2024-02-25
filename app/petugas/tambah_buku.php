<?php 
	session_start();
 
  if($_SESSION['Level']==""){
		header("location:../login.php?pesan=gagal");
	} elseif($_SESSION['Level']=="User"){
        header("location:../user/user.php?pesan=gagal");
    } elseif($_SESSION['Level']=="Admin"){
        header("location:../admin/admin.php?pesan=gagal");
    }
 
	?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="icon" href="../../dist/dist/img/logo_app.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <title>Halaman Aksi Tambah Buku</title>
  </head>

  <body>
    <div class="container" style="margin-top: 80px">
      <div class="row">
        <div class="col-md-8 offset-md-2">
          <div class="card">
            <div class="card-body">
              <form action="tambah_buku_proses.php" method="post" enctype="multipart/form-data">

                <div class="form-group">
                  <input type="file" name="Cover" class="btn form-control-file" style="align-self: center;">
                </div>

                <div class="row justify-content-center h3 mb-3 font-weight-normal">
                  <select name="KategoriID" class="btn btn-info">
                  <?php 
                  include '../koneksi.php';
                  $Genre = mysqli_query($connection, "SELECT * FROM kategoribuku");
                  while($Kategori = mysqli_fetch_array($Genre)){
                  ?>
                  <option value="<?php echo $Kategori['KategoriID']; ?>"><?php echo $Kategori['NamaKategori']; ?> </option>
                  <?php 
                  }
                  ?>
                </select>
                </div>

                <div class="form-group">
                  <label>Judul</label>
                  <input type="text" name="Judul" placeholder="..." class="form-control" required>
                </div>

                <div class="form-group">
                  <label>Penulis</label>
                  <input type="text" name="Penulis" placeholder="..." class="form-control" required>
                </div>

                <div class="form-group">
                  <label>Penerbit</label>
                  <input type="text" name="Penerbit" placeholder="..." class="form-control" required>
                </div>

                <div class="form-group">
                  <label>Tahun Terbit</label>
                  <input type="text" name="TahunTerbit" placeholder="..." class="form-control" required>
                </div>

                <div class="form-group">
                  <label>Stok</label>
                  <input type="text" name="Stok" placeholder="..." class="form-control" min="0" required>
                </div>

                <button type="submit" class="btn btn-success">SIMPAN</button>
                <button type="reset" class="btn btn-info">RESET</button>
                <a class="btn btn-primary" href="buku.php">BATAL</a>

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