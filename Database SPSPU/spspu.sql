-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Okt 2019 pada 16.33
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spspu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

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
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id_user` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `level` enum('Admin','Staff','Mahasiswa') NOT NULL,
  `id_admin` varchar(20) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nim` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `alamat` text NOT NULL,
  `fakultas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

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
-- Struktur dari tabel `pengembalian`
--

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
-- Struktur dari tabel `prasarana`
--

CREATE TABLE `prasarana` (
  `id_prasarana` varchar(20) NOT NULL,
  `nama_prasarana` varchar(20) NOT NULL,
  `kondisi_prasarana` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sarana`
--

CREATE TABLE `sarana` (
  `id_sarana` varchar(20) NOT NULL,
  `nama_sarana` varchar(20) NOT NULL,
  `luas_ruangan` varchar(20) NOT NULL,
  `jumlah_prasarana` int(20) NOT NULL,
  `id_prasarana` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `staff`
--

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
-- Struktur dari tabel `verifikasi`
--

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
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `id_prasarana` (`id_prasarana`),
  ADD UNIQUE KEY `id_sarana` (`id_sarana`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD UNIQUE KEY `nip` (`id_admin`),
  ADD UNIQUE KEY `id_peminjaman` (`id_peminjaman`),
  ADD UNIQUE KEY `id_prasarana` (`id_prasarana`),
  ADD UNIQUE KEY `id_sarana` (`id_sarana`);

--
-- Indeks untuk tabel `prasarana`
--
ALTER TABLE `prasarana`
  ADD PRIMARY KEY (`id_prasarana`);

--
-- Indeks untuk tabel `sarana`
--
ALTER TABLE `sarana`
  ADD PRIMARY KEY (`id_sarana`),
  ADD UNIQUE KEY `id_prasarana` (`id_prasarana`);

--
-- Indeks untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `verifikasi`
--
ALTER TABLE `verifikasi`
  ADD PRIMARY KEY (`id_verifikasi`),
  ADD UNIQUE KEY `nip` (`id_admin`),
  ADD UNIQUE KEY `id_peminjaman` (`id_peminjaman`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akun`
--
ALTER TABLE `akun`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `akun_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `akun_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `akun_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `staff` (`nip`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `staff` (`nip`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_sarana`) REFERENCES `sarana` (`id_sarana`),
  ADD CONSTRAINT `peminjaman_ibfk_4` FOREIGN KEY (`id_prasarana`) REFERENCES `prasarana` (`id_prasarana`);

--
-- Ketidakleluasaan untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`),
  ADD CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`id_prasarana`) REFERENCES `prasarana` (`id_prasarana`),
  ADD CONSTRAINT `pengembalian_ibfk_4` FOREIGN KEY (`id_sarana`) REFERENCES `sarana` (`id_sarana`);

--
-- Ketidakleluasaan untuk tabel `sarana`
--
ALTER TABLE `sarana`
  ADD CONSTRAINT `sarana_ibfk_1` FOREIGN KEY (`id_prasarana`) REFERENCES `prasarana` (`id_prasarana`);

--
-- Ketidakleluasaan untuk tabel `verifikasi`
--
ALTER TABLE `verifikasi`
  ADD CONSTRAINT `verifikasi_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `verifikasi_ibfk_2` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
