<?php

include '../koneksi.php';

$NamaKategori  = $_POST['NamaKategori'];

$query = mysqli_query($connection, "CALL Tambah_Kategori('','$NamaKategori')");

if($query) {

    header("location: kategori.php");

} else {

    echo "Data Gagal Disimpan!";

}

?>