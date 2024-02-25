<?php
include '../koneksi.php';
    $UserID = $_POST['UserID'];
    $BukuID = $_POST['BukuID'];
    $TanggalPeminjaman = $_POST['TanggalPeminjaman'];
    $TanggalPengembalian = $_POST['TanggalPengembalian'];
    $Stok = $_POST['Stok'];
    $StatusPeminjaman = $_POST['StatusPeminjaman'];

    if ($Stok == 0) {
        echo '<script> alert("Stok sudah habis."); window.location="buku.php"; </script>';
        exit;
    }
    $query = mysqli_query($connection, "CALL Tambah_Peminjaman('', '$UserID', '$BukuID', '$TanggalPeminjaman', '$TanggalPengembalian', '$Stok', '$StatusPeminjaman');");
    
    if(mysqli_affected_rows($connection) > 0) {
        echo '<script> window.location="peminjaman.php"; </script>';
    } else {
        echo '<script> alert("Gagal meminjam buku. Silahkan coba lagi."); window.location="peminjaman.php"; </script>';
    }

mysqli_close($connection);
?>
