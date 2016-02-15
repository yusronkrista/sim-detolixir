-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 15 Feb 2016 pada 16.28
-- Versi Server: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `start`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `auth_key` varchar(128) NOT NULL,
  `access_token` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password`, `auth_key`, `access_token`) VALUES
(1, 'admin', '3e513d62635b6697cc8c2d9b55d1968f7fe5b674', '1TViQ1tnQuoTGxQ8a_rRZ6UbX3fq4tSM', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `article_categories`
--

CREATE TABLE `article_categories` (
  `category_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `tree` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `article_items`
--

CREATE TABLE `article_items` (
  `item_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `short` varchar(1024) DEFAULT NULL,
  `text` text NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `time` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `carousel`
--

CREATE TABLE `carousel` (
  `carousel_id` int(11) NOT NULL,
  `image` varchar(128) NOT NULL,
  `link` varchar(255) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `text` text,
  `order_num` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `catalog_categories`
--

CREATE TABLE `catalog_categories` (
  `category_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `fields` text NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `tree` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `catalog_categories`
--

INSERT INTO `catalog_categories` (`category_id`, `title`, `image`, `fields`, `slug`, `tree`, `lft`, `rgt`, `depth`, `order_num`, `status`) VALUES
(24, 'Raw Almond Milk 300ml', '', '[]', 'raw-almond-milk-300ml', 24, 1, 2, 0, 5, 1),
(20, 'Detolixir 300ml', '', '[]', 'detolixir-300ml', 20, 1, 2, 0, 1, 1),
(21, 'Detolixir 600ml', '', '[]', 'detolixir-600ml', 21, 1, 2, 0, 2, 1),
(22, 'Juice 300ml', '', '[]', 'juice-300ml', 22, 1, 2, 0, 3, 1),
(23, 'Juice 600ml', '', '[]', 'juice-600ml', 23, 1, 2, 0, 4, 1),
(26, 'Chia Pudding 300ml', '', '[]', 'chia-pudding-300ml', 26, 1, 2, 0, 7, 1),
(25, 'Raw Almond Milk 600ml', '', '[]', 'raw-almond-milk-600ml', 25, 1, 2, 0, 6, 1),
(27, 'Canelixir 250ml', '', '[]', 'canelixir-250ml', 27, 1, 2, 0, 8, 1),
(28, 'Canelixir 500ml', '', '[]', 'canelixir-500ml', 28, 1, 2, 0, 9, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `catalog_items`
--

CREATE TABLE `catalog_items` (
  `item_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `description` text,
  `available` int(11) DEFAULT NULL,
  `price` float DEFAULT '0',
  `discount` int(11) DEFAULT '0',
  `data` text NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `time` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `catalog_items`
--

INSERT INTO `catalog_items` (`item_id`, `category_id`, `title`, `description`, `available`, `price`, `discount`, `data`, `image`, `slug`, `time`, `status`) VALUES
(9, 22, 'Anti-ing Juice', '<p>Anti-ing Juice adalah produk yang terbuat dari bahan bit, jeruk, lemon, wortel dan sayur-sayuran.</p><p>Manfaat yang akan diperoleh dengan meminum&nbsp;Anti-ing Juice ini antara lain :</p><ul>\r\n<li>Meningkatkan produksi sel darah merah</li><li>Menurunkan resiko serangan jantung</li><li>Membersihkan sistem pencernaan</li><li>Membersihkan pembuluh darah di kolesterol buruk</li></ul><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Vivamus  vulputate, leo vel malesuada tincidunt, purus nunc tristique  erat, at  elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p><p>Lorem  ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo,  eu porta metus. Nulla justo lacus,  aliquam vel libero nec, faucibus  enim tristique, molestie ante. Nunc a  dolor eget lectus venenatis  ullamcorper. Nullam dictum elementum lacus  quis facilisis. Phasellus  mollis tempus tempus. Fusce ut sagittis quam,  quis facilisis tellus. Nam  vel aliquet leo. Integer lacus tortor,  ullamcorper sit amet interdum  at, pulvinar sit amet risus.</p><p>Lorem  ipsum dolor sit amet,  consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo, eu  porta metus. Nulla justo lacus,  aliquam vel libero nec, viverra  placerat neque. Cras nec nunc  sollicitudin, lectus venenatis  ullamcorper. Nullam dictum elementum  lacus quis facilisis. Etiam sit  amet euismod eros. Phasellus mollis  tempus.</p>', NULL, 35000, NULL, '{}', '/uploads/catalog/3-anti-ing-1fc30b9d43.jpg', 'anti-ing-juice', 1454744509, 1),
(8, 23, 'Freshning Juice', '<p>Freshning Juice adalah produk yang terbuat dari bahan jeruk, nanas dan sayur-sayuran.</p><p>Manfaat yang akan diperoleh dengan meminum Freshning Juice ini antara lain :</p><ul>\r\n<li>Memberikan vitamin C</li><li>Menyeimbangkan tekanan darah</li><li>Menurunkan kolesterol buruk </li><li>Menyegarkan kulit</li><li>Menghasilkan kolagen</li></ul><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Vivamus  vulputate, leo vel malesuada tincidunt, purus nunc tristique  erat, at  elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p><p>Lorem  ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo,  eu porta metus. Nulla justo lacus,  aliquam vel libero nec, faucibus  enim tristique, molestie ante. Nunc a  dolor eget lectus venenatis  ullamcorper. Nullam dictum elementum lacus  quis facilisis. Phasellus  mollis tempus tempus. Fusce ut sagittis quam,  quis facilisis tellus. Nam  vel aliquet leo. Integer lacus tortor,  ullamcorper sit amet interdum  at, pulvinar sit amet risus.</p><p>Lorem  ipsum dolor sit amet,  consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo, eu  porta metus. Nulla justo lacus,  aliquam vel libero nec, viverra  placerat neque. Cras nec nunc  sollicitudin, lectus venenatis  ullamcorper. Nullam dictum elementum  lacus quis facilisis. Etiam sit  amet euismod eros. Phasellus mollis  tempus.</p>', NULL, 70000, NULL, '{}', '/uploads/catalog/freshning-1-3d2d30960e.jpg', 'freshning-juice-2', 1454744306, 1),
(5, 22, 'Purifying Juice', '<p>Purifying Juice adalah produk yang terbuat dari bahan lemon, maple sirup dan air.</p><p>Manfaat yang akan diperoleh dengan meminum Purifying Juice ini antara lain :</p><ul>\r\n<li>Menyegarkan nafas anda</li><li>Membantu pencernaan</li><li>Memberikan sistem kekebalan tubuh Anda&nbsp;</li><li>Membersihkan sistem anda</li><li>Membantu menurunkan berat badan</li><li>Membantu peradangan</li><li>Membantu untuk mengurangi kafein</li></ul><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Vivamus  vulputate, leo vel malesuada tincidunt, purus nunc tristique  erat, at  elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p><p>Lorem  ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo,  eu porta metus. Nulla justo lacus,  aliquam vel libero nec, faucibus  enim tristique, molestie ante. Nunc a  dolor eget lectus venenatis  ullamcorper. Nullam dictum elementum lacus  quis facilisis. Phasellus  mollis tempus tempus. Fusce ut sagittis quam,  quis facilisis tellus. Nam  vel aliquet leo. Integer lacus tortor,  ullamcorper sit amet interdum  at, pulvinar sit amet risus.</p><p>Lorem  ipsum dolor sit amet,  consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo, eu  porta metus. Nulla justo lacus,  aliquam vel libero nec, viverra  placerat neque. Cras nec nunc  sollicitudin, lectus venenatis  ullamcorper. Nullam dictum elementum  lacus quis facilisis. Etiam sit  amet euismod eros. Phasellus mollis  tempus.</p>', NULL, 35000, NULL, '{}', '/uploads/catalog/1-purifying-6f4920ea25.jpg', 'purifying-juice', 1454740989, 1),
(6, 23, 'Purifying Juice', '<p>Purifying Juice adalah produk yang terbuat dari bahan lemon, maple sirup dan air.</p><p>Manfaat yang akan diperoleh dengan meminum Purifying Juice ini antara lain :</p><ul>\r\n<li>Menyegarkan nafas anda</li><li>Membantu pencernaan</li><li>Memberikan sistem kekebalan tubuh Anda </li><li>Membersihkan sistem anda</li><li>Membantu menurunkan berat badan</li><li>Membantu peradangan</li><li>Membantu untuk mengurangi kafein</li></ul><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Vivamus  vulputate, leo vel malesuada tincidunt, purus nunc tristique  erat, at  elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p><p>Lorem  ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo,  eu porta metus. Nulla justo lacus,  aliquam vel libero nec, faucibus  enim tristique, molestie ante. Nunc a  dolor eget lectus venenatis  ullamcorper. Nullam dictum elementum lacus  quis facilisis. Phasellus  mollis tempus tempus. Fusce ut sagittis quam,  quis facilisis tellus. Nam  vel aliquet leo. Integer lacus tortor,  ullamcorper sit amet interdum  at, pulvinar sit amet risus.</p><p>Lorem  ipsum dolor sit amet,  consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo, eu  porta metus. Nulla justo lacus,  aliquam vel libero nec, viverra  placerat neque. Cras nec nunc  sollicitudin, lectus venenatis  ullamcorper. Nullam dictum elementum  lacus quis facilisis. Etiam sit  amet euismod eros. Phasellus mollis  tempus.</p>', NULL, 70000, NULL, '{}', '/uploads/catalog/purifying-dddc6994d5.jpg', 'purifying-juice-2', 1454743981, 1),
(7, 22, 'Freshning Juice', '<p>Freshning Juice adalah produk yang terbuat dari bahan jeruk, nanas dan sayur-sayuran.</p><p>Manfaat yang akan diperoleh dengan meminum Freshning Juice ini antara lain :</p><ul><li>Memberikan vitamin C</li><li>Menyeimbangkan tekanan darah</li><li>Menurunkan kolesterol buruk </li><li>Menyegarkan kulit</li><li>Menghasilkan kolagen</li></ul><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Vivamus  vulputate, leo vel malesuada tincidunt, purus nunc tristique  erat, at  elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p><p>Lorem  ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo,  eu porta metus. Nulla justo lacus,  aliquam vel libero nec, faucibus  enim tristique, molestie ante. Nunc a  dolor eget lectus venenatis  ullamcorper. Nullam dictum elementum lacus  quis facilisis. Phasellus  mollis tempus tempus. Fusce ut sagittis quam,  quis facilisis tellus. Nam  vel aliquet leo. Integer lacus tortor,  ullamcorper sit amet interdum  at, pulvinar sit amet risus.</p><p>Lorem  ipsum dolor sit amet,  consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo, eu  porta metus. Nulla justo lacus,  aliquam vel libero nec, viverra  placerat neque. Cras nec nunc  sollicitudin, lectus venenatis  ullamcorper. Nullam dictum elementum  lacus quis facilisis. Etiam sit  amet euismod eros. Phasellus mollis  tempus.</p>', NULL, 35000, NULL, '{}', '/uploads/catalog/2-freshning-a18177565d.jpg', 'freshning-juice', 1454744125, 1),
(10, 23, 'Anti-ing Juice', '<p>Anti-ing Juice adalah produk yang terbuat dari bahan bit, jeruk, lemon, wortel dan sayur-sayuran.</p><p>Manfaat yang akan diperoleh dengan meminum Anti-ing Juice ini antara lain :</p><ul>\r\n<li>Meningkatkan produksi sel darah merah</li><li>Menurunkan resiko serangan jantung</li><li>Membersihkan sistem pencernaan</li><li>Membersihkan pembuluh darah di kolesterol buruk</li></ul><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Vivamus  vulputate, leo vel malesuada tincidunt, purus nunc tristique  erat, at  elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p><p>Lorem  ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo,  eu porta metus. Nulla justo lacus,  aliquam vel libero nec, faucibus  enim tristique, molestie ante. Nunc a  dolor eget lectus venenatis  ullamcorper. Nullam dictum elementum lacus  quis facilisis. Phasellus  mollis tempus tempus. Fusce ut sagittis quam,  quis facilisis tellus. Nam  vel aliquet leo. Integer lacus tortor,  ullamcorper sit amet interdum  at, pulvinar sit amet risus.</p><p>Lorem  ipsum dolor sit amet,  consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo, eu  porta metus. Nulla justo lacus,  aliquam vel libero nec, viverra  placerat neque. Cras nec nunc  sollicitudin, lectus venenatis  ullamcorper. Nullam dictum elementum  lacus quis facilisis. Etiam sit  amet euismod eros. Phasellus mollis  tempus.</p>', NULL, 70000, NULL, '{}', '/uploads/catalog/anti-ing-5da9942da9.jpg', 'anti-ing-juice-2', 1454744680, 1),
(11, 22, 'Vitamizing Juice', '<p>Purifying Juice adalah produk yang terbuat dari bahan wortel dan apel.</p><p>Manfaat yang akan diperoleh dengan meminum Vitamizing Juice ini antara lain :</p><ul>\r\n<li>Meningkatkan pertumbuhan sel yang sehat, termasuk fungsi reproduksi</li><li>Memperkuat sistem kekebalan tubuh</li><li>Menyucikan dan membantu mengembalikan hati/liver</li><li>Menjaga kesehatan jantung</li><li>Anti-kanker</li></ul><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Vivamus  vulputate, leo vel malesuada tincidunt, purus nunc tristique  erat, at  elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p><p>Lorem  ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo,  eu porta metus. Nulla justo lacus,  aliquam vel libero nec, faucibus  enim tristique, molestie ante. Nunc a  dolor eget lectus venenatis  ullamcorper. Nullam dictum elementum lacus  quis facilisis. Phasellus  mollis tempus tempus. Fusce ut sagittis quam,  quis facilisis tellus. Nam  vel aliquet leo. Integer lacus tortor,  ullamcorper sit amet interdum  at, pulvinar sit amet risus.</p><p>Lorem  ipsum dolor sit amet,  consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo, eu  porta metus. Nulla justo lacus,  aliquam vel libero nec, viverra  placerat neque. Cras nec nunc  sollicitudin, lectus venenatis  ullamcorper. Nullam dictum elementum  lacus quis facilisis. Etiam sit  amet euismod eros. Phasellus mollis  tempus.</p>', NULL, 35000, NULL, '{}', '/uploads/catalog/5-vitamizing-91ede05a5b.jpg', 'vitamizing-juice', 1455016440, 1),
(12, 23, 'Vitamizing Juice', '<p>Purifying Juice adalah produk yang terbuat dari bahan wortel dan apel.</p><p>Manfaat yang akan diperoleh dengan meminum Vitamizing Juice ini antara lain :</p><ul>\r\n<li>Meningkatkan pertumbuhan sel yang sehat, termasuk fungsi reproduksi</li><li>Memperkuat sistem kekebalan tubuh</li><li>Menyucikan dan membantu mengembalikan hati/liver</li><li>Menjaga kesehatan jantung</li><li>Anti-kanker</li></ul><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Vivamus  vulputate, leo vel malesuada tincidunt, purus nunc tristique  erat, at  elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p><p>Lorem  ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo,  eu porta metus. Nulla justo lacus,  aliquam vel libero nec, faucibus  enim tristique, molestie ante. Nunc a  dolor eget lectus venenatis  ullamcorper. Nullam dictum elementum lacus  quis facilisis. Phasellus  mollis tempus tempus. Fusce ut sagittis quam,  quis facilisis tellus. Nam  vel aliquet leo. Integer lacus tortor,  ullamcorper sit amet interdum  at, pulvinar sit amet risus.</p><p>Lorem  ipsum dolor sit amet,  consectetur adipiscing elit. Vestibulum  pellentesque consectetur leo, eu  porta metus. Nulla justo lacus,  aliquam vel libero nec, viverra  placerat neque. Cras nec nunc  sollicitudin, lectus venenatis  ullamcorper. Nullam dictum elementum  lacus quis facilisis. Etiam sit  amet euismod eros. Phasellus mollis  tempus.</p>', NULL, 70000, NULL, '{}', '/uploads/catalog/vitamizing-1-73741ea570.jpg', 'vitamizing-juice-2', 1455016469, 1),
(13, 20, 'Paket Detolixir 1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vulputate, leo vel malesuada tincidunt, purus nunc tristique erat, at elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pellentesque consectetur leo, eu porta metus. Nulla justo lacus, aliquam vel libero nec, faucibus enim tristique, molestie ante. Nunc a dolor eget lectus venenatis ullamcorper. Nullam dictum elementum lacus quis facilisis. Phasellus mollis tempus tempus. Fusce ut sagittis quam, quis facilisis tellus. Nam vel aliquet leo. Integer lacus tortor, ullamcorper sit amet interdum at, pulvinar sit amet risus.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pellentesque consectetur leo, eu porta metus. Nulla justo lacus, aliquam vel libero nec, viverra placerat neque. Cras nec nunc sollicitudin, lectus venenatis ullamcorper. Nullam dictum elementum lacus quis facilisis. Etiam sit amet euismod eros. Phasellus mollis tempus.</p>', NULL, 205000, NULL, '{}', '/uploads/catalog/paket-detolixir-8-c3f99e62ef.jpg', 'paket-detolixir-1', 1455017463, 1),
(14, 21, 'Paket Detolixir 1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus  vulputate, leo vel malesuada tincidunt, purus nunc tristique erat, at  elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pellentesque consectetur leo,  eu porta metus. Nulla justo lacus, aliquam vel libero nec, faucibus  enim tristique, molestie ante. Nunc a dolor eget lectus venenatis  ullamcorper. Nullam dictum elementum lacus quis facilisis. Phasellus  mollis tempus tempus. Fusce ut sagittis quam, quis facilisis tellus. Nam  vel aliquet leo. Integer lacus tortor, ullamcorper sit amet interdum  at, pulvinar sit amet risus.</p><p>Lorem ipsum dolor sit amet,  consectetur adipiscing elit. Vestibulum pellentesque consectetur leo, eu  porta metus. Nulla justo lacus, aliquam vel libero nec, viverra  placerat neque. Cras nec nunc sollicitudin, lectus venenatis  ullamcorper. Nullam dictum elementum lacus quis facilisis. Etiam sit  amet euismod eros. Phasellus mollis tempus.</p>', NULL, 398000, NULL, '{}', '/uploads/catalog/paket-detolixir-4-7d757465b1.jpg', 'paket-detolixir-1-2', 1455017663, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `catalog_item_data`
--

CREATE TABLE `catalog_item_data` (
  `data_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `value` varchar(1024) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `faq`
--

CREATE TABLE `faq` (
  `faq_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `order_num` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `text` text NOT NULL,
  `answer_subject` varchar(128) DEFAULT NULL,
  `answer_text` text,
  `time` int(11) DEFAULT '0',
  `ip` varchar(16) NOT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `file` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `downloads` int(11) DEFAULT '0',
  `time` int(11) DEFAULT '0',
  `order_num` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery_categories`
--

CREATE TABLE `gallery_categories` (
  `category_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `tree` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guestbook`
--

CREATE TABLE `guestbook` (
  `guestbook_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `text` text NOT NULL,
  `answer` text,
  `email` varchar(128) DEFAULT NULL,
  `time` int(11) DEFAULT '0',
  `ip` varchar(16) NOT NULL,
  `new` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kurir`
--

CREATE TABLE `kurir` (
  `kurir_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kurir`
--

INSERT INTO `kurir` (`kurir_id`, `name`, `address`, `phone`) VALUES
(1, 'Sukirman', 'Jalan Gatot Subroto 110 Ponorogo', '081259123456'),
(2, 'Supriman', 'Jalan Jendral Soedirman 9 Ponorogo', '081335335335'),
(3, 'Sukijan', 'Jalan Soekarno Hatta 100 Ponorogo', '083845678900'),
(4, 'Sudirman', 'Jalan Letjend Soeprapto 5 Ponorogo', '085655655656');

-- --------------------------------------------------------

--
-- Struktur dari tabel `loginform`
--

CREATE TABLE `loginform` (
  `log_id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `user_agent` varchar(1024) NOT NULL,
  `time` int(11) DEFAULT '0',
  `success` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `loginform`
--

INSERT INTO `loginform` (`log_id`, `username`, `password`, `ip`, `user_agent`, `time`, `success`) VALUES
(57, 'admin', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0', 1455550055, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1454590982),
('m000000_000000_install', 1454590986);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `class` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `icon` varchar(32) NOT NULL,
  `settings` text NOT NULL,
  `notice` int(11) DEFAULT '0',
  `order_num` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`module_id`, `name`, `class`, `title`, `icon`, `settings`, `notice`, `order_num`, `status`) VALUES
(1, 'article', 'yii\\easyii\\modules\\article\\ArticleModule', 'Articles', 'pencil', '{"categoryThumb":true,"articleThumb":true,"enablePhotos":true,"enableShort":true,"shortMaxLength":255,"enableTags":true,"itemsInFolder":false}', 0, 65, 0),
(2, 'carousel', 'yii\\easyii\\modules\\carousel\\CarouselModule', 'Carousel', 'picture', '{"enableTitle":true,"enableText":true}', 0, 40, 0),
(3, 'catalog', 'yii\\easyii\\modules\\catalog\\CatalogModule', 'Katalog', 'list-alt', '{"categoryThumb":true,"itemsInFolder":false,"itemThumb":true,"itemPhotos":true,"itemDescription":true,"itemSale":true}', 0, 100, 1),
(4, 'faq', 'yii\\easyii\\modules\\faq\\FaqModule', 'FAQ', 'question-sign', '[]', 0, 45, 0),
(5, 'feedback', 'yii\\easyii\\modules\\feedback\\FeedbackModule', 'Buku Tamu', 'earphone', '{"mailAdminOnNewFeedback":true,"subjectOnNewFeedback":"New feedback","templateOnNewFeedback":"@easyii\\/modules\\/feedback\\/mail\\/en\\/new_feedback","answerTemplate":"@easyii\\/modules\\/feedback\\/mail\\/en\\/answer","answerSubject":"Answer on your feedback message","answerHeader":"Hello,","answerFooter":"Best regards.","enableTitle":false,"enablePhone":true,"enableCaptcha":false}', 0, 60, 1),
(6, 'file', 'yii\\easyii\\modules\\file\\FileModule', 'Files', 'floppy-disk', '[]', 0, 30, 0),
(7, 'gallery', 'yii\\easyii\\modules\\gallery\\GalleryModule', 'Photo Gallery', 'camera', '{"categoryThumb":true,"itemsInFolder":false}', 0, 90, 0),
(8, 'guestbook', 'yii\\easyii\\modules\\guestbook\\GuestbookModule', 'Guest Book', 'book', '{"enableTitle":false,"enableEmail":true,"preModerate":false,"enableCaptcha":false,"mailAdminOnNewPost":true,"subjectOnNewPost":"New message in the guestbook.","templateOnNewPost":"@easyii\\/modules\\/guestbook\\/mail\\/en\\/new_post","frontendGuestbookRoute":"\\/guestbook","subjectNotifyUser":"Your post in the guestbook answered","templateNotifyUser":"@easyii\\/modules\\/guestbook\\/mail\\/en\\/notify_user"}', 0, 80, 0),
(9, 'news', 'yii\\easyii\\modules\\news\\NewsModule', 'News', 'bullhorn', '{"enableThumb":true,"enablePhotos":true,"enableShort":true,"shortMaxLength":256,"enableTags":true}', 0, 70, 0),
(10, 'page', 'yii\\easyii\\modules\\page\\PageModule', 'Judul', 'file', '[]', 0, 50, 1),
(11, 'shopcart', 'yii\\easyii\\modules\\shopcart\\ShopcartModule', 'Pesanan', 'shopping-cart', '{"mailAdminOnNewOrder":true,"subjectOnNewOrder":"New order","templateOnNewOrder":"@easyii\\/modules\\/shopcart\\/mail\\/en\\/new_order","subjectNotifyUser":"Your order status changed","templateNotifyUser":"@easyii\\/modules\\/shopcart\\/mail\\/en\\/notify_user","frontendShopcartRoute":"\\/shopcart\\/order","enablePhone":true,"enableEmail":true}', 0, 120, 1),
(12, 'subscribe', 'yii\\easyii\\modules\\subscribe\\SubscribeModule', 'E-mail subscribe', 'envelope', '[]', 0, 10, 0),
(13, 'text', 'yii\\easyii\\modules\\text\\TextModule', 'Teks', 'font', '[]', 0, 20, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `short` varchar(1024) DEFAULT NULL,
  `text` text NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `time` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `text` text NOT NULL,
  `slug` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`page_id`, `title`, `text`, `slug`) VALUES
(1, 'Detolixir — Shop', '', 'shop-page'),
(2, 'Detolixir — Home', '<p>Sehat itu gampang kok. Tak perlu mengkonsumsi makanan yang belum jelas manfaatnya bagi tubuh. Semua yang kamu butuhin sudah ada di satu paket Detolixir.</p>', 'index-page'),
(3, 'Detolixir — Checkout', '<span class="light">Periksa keranjang Anda kemudian isi form</span> checkout <span class="light">dengan data yang valid</span>', 'checkout-page'),
(4, 'Detolixir — Transaction Success', '<p class="text-highlight">\r\n	Terima kasih telah melakukan transaksi pembelian. Order Anda akan kami proses segera.\r\n</p>\r\n<p class="text-highlight">\r\n	Untuk menyelesaikan pemesanan, segera lakukan pembayaran ke salah satu rekening kami dibawah ini sesuai total nominal pembayaran. Pesanan Anda tidak akan diproses sampai proses pembayaran selesai.\r\n</p>\r\n<p class="text-highlight">\r\n	Terakhir, konfirmasi pembayaran Anda via SMS di 083845678900 dengan format \r\n	<em>CONFIRM &lt;spasi&gt; NAMA ANDA &lt;spasi&gt; NOMINAL PEMBAYARAN</em> atau via email <a href="mailto:info@detolixir.id">info@detolixir.id</a> cantumkan bukti transfer Anda.\r\n</p>\r\n<p class="text-highlight">\r\n	Info lebih lanjut, buka halaman <a href="/contact/">Kontak</a>\r\n</p>', 'success-page'),
(5, 'Menghilangkan racun dalam tubuh', '<p>Dibuat dengan bahan-bahan alami, detox sangat baik untuk membasmi racun dan menghindarkan pengguna dari berbagai macam penyakit</p>', 'why-1'),
(6, 'Menghaluskan kulit', '<p>Detox mengandung aneka macam vitamin yang terdapat dari buah dan sayuran, baik untuk kesehatan kulit dan juga memperlancar darah</p>', 'why-2'),
(7, 'Menurunkan berat badan', '<p>Diet detox sangat bisa digunakan untuk menurunkan berat badan dengan cepat, tanpa efek samping dan pastinya daya tahan tubuh tetap optimal</p>', 'why-3'),
(8, 'Contact Us', '<p>\r\n	<a class="footer__link" href="#">Detolixir Surabaya</a>\r\n	<br>\r\nJalan Ahmad Yani 1,\r\n	<br>\r\nSurabaya 60243\r\n	<br>\r\n	<a class="footer__link--small" href="#">View Google map <span class="glyphicon glyphicon-chevron-right glyphicon--footer-small"></span></a>\r\n	<br>\r\n	<a class="footer__link" href="#"><span class="glyphicon glyphicon-earphone glyphicon--footer"></span> +031 456 789</a>\r\n	<br>\r\n	<a class="footer__link" href="#"><span class="glyphicon glyphicon-envelope glyphicon--footer"></span> info@detolixir.id</a>\r\n</p>', 'footer-contact-text'),
(9, '<span class="light">Detolixir</span> Surabaya', '<h5>Jalan Ahmad Yani 1,\r\n<br>\r\nSurabaya 60243\r\n</h5><p>\r\n	<span class="glyphicon glyphicon-earphone"></span> <span class="text-dark">+031 456 789</span><br>\r\n	<span class="glyphicon glyphicon-envelope"></span> <a class="secondary-link" href="mailto:info@detolixir.id"><strong>info@detolixir.id</strong></a></p>', 'contact-text'),
(10, 'Horizontal Navigation', '<ul class="nav navbar-nav">\r\n	<li><a href="/">Home</a></li>\r\n	<li><a href="/about/">Tentang</a></li>\r\n	<li><a href="/shop/">Katalog</a></li>\r\n	<li><a href="/contact/">Kontak</a></li>\r\n	<li><a href="#"><span class="glyphicon glyphicon-search glyphicon-search--nav"></span></a></li>\r\n</ul>', 'horizontal-nav'),
(12, 'Profile', '<img class="push-down-10" alt="Footer Logo" src="/assets/b7d4a69c/images/logo-footer.png">\r\n<p class="push-down-15">Love yourself with a healthy lifestyle</p>\r\n<p class="push-down-15">WhatsApp: 0818330829 | BBM: 7ED0E9EF and 5540CE90 | Line: detolixir</p>\r\n<a class="social-container" href="#"><span class="zocial-facebook"></span></a>\r\n<a class="social-container" href="#"><span class="zocial-twitter"></span></a>\r\n<a class="social-container" href="#"><span class="zocial-email"></span></a>\r\n<a class="social-container" href="#"><span class="zocial-youtube"></span></a>', 'profile-text'),
(11, 'Navigation', '<ul class="nav nav-footer">\r\n	<li><a href="/">Home</a></li>\r\n	<li><a href="/about/">Tentang</a></li>\r\n	<li><a href="/shop/">Katalog</a></li>\r\n	<li><a href="/contact/">Kontak</a></li>\r\n</ul>', 'vertical-nav'),
(13, 'Welcome to Detolixir Surabaya', '<p class="text-highlight">\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vulputate, leo vel malesuada tincidunt, purus nunc tristique erat, at elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.\r\n</p>\r\n<p class="text-highlight">\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pellentesque consectetur leo, eu porta metus. Nulla justo lacus, aliquam vel libero nec, faucibus enim tristique, molestie ante. Nunc a dolor eget lectus venenatis ullamcorper. Nullam dictum elementum lacus quis facilisis. Phasellus mollis tempus tempus. Fusce ut sagittis quam, quis facilisis tellus. Nam vel aliquet leo. Integer lacus tortor, ullamcorper sit amet interdum at, pulvinar sit amet risus.\r\n</p>\r\n<p class="text-highlight">\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pellentesque consectetur leo, eu porta metus. Nulla justo lacus, aliquam vel libero nec, viverra placerat neque. Cras nec nunc sollicitudin, lectus venenatis ullamcorper. Nullam dictum elementum lacus quis facilisis. Etiam sit amet euismod eros. Phasellus mollis tempus.\r\n</p>', 'about');

-- --------------------------------------------------------

--
-- Struktur dari tabel `photos`
--

CREATE TABLE `photos` (
  `photo_id` int(11) NOT NULL,
  `class` varchar(128) NOT NULL,
  `item_id` int(11) NOT NULL,
  `image` varchar(128) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `order_num` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `photos`
--

INSERT INTO `photos` (`photo_id`, `class`, `item_id`, `image`, `description`, `order_num`) VALUES
(5, 'yii\\easyii\\modules\\catalog\\models\\Item', 5, '/uploads/photos/purifying-ee389f3b2d.jpg', '', 1),
(6, 'yii\\easyii\\modules\\catalog\\models\\Item', 6, '/uploads/photos/1-purifying-a80ff02f82.jpg', '', 2),
(7, 'yii\\easyii\\modules\\catalog\\models\\Item', 6, '/uploads/photos/paket-detolixir-8-130214d369.jpg', '', 3),
(8, 'yii\\easyii\\modules\\catalog\\models\\Item', 7, '/uploads/photos/freshning-1-4793bfc982.jpg', '', 4),
(9, 'yii\\easyii\\modules\\catalog\\models\\Item', 7, '/uploads/photos/freshning-2-acb95a44c0.jpg', '', 5),
(10, 'yii\\easyii\\modules\\catalog\\models\\Item', 8, '/uploads/photos/2-freshning-cac06d3486.jpg', '', 6),
(11, 'yii\\easyii\\modules\\catalog\\models\\Item', 9, '/uploads/photos/anti-ing-eed5af6add.jpg', '', 7),
(12, 'yii\\easyii\\modules\\catalog\\models\\Item', 9, '/uploads/photos/paket-detolixir-1-9a4d6e8685.jpg', '', 8),
(13, 'yii\\easyii\\modules\\catalog\\models\\Item', 10, '/uploads/photos/3-anti-ing-0feaf58e2a.jpg', '', 9),
(14, 'yii\\easyii\\modules\\catalog\\models\\Item', 10, '/uploads/photos/paket-detolixir-2-4eb9407d63.jpg', '', 10),
(15, 'yii\\easyii\\modules\\catalog\\models\\Item', 10, '/uploads/photos/paket-detolixir-3-97737a7937.jpg', '', 11),
(16, 'yii\\easyii\\modules\\catalog\\models\\Item', 10, '/uploads/photos/paket-detolixir-6-3dfd792516.jpg', '', 12),
(17, 'yii\\easyii\\modules\\catalog\\models\\Item', 10, '/uploads/photos/paket-detolixir-5-aa43cf733f.jpg', '', 13),
(18, 'yii\\easyii\\modules\\catalog\\models\\Item', 10, '/uploads/photos/paket-detolixir-4-c460dc0f18.jpg', '', 14),
(19, 'yii\\easyii\\modules\\catalog\\models\\Item', 11, '/uploads/photos/vitamizing-1-96e215fcdd.jpg', '', 15),
(20, 'yii\\easyii\\modules\\catalog\\models\\Item', 11, '/uploads/photos/vitamizing-2-0ac60fb446.jpg', '', 16),
(21, 'yii\\easyii\\modules\\catalog\\models\\Item', 12, '/uploads/photos/5-vitamizing-f60f6b0d12.jpg', '', 17),
(22, 'yii\\easyii\\modules\\catalog\\models\\Item', 12, '/uploads/photos/paket-detolixir-6-a6d5ab6779.jpg', '', 18),
(23, 'yii\\easyii\\modules\\catalog\\models\\Item', 12, '/uploads/photos/paket-detolixir-7-152b834f41.jpg', '', 19),
(24, 'yii\\easyii\\modules\\catalog\\models\\Item', 12, '/uploads/photos/paket-detolixir-8-b8f3ddac6b.jpg', '', 20),
(25, 'yii\\easyii\\modules\\catalog\\models\\Item', 12, '/uploads/photos/vitamizing-2-148d411aef.jpg', '', 21),
(26, 'yii\\easyii\\modules\\catalog\\models\\Item', 13, '/uploads/photos/paket-detolixir-4-3d8d222046.jpg', '', 22),
(27, 'yii\\easyii\\modules\\catalog\\models\\Item', 13, '/uploads/photos/paket-detolixir-5-05f971b5ec.jpg', '', 23),
(28, 'yii\\easyii\\modules\\catalog\\models\\Item', 13, '/uploads/photos/paket-detolixir-6-ba28c7f62e.jpg', '', 24),
(29, 'yii\\easyii\\modules\\catalog\\models\\Item', 13, '/uploads/photos/paket-detolixir-7-ccf2d76e0c.jpg', '', 25),
(30, 'yii\\easyii\\modules\\catalog\\models\\Item', 14, '/uploads/photos/paket-detolixir-1-a48a1b922c.jpg', '', 26),
(31, 'yii\\easyii\\modules\\catalog\\models\\Item', 14, '/uploads/photos/paket-detolixir-2-d2b5afea3a.jpg', '', 27),
(32, 'yii\\easyii\\modules\\catalog\\models\\Item', 14, '/uploads/photos/paket-detolixir-3-2dfb6bf59b.jpg', '', 28),
(33, 'yii\\easyii\\modules\\catalog\\models\\Item', 14, '/uploads/photos/paket-detolixir-4-ae3a12e662.jpg', '', 29);

-- --------------------------------------------------------

--
-- Struktur dari tabel `seotext`
--

CREATE TABLE `seotext` (
  `seotext_id` int(11) NOT NULL,
  `class` varchar(128) NOT NULL,
  `item_id` int(11) NOT NULL,
  `h1` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `keywords` varchar(128) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `seotext`
--

INSERT INTO `seotext` (`seotext_id`, `class`, `item_id`, `h1`, `title`, `keywords`, `description`) VALUES
(1, 'yii\\easyii\\modules\\catalog\\models\\Category', 28, '', 'Detolixir — Canelixir 500ml', '', ''),
(2, 'yii\\easyii\\modules\\catalog\\models\\Category', 27, '', 'Detolixir — Canelixir 250ml', '', ''),
(3, 'yii\\easyii\\modules\\catalog\\models\\Category', 26, '', 'Detolixir — Chia Pudding 300ml', '', ''),
(4, 'yii\\easyii\\modules\\catalog\\models\\Category', 25, '', 'Detolixir — Raw Almond Milk 600ml', '', ''),
(5, 'yii\\easyii\\modules\\catalog\\models\\Category', 24, '', 'Detolixir — Raw Almond Milk 300ml', '', ''),
(6, 'yii\\easyii\\modules\\catalog\\models\\Category', 23, '', 'Detolixir — Juice 600ml', '', ''),
(7, 'yii\\easyii\\modules\\catalog\\models\\Category', 22, '', 'Detolixir — Juice 300ml', '', ''),
(8, 'yii\\easyii\\modules\\catalog\\models\\Category', 21, '', 'Detolixir — Detolixir 600ml', '', ''),
(9, 'yii\\easyii\\modules\\catalog\\models\\Category', 20, '', 'Detolixir — Detolixir 300ml', '', ''),
(10, 'yii\\easyii\\modules\\page\\models\\Page', 9, '', 'Detolixir — Contact', '', ''),
(11, 'yii\\easyii\\modules\\page\\models\\Page', 13, '', 'Detolixir — About', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `value` varchar(1024) NOT NULL,
  `visibility` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`setting_id`, `name`, `title`, `value`, `visibility`) VALUES
(1, 'easyii_version', 'EasyiiCMS version', '0.9', 0),
(2, 'recaptcha_key', 'ReCaptcha key', '6LfzShcTAAAAAJhFVwEJmGfqKmfEWlUY0_fn7QDu', 1),
(3, 'password_salt', 'Password salt', 'YSoDpI9qcsjbCtfUo0VqSD7Py8G6Ph1D', 0),
(4, 'root_auth_key', 'Root authorization key', '-lavfbkE2qG7qDoG1Bmkaa-RoyoY9k3y', 0),
(5, 'root_password', 'Root password', 'c7843cc83faf05f1eb8dabaa096aea4499eba7ab', 1),
(6, 'auth_time', 'Auth time', '86400', 1),
(7, 'robot_email', 'Robot E-mail', 'yusronkristanto@gmail.com', 1),
(8, 'admin_email', 'Admin E-mail', 'yusronkristanto@gmail.com', 2),
(9, 'recaptcha_secret', 'ReCaptcha secret', '6LfzShcTAAAAAIzdKPdBNbjA6wLmO0tjEFqUzSrD', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopcart_goods`
--

CREATE TABLE `shopcart_goods` (
  `good_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `options` varchar(255) NOT NULL,
  `price` float DEFAULT '0',
  `discount` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `shopcart_goods`
--

INSERT INTO `shopcart_goods` (`good_id`, `order_id`, `item_id`, `count`, `options`, `price`, `discount`) VALUES
(113, 68, 12, 3, '1', 70000, 0),
(114, 68, 9, 10, '1', 35000, 0),
(112, 68, 14, 5, '1', 398000, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopcart_orders`
--

CREATE TABLE `shopcart_orders` (
  `order_id` int(11) NOT NULL,
  `kurir` varchar(128) NOT NULL,
  `payment` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `comment` varchar(1024) NOT NULL,
  `remark` varchar(1024) NOT NULL,
  `date` varchar(128) NOT NULL,
  `access_token` varchar(32) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `time` int(11) DEFAULT '0',
  `new` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `shopcart_orders`
--

INSERT INTO `shopcart_orders` (`order_id`, `kurir`, `payment`, `name`, `address`, `phone`, `email`, `comment`, `remark`, `date`, `access_token`, `ip`, `time`, `new`, `status`) VALUES
(68, 'Sukirman', 'Sudah dibayar', 'Yusron Kristanto', 'Jalan Ahmad Yani 123 Surabaya', '083845678900', 'yusronkristanto@gmail.com', 'Love it', 'Sudah on the way', 'Feb 16, 2016', 'xtonOl2qMSXpWayi-1e8mC-Zwyb5pj7R', '127.0.0.1', 1455549999, 0, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribe_history`
--

CREATE TABLE `subscribe_history` (
  `history_id` int(11) NOT NULL,
  `subject` varchar(128) NOT NULL,
  `body` text NOT NULL,
  `sent` int(11) DEFAULT '0',
  `time` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribe_subscribers`
--

CREATE TABLE `subscribe_subscribers` (
  `subscriber_id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `time` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `frequency` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags_assign`
--

CREATE TABLE `tags_assign` (
  `class` varchar(128) NOT NULL,
  `item_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `texts`
--

CREATE TABLE `texts` (
  `text_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `slug` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `texts`
--

INSERT INTO `texts` (`text_id`, `text`, `slug`) VALUES
(1, 'Love yourself with a healthy lifestyle', 'welcome-text'),
(2, 'WhatsApp: 0818330829 | BBM: 7ED0E9EF and 5540CE90 | Line: detolixir', 'info-text'),
(3, '<span class="light">Mengapa</span> kita perlu detox?', 'why'),
(4, '<p>\r\n<span class="light">Keranjang belanjaan Anda kosong. Silahkan</span> <a href="/shop/">berbelanja</a> <span class="light">terlebih dahulu</span>\r\n</p>', 'empty-cart');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `access_token` (`access_token`);

--
-- Indexes for table `article_categories`
--
ALTER TABLE `article_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `article_items`
--
ALTER TABLE `article_items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`carousel_id`);

--
-- Indexes for table `catalog_categories`
--
ALTER TABLE `catalog_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `catalog_items`
--
ALTER TABLE `catalog_items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `catalog_item_data`
--
ALTER TABLE `catalog_item_data`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `item_id_name` (`item_id`,`name`),
  ADD KEY `value` (`value`(300));

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `gallery_categories`
--
ALTER TABLE `gallery_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `guestbook`
--
ALTER TABLE `guestbook`
  ADD PRIMARY KEY (`guestbook_id`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`kurir_id`);

--
-- Indexes for table `loginform`
--
ALTER TABLE `loginform`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`module_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `model_item` (`class`,`item_id`);

--
-- Indexes for table `seotext`
--
ALTER TABLE `seotext`
  ADD PRIMARY KEY (`seotext_id`),
  ADD UNIQUE KEY `model_item` (`class`,`item_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `shopcart_goods`
--
ALTER TABLE `shopcart_goods`
  ADD PRIMARY KEY (`good_id`);

--
-- Indexes for table `shopcart_orders`
--
ALTER TABLE `shopcart_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `subscribe_history`
--
ALTER TABLE `subscribe_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `subscribe_subscribers`
--
ALTER TABLE `subscribe_subscribers`
  ADD PRIMARY KEY (`subscriber_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tags_assign`
--
ALTER TABLE `tags_assign`
  ADD KEY `class` (`class`),
  ADD KEY `item_tag` (`item_id`,`tag_id`);

--
-- Indexes for table `texts`
--
ALTER TABLE `texts`
  ADD PRIMARY KEY (`text_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `article_categories`
--
ALTER TABLE `article_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `article_items`
--
ALTER TABLE `article_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `carousel_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `catalog_categories`
--
ALTER TABLE `catalog_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `catalog_items`
--
ALTER TABLE `catalog_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `catalog_item_data`
--
ALTER TABLE `catalog_item_data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gallery_categories`
--
ALTER TABLE `gallery_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guestbook`
--
ALTER TABLE `guestbook`
  MODIFY `guestbook_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kurir`
--
ALTER TABLE `kurir`
  MODIFY `kurir_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `loginform`
--
ALTER TABLE `loginform`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `seotext`
--
ALTER TABLE `seotext`
  MODIFY `seotext_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `shopcart_goods`
--
ALTER TABLE `shopcart_goods`
  MODIFY `good_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `shopcart_orders`
--
ALTER TABLE `shopcart_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `subscribe_history`
--
ALTER TABLE `subscribe_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscribe_subscribers`
--
ALTER TABLE `subscribe_subscribers`
  MODIFY `subscriber_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `texts`
--
ALTER TABLE `texts`
  MODIFY `text_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
