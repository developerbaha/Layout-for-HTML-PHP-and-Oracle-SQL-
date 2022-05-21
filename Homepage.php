<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
<link rel="stylesheet" href="./style.css">

<a href="https://www.teach.scam.keele.ac.uk/prin/x4z33/Product%20Name%20&%20Sale%20Information.php">Product Name & Sale Information</a>
<a href="https://www.teach.scam.keele.ac.uk/prin/x4z33/Employee%20&%20Department%20Information.php">Employee & Department Information</a>
</head>

<body>
    <div class="navBar">
     <h1 style="text-align:center;">The IDEA home furniture company</h1>  
    </div>

  <h2> <label for="tables"> Please select tables from the list: </label>  </h2>

  <form action="" method ='POST'>
  <select name="tables" id="tables">

  <option value="COUNTRY">Country</option>
  <option value="REGION">REGION</option>
  <option value="CITY">CITY</option>
  <option value="DISTRICT">DISTRICT</option>
  <option value="ADDRESS1">ADDRESS1</option>
  <option value="EMPLOYEE_TITLE_TYPE">EMPLOYEE_TITLE_TYPE</option>
  <option value="EMPLOYEE">EMPLOYEE</option>
  <option value="SUPPLIER">SUPPLIER</option>
  <option value="JHI_STORE">JHI_STORE</option>
  <option value="CUSTOMER">Customers</option>
  <option value="DEPARTMENT">DEPARTMENT</option>
  <option value="REL_JHI_STORE__EMPLOYEE">REL_JHI_STORE__EMPLOYEE</option>
  <option value="REL_DEPARTMENT__EMPLOYEE">REL_DEPARTMENT__EMPLOYEE</option>
  <option value="REL_CUSTOMER__ADDRESS1">REL_CUSTOMER__ADDRESS1</option>
  <option value="SALE">SALE</option>
  <option value="PRODUCT_CATEGORY">PRODUCT_CATEGORY</option>
  <option value="DELIVERY_LOCATION_TYPE">DELIVERY_LOCATION_TYPE</option>
  <option value="PRODUCT">PRODUCT</option>
  <option value="REL_SALE__PRODUCT">REL_SALE__PRODUCT</option>
  </select>

  <input type="Submit" name="button" value="Submit">

</form>


 <?php
//Program to read the contents of ITEM and display them in a table
if(isset($_POST['tables']))
if ($Connection = oci_connect("x4z33", "tpdcr2aD"))
{

$sql = "select * from ".$_POST['tables']." ";

$Statement = oci_parse($Connection, $sql);
// Execute Oracle query
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
 } // end of if expression
?>


</body>
</html>
