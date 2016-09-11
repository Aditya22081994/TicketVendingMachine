<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Station Details</title>
</head>
<body>

<form role="form" action="stationdetails" method="post">
<fieldset>
<legend><h3>Add Station Details</h3></legend>
<div class="container">

    <div class="form-group">
      <label for="text">Add Id</label>
      <input type="text" class="form-control" name="AddSid" placeholder="Enter Id" required>
    </div>
    <div class="form-group">
      <label for="text">Add Name</label>
      <input type="text" class="form-control" name="AddSname" placeholder="Enter Name" required>
    </div>
    <div class="form-group">
    <label for="text">Add City</label>
    <input type="text" class="form-control" name="AddScity" placeholder="Enter City" required>
    </div>
    <div class="form-group">
    <label for="text">Add Station Master</label>
    <input type="text" class="form-control" name="AddSstationmaster" placeholder="Enter Station Master" required>
    </div>
        <button type="submit" name="AddSbutton" value="AddSvalue" class="btn btn-success">Add Station Details</button>
</div>
</fieldset>
</form>



<br><br>
<form  role="form" action="stationdetails" method="post">
<fieldset>
<legend><h3>Modify Station Details</h3></legend>
<div class="container">

    <div class="form-group">
      <label for="text">Enter Id</label>
      <input type="text" class="form-control" name="ModifySid" placeholder="Enter Id" required>
    </div>
    <div class="form-group">
      <label for="text">Modify Name</label>
      <input type="text" class="form-control" name="ModifySname" placeholder="Enter Name" required>
    </div>
    <div class="form-group">
    <label for="text">Modify City</label>
    <input type="text" class="form-control" name="ModifyScity" placeholder="Enter City" required>
    </div>
    <div class="form-group">
    <label for="text">Modify Station Master</label>
    <input type="text" class="form-control" name="ModifySstationmaster" placeholder="Enter Station Master" required>
    </div>
        <button type="submit" name="ModifySbutton" value="ModifySvalue" class="btn btn-success">Modify Station Details</button>
</div>
</fieldset>
</form>
</body>
</html>