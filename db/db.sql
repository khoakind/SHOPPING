-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 18, 2021 lúc 05:08 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoryDescription` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Áo', 'Áo', '2017-01-24 19:17:37', '30-01-2017 12:22:24 AM'),
(2, 'Quần', 'Quần', '2017-01-24 19:19:32', ''),
(3, 'Giầy', 'Giầy', '2017-01-24 19:19:54', ''),
(4, 'Phụ Kiện', 'Phụ Kiện', '2017-02-20 19:18:52', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderStatus` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `review` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productCompany` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `productImage1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productImage2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productImage3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 1, 1, 'Áo Thun To The North 1464', 'North ', 139900, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-01-30 16:54:35', ''),
(2, 2, 2, 'Quần Jeans Simwood Denim 1389', 'Simwood', 36990, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-01-30 16:59:00', ''),
(3, 1, 1, 'Áo Thun SPORT 1443', 'SPORT', 10999, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:03:15', ''),
(4, 2, 2, 'Quần Jeans Simwood Denim 1390', 'Simwood', 9999, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:04:43', ''),
(5, 1, 1, 'Áo Thun Printed 1423', 'Printed ', 11999, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:06:17', ''),
(6, 2, 2, 'Quần Jeans Simwood Denim 1400', 'Simwood ', 6999, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:08:07', ''),
(7, 2, 2, 'Quần Jeans Simwood Denim 1389', 'Simwood', 7490, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:10:17', ''),
(8, 2, 2, 'Quần Jeans Simwood Denim 1432', 'Siwood', 14990, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:11:54', ''),
(9, 1, 1, 'Áo Thun Striped Horizontal 1400', 'Horizontal ', 259, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:17:03', ''),
(10, 1, 1, 'Áo Thun Liaoyongfie Ripped 1424', 'Ripped ', 19990, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:26:17', ''),
(11, 3, 3, 'Boots da nam cao cổ G - 2008\r\n', 'Boots', 10999, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:28:17', ''),
(12, 3, 3, 'Boots nam da lộn G - 880', 'Boots', 41990, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:30:24', ''),
(13, 3, 3, 'Giày da trắng nam G - 0997', 'G', 22990, 0, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:32:15', ''),
(14, 3, 3, '\r\nGiầy Da Nam GHL18 - 0442', 'G', 205, 250, NULL, 'img-1.jpg', 'img-2.jpg', 'img-3.jpg', 0, 'Còn hàng', '2017-02-04 04:35:13', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Áo Thun', '2017-01-26 16:24:52', '09-10-2021 08:58:25 PM'),
(2, 1, 'Áo Polo', '2017-01-26 16:29:09', '09-10-2021 08:57:29 PM'),
(3, 2, 'Quần Jean', '2017-01-30 16:55:48', '09-10-2021 08:56:49 PM'),
(4, 2, 'Quần Âu', '2017-02-04 04:12:40', '09-10-2021 08:56:54 PM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(28, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-18 11:51:00', NULL, 1),
(29, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-18 12:35:44', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingAddress` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingState` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingCity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingState` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingCity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(6, 'Dũng', 'demo@gmail.com', 12345, 'e2fc714c4727ee9395f324cd2e7f331f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-18 11:49:34', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
