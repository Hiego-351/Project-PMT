<?php
include '../koneksi.php';

if ($_FILES['Cover']['error'] !== UPLOAD_ERR_OK) {
    echo '<script>alert("Terjadi kesalahan saat mengunggah gambar."); window.history.back();</script>';
    die();
}

$KategoriID = $_POST['KategoriID'];
$Judul = $_POST['Judul'];
$Penulis = $_POST['Penulis'];
$Penerbit = $_POST['Penerbit'];
$TahunTerbit= $_POST['TahunTerbit'];
$Stok = $_POST['Stok'];

$Cover = $_FILES['Cover']['name'];
$Size = $_FILES['Cover']['size'];
$Type = $_FILES['Cover']['type'];
$Tmp = $_FILES['Cover']['tmp_name'];

$AllowedTypes = ['image/png', 'image/jpg', 'image/jpeg'];
if (!in_array($Type, $AllowedTypes)) {
    echo '<script>alert("Gambar hanya bisa memproses tipe PNG, JPG, dan JPEG"); window.history.back();</script>';
    die();
}

$MaxSize = 2 * 1024 * 1024;
if ($Size > $MaxSize) {
    echo '<script>alert("Ukuran gambar terlalu besar!"); window.history.back();</script>';
    die();
}

$Location = '../../dist/dist/img/' . $Cover;
move_uploaded_file($Tmp, $Location);

$query = "CALL Tambah_Buku('', '$KategoriID', '$Cover', '$Judul', '$Penulis','$Penerbit','$TahunTerbit','$Stok')";
$data = mysqli_query($connection, $query);

if ($data) {
    header("location: buku.php");
} else {
    echo '<script>alert("Data Gagal Disimpan!"); window.history.back();</script>';
}
?>
