-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Feb 2024 pada 01.34
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
-- Database: `perpustakaan.`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Hapus_Kategori` (IN `KategoriIDp` INT(11))  NO SQL BEGIN 
DECLARE KategoriIDd integer;
SET KategoriIDd = KategoriIDp;
DELETE FROM kategoribuku WHERE KategoriIDd = KategoriID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Hapus_Koleksi` (IN `KoleksiIDp` INT(11))   BEGIN 
DECLARE KoleksiIDd integer;
SET KoleksiIDd = KoleksiIDp;
DELETE FROM koleksipribadi WHERE KoleksiIDd = KoleksiID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pengembalian` (IN `PeminjamanIDp` INT(11), IN `UserIDp` INT(11), IN `BukuIDp` INT(11), IN `TanggalPeminjamanp` DATE, IN `TanggalPengembalianp` DATE, IN `Jumlahp` VARCHAR(255), IN `StatusPeminjamanp` VARCHAR(255))   BEGIN
DECLARE PeminjamanIDd integer;
DECLARE UserIDd integer;
DECLARE BukuIDd integer;
DECLARE TanggalPeminjamand date;
DECLARE TanggalPengembaliand date;
DECLARE Jumlahd varchar (255);
DECLARE StatusPeminjamand varchar(255);
SET PeminjamanIDd = PeminjamanIDp;
SET UserIDd = UserIDp;
SET BukuIDd = BukuIDp;
SET TanggalPeminjamand = TanggalPeminjamanp;
SET TanggalPengembaliand = TanggalPengembalianp;
SET Jumlahd = Jumlahp;
SET StatusPeminjamand = StatusPeminjamanp;
UPDATE peminjaman SET UserID=UserIDd, BukuID=BukuIDd, TanggalPeminjaman=TanggalPeminjamand, TanggalPengembalian=TanggalPengembaliand, Jumlah=JumlahD, StatusPeminjaman=StatusPeminjamand WHERE PeminjamanID=PeminjamanIDd;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Tambah_Buku` (IN `BukuID` INT(11), IN `KategoriID` INT(11), IN `Cover` VARCHAR(255), IN `Judul` VARCHAR(255), IN `Penulis` VARCHAR(255), IN `Penerbit` VARCHAR(255), IN `TahunTerbit` VARCHAR(255), IN `Stok` VARCHAR(255))  NO SQL BEGIN
INSERT INTO buku VALUES (BukuID, KategoriID, Cover, Judul, Penulis, Penerbit, TahunTerbit, Stok);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Tambah_Kategori` (IN `KategoriID` INT(11), IN `NamaKategori` VARCHAR(255))  NO SQL BEGIN
INSERT INTO kategoribuku VALUES ('KategoriID', NamaKategori);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Tambah_Koleksi` (IN `KoleksiID` INT(11), IN `UserID` INT(11), IN `BukuID` INT(11))   BEGIN
INSERT INTO koleksipribadi VALUES ('KoleksiID', UserID, BukuID);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Tambah_Peminjaman` (IN `PeminjamanID` INT(11), IN `UserID` INT(11), IN `BukuID` INT(11), IN `TanggalPeminjaman` DATE, IN `TanggalPengembalian` DATE, IN `Jumlah` VARCHAR(255), IN `StatusPeminjaman` VARCHAR(255))   BEGIN
INSERT INTO peminjaman VALUES(PeminjamanID, UserID, BukuID, TanggalPeminjaman, TanggalPengembalian, Jumlah, StatusPeminjaman);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ubah_Buku` (IN `BukuIDp` INT(11), IN `KategoriIDp` INT(11), IN `Coverp` VARCHAR(255), IN `Judulp` VARCHAR(255), IN `Penulisp` VARCHAR(255), IN `Penerbitp` VARCHAR(255), IN `TahunTerbitp` VARCHAR(255), IN `Stokp` VARCHAR(255))  NO SQL BEGIN
DECLARE BukuIDd integer;
DECLARE KategoriIDd integer;
DECLARE Coverd varchar (255);
DECLARE Juduld varchar (255);
DECLARE Penulisd varchar (255);
DECLARE Penerbitd varchar (255);
DECLARE TahunTerbitd varchar (255);
DECLARE Stokd varchar (255);
SET BukuIDd = BukuIDp;
SET KategoriIDd = KategoriIDp;
SET Coverd = Coverp;
SET Juduld = Judulp;
SET Penulisd = Penulisp;
SET Penerbitd = Penerbitp;
SET TahunTerbitd = TahunTerbitp;
SET Stokd = Stokp;
UPDATE buku SET KategoriID = KategoriIDd WHERE BukuID = BukuIDd;
UPDATE buku SET Cover = Coverd WHERE BukuID = BukuIDd;
UPDATE buku SET Judul = Juduld WHERE BukuID = BukuIDd;
UPDATE buku SET Penulis = Penulisd WHERE BukuID = BukuIDd;
UPDATE buku SET Penerbit = Penerbitd WHERE BukuID = BukuIDd;
UPDATE buku SET TahunTerbit = TahunTerbitd WHERE BukuID = BukuIDd;
UPDATE buku SET Stok = Stokd WHERE BukuID = BukuIDd;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ubah_Buku1` (IN `BukuIDp` INT(11), IN `KategoriIDp` INT(11), IN `Judulp` VARCHAR(255), IN `Penulisp` VARCHAR(255), IN `Penerbitp` VARCHAR(255), IN `TahunTerbitp` VARCHAR(255), IN `Stokp` VARCHAR(255))  NO SQL BEGIN
DECLARE BukuIDd integer;
DECLARE KategoriIDd integer;
DECLARE Juduld varchar (255);
DECLARE Penulisd varchar (255);
DECLARE Penerbitd varchar (255);
DECLARE TahunTerbitd varchar (255);
DECLARE Stokd varchar (255);
SET BukuIDd = BukuIDp;
SET KategoriIDd = KategoriIDp;
SET Juduld = Judulp;
SET Penulisd = Penulisp;
SET Penerbitd = Penerbitp;
SET TahunTerbitd = TahunTerbitp;
SET Stokd = Stokp;
UPDATE buku SET KategoriID = KategoriIDd WHERE BukuID = BukuIDd;
UPDATE buku SET Judul = Juduld WHERE BukuID = BukuIDd;
UPDATE buku SET Penulis = Penulisd WHERE BukuID = BukuIDd;
UPDATE buku SET Penerbit = Penerbitd WHERE BukuID = BukuIDd;
UPDATE buku SET TahunTerbit = TahunTerbitd WHERE BukuID = BukuIDd;
UPDATE buku SET Stok = Stokd WHERE BukuID = BukuIDd;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ubah_Kategori` (IN `KategoriIDp` INT(11), IN `NamaKategorip` VARCHAR(255))  NO SQL BEGIN
DECLARE KategoriIDd integer;
DECLARE NamaKategorid varchar(255);
SET KategoriIDd = KategoriIDp;
SET NamaKategorid = NamaKategorip;
UPDATE kategoribuku SET NamaKategori = NamaKategorid WHERE KategoriID = KategoriIDd;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `BukuID` int(11) NOT NULL,
  `KategoriID` int(11) DEFAULT NULL,
  `Cover` varchar(255) DEFAULT NULL,
  `Judul` varchar(255) DEFAULT NULL,
  `Penulis` varchar(255) DEFAULT NULL,
  `Penerbit` varchar(255) DEFAULT NULL,
  `TahunTerbit` int(11) DEFAULT NULL,
  `Stok` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`BukuID`, `KategoriID`, `Cover`, `Judul`, `Penulis`, `Penerbit`, `TahunTerbit`, `Stok`) VALUES
