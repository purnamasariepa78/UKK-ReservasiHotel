-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Bulan Mei 2022 pada 08.02
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_scada`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_fasilitas`
--

CREATE TABLE `tbl_fasilitas` (
  `idfasilitas` int(20) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_fasilitas`
--

INSERT INTO `tbl_fasilitas` (`idfasilitas`, `jenis`, `deskripsi`, `gambar`) VALUES
(1, 'Kolam Renang', 'Bar kolam renang dengan penataan unik untuk melewatkan hari dengan secangkir teh atau kopi atau segelas koktail. Memiliki pemandangan laut dan kolam renang yang fantasitis', 'hotel-di-padang2.jpg'),
(3, 'Gym', 'Bagi anda yang suka berolahraga, Kami manajemen Scada Hotel juga Menyediakan fasilitas olahraga dan gym, sehingga client juga bisa berolahraga di hotel tanpa harus capek pergi keluar sekedar mencari tempat GYM, dan juga berolahraga di GYM Scada Hotel juga sangat menyenangkan karena sambil berolahraga juga bisa sambil menikmati sunset di Penghujung senja.', 'gym.jpg'),
(4, 'Ruang Temu Bisnis', 'Menyediakan Ruang temu yang sangat mewah, dan bisa di desain juga, ruang ini berguna sebagai tampat mengadakan acara rapat bisnis yang di lakukan oleh pengusaha - pengusaha besar, dan sebagai acara lainnya juga. sehingga tidak rugi deh bagi para pebisnis atau pengusaha melakukan rapat penting mereka di Scada Hotel.', 'ruang temu.jpg'),
(5, 'Spa', 'Scada Hotel Menyediakan fasilitas SPA bagi para perempuan yang ingin tampil lebih cantik dan memanjakan diri mereka, selain itu petugas SPA juga sangat ramah serta produk yang pakai di SPA Scada Hotel di bawah perlindungan dokter kecantikan, jadi di jamin aman untuk kulit client.', 'spa.jpg'),
(8, 'Karoke', 'xxxxxxxxxxxxxxxx', '5e6a1c82405f1.jpg'),
(10, 'Restoran', 'nnn', 'bar.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_fasilitas_kamar`
--

CREATE TABLE `tbl_fasilitas_kamar` (
  `id_fasilitas` int(10) NOT NULL,
  `tipe_kamar` varchar(20) NOT NULL,
  `fasilitas` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_fasilitas_kamar`
--

INSERT INTO `tbl_fasilitas_kamar` (`id_fasilitas`, `tipe_kamar`, `fasilitas`) VALUES
(1, 'Super Presidents', 'kamar super president nan mewah yang memiliki sebuah kamar tidur utama dengan kamar mandi en-suite yang mewah, sofa, bak mandi, mantel mandi dan sebuah lemari pakaian. Kamar ini juga memiliki ruang tamu yang dilengkapi dengan fasilitas home theater, TV LCD dengan mini HiFi, ruang makan, dapur, dan kamar mandi tambahan.'),
(2, 'VIP', 'kamar VIP mewah yang memiliki sebuah kamar tidur utama dengan kamar mandi yang mewah, bak mandi, mantel mandi dan sebuah lemari pakaian. Kamar ini juga memiliki ruang tamu yang dilengkapi dengan fasilitas  TV LCD.'),
(3, 'Super VIP', 'Kamar super VIP memiliki dua tempat tidur berukuran Queen atau satu tempat tidur berukuran King dengan dua sofa permanen yang ideal digunakan untuk bersantai, atau bisa berfungsi sebagai tempat tidur tambahan untuk anak-anak.'),
(4, 'Deluxe VIP', 'Kamar Deluxe VIP memiliki tempat tidur berukuran Queen atau satu tempat tidur berukuran King dengan satu sofa permanen yang ideal digunakan untuk bersantai, atau bisa berfungsi sebagai tempat tidur bagi anak-anak.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kamar`
--

CREATE TABLE `tbl_kamar` (
  `id_kamar` int(10) NOT NULL,
  `id_fasilitas` int(10) NOT NULL,
  `no_kamar` char(11) NOT NULL,
  `tarif` double NOT NULL,
  `foto` varchar(50) NOT NULL,
  `jumlah_kamar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kamar`
--

INSERT INTO `tbl_kamar` (`id_kamar`, `id_fasilitas`, `no_kamar`, `tarif`, `foto`, `jumlah_kamar`) VALUES
(4, 1, 'A', 2500000, 'Capture1.JPG', 5),
(5, 2, 'B', 2000000, 'Capture2.JPG', 10),
(6, 3, 'C', 1500000, 'Capture3.JPG', 10),
(7, 4, 'D', 1000000, 'Capture4.JPG', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pemesan`
--

CREATE TABLE `tbl_pemesan` (
  `nik` char(20) NOT NULL,
  `nama_pemesan` varchar(30) NOT NULL,
  `email_pemesan` varchar(32) NOT NULL,
  `nama_tamu` varchar(30) NOT NULL,
  `alamat_pemesan` text NOT NULL,
  `no_telp_pemesan` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_petugas`
--

CREATE TABLE `tbl_petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `level` enum('admin','resepsionis') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_petugas`
--

INSERT INTO `tbl_petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `level`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'admin', 'admin'),
(2, 'petugas', '202cb962ac59075b964b07152d234b70', 'resepsionis', 'resepsionis');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_reservasi`
--

CREATE TABLE `tbl_reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `nama_pemesan` varchar(30) NOT NULL,
  `email_pemesan` varchar(32) NOT NULL,
  `nama_tamu` varchar(30) NOT NULL,
  `no_telp` char(13) NOT NULL,
  `tgl_cek_in` date NOT NULL,
  `tgl_cek_out` date NOT NULL,
  `jumlah_kamar_dipensan` int(11) NOT NULL,
  `status` enum('cek in','cek out') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_reservasi`
--

INSERT INTO `tbl_reservasi` (`id_reservasi`, `id_kamar`, `nama_pemesan`, `email_pemesan`, `nama_tamu`, `no_telp`, `tgl_cek_in`, `tgl_cek_out`, `jumlah_kamar_dipensan`, `status`) VALUES
(18, 5, 'Priska', 'priska@gmail.com', 'Priska', '08912345678', '2022-05-27', '2022-05-28', 1, 'cek in');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_fasilitas`
--
ALTER TABLE `tbl_fasilitas`
  ADD PRIMARY KEY (`idfasilitas`);

--
-- Indeks untuk tabel `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indeks untuk tabel `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indeks untuk tabel `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  ADD PRIMARY KEY (`id_reservasi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_fasilitas`
--
ALTER TABLE `tbl_fasilitas`
  MODIFY `idfasilitas` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  MODIFY `id_fasilitas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  MODIFY `id_kamar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
