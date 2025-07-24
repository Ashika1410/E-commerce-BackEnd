-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2025 at 11:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartID` int(255) NOT NULL,
  `productID` int(255) NOT NULL,
  `Quantity` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartID`, `productID`, `Quantity`) VALUES
(86, 87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(255) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_imgSrc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `category_name`, `category_description`, `category_imgSrc`) VALUES
(1, 'Creative Potraites', 'Different types of potraites an wall pictures', 'https://i.etsystatic.com/31618099/r/il/3eceb8/5548664505/il_794xN.5548664505_ib2y.jpg'),
(2, 'Birthday Gifts', 'All kinds of birthday gifts', 'https://i.etsystatic.com/16578798/r/il/4fe088/2510454746/il_794xN.2510454746_q3fe.jpg'),
(3, 'Wedding Gifts', 'All kinds of wedding gifts', 'https://i.etsystatic.com/28614761/r/il/6d5bc9/4807200773/il_794xN.4807200773_g28n.jpg'),
(4, 'Home Gifts', 'All kinds of House decoration products', 'https://i.etsystatic.com/49523173/c/1329/1329/361/481/il/39bf16/6387404066/il_170x135.6387404066_olck.jpg'),
(5, 'Garden and Floral Gifts', 'Garden decorators and planting eqipments', 'https://i.etsystatic.com/16555624/c/1639/1301/112/541/il/9ee34f/4407428528/il_340x270.4407428528_nmcn.jpg'),
(6, 'Baby Gifts', 'Dresses,gifts and accesiories for new born babies', 'https://i.etsystatic.com/38492349/r/il/cfe979/6326225670/il_794xN.6326225670_8ojg.jpg'),
(7, 'Anniversary Gifts', 'Tall slender porcelain bottle with natural clay textured body and cork stopper.', 'https://i.etsystatic.com/51757054/r/il/725b8e/6241710457/il_794xN.6241710457_pbfd.jpg'),
(8, 'Gifts for Him', 'Tall slender porcelain bottle with natural clay textured body and cork stopper.', 'https://i.etsystatic.com/28180041/r/il/2f3a61/5466266289/il_794xN.5466266289_9uyu.jpg'),
(9, 'Gifts for Her', 'Tall slender porcelain bottle with natural clay textured body and cork stopper.', 'https://i.etsystatic.com/51464338/r/il/99f64f/6638267541/il_794xN.6638267541_hupq.jpg'),
(10, 'Personalised Gift Ideas', 'Tall slender porcelain bottle with natural clay textured body and cork stopper.', 'https://i.etsystatic.com/20595428/r/il/7d6737/4040126572/il_794xN.4040126572_akxy.jpg'),
(11, 'Wedding Gifts Ideas', 'Tall slender porcelain bottle with natural clay textured body and cork stopper.', 'https://i.etsystatic.com/51351279/r/il/ce3703/6305195807/il_794xN.6305195807_9a6b.jpg'),
(12, 'ThreadsofindiaArt', 'Tall slender porcelain bottle with natural clay textured body and cork stopper.', 'https://i.etsystatic.com/49172423/r/il/ea6a3b/6221926698/il_300x300.6221926698_j1d6.jpg'),
(13, 'Thefantasystitch', 'Tall slender porcelain bottle with natural clay textured body and cork stopper.', 'https://i.etsystatic.com/49172423/c/2518/1999/0/0/il/30ee5e/6241561307/il_300x300.6241561307_lgef.jpg'),
(14, 'ShivaniPatelArt', 'Tall slender porcelain bottle with natural clay textured body and cork stopper.', 'https://i.etsystatic.com/43072277/r/il/99d127/5410012265/il_794xN.5410012265_dycx.jpg'),
(15, '9 Comfy Throws for Cosy Autumn Vibes', 'Embrace the snuggling season with stylish throws that will warm your hearts.', 'https://i.etsystatic.com/inv/f73b3c/5461598354/inv_fullxfull.5461598354_nv8rwpe2.jpg?version=0'),
(16, '14 Beautiful Bags That Express Your Unique Style', 'Amp up your fashion game with bags that perfectly match your aesthetic.', 'https://i.etsystatic.com/inv/1b86b2/5514321927/inv_fullxfull.5514321927_50cniifw.jpg?version=0'),
(17, 'The Best Gift Ideas for Kids of All Ages', 'Shop the sweetest surprises for all little ones in your family–these gifts for kids will definitely earn you some brownie points.', 'https://i.etsystatic.com/inv/0c0724/5507381345/inv_fullxfull.5507381345_8imomvyj.jpg?version=0');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(255) NOT NULL,
  `orderQuantity` int(255) DEFAULT NULL,
  `orderTotal` int(255) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `userID` int(255) DEFAULT NULL,
  `productID` int(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `orderQuantity`, `orderTotal`, `orderDate`, `deliveryDate`, `userID`, `productID`, `payment_method`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 689, '0000-00-00', '0000-00-00', 4, 9, 'G-Pay');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(255) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_imgSrc` varchar(255) DEFAULT NULL,
  `product_price` int(255) DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `product_vendors` varchar(255) DEFAULT NULL,
  `categoryID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `product_name`, `product_imgSrc`, `product_price`, `product_description`, `product_vendors`, `categoryID`) VALUES
