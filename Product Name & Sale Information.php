<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
<link rel="stylesheet" href="./style.css">

<<p><a href="https://www.teach.scam.keele.ac.uk/prin/x4z33/Homepage.php">Homepage</a></p>
</head>

<body>
    <div class="navBar">
     <h1 style="text-align:center;"> Product Name & Sale Information</h1>  
    </div>

  <h2> <label for="tables"> Please select tables from the list: </label>  </h2>

  <form action="" method ='POST'>
<select name="SALE" id="SALE">

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

if(isset($_POST['SALE'])){
    $SALE = $_POST['SALE'];

if ($Connection = oci_connect("x4z33", "tpdcr2aD")) 
{
  $sql = "SELECT SALE.CUSTOMER_ID, SALE.EMPLOYEE_ID, SALE.ADDRESS1_ID, SALE.STORE_ID, SALE.DEPARTMENT_ID, PRODUCT.ID, PRODUCT.NAME FROM SALE INNER JOIN PRODUCT ON SALE.ID = PRODUCT.ID where PRODUCT.ID = '".$_POST['SALE']."'";


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
    $SALE =' ';
    echo $SALE;
} 
?>


</body>
</html>