(27, 7, 'SL-100820-36440-01.jpg', 'Durarara!!d', 'Ryōgo Narita', 'ASCII Media Works', 2004, '11'),
(33, 7, 'kereta-api.jpg', 'dasdsads', 'dsadsd', 'sads', 2312, '31'),
(34, 7, 'kumbangtanduk.jpg', 'dasdasd', 'dsadasds', 'dsdsdsd', 2321321, '11'),
(35, 7, 'jalan pemmandan.jpg', 'dasdaswdsa', 'dasdwad', 'wdasads', 23211, '321');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `KategoriID` int(11) NOT NULL,
  `NamaKategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategoribuku`
--

INSERT INTO `kategoribuku` (`KategoriID`, `NamaKategori`) VALUES
(7, 'Fiksi'),
(12, 'Non-Fiksi'),
(13, 'Agama'),
(14, 'Panduan'),
(15, 'Gaya Hidup'),
(16, 'Anak - Anak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku_relasi`
--

CREATE TABLE `kategoribuku_relasi` (
  `KategoriBukuID` int(11) NOT NULL,
  `BukuID` int(11) DEFAULT NULL,
  `KategoriID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksipribadi`
--

CREATE TABLE `koleksipribadi` (
  `KoleksiID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BukuID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `koleksipribadi`
--

INSERT INTO `koleksipribadi` (`KoleksiID`, `UserID`, `BukuID`) VALUES
(7, 4, 27);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `PeminjamanID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BukuID` int(11) DEFAULT NULL,
  `TanggalPeminjaman` date DEFAULT NULL,
  `TanggalPengembalian` date DEFAULT NULL,
  `Jumlah` varchar(255) DEFAULT NULL,
  `StatusPeminjaman` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`PeminjamanID`, `UserID`, `BukuID`, `TanggalPeminjaman`, `TanggalPengembalian`, `Jumlah`, `StatusPeminjaman`) VALUES
(72, 4, 27, '2024-02-18', '2024-02-18', '0', 'Dikembalikan'),
(73, 4, 27, '2024-02-18', '2024-02-18', '0', 'Dikembalikan'),
(74, 4, 27, '2024-02-18', '2024-02-18', '0', 'Dikembalikan'),
(75, 4, 27, '2024-02-18', '2024-02-18', '0', 'Dikembalikan'),
(77, 4, 27, '2024-02-18', '2024-02-18', '0', 'Dikembalikan'),
(79, 4, 27, '2024-02-18', '2024-02-19', '0', 'Dikembalikan'),
(83, 4, 27, '2024-02-19', '2024-02-19', '1', 'Dikembalikan'),
(86, 4, 27, '2024-02-19', '0000-00-00', '12', 'Ditolak'),
(87, 4, 27, '2024-02-19', '0000-00-00', '10', 'Ditolak'),
(88, 4, 27, '2024-02-19', '0000-00-00', '10', 'Ditolak'),
(90, 4, 27, '2024-02-19', '2024-02-19', '12', 'Dikembalikan');

--
-- Trigger `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `Peminjaman` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
IF NEW.StatusPeminjaman = 'Disetujui' AND
OLD.StatusPeminjaman != NEW.StatusPeminjaman THEN
UPDATE buku SET Stok = Stok - NEW.Jumlah WHERE BukuID = NEW.BukuID;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Pengembalian` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
IF NEW.StatusPeminjaman = 'Dikembalikan' AND
OLD.StatusPeminjaman != NEW.StatusPeminjaman THEN
UPDATE buku SET Stok = Stok + NEW.Jumlah WHERE BukuID = NEW.BukuID;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasanbuku`
--

CREATE TABLE `ulasanbuku` (
  `UlasanID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BukuID` int(11) DEFAULT NULL,
  `Ulasan` text DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `NamaLengkap` varchar(255) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `Level` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`, `Level`) VALUES
(1, 'fmaulid', '456', 'fajarmaulid411@gmail.com', 'Fajar Maulid', 'Kp. Neglasari', 'Admin'),
(4, 'asep', '123', 'asepstroberi@gmail.com', 'Asep Stroberi', 'Selat Sunda', 'User');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`BukuID`),
  ADD KEY `KategoriID` (`KategoriID`);

--
-- Indeks untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`KategoriID`);

--
-- Indeks untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD PRIMARY KEY (`KategoriBukuID`),
  ADD KEY `BukuID` (`BukuID`),
  ADD KEY `KategoriID` (`KategoriID`);

--
-- Indeks untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD PRIMARY KEY (`KoleksiID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`PeminjamanID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indeks untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD PRIMARY KEY (`UlasanID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `BukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `KategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  MODIFY `KategoriBukuID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  MODIFY `KoleksiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `PeminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  MODIFY `UlasanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`KategoriID`) REFERENCES `kategoribuku` (`KategoriID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_2` FOREIGN KEY (`KategoriID`) REFERENCES `kategoribuku` (`KategoriID`),
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_3` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD CONSTRAINT `koleksipribadi_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `koleksipribadi_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD CONSTRAINT `ulasanbuku_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ulasanbuku_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
