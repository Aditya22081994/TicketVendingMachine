<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>

<div class="container-fluid">
<br><br><br>
   <br>
  <form class="form-horizontal" role="form" action="sendemail" method="post">
  <fieldset>
  <legend>Forgot Password</legend>
  <div class="form-group">
    <div class="col-sm-5">
    <label for="text">Enter Your UserName: </label>
    <input type="text" class="form-control" name="username" placeholder="Enter your UserName">
    </div>
    </div>
       
        <button type="submit" name="Emailbutton" value="AddSvalue" class="btn btn-success">Send Password</button>

    </fieldset>
  </form>
  
</div>

</body>
</html>