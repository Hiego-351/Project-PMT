<?php 
include '../koneksi.php';

if(isset($_GET['id']) && isset($_GET['action'])) {
    $PeminjamanID = $_GET['id'];
    $action = $_GET['action'];

    if($action == 'setuju') {

        $query = "UPDATE peminjaman SET StatusPeminjaman = 'Dipinjam' WHERE PeminjamanID = $PeminjamanID";
        header("location: peminjaman.php");
    } elseif($action == 'tolak') {

        $query = "UPDATE peminjaman SET StatusPeminjaman = 'Ditolak' WHERE PeminjamanID = $PeminjamanID";
        header("location: peminjaman.php");
    }

    mysqli_query($connection, $query);
}