<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Masuk Project PMT </title>
   
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
    <link rel="stylesheet" href="../dist/bower_components/bootstrap/dist/css/bootstrap.min.css">
  
    <link rel="stylesheet" href="../dist/bower_components/font-awesome/css/font-awesome.min.css">
   
    <link rel="stylesheet" href="../dist/bower_components/Ionicons/css/ionicons.min.css">

    <link rel="stylesheet" href="../dist/dist/css/AdminLTE.min.css">
   
    <link rel="stylesheet" href="../dist/plugins/iCheck/square/blue.css">
    
    <link rel="icon" type="icon" href="../dist/dist/img/logo_app.png">
    
    <link rel="stylesheet" href="../dist/dist/css/custom.css">
  
    <link rel="stylesheet" href="../dist/dist/css/toastr.min.css">
</head>

<body class="hold-transition login-page" style="font-family: 'Quicksand', sans-serif;">
    <div class="login-box">
        <div class="login-logo">
        <a href="masuk"><b> Project PMT </b></a>
        </div>
      
        <div class="login-box-body" style="border-radius: 10px;">
            <img src="../dist/dist/img/logo_app.png" height="80px" width="80px" style="display: block; margin-left: auto; margin-right: auto; margin-top: -12px; margin-bottom: 5px;">
            <form name="formLogin" action="register_proses.php" method="POST" enctype="multipart/form-data">

                <div class="form-group has-feedback">
                    <input type="text" class="form-control" name="Username" id="username" placeholder="Username" required>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>

                <div class="form-group has-feedback">
                    <input type="password" class="form-control" name="Password" id="password" placeholder="Password" required>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>

                <div class="form-group has-feedback">
                    <input type="email" class="form-control" name="Email" id="email" placeholder="Email" required>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>

                <div class="form-group has-feedback">
                    <input type="text" class="form-control" name="NamaLengkap" id="namalengkap" placeholder="Nama Lengkap" required>
                    <span class="glyphicon glyphicon-font form-control-feedback"></span>
                </div>

                <div class="form-group has-feedback">
                    <input type="text" class="form-control" name="Alamat" id="alamat" placeholder="Alamat" required>
                    <span class="glyphicon glyphicon-home form-control-feedback"></span>
                </div>

                <input type="hidden" name="Level" value="User" required>

                <div class="row">

                <div class="col-xs-12">
                     
                </div>
                  
                    <div class="col-xs-12">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Daftar</button>
                    </div>
 
                </div>
            </form>

            <div class="social-auth-links text-center">
                <p style="font-size: 11px;">- ATAU -</p>
                <div class="row">
                    <div class="col-xs-12">
                        <a class="btn btn-block btn-warning btn-flat" href="login.php"><i class="fa fa-user"></i> Masuk sebagai pengguna</a>
                    </div>
                </div>
            </div>
        </div>
       
    </div>
  
    <script src="../dist/bower_components/jquery/dist/jquery.min.js"></script>

    <script src="../dist/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  
    <script src="../dist/json/lottie-player.js"></script>
 
    <script src="../dist/dist/js/sweetalert.min.js"></script>

    <script src="../dist/dist/js/toastr.min.js"></script>
</body>

</html>