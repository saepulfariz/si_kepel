-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2024 at 12:13 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_keluhan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(11) NOT NULL,
  `nama_admin` varchar(45) DEFAULT NULL,
  `kata_sandi` varchar(45) DEFAULT NULL,
  `level_user` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idadmin`, `nama_admin`, `kata_sandi`, `level_user`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'teknisi', 'e21394aaeee10f917f581054d24b031f', 'teknisi');

-- --------------------------------------------------------

--
-- Table structure for table `keluhan`
--

CREATE TABLE `keluhan` (
  `idkeluhan` int(11) NOT NULL,
  `idpelanggan` int(11) DEFAULT NULL,
  `keluhan` varchar(100) DEFAULT NULL,
  `penyebab` varchar(100) DEFAULT NULL,
  `tindakan` varchar(100) DEFAULT NULL,
  `tgl_keluhan` date DEFAULT NULL,
  `tgl_perbaikan` date DEFAULT NULL,
  `idteknisi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `keluhan`
--

INSERT INTO `keluhan` (`idkeluhan`, `idpelanggan`, `keluhan`, `penyebab`, `tindakan`, `tgl_keluhan`, `tgl_perbaikan`, `idteknisi`) VALUES
(1231, 18, 'Produk tidak berjalan dengan baik', 'Kelistrikan tidak stabil', 'survei', '2018-11-15', '2018-12-05', 9),
(1234, 16, 'Produk Tidak Berjalan dengan Normal', 'Kelistrikan', 'perlu pengechekan ke lokasi device', '2018-12-08', '2018-12-07', 8),
(1235, 17, 'Alat sering mati mendadak', 'kerusakan pada komponen', 'pergantian spartpare', '2018-12-13', '2018-12-21', 10),
(1237, 19, 'Produk tidak berjalan dengan baik', 'kondisi listrik tidak stabil', 'perlu pengechekan ke lokasi', '2018-12-31', '2018-12-13', 10),
(1238, 20, 'Produk tidak berjalan dengan baik', 'Kelistrikan', 'asda', '2018-12-15', '2018-12-29', 8),
(1239, 28, 'tes', 'res', 'es', '2024-10-17', '2024-10-17', 11),
(1240, 29, 'test', 'test', 'test', '2024-10-17', '2024-10-17', 10);

-- --------------------------------------------------------

--
-- Table structure for table `keluhan_teknisi`
--

CREATE TABLE `keluhan_teknisi` (
  `id` int(11) NOT NULL,
  `idkeluhan` int(11) NOT NULL,
  `idteknisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keluhan_teknisi`
--

INSERT INTO `keluhan_teknisi` (`id`, `idkeluhan`, `idteknisi`) VALUES
(1, 1231, 9),
(2, 1234, 8),
(3, 1235, 10),
(4, 1237, 10),
(5, 1238, 11);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(45) DEFAULT NULL,
  `alamat_pelanggan` varchar(150) DEFAULT NULL,
  `telepon_pelanggan` varchar(45) DEFAULT NULL,
  `email_pelanggan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`idpelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `telepon_pelanggan`, `email_pelanggan`) VALUES
