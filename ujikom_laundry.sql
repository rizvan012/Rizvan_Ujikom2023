-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Mar 2023 pada 06.59
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ujikom_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `transaksi_id` int(11) DEFAULT NULL,
  `paket_id` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `total_harga` double DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `transaksi_id`, `paket_id`, `qty`, `total_harga`, `keterangan`, `total_bayar`) VALUES
(9, 33, 4, 10, 150000, NULL, 200000),
(10, 34, 4, 2, 30000, NULL, 30000),
(11, 35, 4, 2, 30000, NULL, 30000),
(12, 36, 4, 2, 30000, NULL, 30000),
(13, 37, 4, 2, 30000, NULL, 30000),
(14, 38, 4, 2, 30000, NULL, 30000),
(15, 39, 4, 2, 27000, NULL, 27000),
(16, 40, 4, 2, 27000, NULL, 30000),
(17, 41, 6, 2, 36000, NULL, 36000),
(18, 42, 6, 4, 64000, NULL, 64000),
(19, 43, 4, 1, 13500, NULL, NULL),
(20, 44, 4, 2, 21000, NULL, NULL),
(21, 45, 4, 1, 13500, NULL, NULL),
(22, 46, 4, 1, 15000, NULL, NULL),
(23, 47, 4, 1, 15000, NULL, NULL),
(24, 48, 4, 2, 30000, NULL, NULL),
(25, 49, 4, 2, 24000, NULL, NULL),
(26, 50, 7, 2, 35000, NULL, NULL),
(27, 51, 7, 1, 21250, NULL, NULL),
(28, 52, 4, 2, 27000, NULL, NULL),
(29, 53, 4, 1, 13500, NULL, NULL),
(30, 54, 4, 2, 448000, NULL, NULL),
(31, 55, 7, 2, 45000, NULL, NULL),
(32, 56, 4, 1, 13500, NULL, NULL),
(33, 57, 7, 1, 22500, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama_member` varchar(100) DEFAULT NULL,
  `alamat_member` text DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `telp_member` varchar(15) DEFAULT NULL,
  `no_ktp` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `alamat_member`, `jenis_kelamin`, `telp_member`, `no_ktp`) VALUES
(5, 'Abang Fikri', 'Ciamis', 'L', '0821340411', '123456789'),
(6, 'Rizvan Gunawan', 'Kp. Cicahem', 'L', '0895678765453', '321787676778877'),
(7, ' ukhu', 'yj tyj', 'L', 'yrty', '435346');

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(100) DEFAULT NULL,
  `alamat_outlet` text DEFAULT NULL,
  `telp_outlet` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `alamat_outlet`, `telp_outlet`) VALUES
(26, 'Outlet Mawar', 'Jalan Mawar', '081243555656'),
(28, 'Outlet karem', 'Batujajar', '08978765654');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `jenis_paket` enum('kiloan','selimut','bedcover','kaos','lain') DEFAULT NULL,
  `nama_paket` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `jenis_paket`, `nama_paket`, `harga`, `outlet_id`) VALUES
(4, 'kiloan', 'Paket Kering Wangi', 15000, 26),
(6, 'kiloan', 'Paket Khusus Madep', 20000, 26),
(7, 'bedcover', 'Paket Cuci Exspress', 25000, 28);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `kode_invoice` varchar(100) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL,
  `biaya_tambahan` int(11) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  `status` enum('baru','proses','selesai','diambil') DEFAULT NULL,
  `status_bayar` enum('dibayar','belum') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `outlet_id`, `kode_invoice`, `member_id`, `tgl`, `batas_waktu`, `tgl_pembayaran`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `status_bayar`, `user_id`) VALUES
(33, 26, 'DRY202003213927', 5, '2020-03-21 02:27:48', '2020-03-28 12:00:00', '2020-03-21 02:28:03', 0, 0, 0, 'diambil', 'dibayar', 11),
(34, 26, 'DRY202302233001', 5, '2023-02-23 03:01:52', '2023-03-02 12:00:00', '2023-03-01 03:27:39', 0, 0, 0, 'baru', 'dibayar', 1),
(35, 26, 'DRY202303021045', 5, '2023-03-02 01:51:32', '2023-03-09 12:00:00', '2023-03-10 02:25:46', 0, 0, 0, 'baru', 'dibayar', 1),
(36, 26, 'DRY202303023557', 5, '2023-03-02 01:58:08', '2023-03-09 12:00:00', '2023-03-10 02:30:53', 0, 0, 0, 'baru', 'dibayar', 1),
(37, 26, 'DRY202303072338', 5, '2023-03-07 04:38:31', '2023-03-14 12:00:00', '2023-03-10 02:39:00', 0, 0, 0, 'baru', 'dibayar', 1),
(38, 26, 'DRY202303071341', 5, '2023-03-07 04:41:23', '2023-03-14 12:00:00', '2023-03-10 02:30:33', 0, 10, 0, 'baru', 'dibayar', 1),
(39, 26, 'DRY202303074047', 5, '2023-03-07 04:47:48', '2023-03-14 12:00:00', '2023-03-10 02:57:21', 0, 10, 0, 'baru', 'dibayar', 1),
(40, 26, 'DRY202303075521', 5, '2023-03-07 05:22:04', '2023-03-14 12:00:00', '2023-03-11 01:28:04', 0, 10, 0, 'baru', 'dibayar', 1),
(41, 26, 'DRY202303072546', 6, '2023-03-07 05:46:40', '2023-03-14 12:00:00', '2023-03-10 02:49:17', 0, 10, 0, 'baru', 'dibayar', 1),
(42, 26, 'DRY202303081253', 6, '2023-03-08 02:53:24', '2023-03-15 12:00:00', '2023-03-10 02:26:25', 0, 20, 0, 'baru', 'dibayar', 1),
(43, 26, 'DRY202303083553', 6, '2023-03-08 02:53:45', '2023-03-15 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 1),
(44, 26, 'DRY202303091255', 5, '2023-03-09 02:55:22', '2023-03-16 12:00:00', NULL, 0, 30, 0, 'baru', 'belum', 1),
(45, 26, 'DRY202303092326', 5, '2023-03-09 03:26:42', '2023-03-16 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 1),
(46, 26, 'DRY202303092443', 5, '2023-03-09 08:45:51', '2023-03-16 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 11),
(47, 26, 'DRY202303090046', 5, '2023-03-09 08:46:08', '2023-03-16 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 11),
(48, 26, 'DRY202303103546', 5, '2023-03-10 01:46:45', '2023-03-17 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 11),
(49, 26, 'DRY202303101947', 5, '2023-03-10 01:47:28', '2023-03-17 12:00:00', NULL, 0, 20, 0, 'baru', 'belum', 1),
(50, 28, 'DRY202303101052', 6, '2023-03-10 01:52:22', '2023-03-17 12:00:00', NULL, 0, 30, 0, 'baru', 'belum', 1),
(51, 28, 'DRY202303103152', 6, '2023-03-10 01:52:39', '2023-03-17 12:00:00', NULL, 0, 15, 0, 'baru', 'belum', 1),
(52, 26, 'DRY202303100659', 6, '2023-03-10 01:59:20', '2023-03-17 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 11),
(53, 26, 'DRY202303103259', 5, '2023-03-10 01:59:43', '2023-03-17 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 11),
(54, 26, 'DRY202303104814', 5, '2023-03-10 02:15:11', '2023-03-17 12:00:00', NULL, 1000, 10, 1500, 'baru', 'belum', 1),
(55, 28, 'DRY202303102416', 6, '2023-03-10 02:16:34', '2023-03-17 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 1),
(56, 26, 'DRY202303105421', 5, '2023-03-10 02:22:01', '2023-03-17 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 1),
(57, 28, 'DRY202303104124', 6, '2023-03-10 02:24:52', '2023-03-17 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `role` enum('admin','kasir','owner') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `outlet_id`, `role`) VALUES
(1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 'admin'),
(10, 'Bapak Mawar', 'owner', '72122ce96bfec66e2396d2e25225d70a', 26, 'owner'),
(11, 'kasirmawar', 'kasir', 'c7911af3adbd12a035b289556d96470a', 26, 'kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_log`
--

CREATE TABLE `user_log` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `perubahan` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nama_user` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `paket_id` (`paket_id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `outlet_id` (`outlet_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indeks untuk tabel `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id_log`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`paket_id`) REFERENCES `paket` (`id_paket`);

--
-- Ketidakleluasaan untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD CONSTRAINT `paket_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`id_member`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
