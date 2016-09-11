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
<title>Manage Train Details</title>
</head>
<body>

<form role="form" action="traindetails" method="post">
<fieldset>
<legend><h3>Add Train Details</h3></legend>
<div class="container">

    <div class="form-group">
      <label for="text">Add Number</label>
      <input type="text" class="form-control" name="AddTnumber" placeholder="Enter Train number" required>
    </div>
    <div class="form-group">
      <label for="text">Add Name</label>
      <input type="text" class="form-control" name="AddTname" placeholder="Enter Name" required>
    </div>
    <div class="form-group">
    <label for="text">Add Source</label>
    <input type="text" class="form-control" name="AddTsource" placeholder="Enter Source" required>
    </div>
    <div class="form-group">
    <label for="text">Add Destination</label>
    <input type="text" class="form-control" name="AddTdestination" placeholder="Enter Destination" required>
    </div>
    <div class="form-group">
    <label for="text">Add Date</label>
    <input type="text" class="form-control" name="AddTdate" placeholder="Enter Date" required>
    </div>
    <div class="form-group">
    <label for="text">Add Time</label>
    <input type="text" class="form-control" name="AddTtime" placeholder="Enter Time" required>
    </div>
        <button type="submit" name="AddTbutton" value="AddTvalue" class="btn btn-success">Add Train Details</button>
</div>
</fieldset>
</form>



<br><br>
<form  role="form" action="traindetails" method="post">
<fieldset>
<legend><h3>Modify Train Details</h3></legend>
<div class="container">

     <div class="form-group">
      <label for="text">Enter Number</label>
      <input type="text" class="form-control" name="ModifyTnumber" placeholder="Enter Train number" required>
    </div>
    <div class="form-group">
      <label for="text">Modify Name</label>
      <input type="text" class="form-control" name="ModifyTname" placeholder="Enter Name" required>
    </div>
    <div class="form-group">
    <label for="text">Modify Source</label>
    <input type="text" class="form-control" name="ModifyTsource" placeholder="Enter Source" required>
    </div>
    <div class="form-group">
    <label for="text">Modify Destination</label>
    <input type="text" class="form-control" name="ModifyTdestination" placeholder="Enter Destination" required>
    </div>
    <div class="form-group">
    <label for="text">Modify Date</label>
    <input type="text" class="form-control" name="ModifyTdate" placeholder="Enter Date" required>
    </div>
    <div class="form-group">
    <label for="text">Modify Time</label> 
    <input type="text" class="form-control" name="ModifyTtime" placeholder="Enter Time" required>
    </div>
        <button type="submit" name="ModifyTbutton" value="ModifyTvalue" class="btn btn-success">Modify Train Details</button>
</div>
</fieldset>
</form>
</body>
</html>