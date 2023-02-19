<?php
include 'cart-process.php'
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="MediaCenter, Template, eCommerce">
    <meta name="robots" content="all">

    <title>My Cart</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/green.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/owl.transitions.css">
    <!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
    <link href="assets/css/lightbox.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/rateit.css">
    <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

    <!-- Demo Purpose Only. Should be removed in production -->
    <link rel="stylesheet" href="assets/css/config.css">

    <link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
    <link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
    <link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
    <link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
    <link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
    <!-- Demo Purpose Only. Should be removed in production : END -->


    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
    <!--[if lt IE 9]>
			<script src="assets/js/html5shiv.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->

</head>

<body class="cnt-home">



    <!-- ============================================== HEADER ============================================== -->
    <header class="header-style-1">
        <?php include('includes/top-header.php'); ?>
        <?php include('includes/main-header.php'); ?>
        <?php include('includes/menu-bar.php'); ?>
    </header>
    <!-- ============================================== HEADER : END ============================================== -->

    <div class="body-content outer-top-xs">
        <div class="container">
            <div class="row inner-bottom-sm">
                <div class="shopping-cart">
                    <div class="col-md-12 col-sm-12 shopping-cart-table ">
                        <div class="table-responsive">
                            <form name="cart" method="post">
                                <?php
                                if (!empty($_SESSION['cart'])) {
                                ?>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="cart-description item">Ảnh</th>
                                                <th class="cart-product-name item">Tên Sản Phẩm</th>
                                                <th class="cart-qty item">Số Lượng</th>
                                                <th class="cart-size item">Size</th>
                                                <th class="cart-sub-total item">Giá</th>
                                                <th class="cart-total last-item">Tổng</th>
                                                <th class="cart-romove item">#</th>
                                            </tr>
                                        </thead><!-- /thead -->
                                        <tfoot>
                                            <tr>
                                                <td colspan="7">
                                                    <div class="shopping-cart-btn">
                                                        <span class="">
                                                            <a href="index.php" class="btn btn-upper btn-primary outer-left-xs">Mua thêm sản phẩm</a>
                                                            <input type="submit" name="submit" value="Làm Mới Giỏ Hàng" class="btn btn-upper btn-primary pull-right outer-right-xs">
                                                        </span>
                                                    </div><!-- /.shopping-cart-btn -->
                                                </td>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <?php
                                            $pdtid = array();
                                            $sql = "SELECT * FROM products WHERE id IN(";
                                            foreach ($_SESSION['cart'] as $id => $value) {
                                                $sql .= $id . ",";
                                            }
                                            $sql = substr($sql, 0, -1) . ") ORDER BY id ASC";
                                            $query = mysqli_query($con, $sql);
                                            $totalprice = 0;
                                            $totalqunty = 0;
                                            if (!empty($query)) {
                                                while ($row = mysqli_fetch_array($query)) {
                                                    $quantity = $_SESSION['cart'][$row['id']]['quantity'];
                                                    $subtotal = $_SESSION['cart'][$row['id']]['quantity'] * $row['productPrice'] + $row['shippingCharge'];
                                                    $totalprice += $subtotal;
                                                    $_SESSION['qnty'] = $totalqunty += $quantity;

                                                    array_push($pdtid, $row['id']);
                                                    //print_r($_SESSION['pid'])=$pdtid;exit;
                                            ?>

                                                    <tr>
                                                        <td class="cart-image">
                                                            <a class="entry-thumbnail" href="detail.html">
                                                                <img src="admin/productimages/<?php echo $row['id']; ?>/<?php echo $row['productImage1']; ?>" alt="" width="114" height="146">
                                                            </a>
                                                        </td>
                                                        <td class="cart-product-name-info">
                                                            <h4 class='cart-product-description'><a href="product-details.php?pid=<?php echo htmlentities($pd = $row['id']); ?>"><?php echo $row['productName'];

                                                                                                                                                                                    $_SESSION['sid'] = $pd;
                                                                                                                                                                                    ?></a></h4>
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="rating rateit-small"></div>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                    <?php $rt = mysqli_query($con, "select * from productreviews where productId='$pd'");
                                                                    $num = mysqli_num_rows($rt); {
                                                                    ?>
                                                                        <div class="reviews">
                                                                            ( <?php echo htmlentities($num); ?> Đánh Giá )
                                                                        </div>
                                                                    <?php } ?>
                                                                </div>
                                                            </div><!-- /.row -->

                                                        </td>
                                                        <td class="cart-product-quantity">
                                                            <div class="quant-input">
                                                                <div class="arrows">
                                                                    <div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
                                                                    <div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
                                                                </div>
                                                                <input type="text" value="<?php echo $_SESSION['cart'][$row['id']]['quantity']; ?>" name="quantity[<?php echo $row['id']; ?>]">

                                                            </div>
                                                        </td>
                                                        <td class="cart-size item"><span class="cart-size item"><?php echo $row['id'] +  $row['size']?></span>
                                                        </td>
                                                        <td class="cart-product-sub-total"><span class="cart-sub-total-price"><?php echo $row['productPrice'] . " VND"; ?></span>
                                                        </td>
                                                        <td class="cart-product-grand-total"><span class="cart-grand-total-price"><?php echo ($_SESSION['cart'][$row['id']]['quantity'] * $row['productPrice'] + $row['shippingCharge']) . " VND"; ?></span>
                                                        </td>
                                                        <td class="remove-item">
                                                            <a href="my-cart.php?action=remove&id=<?php echo $row["id"]; ?>" class="btnRemoveAction"><img src="img/icon-delete.png" alt="Remove Item" /></a>
                                                        </td>
                                                    </tr>

                                            <?php }
                                            }
                                            $_SESSION['pid'] = $pdtid;
                                            ?>

                                        </tbody><!-- /tbody -->
                                    </table><!-- /table -->

                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 cart-shopping-total pull-right">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>

                                        <div class="cart-grand-total">
                                            TỔng Tiền: <span class="inner-left-md"><?php echo $_SESSION['tp'] = "$totalprice" . " VND"; ?></span>
                                        </div>
                                    </th>
                                </tr>
                            </thead><!-- /thead -->
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="cart-checkout-btn pull-right">
                                            <button type="submit" name="ordersubmit" class="btn btn-primary">Thanh Toán</button>

                                        </div>
                                    </td>
                                </tr>
                            </tbody><!-- /tbody -->
                        </table>
                    <?php } else {
                                    echo "Không có sản phẩm nào.";
                                } ?>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>

    <?php include('includes/footer.php'); ?>

    <script src="assets/js/jquery-1.11.1.min.js"></script>

    <script src="assets/js/bootstrap.min.js"></script>

    <script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>

    <script src="assets/js/echo.min.js"></script>
    <script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/bootstrap-slider.min.js"></script>
    <script src="assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/scripts.js"></script>

    <!-- For demo purposes – can be removed on production -->

    <script src="switchstylesheet/switchstylesheet.js"></script>

    <script>
        $(document).ready(function() {
            $(".changecolor").switchstylesheet({
                seperator: "color"
            });
            $('.show-theme-options').click(function() {
                $(this).parent().toggleClass('open');
                return false;
            });
        });

        $(window).bind("load", function() {
            $('.show-theme-options').delay(2000).trigger('click');
        });
    </script>
    <!-- For demo purposes – can be removed on production : End -->
</body>

</html>