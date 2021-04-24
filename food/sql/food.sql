-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 12, 2020 at 10:08 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `deleted`) VALUES
(1, 'Rice Sambhar', 25, 1),
(2, 'Aloo paratha', 30, 0),
(3, 'Poori Cholle', 45, 0),
(5, 'Rajma Chawal', 25, 0),
(6, 'Gobi Manchurian', 30, 0),
(7, 'Paneer Paratha', 35, 0),
(8, 'Paneer Manchurian', 30, 0),
(9, 'Butter Naan', 20, 0),
(10, 'Hakka Noodles', 30, 0),
(11, 'Baby Corn Fry', 35, 0),
(12, 'Aloo bajji', 30, 0),
(13, 'Idli Sambhar', 35, 0),
(14, 'Masala Dosa', 25, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_type` varchar(16) NOT NULL DEFAULT 'Wallet',
  `total` int(11) NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'Yet to be delivered',
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `description`, `date`, `payment_type`, `total`, `status`, `deleted`) VALUES
(1, 12, 'Whitefield', '', '2017-03-28 17:32:41', 'Wallet', 150, 'Yet to be delivered', 0),
(2, 12, 'Whitefield', '', '2017-03-28 17:43:05', 'Wallet', 130, 'Cancelled by Customer', 1),
(3, 3, 'Malleshwaram', 'Food not delivered', '2017-03-28 19:49:33', 'Cash On Delivery', 130, 'Delivered', 0),
(4, 3, 'Malleshwaram', 'Awaiting reply', '2017-03-28 19:52:01', 'Cash On Delivery', 130, 'Cancelled by Customer', 1),
(5, 3, 'Malleshwaram', 'Please serve hot', '2017-03-28 20:47:28', 'Wallet', 285, 'Paused', 0),
(6, 3, 'Malleshwaram', '', '2017-03-30 00:43:31', 'Wallet', 325, 'Cancelled by Customer', 1),
(7, 3, 'Malleshwaram', '', '2020-04-09 00:11:35', 'Cash On Delivery', 130, 'Delivered', 0),
(8, 3, 'Malleshwaram', '', '2020-04-12 00:57:58', 'Wallet', 95, 'Yet to be delivered', 0),
(9, 9, 'Sanjaynagar', '', '2020-04-12 01:13:59', 'Wallet', 30, 'Yet to be delivered', 0),
(10, 13, 'Yeshwanthpur', '', '2020-04-12 01:19:19', 'Wallet', 195, 'Yet to be delivered', 0),
(11, 13, 'Yeshwanthpur', '', '2020-04-12 01:22:57', 'Wallet', 90, 'Yet to be delivered', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `item_id`, `quantity`, `price`) VALUES
(1, 1, 2, 2, 90),
(2, 1, 3, 3, 60),
(3, 2, 2, 2, 90),
(4, 2, 3, 2, 40),
(5, 3, 2, 2, 90),
(6, 3, 3, 2, 40),
(7, 4, 2, 2, 90),
(8, 4, 3, 2, 40),
(9, 5, 2, 5, 225),
(10, 5, 3, 2, 40),
(11, 5, 5, 1, 20),
(12, 6, 2, 5, 225),
(13, 6, 3, 3, 60),
(14, 6, 5, 2, 40),
(15, 7, 12, 1, 30),
(16, 7, 2, 1, 30),
(17, 7, 11, 2, 70),
(18, 8, 12, 1, 30),
(19, 8, 2, 1, 30),
(20, 8, 11, 1, 35),
(21, 9, 12, 1, 30),
(22, 10, 12, 1, 30),
(23, 10, 2, 2, 60),
(24, 10, 11, 3, 105),
(25, 11, 12, 2, 60),
(26, 11, 2, 1, 30);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'Open',
  `type` varchar(30) NOT NULL DEFAULT 'Others',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `poster_id`, `subject`, `description`, `status`, `type`, `date`, `deleted`) VALUES
(2, 7, 'HAVING ISSUES WITH WEBSITE', 'Some features of website not working', 'Closed', 'Support', '2020-04-12 12:07:36', 0),
(3, 7, 'SERVICE NEEDED!!', 'Service guys still havent come', 'Open', 'Support', '2020-04-12 12:13:16', 0),
(4, 9, 'FOOD NOT GETTING DELIVERED ON TIME.', 'This is with respect to the order i made a week ago. I still havent received the parcel.', 'Answered', 'Complaint', '2020-04-12 12:25:48', 0),
(5, 9, 'NOT ABLE TO ORDER FOOD IN BULK', 'Wanted to order for a party but couldnt do so. Please extend your limit for the number of items.', 'Answered', 'Others', '2020-04-12 12:27:07', 0),
(6, 13, 'EXTRA CASH TAKEN BY DELIVERY BOY', 'This is with respect to the order i made yesterday. The delivery boy took more cash than was needed . Please look into the matter.', 'Answered', 'Payment', '2020-04-12 12:33:24', 0),
(7, 9, 'QUALITY OF FOOD DETERIORATING!!', 'I have been your regular customer for many months now and i have observed that the quality of your food has been getting worse over the months. Its not as tasty as it was before.Please look into this issue.', 'Answered', 'Complaint', '2020-04-12 12:40:14', 0),
(8, 13, 'LESSER QUANTITY IN FOOD', 'I had ordered Puri chhole a couple of days back and the quantity of chhole in the food was just shocking. It wasnt even sufficient for one puri.', 'Open', 'Complaint', '2020-04-12 12:47:52', 0),
(9, 12, 'QUALITY OF FOOD IS DISGUSTING', 'The Rajma Chawal ordered today had ants in it!! Yes, ants! Im astonished that a delivery service like yours can be so careless! Kindly look into the matter.', 'Open', 'Complaint', '2020-04-12 12:52:12', 0),
(10, 12, 'BETTER CONTAINERS PLEASE!!', 'This is just a humble request from someone who has been a fan of your food for such a long time.', 'Closed', 'Others', '2020-04-12 13:00:18', 0),
(11, 13, 'FASTER SERVICE PLEASE', 'Although your delivery service is great, I request your team to kindly make the service faster. Most of the time the food becomes cold before it can reach our house.', 'Answered', 'Others', '2020-04-12 13:02:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`id`, `ticket_id`, `user_id`, `description`, `date`) VALUES
(5, 2, 7, 'Some features of website not working', '2020-04-12 12:07:36'),
(6, 3, 7, 'Service guys still havent come', '2020-04-12 12:13:16'),
(7, 4, 9, 'This is with respect to the order i made a week ago. I still havent received the parcel.', '2020-04-12 12:25:48'),
(8, 5, 9, 'Wanted to order for a party but couldnt do so. Please extend your limit for the number of items.', '2020-04-12 12:27:07'),
(9, 6, 13, 'This is with respect to the order i made yesterday. The delivery boy took more cash than was needed . Please look into the matter.', '2020-04-12 12:33:24'),
(10, 7, 9, 'I have been your regular customer for many months now and i have observed that the quality of your food has been getting worse over the months. Its not as tasty as it was before.Please look into this issue.', '2020-04-12 12:40:14'),
(11, 8, 13, 'I had ordered Puri chhole a couple of days back and the quantity of chhole in the food was just shocking. It wasnt even sufficient for one puri.', '2020-04-12 12:47:52'),
(12, 9, 12, 'The Rajma Chawal ordered today had ants in it!! Yes, ants! Im astonished that a delivery service like yours can be so careless! Kindly look into the matter.', '2020-04-12 12:52:12'),
(13, 10, 12, 'This is just a humble request from someone who has been a fan of your food for such a long time.', '2020-04-12 13:00:19'),
(14, 11, 13, 'Although your delivery service is great, I request your team to kindly make the service faster. Most of the time the food becomes cold before it can reach our house.', '2020-04-12 13:02:09'),
(15, 2, 1, 'Sorry to hear that sir. We are working on the update for this website and therefore the customers might face a few bugs. We assure you that we will fix this issue soon.', '2020-04-12 13:07:38'),
(16, 4, 1, 'Hello sir , we have looked into the matter and apologize for our mistake', '2020-04-12 13:12:36'),
(17, 7, 1, 'We are sorry to hear that sir. We have constantly tried to keep our customers happy and will continue to do so. ', '2020-04-12 13:13:30'),
(18, 6, 1, 'We condemn just cheap behaviour on our part. We have received the details of the delivery boy and are questioning him. There will be no compromise on our part.', '2020-04-12 13:14:37'),
(19, 5, 1, 'Im sorry sir but this is because we have limited the purchase of food to just 10 per item. Kindly cooperate.', '2020-04-12 13:15:37'),
(20, 11, 1, 'Thank you for your feedback sir. Sometimes the delivery is delayed because of factors like traffic or bad weather. We will continue to provide good and faster service.', '2020-04-12 13:16:45'),
(21, 10, 1, 'Thank you for your valuable feedback sir. We have made a decision to provide better containers and packets for delivery. ', '2020-04-12 13:17:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(15) NOT NULL DEFAULT 'Customer',
  `name` varchar(15) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact` bigint(11) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `username`, `password`, `email`, `address`, `contact`, `verified`, `deleted`) VALUES
