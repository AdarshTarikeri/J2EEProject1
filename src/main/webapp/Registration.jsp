<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.20.0/jquery.validate.min.js"></script>
</head>
<body>
<%@include file="Header.jsp"%>
    <script type="text/javascript">
    
    jQuery.validator.addMethod("checkemail", function(value, element) {
        return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
    });

    
        jQuery(document).ready(function($){
            $("#signup").validate({
                rules:{
                    name:{
                        required:true
                    },
                    phone:{
                        required:true,
                        minlength:10,
                        maxlength:10
                    },
                    email:{
                        required:true,
                        checkemail:true
                    },
                    pw:{
                        required:true,
                        minlength:6
                    },
                    cp:{
                        required:true,
                        equalTo:"#pw"
                    }
                },
                messages:{
                    name:{
                        required:"Please enter the name."
                    },
                    phone:{
                        required:"Please enter a phone number.",
                        minlength:"Phone number must be at least 10 digits.",
                        maxlength:"Phone number must not exceed 10 digits."
                    },
                    email:{
                        required:"Please enter an email address.",
                        email:"Please enter a valid email address."
                    },
                    pw:{
                        required:"Please enter a password.",
                        minlength:"Password must be at least 6 characters."
                    },
                    cp:{
                        required:"Please confirm your password.",
                        equalTo:"Passwords do not match."
                    }
                }
            });
        });
    </script>
    
            <style>
            .error{   
                color:red;
            }
            input{
                display: block;
            }
            #msg
            {
                background: red;
                color:black;
                border: 1px solid red;
                width:24%;
                font-weight: bold;
                font-size: 25px;
                padding: 5px;
            }
            
        </style>
       
           <center>

        <br><br>
       
     <% if (request.getAttribute("status") != null) {%><div id="msg">  <%= request.getAttribute("status")%></div><%}%>
       

    <form method="post" id="signup" action="RegisterS">
        <font color="green">
            <h2> Sookshmas Registration Form</h2>
        </font>
        <table>
            <tr>
                <td> Name </td>
                <td> <input type="text" id="Name" name="name" ></td>
            </tr>
            <tr>
                <td> Phone Number </td>
                <td> <input type="text" name="phone"></td>
            </tr>
            <tr>
                <td> Email</td>
                <td> <input type="email" name="email"></td>
            </tr>
            <tr>
                <td> Password</td>
                <td> <input type="password" id="pw" name="pw"></td>
            </tr>
            <tr>
                <td> Confirm Password</td>
                <td><input type="password" name="cp"></td>
            </tr>
            <tr>
                <td><br><input type="submit" name="register" value="Register"></td>
            </tr>
        </table>
    </form>
    </center>
     <%@include file="footer.jsp"%>
</body>
</html>