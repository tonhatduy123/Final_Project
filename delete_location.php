<?php

include('db_connect.php');
extract($_POST);
$remove = $conn->query("DELETE from location where id =".$id);
if($remove)
	echo 1;