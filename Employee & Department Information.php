<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
<link rel="stylesheet" href="./style.css">

<a href="https://www.Homepage.php">Homepage</a>
</head>

<body>
    <div class="navBar">
     <h1 style="text-align:center;"> Employee & Department Information</h1>  
    </div>

  <h2> <label for="tables"> Please select tables from the list: </label>  </h2>

  <form action="" method ='POST'>
<select name="EMPLOYEE" id="EMPLOYEE">

<option value=1> 1 </option>    
<option value=2> 2 </option>
<option value=3> 3 </option>
<option value=4> 4 </option>
<option value=5> 5 </option>
<option value=6> 6 </option>
<option value=7> 7 </option>
<option value=8> 8 </option>
<option value=9> 9 </option>
</select>
<input type="Submit" name="button" value="Submit">
</form>

<?php

if(isset($_POST['EMPLOYEE'])){
    $EMPLOYEE = $_POST['EMPLOYEE'];

if ($Connection = oci_connect("user-name", "password")) 
{
  //$sql = "SELECT EMPLOYEE.CUSTOMER_ID, EMPLOYEE.EMPLOYEE_ID, EMPLOYEE.ADDRESS1_ID, EMPLOYEE.STORE_ID, EMPLOYEE.DEPARTMENT_ID, PRODUCT.ID, PRODUCT.NAME FROM EMPLOYEE INNER JOIN PRODUCT ON EMPLOYEE.ID = PRODUCT.ID where PRODUCT.ID = '".$_POST['EMPLOYEE']."'";
  $sql = "SELECT EMPLOYEE.ID, EMPLOYEE.CITIZEN_NUMBER, EMPLOYEE.FIRST_NAME, EMPLOYEE.LAST_NAME, EMPLOYEE.PHONE_NUMBER, EMPLOYEE.EMPLOYEE_TITLE_ID, REL_DEPARTMENT__EMPLOYEE.EMPLOYEE_ID, REL_DEPARTMENT__EMPLOYEE.DEPARTMENT_ID FROM EMPLOYEE INNER JOIN REL_DEPARTMENT__EMPLOYEE ON EMPLOYEE.ID = REL_DEPARTMENT__EMPLOYEE.EMPLOYEE_ID where REL_DEPARTMENT__EMPLOYEE.EMPLOYEE_ID = '".$_POST['EMPLOYEE']."'"; 

$Statement = oci_parse($Connection, $sql);
oci_execute($Statement);
$numcols = oci_num_fields($Statement);
print "<table width=300 border=1><tr>";
for ($i=1; $i<=$numcols; $i++)
{

// Print column headings
 $colname = oci_field_name($Statement, $i);
 print "<td>$colname</td>";
}

 print "</tr>";
// Get a row and print it column by column
while (oci_fetch($Statement))
{

 print "<tr>";
 for ($i=1; $i<=$numcols; $i++)
{
 $col = oci_result($Statement, $i);
 PRINT "<td>$col</td>";
 }
print "</tr>";
}
print "</table>";
$numrows = oci_num_rows($Statement);

oci_close($Connection);

}
else
 {
var_dump(oci_error($Connection));
 }
}
else
{
    $EMPLOYEE =' ';
    echo $EMPLOYEE;
} 
?>


</body>
</html>
