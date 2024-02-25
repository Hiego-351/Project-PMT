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
<?php
    include '../koneksi.php';

    if(isset($_POST['update'])) {   
        $KategoriID = $_POST['KategoriID'];
        $BukuID = $_POST['BukuID'];
        $Judul = $_POST['Judul'];
        $Penulis = $_POST['Penulis'];
        $Penerbit = $_POST['Penerbit'];
        $TahunTerbit = $_POST['TahunTerbit'];
        $Stok = $_POST['Stok'];

        $query_stok = mysqli_query($connection, "SELECT Stok FROM buku WHERE BukuID='$BukuID'");
        $StokSekarang = mysqli_fetch_assoc($query_stok)['Stok'];

        if ($Stok < 0) {
            $Stok = 0;
        }

        if(isset($_FILES['Cover']['name']) && $_FILES['Cover']['name'] != '') {
            $Cover = $_FILES['Cover']['name'];
            $Tmp = $_FILES['Cover']['tmp_name'];
            $Location = '../../dist/dist/img/' . $Cover;
            
            move_uploaded_file($Tmp, $Location);

            $query = mysqli_query($connection, "CALL Ubah_Buku('$BukuID', '$KategoriID', '$Cover', '$Judul', '$Penulis','$Penerbit','$TahunTerbit','$Stok')");
        } else {
            $query = mysqli_query($connection, "CALL Ubah_Buku1('$BukuID', '$KategoriID', '$Judul', '$Penulis','$Penerbit','$TahunTerbit','$Stok')");
        }

        header("location: buku.php");
    }
?>
<?php
    $BukuID = $_GET['id'];
    $data = mysqli_query($connection, "SELECT * FROM buku WHERE BukuID='$BukuID'");
    while($r = mysqli_fetch_array($data)) {
        $KategoriID = $r['KategoriID'];
        $Cover = $r['Cover']; 
        $Judul = $r['Judul'];
        $Penulis = $r['Penulis'];
        $Penerbit = $r['Penerbit'];
        $TahunTerbit = $r['TahunTerbit'];
        $Stok = $r['Stok'];
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="icon" href="../../dist/dist/img/logo_app.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <title>Halaman Ubah Buku</title>
</head>
<body>

    <div class="container" style="margin-top: 80px">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div align="center" class="card-header">
                        <?php if(isset($Cover) && $Cover != 'empty'): ?>
                            <img src="../../dist/dist/img/<?php echo $Cover; ?>" width="120px">
                        <?php else: ?>
                            <img src="../../dist/dist/img/<?php echo $Cover; ?>" width="120px">
                        <?php endif; ?>
                    </div>
                    <div class="card-body">
                        <form method="post" enctype="multipart/form-data">
                            <div class="row justify-content-center h3 mb-3 font-weight-normal">
                                <select name="KategoriID" class="btn btn-info">
                                    <?php 
                                        $Genre = mysqli_query($connection, "SELECT * FROM kategoribuku");
                                        while($Kategori = mysqli_fetch_array($Genre)){
                                    ?>
                                        <option <?php if($Kategori['KategoriID'] == $r['KategoriID']) echo 'selected'; ?> value="<?php echo $Kategori['KategoriID']; ?>"><?php echo $Kategori['NamaKategori']; ?> </option>
                                    <?php 
                                        }
                                    ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Judul</label>
                                <input type="text" name="Judul" value="<?php echo $Judul;?>" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Penulis</label>
                                <input type="text" name="Penulis" value="<?php echo $Penulis;?>" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Penerbit</label>
                                <input type="text" name="Penerbit" value="<?php echo $Penerbit;?>" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tahun Terbit</label>
                                <input type="text" name="TahunTerbit" value="<?php echo $TahunTerbit;?>" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Stok</label>
                                <input type="number" name="Stok" value="<?php echo $Stok;?>" class="form-control" min="0" required>
                            </div>
                            <div class="form-group">
                                <label>Cover</label>
                                <input type="file" name="Cover" class="form-control-file">
                            </div>
                            <input type="hidden" name="BukuID" value="<?php echo $_GET['id'];?>">
                            <button type="submit" class="btn btn-success" name="update">SIMPAN</button>
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
<?php 
    }
?>
