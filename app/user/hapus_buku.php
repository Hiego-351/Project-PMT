<?php
include '../koneksi.php';

$BukuID = $_GET['id'];

$data = mysqli_query($connection, "CALL Hapus_Buku('$BukuID')");

header("Location:buku.php");
?>