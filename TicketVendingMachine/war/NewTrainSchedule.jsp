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
<style type="text/css">
body{
background-color: #696969;
color: #fff;
}
</style>
</head>
<body>

<form role="form" action="trainschedule" method="post">
<fieldset>
<legend><h3>Add Train Details</h3></legend>
<div class="container">

    <div class="form-group">
      <label for="text">Add Station Name</label>
      <input type="text" class="form-control" name="AddTSstationname" placeholder="Enter Station name" required>
    </div>
    <div class="form-group">
      <label for="text">Add Arrival Time</label>
      <input type="text" class="form-control" name="AddTSarrivaltime" placeholder="Enter Arrival Time" required>
    </div>
    <div class="form-group">
    <label for="text">Add Departure Time</label>
    <input type="text" class="form-control" name="AddTSdeparturetime" placeholder="Enter Departure Time" required>
    </div>
    <div class="form-group">
    <label for="text">Add Day</label>
    <input type="text" class="form-control" name="AddTSday" placeholder="Enter Day" required>
    </div>
            <button type="submit" name="AddTSbutton" value="AddTSvalue" class="btn btn-success">Add Train Schedule</button>
</div>
</fieldset>
</form>



<br><br>
<form  role="form" action="trainschedule" method="post">
<fieldset>
<legend><h3>Modify Train Details</h3></legend>
<div class="container">

     <div class="form-group">
      <label for="text">Add Station Name</label>
      <input type="text" class="form-control" name="ModifyTSstationname" placeholder="Enter Station name" required>
    </div>
    <div class="form-group">
      <label for="text">Modify Arrival Time</label>
      <input type="text" class="form-control" name="ModifyTSarrivaltime" placeholder="Enter Arrival Time" required>
    </div>
    <div class="form-group">
    <label for="text">Modify Departure Time</label>
    <input type="text" class="form-control" name="ModifyTSdeparturetime" placeholder="Enter Departure Time" required>
    </div>
    <div class="form-group">
    <label for="text">Modify Day</label>
    <input type="text" class="form-control" name="ModifyTSday" placeholder="Enter Day" required>
    </div>
        <button type="submit" name="ModifyTSbutton" value="ModifyTSvalue" class="btn btn-success">Modify Train Schedule</button>
</div>
</fieldset>
</form>

<div class="container-fluid">
<br><br>
<a class="btn btn-primary" href="TrainScheduleTable.jsp" role="button">Back to Train Schedule</a>
</div>
</body>
</html>