(1, 'Fine Art Ceramics', 'https://i.etsystatic.com/14575056/c/727/727/71/0/il/3d184d/2376694449/il_312x312.2376694449_fwyg.jpg', 3500, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'Ad by LeroyMakesThings', '1'),
(2, 'Needle Felted Animal', 'https://i.etsystatic.com/5438394/r/il/9bb4e1/5774984899/il_312x312.5774984899_5ra9.jpg', 4500, 'Irresistible worth! This clipart collection includes 10 images to give you the best value for your money. Clipart bundle will be perfect for a variety of your creative projects - nursery wall art or decor, junk journals, greeting cards, invitations, print', 'Ad by JAKEARTSHOPS', '1'),
(3, 'Mixed Media & Collage', 'https://i.etsystatic.com/13701209/c/2250/2250/0/298/il/cd5c4c/1378217145/il_312x312.1378217145_8xk8.jpg', 599, 'Transform your space with our Custom Guest Check Wall Print, a heartfelt piece of personalized wall art designed to capture the essence of your favorite city—perfect for adding a unique touch to your home or office. Celebrate cherished memories and invite', 'TheSquareToSpare', '1'),
(5, 'Fiber Art', 'https://i.etsystatic.com/5835642/r/il/f22361/4803308264/il_312x312.4803308264_mzo0.jpg', 999, 'Irresistible worth! This clipart collection includes 12 images to give you the best value for your money. Clipart bundle will be perfect for a variety of your creative projects - nursery wall art or decor, junk journals, greeting cards, invitations, print', 'DreamKrafter', '1'),
(6, 'Sewing & Fiber', 'https://i.etsystatic.com/5154892/c/2075/2075/44/256/il/76c4d9/2668994916/il_312x312.2668994916_jlp8.jpg', 499, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'Ad by AngelKnitGift', '1'),
(7, 'Sculpting & Forming', 'https://i.etsystatic.com/22655092/c/2266/2266/0/734/il/3abe64/4910557295/il_312x312.4910557295_d8fb.jpg', 3450, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'VanGaurdPrint', '1'),
(8, 'Artist Trading Cards', 'https://i.etsystatic.com/5926119/c/1275/1275/0/0/il/9d1b70/1931813040/il_312x312.1931813040_ihjr.jpg', 1199, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'Ad by OrionArtsandCraft', '1'),
(9, 'Prints', 'https://i.etsystatic.com/7923668/c/998/998/1/0/il/3e9953/1440705435/il_312x312.1440705435_ec5o.jpg', 689, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'Ad by Goldleafking', '1'),
(10, 'Sculpture', 'https://i.etsystatic.com/5291835/c/978/978/0/0/il/69c5d4/3491850470/il_312x312.3491850470_ksy0.jpg', 2599, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'YanwwShop', '1'),
(11, 'Glass Art', 'https://i.etsystatic.com/11991447/c/426/426/0/32/il/a3bd71/2751062303/il_312x312.2751062303_92dj.jpg', 999, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'Ad by FireLifeGlass', '1'),
(12, 'Drawing & Illustration', 'https://i.etsystatic.com/14409281/r/il/e81b60/4651013203/il_312x312.4651013203_2j18.jpg', 2299, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'SaraAmazing', '1'),
(13, 'Photography', 'https://i.etsystatic.com/7293334/r/il/570077/1116708324/il_312x312.1116708324_dtad.jpg', 599, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'Ad by OnReflectionScopes', '1'),
(14, 'Collectibles', 'https://i.etsystatic.com/28239647/r/il/7e7b9c/4316976210/il_312x312.4316976210_6hok.jpg', 6783, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'Ad by RenArtPrints', '1'),
(15, 'Art Objects', 'https://i.etsystatic.com/6793590/r/il/6dfc5e/1805289725/il_312x312.1805289725_pipp.jpg', 782, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'Ad by ArtsFezShop', '1'),
(16, 'Home & Hobby', 'https://i.etsystatic.com/6891160/r/il/ae9b6c/3074509628/il_312x312.3074509628_7o85.jpg', 6754, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'Ad by StreamWidgetShop', '1'),
(17, 'Mid Century Modern Art Print', 'https://i.etsystatic.com/33729276/c/840/840/61/109/il/76f1e3/6039426055/il_600x600.6039426055_51zc.jpg', 350, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'Black', '3'),
(18, 'Mid Century Modern Art Print', 'https://i.etsystatic.com/15139720/r/il/168543/5330257292/il_600x600.5330257292_avd9.jpg', 578, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(19, 'Mid Century Modern Art Print', 'https://i.etsystatic.com/47348932/r/il/125f17/5688710283/il_600x600.5688710283_cgkj.jpg', 450, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(20, 'Mid Century Modern Art Print', 'https://i.etsystatic.com/35231780/r/il/c8663e/4943946732/il_600x600.4943946732_j7mb.jpg', 2459, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(21, 'Mid Century Modern Art Print', 'https://i.etsystatic.com/23524437/r/il/b9f38f/5736996594/il_600x600.5736996594_103o.jpg', 578, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(22, 'Mid Century Modern Art Print', 'https://i.etsystatic.com/25506271/r/il/ff511d/4897024496/il_600x600.4897024496_ij2u.jpg', 450, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'PeachPenguinCrochet', '3'),
(23, 'Mid Century Modern Art Print', 'https://i.etsystatic.com/18125450/c/2016/2016/249/241/il/e5378c/5841089260/il_600x600.5841089260_2lnl.jpg', 2999, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(24, 'Neutral Modern Wall Art', 'https://i.etsystatic.com/35569337/c/2608/2608/390/391/il/931b29/5232265885/il_600x600.5232265885_kxc5.jpg', 578, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(25, 'Neutral Modern Wall Art', 'https://i.etsystatic.com/16578798/r/il/efe4cb/3387904323/il_600x600.3387904323_soo1.jpg', 3458, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'PeachPenguinCrochet', '3'),
(26, 'Neutral Modern Wall Art', 'https://i.etsystatic.com/9508515/r/il/0da806/5554905863/il_600x600.5554905863_22lj.jpg', 2459, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(27, 'Neutral Modern Wall Art', 'https://i.etsystatic.com/28614761/c/1978/1571/108/143/il/e24fdc/5157837722/il_340x270.5157837722_9vgi.jpg', 559, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(31, 'Boho Art Prints, Green, Black Rainbow Printables', 'https://i.etsystatic.com/28614761/c/2116/1680/77/212/il/33f1c8/5158026122/il_340x270.5158026122_rfst.jpg', 1499, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(32, 'Boho Art Prints, Green, Black Rainbow Printables', 'https://i.etsystatic.com/27233558/c/3000/2384/0/320/il/cf4e64/5062158626/il_340x270.5062158626_f0p4.jpg', 499, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(33, 'Boho Art Prints, Green, Black Rainbow Printables', 'https://i.etsystatic.com/13596232/c/2250/1788/0/740/il/72a9b0/3936751338/il_340x270.3936751338_scu3.jpg', 2599, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(34, 'Boho Art Prints, Green, Black Rainbow Printables', 'https://i.etsystatic.com/28614761/c/1838/1461/439/353/il/6d5bc9/4807200773/il_340x270.4807200773_g28n.jpg', 569, 'Bring a touch of springtime charm to your space with this delightful digital download of a calico cat gazing up at blooming cherry blossoms on a soft pastel pink background. Perfect for cat lovers and fans of Japanese-inspired artwork, this illustration c', 'PeachPenguinCrochet', '3'),
(35, 'Boho Art Prints, Green, Black Rainbow Printables', 'https://i.etsystatic.com/20641892/r/il/d5aa47/3742912928/il_340x270.3742912928_mq3y.jpg', 1199, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'PeachPenguinCrochet', '3'),
(36, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/22523134/r/il/a6abfb/4453660565/il_600x600.4453660565_h6ny.jpg', 459, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'Black', '4'),
(37, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/28045281/c/2607/2071/152/0/il/81cf95/5497274807/il_340x270.5497274807_gt8d.jpg', 425, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'AprilLaneArt', '4'),
(38, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/17860793/r/il/582f59/1766951619/il_340x270.1766951619_sww3.jpg', 799, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'AprilLaneArt', '4'),
(39, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/27231545/c/1785/1785/137/160/il/031139/4140718095/il_600x600.4140718095_mc7l.jpg', 959, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'AprilLaneArt', '4'),
(40, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/38492349/r/il/2c1248/4978584324/il_600x600.4978584324_erg3.jpg', 1259, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'AprilLaneArt', '4'),
(41, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/13699519/r/il/35d67d/3885228348/il_600x600.3885228348_onsc.jpg', 649, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'AprilLaneArt', '4'),
(42, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/41680084/r/il/f09928/5191407963/il_600x600.5191407963_rurr.jpg', 1269, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'AprilLaneArt', '4'),
(43, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/24657363/c/619/619/52/3/il/92960f/3810469116/il_600x600.3810469116_mj1u.jpg', 2599, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'AprilLaneArt', '4'),
(44, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/23326449/c/2000/2000/0/0/il/6d72c2/3883614573/il_600x600.3883614573_hhk4.jpg', 859, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'AprilLaneArt', '4'),
(45, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/20150800/r/il/4ac93d/5755299324/il_600x600.5755299324_rr3e.jpg', 1158, 'cheers print | bar cart wall decor | cheers sign | cheers printable wall art | bar cart accessories | bar cart art | digital downloadDIGITAL | Instantly DOWNLOAD and PRINT this printable wall art to give your wall decor a refresh. Printable art saves you ', 'AprilLaneArt', '4'),
(46, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/21495979/r/il/b46317/5507287651/il_600x600.5507287651_sdgv.jpg', 2457, 'Irresistible worth! This clipart collection includes 10 images to give you the best value for your money. Clipart bundle will be perfect for a variety of your creative projects - nursery wall art or decor, junk journals, greeting cards, invitations, print', 'Ad by JAKEARTSHOPS', '4'),
(47, 'Heart Candy Wall Art, Trendy Red', 'https://i.etsystatic.com/25455130/r/il/7f62a9/3173062614/il_600x600.3173062614_9pni.jpg', 757, 'Irresistible worth! This clipart collection includes 10 images to give you the best value for your money. Clipart bundle will be perfect for a variety of your creative projects - nursery wall art or decor, junk journals, greeting cards, invitations, print', 'Ad by JAKEARTSHOPS', '4'),
(48, 'Artist Trading Cards', 'https://i.etsystatic.com/23524437/c/1591/1591/285/1013/il/155e0b/3828695878/il_600x600.3828695878_9ccl.jpg', 998, 'Irresistible worth! This clipart collection includes 10 images to give you the best value for your money. Clipart bundle will be perfect for a variety of your creative projects - nursery wall art or decor, junk journals, greeting cards, invitations, print', 'Ad by JAKEARTSHOPS', '4'),
(49, 'Artist Trading Cards', 'https://i.etsystatic.com/49508217/r/il/a23c8d/5891400631/il_600x600.5891400631_dcor.jpg', 399, 'Irresistible worth! This clipart collection includes 10 images to give you the best value for your money. Clipart bundle will be perfect for a variety of your creative projects - nursery wall art or decor, junk journals, greeting cards, invitations, print', 'Ad by JAKEARTSHOPS', '4'),
(50, 'Artist Trading Cards', 'https://i.etsystatic.com/43447854/r/il/dcc5f3/5780637765/il_600x600.5780637765_7ln7.jpg', 2109, 'Irresistible worth! This clipart collection includes 10 images to give you the best value for your money. Clipart bundle will be perfect for a variety of your creative projects - nursery wall art or decor, junk journals, greeting cards, invitations, print', 'Ad by JAKEARTSHOPS', '4'),
(51, 'Artist Trading Cards', 'https://i.etsystatic.com/22039930/r/il/b855b8/4660372147/il_600x600.4660372147_t8y7.jpg', 1599, 'Irresistible worth! This clipart collection includes 10 images to give you the best value for your money. Clipart bundle will be perfect for a variety of your creative projects - nursery wall art or decor, junk journals, greeting cards, invitations, print', 'Ad by JAKEARTSHOPS', '4'),
(52, 'Sculpting & Forming', 'https://i.etsystatic.com/16555624/c/2654/2112/203/587/il/0cc058/5714817145/il_340x270.5714817145_ts9e.jpg', 499, 'Transform your space with our Custom Guest Check Wall Print, a heartfelt piece of personalized wall art designed to capture the essence of your favorite city—perfect for adding a unique touch to your home or office. Celebrate cherished memories and invite', 'VanGaurdPrint', '5'),
(53, 'Sculpting & Forming', 'https://i.etsystatic.com/16555624/c/1318/1049/544/880/il/dfbde0/5431836162/il_340x270.5431836162_kddh.jpg', 4599, 'Transform your space with our Custom Guest Check Wall Print, a heartfelt piece of personalized wall art designed to capture the essence of your favorite city—perfect for adding a unique touch to your home or office. Celebrate cherished memories and invite', 'VanGaurdPrint', '5'),
(54, 'Sculpting & Forming', 'https://i.etsystatic.com/18527364/c/1347/1069/368/701/il/7ec7f3/6133271181/il_340x270.6133271181_7flm.jpg', 3499, 'Transform your space with our Custom Guest Check Wall Print, a heartfelt piece of personalized wall art designed to capture the essence of your favorite city—perfect for adding a unique touch to your home or office. Celebrate cherished memories and invite', 'VanGaurdPrint', '5'),
(55, 'Sculpting & Forming', 'https://i.etsystatic.com/16555624/c/2970/2363/12/379/il/dad5f9/5772129770/il_340x270.5772129770_reer.jpg', 678, 'Transform your space with our Custom Guest Check Wall Print, a heartfelt piece of personalized wall art designed to capture the essence of your favorite city—perfect for adding a unique touch to your home or office. Celebrate cherished memories and invite', 'VanGaurdPrint', '5'),
(56, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/16555624/c/3000/3000/0/0/il/10be5d/5999037475/il_600x600.5999037475_fnt2.jpg', 678, 'Transform your space with our Custom Guest Check Wall Print, a heartfelt piece of personalized wall art designed to capture the essence of your favorite city—perfect for adding a unique touch to your home or office. Celebrate cherished memories and invite', 'JMHolidayPrintables', '5'),
(57, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/45851537/r/il/4dafd0/6090983216/il_600x600.6090983216_9bxc.jpg', 799, 'Transform your space with our Custom Guest Check Wall Print, a heartfelt piece of personalized wall art designed to capture the essence of your favorite city—perfect for adding a unique touch to your home or office. Celebrate cherished memories and invite', 'JMHolidayPrintables', '5'),
(58, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/18527364/c/2001/2001/485/0/il/e8ceda/4737228436/il_600x600.4737228436_3g1j.jpg', 849, 'Transform your space with our Custom Guest Check Wall Print, a heartfelt piece of personalized wall art designed to capture the essence of your favorite city—perfect for adding a unique touch to your home or office. Celebrate cherished memories and invite', 'JMHolidayPrintables', '5'),
(59, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/43681968/c/1503/1503/0/372/il/c8bbc8/4961218312/il_600x600.4961218312_y32z.jpg', 849, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'JMHolidayPrintables', '5'),
(60, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/24718094/c/2000/2000/0/288/il/d1c35e/5124816459/il_600x600.5124816459_su9o.jpg', 789, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'JMHolidayPrintables', '5'),
(61, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/10157315/r/il/24ff36/842134329/il_600x600.842134329_f5y6.jpg', 1279, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'JMHolidayPrintables', '5'),
(62, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/52658082/r/il/96a035/6150492961/il_600x600.6150492961_lktm.jpg', 2999, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'JMHolidayPrintables', '5'),
(63, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/52658082/r/il/96a035/6150492961/il_600x600.6150492961_lktm.jpg', 2999, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'JMHolidayPrintables', '5'),
(64, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/23099709/c/1869/1869/79/556/il/8ed578/5225417965/il_600x600.5225417965_8gtk.jpg', 1459, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'JMHolidayPrintables', '5'),
(65, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/22036630/r/il/5a83d3/5193805586/il_600x600.5193805586_o53n.jpg', 897, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'JMHolidayPrintables', '5'),
(66, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/51078394/r/il/20a2b5/5994195413/il_600x600.5994195413_fuhp.jpg', 2599, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'JMHolidayPrintables', '5'),
(67, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/21135980/c/1814/1814/201/744/il/109303/2469807287/il_600x600.2469807287_mpi2.jpg', 659, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'JMHolidayPrintables', '5'),
(68, 'Wall Art Bundle | Holiday Decor | Galentines Day', 'https://i.etsystatic.com/25548134/r/il/0bf0f1/5518108095/il_600x600.5518108095_i7sp.jpg', 949, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'JMHolidayPrintables', '5'),
(69, 'Earthen Bottle', 'https://i.etsystatic.com/43287139/r/il/923058/4957059299/il_340x270.4957059299_pugy.jpg', 1149, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(70, 'Nomad Tumbler', 'https://i.etsystatic.com/18017285/c/1538/1222/282/841/il/5edf47/2238527557/il_340x270.2238527557_8b0n.jpg', 825, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(71, 'Focus Paper Refill', 'https://i.etsystatic.com/38328798/c/2327/1848/194/0/il/cf8871/5211256491/il_340x270.5211256491_hs79.jpg', 1578, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(72, 'Machined Mechanical Pencil', 'https://i.etsystatic.com/41556400/r/il/a97dcd/4982004022/il_600x600.4982004022_khlq.jpg', 658, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(73, 'Machined Mechanical Pencil', 'https://i.etsystatic.com/37668583/c/2632/2632/0/60/il/f7d30b/5566701386/il_600x600.5566701386_ad7k.jpg', 2549, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(74, 'Machined Mechanical Pencil', 'https://i.etsystatic.com/41680084/r/il/f09928/5191407963/il_600x600.5191407963_rurr.jpg', 785, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(75, 'Machined Mechanical Pencil', 'https://i.etsystatic.com/34379934/c/2000/2000/0/0/il/628644/4796937795/il_600x600.4796937795_qnr6.jpg', 1125, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(76, 'Machined Mechanical Pencil', 'https://i.etsystatic.com/50851922/r/il/261536/6121875795/il_600x600.6121875795_mggf.jpg', 2999, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(77, 'Nomad Tumbler', 'https://i.etsystatic.com/27231545/c/1785/1785/137/160/il/031139/4140718095/il_600x600.4140718095_mc7l.jpg', 459, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(78, 'Nomad Tumbler', 'https://i.etsystatic.com/39440594/c/2291/1823/331/126/il/27ae2a/5959779356/il_340x270.5959779356_s6k0.jpg', 799, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(79, 'Nomad Tumbler', 'https://i.etsystatic.com/45349016/c/1736/1736/743/188/il/542fab/5278686276/il_600x600.5278686276_lmx4.jpg', 999, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(80, 'Nomad Tumbler', 'https://i.etsystatic.com/12096010/c/2380/2380/325/437/il/d9efad/5730423983/il_600x600.5730423983_9fd9.jpg', 1299, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'LittleLadyPrintShop', '2'),
(81, 'Nomad Tumbler', 'https://i.etsystatic.com/28614761/c/2400/2400/353/0/il/663972/5157830682/il_600x600.5157830682_w2wd.jpg', 1677, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'Hand Holdi', '2'),
(82, 'Nomad Tumbler', 'https://i.etsystatic.com/24136697/r/il/e0169a/5854409293/il_600x600.5854409293_m2nr.jpg', 2597, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'Hand Holdi', '2'),
(83, 'Nomad Tumbler', 'https://i.etsystatic.com/41680084/r/il/28f1d6/5529593944/il_600x600.5529593944_ie78.jpg', 899, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'Hand Holdi', '2'),
(84, 'Machine Mechanical Pencil', 'https://i.etsystatic.com/26908095/c/2025/2025/317/0/il/660a0b/5009305023/il_600x600.5009305023_4l8y.jpg', 998, 'This is a hand shaped ceramic arctic fox figurine. I shaped it in my hand without mold. That is why it is different and unique.I used white clay for this one which is one of my favorite clays. It looks very beautiful with like these blazing colors.', 'Hand Holdi', '2'),
(85, 'My Happy Place Print ~ Red Poster ~ Aesthetic', 'https://i.etsystatic.com/54713304/r/il/4ea1a2/6312076608/il_600x600.6312076608_egmd.jpg', 599, 'Neon signs are hand-made products made up of LED strips, silicon flex tubes, and acrylic shape. Neon signs are the best type of decoration for homes, weddings, shops, offices, etc as well as they are much liked as a gift that can be gifted to anyone such ', 'HBlack', '6'),
(86, 'Name Neon Sign, Custom Neon Sign, Neon Sign', 'https://i.etsystatic.com/52310025/r/il/bd07ad/6159120315/il_600x600.6159120315_4h7u.jpg', 879, 'Neon signs are hand-made products made up of LED strips, silicon flex tubes, and acrylic shape. Neon signs are the best type of decoration for homes, weddings, shops, offices, etc as well as they are much liked as a gift that can be gifted to anyone such ', 'HBlack', '6'),
(87, 'Name Neon Sign, Custom Neon Sign, Neon Sign', 'https://i.etsystatic.com/27857653/c/2000/2000/0/603/il/0a04fb/5370596805/il_600x600.5370596805_rsxu.jpg', 6743, 'Elevate your style with this heart pendant crystal choker and matching dangle heart earrings. The toggle necklace features a delicate crystal design, while the heart hoop earrings add a touch of elegance to this fine handmade jewelry set, perfect for any ', 'AliceWallArt is a Star Seller!', '6'),
(88, 'Heart Pendant Crystal Choker', 'https://i.etsystatic.com/52020388/c/1724/1724/128/69/il/d7d67a/6452690491/il_600x600.6452690491_mjar.jpg', 949, 'Elevate your style with this heart pendant crystal choker and matching dangle heart earrings. The toggle necklace features a delicate crystal design, while the heart hoop earrings add a touch of elegance to this fine handmade jewelry set, perfect for any ', 'AliceWallArt is a Star Seller!', '6'),
(89, ' Dangle Heart Earrings, Dainty Toggle Necklace, Fine Jewelry Set, Girlfriend Valentine Gift', 'https://i.etsystatic.com/27235619/c/2400/2400/370/0/il/34ed7e/5303210657/il_600x600.5303210657_mrtd.jpg', 1299, 'This dainty necklace and earring set is a thoughtful Valentine gift for a loved one. Whether for a girlfriend, wife, or someone special, its timeless design and romantic details make it an unforgettable way to show your love and appreciation.', 'AliceWallArt is a Star Seller!', '6'),
(90, ' Dangle Heart Earrings, Dainty Toggle Necklace, Fine Jewelry Set, Girlfriend Valentine Gift', 'https://i.etsystatic.com/26836482/c/2250/2250/376/0/il/b95124/4195041946/il_600x600.4195041946_ma1p.jpg', 549, 'This dainty necklace and earring set is a thoughtful Valentine gift for a loved one. Whether for a girlfriend, wife, or someone special, its timeless design and romantic details make it an unforgettable way to show your love and appreciation.', 'AliceWallArt is a Star Seller!', '6'),
(91, 'Custom Neon Sign, Wedding Neon Sign, Neon Signs, Personalized Gifts', 'https://i.etsystatic.com/18547159/r/il/d7dec7/4294190396/il_600x600.4294190396_41t9.jpg', 549, 'The price displayed i.e. 9$ is only a deposit price since each and every sign\'s cost depends upon the options our customer\'s choose. Feel free to send us your neon sign details (text, font and color) via Etsy message so we can send you a visual of your si', 'AliceWallArt is a Star Seller!', '6'),
(92, 'Custom Neon Sign, Wedding Neon Sign, Neon Signs, Personalized Gifts', 'https://i.etsystatic.com/33092522/r/il/f532d3/4717063936/il_600x600.4717063936_dgfs.jpg', 2459, 'The price displayed i.e. 9$ is only a deposit price since each and every sign\'s cost depends upon the options our customer\'s choose. Feel free to send us your neon sign details (text, font and color) via Etsy message so we can send you a visual of your si', 'AliceWallArt is a Star Seller!', '6'),
(93, 'My Happy Place Print ~ Red Poster ~ Aesthetic', 'https://i.etsystatic.com/53580386/r/il/142b05/6315759815/il_600x600.6315759815_fwlm.jpg', 2459, 'The price displayed i.e. 9$ is only a deposit price since each and every sign\'s cost depends upon the options our customer\'s choose. Feel free to send us your neon sign details (text, font and color) via Etsy message so we can send you a visual of your si', 'AliceWallArt is a Star Seller!', '6'),
(94, 'My Happy Place Print ~ Red Poster ~ Aesthetic', 'https://i.etsystatic.com/7108198/r/il/9219bc/1265670687/il_600x600.1265670687_c42y.jpg', 789, 'The price displayed i.e. 9$ is only a deposit price since each and every sign\'s cost depends upon the options our customer\'s choose. Feel free to send us your neon sign details (text, font and color) via Etsy message so we can send you a visual of your si', 'AliceWallArt is a Star Seller!', '6'),
(95, 'My Happy Place Print ~ Red Poster ~ Aesthetic', 'https://i.etsystatic.com/27857653/r/il/425a63/5321986132/il_600x600.5321986132_6dcq.jpg', 949, 'The price displayed i.e. 9$ is only a deposit price since each and every sign\'s cost depends upon the options our customer\'s choose. Feel free to send us your neon sign details (text, font and color) via Etsy message so we can send you a visual of your si', 'AliceWallArt is a Star Seller!', '6'),
(96, 'Leather engraving service , Leather embossing service , Personalized leather goods gift', 'https://i.etsystatic.com/28485446/c/2096/2096/0/16/il/774675/5577796347/il_600x600.5577796347_3t7r.jpg', 1299, 'Get your neon sign customized for whatever purpose you want as we can make your neon sign according to the instruction you provide us to complete the cause you are buying it. The neon signs we make can be customized the way you want it either you want it ', 'ManhattanNeons is a Star Seller!', '6'),
(97, 'Leather engraving service , Leather embossing service , Personalized leather goods gift', 'https://i.etsystatic.com/19863586/r/il/546f30/5506333630/il_600x600.5506333630_f8nb.jpg', 2459, 'Get your neon sign customized for whatever purpose you want as we can make your neon sign according to the instruction you provide us to complete the cause you are buying it. The neon signs we make can be customized the way you want it either you want it ', 'ManhattanNeons is a Star Seller!', '6'),
(98, 'Leather engraving service , Leather embossing service , Personalized leather goods gift', 'https://i.etsystatic.com/37917289/r/il/c9f45d/5947416433/il_600x600.5947416433_q56e.jpg', 987, 'Get your neon sign customized for whatever purpose you want as we can make your neon sign according to the instruction you provide us to complete the cause you are buying it. The neon signs we make can be customized the way you want it either you want it ', 'ManhattanNeons is a Star Seller!', '6'),
(99, 'DMleatherStudio', 'https://i.etsystatic.com/53626194/r/il/73cf17/6171367464/il_600x600.6171367464_1bvx.jpg', 1599, '☛ This is a listing that just show you some great images you could add it to your leather goods .Please do NOT order it directly , thank you. ☛ We could engrave these great images ,text or your initial to our leather goods, you also could send your compan', 'ManhattanNeons is a Star Seller!', '6'),
(100, 'DMleatherStudio', 'https://i.etsystatic.com/8537372/c/2019/2019/171/337/il/b4479f/6443201981/il_600x600.6443201981_fatu.jpg', 987, '☛ This is a listing that just show you some great images you could add it to your leather goods .Please do NOT order it directly , thank you. ☛ We could engrave these great images ,text or your initial to our leather goods, you also could send your compan', 'ManhattanNeons is a Star Seller!', '6');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewID` int(255) DEFAULT NULL,
  `product_review` varchar(255) DEFAULT NULL,
  `product_rating` varchar(255) DEFAULT NULL,
  `productID` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `PhoneNumber` int(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `FirstName`, `LastName`, `Email`, `Password`, `PhoneNumber`, `Address`) VALUES
(2, 'anu768', 'Anu', 'Sree', 'anu@gmail.com', '$2b$10$I3FVkSA0uoIs10aqiOnPNu/T4BHraXPNuqXlPCzZ/czbOWM1MZfxa', 2147483647, 'Nagercoil, Kanyakumari, 684503'),
(4, 'ashi1410', 'Ashika', 'M', 'ashika04m@gmail.com', '$2b$10$u/GReGvVH/enD88jAY2RYeWNBulYRiX9XJZMOWgDv8sk5UGgXUSTm', 2147483647, 'kurunthen code');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlistID` int(255) NOT NULL,
  `productID` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlistID`, `productID`) VALUES
(3, 70),
(4, 76);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`),
  ADD KEY `FK_CartProducts` (`productID`) USING BTREE;

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlistID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlistID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_CartProducts` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
