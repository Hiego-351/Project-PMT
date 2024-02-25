<?php

include '../koneksi.php';

$KategoriID = $_POST['KategoriID'];
$Judul  = $_POST['Judul'];
$Penulis  = $_POST['Penulis'];
$Penerbit  = $_POST['Penerbit'];
$TahunTerbit  = $_POST['TahunTerbit'];
$Stok  = $_POST['Stok'];

$Gambar = $_FILES['Gambar']['name'];
$Size = $_FILES['Gambar']['size'];
$Type = $_FILES['Gambar']['type'];
$Tmp = $_FIELS['Gambar']['tmp_name'];

$Only = ['image/png', 'image/jpg', 'image/jpeg'];
if (!in_array($Type,$Only)){
    echo '<script>alert("Gambar hanya bisa memproses tipe PNG, JPG, dan JPEG"); window.history.back();</script>';
    die();
}
$Sizes = 2 * 1024 * 1024;
if ($Size > $Sizes){
    echo '<script>alert("Ukuran gambar terlalu besar!"); window.history.back();</script>';
    die();
}
$Location = '../../dist/dist/img/.png' . $Gambar;
move_uploaded_file($Tmp, $Location);

$query = mysqli_query($connection, "CALL Tambah_Buku('', '$KategoriID', '$Judul', '$Penulis','$Penerbit','$TahunTerbit','$Stok')");
if($query) {

    header("location: buku.php");

} else {

    echo '<script>alert("Data Gagal Disimpan!"); window.history.back();</script>';

}

?>