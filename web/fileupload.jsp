<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CTAC</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/creative.min.css" rel="stylesheet">



</head>

<body id="page-top">
<%String t1name=(String)session.getAttribute("t1name");String t1id=(String)session.getAttribute("t1id");%>
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Resource Sharing</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="t1home.jsp">Home</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="t1pass.jsp">Change Password</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="fileupload.jsp">File Upload</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="viewupfile.jsp">View Files</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="t1vt2request.jsp">User Activation</a>
                    </li>
					<li>
                        <a class="page-scroll" href="t1permt2.jsp">T2 Permission</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="t1perrevo.jsp">Permission Revocation</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="t1log.jsp" onclick="return confirm('Are you sure you want to quit this session?');">Logout</a>
                    </li>
                    <li style="float:right">
                        <a class="page-scroll" href="t1log.jsp" onclick="return confirm('Are you sure you want to quit this session?');"><%=t1id%></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
	 <%

                Random RANDOM = new SecureRandom();
                int PASSWORD_LENGTH = 4;
                String letters = "0123456789";
                String uid = "";
                for (int i = 0; i < PASSWORD_LENGTH; i++) {
                    int index = (int) (RANDOM.nextDouble() * letters.length());
                    uid += letters.substring(index, index + 1);
                }
                String msg = uid;

            %>
       <div class="header-content">
            <div class="header-content-inner">
			<form action="upload" enctype="multipart/form-data" method="post"><center>
                <h1 id="homeHeading">File Upload</h1>
              
                <table>
				<div><tr><td><label style="margin-right: 10px;margin-top: 10px;margin-left: 10px;margin-bottom: 10px;"><h3>File Name:</h3></label></td>
				<td><input type="text" required name="fname" placeholder="enter file name" style="margin-right: 10px;margin-top: 25px;margin-left: 10px;margin-bottom: 10px;color: #31708f;"></td></tr></div>
				<div><tr><td><label style="margin-right: 10px;margin-top: 10px;margin-left: 10px;margin-bottom: 10px;"><h3>Description:</h3></label></td>
				<td><textarea required name="des" placeholder="enter description" style="margin-right: 10px;margin-top: 25px;margin-left: 10px;margin-bottom: 10px;color: #31708f;"></textarea></td></tr></div>
				<div><tr><td><label style="margin-right: 10px;margin-top: 10px;margin-left: 10px;margin-bottom: 10px;"><h3>File Access Policy:</h3></label></td>
				<td><select required name="policy" style="margin-right: 10px;margin-top: 25px;margin-left: 10px;margin-bottom: 10px;color: #31708f;">
				<option value>Choose Policy</option>
				<option value="CSE">CSE</option>
				<option value="ECE">ECE</option>
				<option value="EEE">EEE</option>
				<option value="IT">IT</option></select></td></tr></div>
				<div><tr><td><label style="margin-right: 10px;margin-top: 10px;margin-left: 10px;margin-bottom: 10px;"><h3>File Key:</h3></label></td>
				<td><input type="text" name="skey" value="<%=msg%>" readonly style="margin-right: 10px;margin-top: 25px;margin-left: 10px;margin-bottom: 10px;color: #31708f;"></td></tr></div>
				<div><tr><td><label style="margin-right: 10px;margin-top: 10px;margin-left: 10px;margin-bottom: 10px;"><h3>File:</h3></label></td>
				<td><input type="file" name="file" required style="margin-right: 10px;margin-top: 25px;margin-left: 10px;margin-bottom: 10px;color: #31708f;"></td></tr></div>
				</table>
				<input type="submit" value="Upload" class="btn btn-primary btn-xl page-scroll" style="margin-right: 10px;margin-top: 25px">
				</center></form>
            </div>
        </div>
	   
	   
	   
    </header>


    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/creative.min.js"></script>

</body>

</html>