(16, 'UIN Syarif Hidayatullah Jakarta', 'Jl. Ir. H. Djuanda No.95, Cemp. Putih, Ciputat, Kota Tangerang Selatan, Banten 15412', '0221786 7222', 'humas@uinjkt.ac.id'),
(17, 'Universitas Indonesia', 'Jl. Margonda Raya, Pondok Cina, Beji, Kota Depok, Jawa Barat 16424', '0215225711', 'humas-ui@ui.ac.id'),
(18, 'LIPI', 'Jl. Jend. Gatot Subroto 10 Jakarta 12710', '021740 1925', 'humas@mail.lipi.go.id'),
(19, 'Petro China', 'Menara Kuningan Lt.17 - 27 Jl. HR. Rasuna Said Blok. X-7 Kav. 5, Karet Kuningan', '02150000', 'info@petrochina.co.id'),
(20, 'PT. Pertamina', 'PT Pertamina (persero) Jl. Medan Merdeka Timur 1A Jakarta 10110 Indonesia', '02157945300', 'pcc@pertamina.com'),
(21, 'Badan Pengawas Obat dan Makanan', 'Jalan Percetakan Negara Nomor 23 Jakarta - 10560 - Indonesia ', '0214244691', 'halobpom@pom.go.id'),
(22, 'LPPOM MUI', 'Gedung Majelis Ulama Indonesia Jl. Proklamasi No. 51 Menteng Jakarta Pusat', '021 3918917 ', 'info@halalmui.org'),
(23, 'Core Laboratories Indonesia', 'Setu, South Tangerang City, Banten 15314', '021 80623777', 'info@corelab.com'),
(24, 'Pt. Unilab Perdana', 'Ciledug Raya No.10 Cipulir  Kebayoran Lama, Jakarta Selatan', '062 21 7253323', 'info@unilabperdana.com'),
(25, 'Pusat Hiperkes Dan Keselamatan Kerja', 'East Cempaka Putih, Cempaka Putih, Central Jakarta City, Jakarta 10510', '021 4267398', 'admin@balaik3jakarta.com'),
(26, 'PT. Panca Amara Utama', 'DBS Bank Tower 18th Floor Ciputra World', '02129885700', 'admin@pau.co.id'),
(28, 'sae', 'sss', '082216501151', 'saepulhidayat302@gmail.com'),
(29, 'Tes', 'sss', '082216501151', 'saepulhidayat302@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `perbaikan`
--

CREATE TABLE `perbaikan` (
  `idperbaikan` int(11) NOT NULL,
  `idpelanggan` int(11) NOT NULL,
  `idkeluhan` int(11) NOT NULL,
  `idteknisi` int(11) NOT NULL,
  `perbaikan` varchar(255) DEFAULT NULL,
  `tgl_perbaikan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `perbaikan`
--

INSERT INTO `perbaikan` (`idperbaikan`, `idpelanggan`, `idkeluhan`, `idteknisi`, `perbaikan`, `tgl_perbaikan`) VALUES
(1, 19, 1235, 8, 'coba ss', '2018-12-13'),
(2, 17, 1237, 9, 'coba', '2018-12-21'),
(12347, 23, 1231, 8, 'coba', '2018-12-15');

-- --------------------------------------------------------

--
-- Table structure for table `teknisi`
--

CREATE TABLE `teknisi` (
  `idteknisi` int(11) NOT NULL,
  `nama_teknisi` varchar(45) DEFAULT NULL,
  `telpon_teknisi` varchar(45) DEFAULT NULL,
  `email_teknisi` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teknisi`
--

INSERT INTO `teknisi` (`idteknisi`, `nama_teknisi`, `telpon_teknisi`, `email_teknisi`) VALUES
(8, 'Eka Rizky Febrian', '081218767637', 'eka@panduana.com'),
(9, 'Rifqi Hermawan', '089712132323', 'rifqi@panduana.com'),
(10, 'Iqbal Ramadhan', '082313121221', 'iqbal@panduana.com'),
(11, 'Dimas', '082311311223', 'dimas@panduana.com'),
(12, 'Rivai Abustam', '082313245623', 'rivai@panduana.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indexes for table `keluhan`
--
ALTER TABLE `keluhan`
  ADD PRIMARY KEY (`idkeluhan`),
  ADD KEY `idteknisi` (`idteknisi`),
  ADD KEY `idpelanggan` (`idpelanggan`);

--
-- Indexes for table `keluhan_teknisi`
--
ALTER TABLE `keluhan_teknisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idkeluhan_keluhan_teknisi` (`idkeluhan`),
  ADD KEY `idteknisi_keluhan_teknisi` (`idteknisi`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idpelanggan`);

--
-- Indexes for table `perbaikan`
--
ALTER TABLE `perbaikan`
  ADD PRIMARY KEY (`idperbaikan`) USING BTREE,
  ADD KEY `idpelanggan` (`idpelanggan`),
  ADD KEY `idpelanggan_2` (`idpelanggan`),
  ADD KEY `idkeluhan` (`idkeluhan`),
  ADD KEY `idteknisi` (`idteknisi`);

--
-- Indexes for table `teknisi`
--
ALTER TABLE `teknisi`
  ADD PRIMARY KEY (`idteknisi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keluhan`
--
ALTER TABLE `keluhan`
  MODIFY `idkeluhan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1241;

--
-- AUTO_INCREMENT for table `keluhan_teknisi`
--
ALTER TABLE `keluhan_teknisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idpelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `perbaikan`
--
ALTER TABLE `perbaikan`
  MODIFY `idperbaikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12348;

--
-- AUTO_INCREMENT for table `teknisi`
--
ALTER TABLE `teknisi`
  MODIFY `idteknisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keluhan`
--
ALTER TABLE `keluhan`
  ADD CONSTRAINT `keluhan_ibfk_1` FOREIGN KEY (`idteknisi`) REFERENCES `teknisi` (`idteknisi`),
  ADD CONSTRAINT `keluhan_ibfk_2` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`);

--
-- Constraints for table `keluhan_teknisi`
--
ALTER TABLE `keluhan_teknisi`
  ADD CONSTRAINT `idkeluhan_keluhan_teknisi` FOREIGN KEY (`idkeluhan`) REFERENCES `keluhan` (`idkeluhan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idteknisi_keluhan_teknisi` FOREIGN KEY (`idteknisi`) REFERENCES `teknisi` (`idteknisi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perbaikan`
--
ALTER TABLE `perbaikan`
  ADD CONSTRAINT `perbaikan_ibfk_1` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`),
  ADD CONSTRAINT `perbaikan_ibfk_2` FOREIGN KEY (`idkeluhan`) REFERENCES `keluhan` (`idkeluhan`),
  ADD CONSTRAINT `perbaikan_ibfk_3` FOREIGN KEY (`idteknisi`) REFERENCES `teknisi` (`idteknisi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
