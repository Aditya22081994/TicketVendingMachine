<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Profile Information</title>
</head>
<body>

<div class="container-fluid">
<br><br><br>
  <h3><strong><b>UPDATE INFORMATION</b></strong></h3>
  <br>
  <form class="form-horizontal" role="form" method="post" action="updateinformation">
    <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Name </label>
      <div class="col-sm-3">
        <input type="text" class="form-control" name="Mname"  placeholder="Enter Name" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Mobile No.</label>
      <div class="col-sm-3">
        <input type="text" class="form-control" name="Mmobile" placeholder="Enter mobile no." required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Email Id</label>
      <div class="col-sm-3">
        <input type="text" class="form-control" name="Memail" placeholder="Enter email Id" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Password</label>
      <div class="col-sm-3">
        <input type="text" class="form-control" name="Mpassword" placeholder="Enter password" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Age</label>
      <div class="col-sm-3">
        <input type="text" class="form-control" name="Mage" placeholder="Enter your age" required>
      </div>
    </div>
    
           <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success">Modify</button>
      </div>
    </div>
  </form>
  </div>
</body>
</html>