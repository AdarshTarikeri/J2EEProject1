<%@ page  contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<title>New Password</title>
<style>
.c1
{
border:2px solid black;
width:46vh;
height:50vh;
margin-top:25vh;
margin-left:80vh;
}
.form-control
{
width:40vh;
margin-left:-15vh;
margin-bottom:5vh;
}
#msg {
	background: green;
	color: black;
	border: 1px solid green;
	width: 24%;
	font-weight: bold;
	font-size: 25px;
	padding: 5px;
	text-align:center;
}
</style>
</head>
<body>
<%
		if (request.getAttribute("status") != null) {
		%>
		<center><div id="msg">
			<%=request.getAttribute("status")%></div></center>
		<%
		}
		%>

<div class="c1">
<center>
 <form method="POST" id="change" action="RegisterS">
 <font color="blue" size="4">
 <div class="p-4"></div>
 <h2>New Password</h2>
   <div class="p-1"></div>
 <div class="container ">
<div class="form-group col-md-4">
                    <input type="password" class="form-control" placeholder="create new password" name="pwd">
                </div>
                </div>
          <div class="container ">
                <div class="form-group col-md-4">
                    <input type="password" class="form-control" placeholder="confirm your password" name="cp">
                </div>
                </div>
                <button type="submit" class="btn btn-primary" name="change">change</button>
 </form>
 </center>
 </div>
</body>
</html>
