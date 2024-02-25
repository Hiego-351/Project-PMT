<?php 
session_start();
 
session_destroy();
 
?>
<script>
    alert('Anda telah Logout');
    window.location='login.php';
</script>