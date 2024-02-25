<?php
include '../koneksi.php';
$UserID = $_POST['UserID'];
$BukuID = $_POST['BukuID'];
$query = mysqli_query($connection, "CALL Tambah_Koleksi('','$UserID','$BukuID');");

if(mysqli_affected_rows($connection) > 0) {
    echo '<script> window.location="koleksi.php"; </script>';
} else {
    echo '<script> alert("Gagal meminjam buku. Silahkan coba lagi."); window.location="koleksi.php"; </script>';
}

mysqli_close($connection);

?>