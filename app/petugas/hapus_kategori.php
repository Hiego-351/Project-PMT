<?php
include '../koneksi.php';

$KategoriID = $_GET['id'];

$result = mysqli_query($connection, "SELECT * FROM buku WHERE KategoriID = '$KategoriID'");

if (mysqli_num_rows($result) > 0) {
    echo "<script>alert('Kategori tidak bisa dihapus karena sedang dipakai oleh data buku!'); window.location='kategori.php';</script>";
} else {

    $data = mysqli_query($connection, "CALL Hapus_Kategori('$KategoriID')");

    if ($data) {
        header("Location: kategori.php");
    } else {
        echo "<script>alert('Kategori tidak bisa dihapus!'); window.location='kategori.php';</script>";
    }
}
?>
