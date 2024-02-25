<?php
include '../koneksi.php';

$KoleksiID = $_GET['id'];

$data = mysqli_query($connection, "CALL Hapus_Koleksi('$KoleksiID')");

header("Location:koleksi.php");
?>