(1, 'Administrator', 'Anushka', 'anushka', 'toor', 'anushka@gmail.com', 'Vidyaranyapura', 6363939844, 1, 0),
(2, 'Administrator', 'Aniket', 'aniket', 'pass1', 'aniket@gmail.com', 'Yelahanka', 7658493788, 1, 0),
(3, 'Customer', 'Harshith', 'harshith', 'pass2', 'harshith@gmail.com', 'Malleshwaram', 7684593567, 1, 0),
(4, 'Customer', 'Vishwas', 'vishwas', 'pass3', 'vishwas@gmail.com', 'R.T Nagar', 6584950345, 0, 0),
(5, 'Customer', 'Arvind', 'arvind', 'pass4', 'arvind2gmail.com', 'R.T Nagar', 9654745355, 0, 1),
(6, 'Customer', 'Siddharth', 'siddharth', 'pass5', 'sid@gmail.com', 'Yelahanka', 9456738456, 0, 0),
(7, 'Customer', 'Harsh', 'harsh', 'pass6', 'harsh@gmail.com', 'Yelahanka', 9456374567, 1, 0),
(8, 'Customer', 'Anisha', 'anisha', 'pass7', 'anisha@gmail.com', 'Rajajinagar', 6758435678, 0, 0),
(9, 'Customer', 'Kaushik', 'kaushik', 'pass8', 'kaushik@gmail.com', 'Sanjaynagar', 9456372867, 1, 0),
(10, 'Customer', 'Saranjana', 'saranjana', 'pass9', 'saru@gmail.com', 'Malleshwaram', 9456375678, 0, 0),
(11, 'Customer', 'Abhyuddhay', 'abhyudhhay', 'pass10', 'abhyudhhay@gmail.com', 'Kavalbyrasandra', 9567493456, 1, 0),
(12, 'Customer', 'Randhir', 'randhir', 'pass11', 'randhir@gmail.com', 'Whitefield', 9567483456, 1, 0),
(13, 'Customer', 'Amith', 'amith', 'pass12', 'amith@gmail.com', 'Yeshwanthpur', 7456378564, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `customer_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_details`
--

CREATE TABLE `wallet_details` (
  `id` int(11) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `number` varchar(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `balance` int(11) NOT NULL DEFAULT 2000
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet_details`
--

INSERT INTO `wallet_details` (`id`, `wallet_id`, `number`, `cvv`, `balance`) VALUES
(1, 1, '6155247490533921', 983, 3430),
(2, 2, '1887587142382050', 772, 1850),
(3, 3, '4595809639046830', 532, 1490),
(4, 4, '5475856443351234', 521, 2000),
(5, 5, '9076633115663264', 229, 2000),
(6, 6, '4173873329737090', 338, 2000),
(7, 7, '9325208503169190', 584, 2000),
(8, 8, '1799434148526710', 258, 2000),
(9, 9, '5177597284504806', 474, 1970),
(10, 10, '1456639100432459', 949, 2000),
(11, 11, '6540157557971050', 861, 2000),
(12, 12, '6566046916491128', 713, 2000),
(13, 13, '8564756746574657', 657, 2500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallet_id` (`wallet_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ticket_details`
--
ALTER TABLE `ticket_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wallet_details`
--
ALTER TABLE `wallet_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`poster_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD CONSTRAINT `wallet_details_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
