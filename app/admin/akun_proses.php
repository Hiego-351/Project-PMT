<?php

include('../koneksi.php');

$Username = $_POST['Username'];
$Password = $_POST['Password'];
$Email = $_POST['Email'];
$NamaLengkap = $_POST['NamaLengkap'];
$Alamat = $_POST['Alamat'];
$Level = $_POST['Level'];   
$query = "INSERT INTO user (UserID, Username, Password, Email, NamaLengkap, Alamat, Level) VALUES ('','$Username', '$Password', '$Email', '$NamaLengkap', '$Alamat', '$Level')";

if($connection->query($query)) {

    echo "<script> window.history.back(); </script>";

} else {

    echo "Data Gagal Disimpan!";

}

?>