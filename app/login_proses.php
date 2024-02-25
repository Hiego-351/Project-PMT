<?php 
session_start();
 
include 'koneksi.php';
 
$username = $_POST['Username'];
$password = $_POST['Password'];
 
$login = mysqli_query($connection,"SELECT * FROM user WHERE Username='$username' AND Password='$password'");

$cek = mysqli_num_rows($login);
 
if($cek > 0){
 
	$data = mysqli_fetch_assoc($login);
	
	$_SESSION['UserID'] = $data['UserID'];
	$_SESSION['Username'] = $data['Username'];
	$_SESSION['Password'] = $data['Password'];
	$_SESSION['Email'] = $data['Email'];
	$_SESSION['NamaLengkap'] = $data['NamaLengkap'];
	$_SESSION['Alamat'] = $data['Alamat'];
	$_SESSION['Level'] = $data['Level'];

	if($data['Level']=="Admin"){
 
		$_SESSION['Username'] = $username;
		$_SESSION['Level'] = "Admin";

		header("location:admin/admin.php");
 
	}else if($data['Level']=="Petugas"){
		
		$_SESSION['Username'] = $username;
		$_SESSION['Level'] = "Petugas";
		
		header("location:petugas/petugas.php");
 
	}else if($data['Level']=="User"){
	
		$_SESSION['Username'] = $username;
		$_SESSION['Level'] = "User";
		
		header("location:user/user.php");
}
	}else{
 
		echo '<script>
		alert("Login Gagal, Username atau Password Salah!!! ");
		window.location="login.php";
		</script>';
	}	

 
?>