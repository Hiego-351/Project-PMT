<?php
include '../koneksi.php';
    $PeminjamanID = $_POST['PeminjamanID'];
    $UserID = $_POST['UserID'];
    $BukuID = $_POST['BukuID'];
    $TanggalPeminjaman = $_POST['TanggalPeminjaman'];
    $TanggalPengembalian = $_POST['TanggalPengembalian'];
    $Jumlah = $_POST['Jumlah'];
    $StatusPeminjaman = $_POST['StatusPeminjaman'];

    $query = mysqli_query($connection, "CALL Pengembalian('$PeminjamanID', '$UserID', '$BukuID', '$TanggalPeminjaman', '$TanggalPengembalian', '$Jumlah', '$StatusPeminjaman');");
    if(mysqli_affected_rows($connection) > 0) {
        echo '<script> window.location="Peminjaman.php"; </script>';
    } else {
        echo '<script> alert("Gagal mengembalikan buku. Silahkan coba lagi."); window.history.back(); </script>';
    }

mysqli_close($connection);
?>
