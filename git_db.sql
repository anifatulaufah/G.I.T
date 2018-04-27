-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 27, 2018 at 06:25 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `git_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `benih`
--

CREATE TABLE IF NOT EXISTS `benih` (
  `id_benih` varchar(45) NOT NULL,
  `id_ikan` varchar(45) DEFAULT NULL,
  `stok_benih` int(11) DEFAULT NULL,
  `harga_per20_ekor` int(11) DEFAULT NULL,
  `deskripsi` text,
  PRIMARY KEY (`id_benih`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `benih`
--

INSERT INTO `benih` (`id_benih`, `id_ikan`, `stok_benih`, `harga_per20_ekor`, `deskripsi`) VALUES
('BEN001', 'IKA002', 350, 50000, 'Untuk harga per 20 ekor benih ikan mas'),
('BEN002', 'IKA003', 200, 45000, 'Untuk harga per 20 ekor benih ikan bandeng');

-- --------------------------------------------------------

--
-- Table structure for table `ikan`
--

CREATE TABLE IF NOT EXISTS `ikan` (
  `id_ikan` varchar(45) NOT NULL,
  `nama_ikan` varchar(45) DEFAULT NULL,
  `stok_ikan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `investor`
--

CREATE TABLE IF NOT EXISTS `investor` (
  `id_investor` varchar(45) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `NIK` varchar(45) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `kontak` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pekerjaan` varchar(45) DEFAULT NULL,
  `ikan_id` varchar(45) DEFAULT NULL,
  `nomor_rekening` varchar(45) DEFAULT NULL,
  `jumlah_investasi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_investor`),
  UNIQUE KEY `NIK` (`NIK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `konsumen`
--

CREATE TABLE IF NOT EXISTS `konsumen` (
  `id_konsumen` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `kontak` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `no_rekening` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_konsumen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `monitor_ikan`
--

CREATE TABLE IF NOT EXISTS `monitor_ikan` (
  `id_monitor` varchar(45) NOT NULL,
  `id_penambak` varchar(45) DEFAULT NULL,
  `id_ikan` varchar(45) DEFAULT NULL,
  `usia_ikan` int(11) DEFAULT NULL,
  `deskripsi` text,
  `tgl_monitor` date DEFAULT NULL,
  `waktu_panen` date DEFAULT NULL,
  PRIMARY KEY (`id_monitor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pakan`
--

CREATE TABLE IF NOT EXISTS `pakan` (
  `id_pakan` varchar(45) NOT NULL,
  `nama_pakan` varchar(45) DEFAULT NULL,
  `stok_pakan` int(11) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  PRIMARY KEY (`id_pakan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pakar`
--

CREATE TABLE IF NOT EXISTS `pakar` (
  `id_pakar` varchar(45) NOT NULL,
  `NIK` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `kontak` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `keahlian` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pakar`),
  UNIQUE KEY `NIK` (`NIK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penambak`
--

CREATE TABLE IF NOT EXISTS `penambak` (
  `id_penambak` varchar(45) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `NIK` varchar(45) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `kontak` varchar(20) DEFAULT NULL,
  `id_ikan` varchar(45) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `kebutuhan_modal` int(11) DEFAULT NULL,
  `jumlah_tambak` int(11) DEFAULT NULL,
  `ukuran_tambak` int(11) DEFAULT NULL,
  `jumlah_omset_per_bulan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_penambak`),
  UNIQUE KEY `NIK` (`NIK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjual_benih`
--

CREATE TABLE IF NOT EXISTS `penjual_benih` (
  `id_penjual` varchar(45) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `nama_toko` varchar(45) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `id_benih` int(11) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `kontak` varchar(45) DEFAULT NULL,
  `no_rekening` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_penjual`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjual_benih`
--

INSERT INTO `penjual_benih` (`id_penjual`, `nama`, `nama_toko`, `umur`, `id_benih`, `alamat`, `kontak`, `no_rekening`) VALUES
('JLBN01', 'Ali sadiqin', 'Bikan Jaya', 35, 2, 'Jl Mawar no.44 timah,tugu,cimanggis,depok', '089654543221', '4000-1232-1122');

-- --------------------------------------------------------

--
-- Table structure for table `penjual_pakan`
--

CREATE TABLE IF NOT EXISTS `penjual_pakan` (
  `id_penjual_pakan` varchar(45) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `nama_toko` varchar(45) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `pakan_id` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `kontak` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_penjual_pakan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_benih`
--

CREATE TABLE IF NOT EXISTS `transaksi_benih` (
  `id_transaksi` varchar(45) NOT NULL,
  `id_konsumen` varchar(45) DEFAULT NULL,
  `id_penjual` varchar(45) DEFAULT NULL,
  `id_benih` varchar(45) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `waktu_dan_tanggal` datetime DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_benih`
--

INSERT INTO `transaksi_benih` (`id_transaksi`, `id_konsumen`, `id_penjual`, `id_benih`, `jumlah`, `total_harga`, `waktu_dan_tanggal`) VALUES
('TRNBN1', 'KON001', 'JLBN01', 'IKA003', 100, 225000, '2018-04-27 10:00:10');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_ikan`
--

CREATE TABLE IF NOT EXISTS `transaksi_ikan` (
  `id_transaksi` int(11) NOT NULL,
  `id_penambak` varchar(45) DEFAULT NULL,
  `id_ikan` varchar(45) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_investor`
--

CREATE TABLE IF NOT EXISTS `transaksi_investor` (
  `id_transaksi_investor` varchar(45) NOT NULL,
  `investor_id` varchar(45) DEFAULT NULL,
  `ikan_id` varchar(45) DEFAULT NULL,
  `jumlah_investasi` int(11) DEFAULT NULL,
  `waktu_investasi` date DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id_transaksi_investor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_pakan`
--

CREATE TABLE IF NOT EXISTS `transaksi_pakan` (
  `id_transaksi_pakan` varchar(45) DEFAULT NULL,
  `konsumen_id` varchar(45) DEFAULT NULL,
  `penjual_pakan_id` varchar(45) DEFAULT NULL,
  `waktu_tanggal_transaksi` datetime DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_penyaluran_dana`
--

CREATE TABLE IF NOT EXISTS `transaksi_penyaluran_dana` (
  `id_transaksi_penyaluran_dana` varchar(45) NOT NULL,
  `waktu_pendanaan` date DEFAULT NULL,
  `penambak_id` varchar(45) DEFAULT NULL,
  `jumlah_dana` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_penyaluran dana`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ---------------------------------------------------

ALTER TABLE 'investor'
	ADD KEY 'fk_ikan_id' ('id_ikan');

ALTER TABLE 'penambak'
	ADD KEY 'fk_ikan_id' ('id_ikan');

ALTER TABLE 'transaksi_investor'
	ADD KEY 'fk_investor_id' ('id_investor'),
	ADD KEY 'fk_ikan_id' ('id_ikan');

ALTER TABLE 'transaksi_penyaluran_dana'
	ADD KEY 'fk_penambak_id' ('id_penambak');

ALTER TABLE 'penjual_pakan'
	ADD KEY 'fk_pakan_id' ('id_pakan');

ALTER TABLE 'informasi_beli_pakan'
	ADD KEY 'fk_penjual_pakan_id' ('id_penjual_pakan'),
	ADD KEY 'fk_pakan_id' ('id_pakan');

ALTER TABLE 'transaksi_pakan'
	ADD KEY 'fk_konsumen_id' ('id_konsumen'),
	ADD KEY 'fk_penjual_pakan_id' ('id_penjual_pakan');
ALTER TABLE 'benih'
	ADD KEY 'fk_ikan_id' ('id_ikan');
ALTER TABLE 'penjual_benih'
	ADD KEY 'fk_benih_id' ('id_benih');
ALTER TABLE 'transaksi_benih' 
	ADD KEY 'fk_konsumen_id'  ('id_konsumen'),
	ADD KEY 'fk_penjual_id' ('id_penjual'),
	ADD KEY 'fk_benih_id' ('id_benih');


	
	
	

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
