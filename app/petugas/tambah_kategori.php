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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="icon" type="icon" href="../../dist/dist/img/logo_app.png">
    <title>Halaman Aksi Tambah Kategori</title>
  </head>

  <body>

    <div class="container" style="margin-top: 80px">
      <div class="row">
        <div class="col-md-8 offset-md-2">
          <div class="card">
            <div class="card-header">
            <img src="" alt="" width="72" height="72">
              Tambahkan Kategori
            </div>
            <div class="card-body">
              <form action="tambah_kategori_proses.php" method="post">
                
                <div class="form-group">
                  <label>Nama Kategori</label>
                  <input type="text" name="NamaKategori" placeholder="..." class="form-control" required>
                </div>

                <button type="submit" class="btn btn-success">SIMPAN</button>
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
