<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MD_Clinic.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>MedVisit - Login</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
		
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
</head>
<body class="body-bg">
    <form id="form1" runat="server">
     <!-- Main Wrapper -->
        <div class="main-wrapper login-body">
            <div class="login-wrapper">
            	<div class="container">
                	<div class="loginbox">
                    	<div class="login-left">
							<img class="img-fluid" src="assets/img/medical_heart.png" alt="Logo">
							<br/><span style="color:white; font-size:45px; font-weight: bold; ">MedVisit</span>
                        </div>
                        <div class="login-right">
							<div class="login-right-wrap">
								<h1>Login</h1>
								<p class="account-subtitle">Login to Access Dashboard</p>
								
								
									<div class="form-group">
										
                                         <asp:TextBox ID="txt_username" runat="server" placeholder="Enter UserID" class="form-control" required=""></asp:TextBox>
                                                   
									</div>
									<div class="form-group">
										 <asp:TextBox ID="txt_pass" runat="server" placeholder="Enter Password" TextMode="Password" class="form-control" required=""></asp:TextBox>
                                                  
									</div>
									<div class="form-group">
									
                                         <asp:Button ID="Button_login" runat="server" Text="Login" class="btn btn-primary btn-block" OnClick="Button_login_Click"></asp:Button>
									</div>
							
								
								<div class="text-center forgotpass"><a href="forgot-password.html">Forgot Password?</a></div>
								
								<!-- Social Login -->
									</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- /Main Wrapper -->
    </form>
    <!-- jQuery -->
        <script src="assets/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/script.js"></script>
</body>
</html>
