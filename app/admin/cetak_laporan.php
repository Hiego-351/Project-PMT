<h2 align="center"> Cetak Laporan Peminjaman </h2>
<table border="1" width="100%" cellspacing="0" cellpadding="5">
    <tr>
        <th>No </th>
        <th>Kode Pinjam </th>
        <th>Nama </th>
        <th>Judul </th>
        <th>Tanggal Peminjaman </th>
        <th>Tanggal Pengembalian</th>
        <th>Jumlah</th>
        <th>Status Peminjaman </th>
    </tr>
<?php 
include '../koneksi.php';
    $i = 1;
    $query = mysqli_query($connection, "SELECT * FROM peminjaman LEFT JOIN user ON peminjaman.UserID = user.UserID LEFT JOIN buku ON peminjaman.BukuID = buku.BukuID");
    while($data = mysqli_fetch_array($query)){
    $KodePinjam = 'PM' . str_pad($i, 3, '0', STR_PAD_LEFT);
?>
    <tr>
        <td><?php echo $i++;?></td>
        <td><?php echo $KodePinjam;?></td>
        <td><?php echo $data['NamaLengkap']; ?></td>
        <td><?php echo $data['Judul']; ?></td>
        <td><?php echo $data['TanggalPeminjaman']; ?></td>
        <td><?php echo $data['TanggalPengembalian']; ?></td>
        <td><?php echo $data['Jumlah']; ?></td>
        <td><?php echo $data['StatusPeminjaman']; ?></td>
    </tr>
<?php 
 } 
?>
</table>
<script>
    window.print();
    setTimeout(function() {
        window.close();
    }, 100);
</script>