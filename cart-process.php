<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (isset($_POST['submit'])) {
	if (!empty($_SESSION['cart'])) {
		foreach ($_POST['quantity'] as $key => $val) {
			if ($val == 0) {
				unset($_SESSION['cart'][$key]);
			} else {
				$_SESSION['cart'][$key]['quantity'] = $val;
			}
		}
	}
}
// Code for Remove a Product from Cart
if (!empty($_GET["action"])) {
	switch ($_GET["action"]) {
		case "remove":
			if (!empty($_SESSION["cart"])) {
				foreach ($_SESSION["cart"] as $k => $v) {
					if ($_GET["id"] == $k)
						unset($_SESSION["cart"][$k]);
					if (empty($_SESSION["cart"]))
						unset($_SESSION["cart"]);
				}
			}
			break;
		case "empty":
			unset($_SESSION["cart"]);
			break;
	}
}
// code for insert product in order table


if (isset($_POST['ordersubmit'])) {

	if (strlen($_SESSION['login']) == 0) {
		header('location:login.php');
	} else {

		$quantity = $_POST['quantity'];
		$pdd = $_SESSION['pid'];
		$value = array_combine($pdd, $quantity);


		foreach ($value as $qty => $val34) {



			mysqli_query($con, "insert into orders(userId,productId,quantity) values('" . $_SESSION['id'] . "','$qty','$val34')");
			header('location:payment-method.php');
		}
	}
}

// code for billing address updation
if (isset($_POST['update'])) {
	$baddress = $_POST['billingaddress'];
	$bstate = $_POST['bilingstate'];
	$bcity = $_POST['billingcity'];
	$bpincode = $_POST['billingpincode'];
	$query = mysqli_query($con, "update users set billingAddress='$baddress',billingState='$bstate',billingCity='$bcity',billingPincode='$bpincode' where id='" . $_SESSION['id'] . "'");
	if ($query) {
		echo "<script>alert('Địa chỉ Thanh toán đã được cập nhật');</script>";
	}
}


// code for Shipping address updation
if (isset($_POST['shipupdate'])) {
	$saddress = $_POST['shippingaddress'];
	$sstate = $_POST['shippingstate'];
	$scity = $_POST['shippingcity'];
	$spincode = $_POST['shippingpincode'];
	$query = mysqli_query($con, "update users set shippingAddress='$saddress',shippingState='$sstate',shippingCity='$scity',shippingPincode='$spincode' where id='" . $_SESSION['id'] . "'");
	if ($query) {
		echo "<script>alert('Địa chỉ Giao hàng đã được cập nhật');</script>";
	}
}

?>