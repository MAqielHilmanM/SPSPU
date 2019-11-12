-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 12, 2019 at 04:04 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spspu`
--
CREATE DATABASE IF NOT EXISTS `db_spspu` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_spspu`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id_admin` varchar(20) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `divisi` varchar(20) NOT NULL,
  `jam_kerja` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

DROP TABLE IF EXISTS `akun`;
CREATE TABLE `akun` (
  `id_user` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `level` enum('Admin','Staff','Mahasiswa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_user`, `username`, `password`, `email`, `level`) VALUES
('1301170428', '1301170428', '5ad62906c0a165807687018c82b36db8', '', 'Mahasiswa'),
('admin0', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa` (
  `nim` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `alamat` text NOT NULL,
  `fakultas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `kelas`, `alamat`, `fakultas`) VALUES
('1301170428', 'aqiel', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

DROP TABLE IF EXISTS `peminjaman`;
CREATE TABLE `peminjaman` (
  `id_peminjaman` varchar(20) NOT NULL,
  `tgl_peminjaman` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `jumlah` int(255) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `id_prasarana` varchar(20) NOT NULL,
  `id_sarana` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

DROP TABLE IF EXISTS `pengembalian`;
CREATE TABLE `pengembalian` (
  `id_pengembalian` varchar(20) NOT NULL,
  `lama_peminjaman` date NOT NULL,
  `denda` int(20) NOT NULL,
  `status_barang` varchar(20) NOT NULL,
  `id_admin` varchar(20) NOT NULL,
  `id_peminjaman` varchar(20) NOT NULL,
  `id_prasarana` varchar(20) NOT NULL,
  `id_sarana` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prasarana`
--

DROP TABLE IF EXISTS `prasarana`;
CREATE TABLE `prasarana` (
  `id_prasarana` varchar(20) NOT NULL,
  `nama_prasarana` varchar(20) NOT NULL,
  `kondisi_prasarana` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sarana`
--

DROP TABLE IF EXISTS `sarana`;
CREATE TABLE `sarana` (
  `id_sarana` varchar(20) NOT NULL,
  `nama_sarana` varchar(20) NOT NULL,
  `luas_ruangan` varchar(20) NOT NULL,
  `jumlah_prasarana` int(20) NOT NULL,
  `id_prasarana` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `nip` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `divisi` varchar(20) NOT NULL,
  `fakultas` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `is_outsider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `verifikasi`
--

DROP TABLE IF EXISTS `verifikasi`;
CREATE TABLE `verifikasi` (
  `id_verifikasi` varchar(20) NOT NULL,
  `tgl_verifikasi` date NOT NULL,
  `status_persetujuan` varchar(20) NOT NULL,
  `id_admin` varchar(20) NOT NULL,
  `id_peminjaman` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `id_prasarana` (`id_prasarana`),
  ADD UNIQUE KEY `id_sarana` (`id_sarana`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD UNIQUE KEY `nip` (`id_admin`),
  ADD UNIQUE KEY `id_peminjaman` (`id_peminjaman`),
  ADD UNIQUE KEY `id_prasarana` (`id_prasarana`),
  ADD UNIQUE KEY `id_sarana` (`id_sarana`);

--
-- Indexes for table `prasarana`
--
ALTER TABLE `prasarana`
  ADD PRIMARY KEY (`id_prasarana`);

--
-- Indexes for table `sarana`
--
ALTER TABLE `sarana`
  ADD PRIMARY KEY (`id_sarana`),
  ADD UNIQUE KEY `id_prasarana` (`id_prasarana`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `verifikasi`
--
ALTER TABLE `verifikasi`
  ADD PRIMARY KEY (`id_verifikasi`),
  ADD UNIQUE KEY `nip` (`id_admin`),
  ADD UNIQUE KEY `id_peminjaman` (`id_peminjaman`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `staff` (`nip`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_sarana`) REFERENCES `sarana` (`id_sarana`),
  ADD CONSTRAINT `peminjaman_ibfk_4` FOREIGN KEY (`id_prasarana`) REFERENCES `prasarana` (`id_prasarana`);

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`),
  ADD CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`id_prasarana`) REFERENCES `prasarana` (`id_prasarana`),
  ADD CONSTRAINT `pengembalian_ibfk_4` FOREIGN KEY (`id_sarana`) REFERENCES `sarana` (`id_sarana`);

--
-- Constraints for table `sarana`
--
ALTER TABLE `sarana`
  ADD CONSTRAINT `sarana_ibfk_1` FOREIGN KEY (`id_prasarana`) REFERENCES `prasarana` (`id_prasarana`);

--
-- Constraints for table `verifikasi`
--
ALTER TABLE `verifikasi`
  ADD CONSTRAINT `verifikasi_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `verifikasi_ibfk_2` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
