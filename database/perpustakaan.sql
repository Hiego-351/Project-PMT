-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Feb 2024 pada 11.27
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Hapus_Buku` (IN `BukuIDp` INT(11))   BEGIN
DECLARE BukuIDd integer;
SET BukuIDd = BukuIDp;
DELETE FROM buku WHERE BukuIDd = BukuID;
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Tambah_Akun` (IN `UserID` INT(11), IN `Username` VARCHAR(255), IN `Password` VARCHAR(255), IN `Email` VARCHAR(255), IN `NamaLengkap` VARCHAR(255), IN `Alamat` VARCHAR(255), IN `Level` VARCHAR(255))   BEGIN
INSERT INTO user VALUES (UserID, Username, Password, Email, NamaLengkap, Alamat, Level);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Tambah_Buku` (IN `BukuID` INT(11), IN `KategoriID` INT(11), IN `Cover` VARCHAR(255), IN `Judul` VARCHAR(255), IN `Penulis` VARCHAR(255), IN `Penerbit` VARCHAR(255), IN `TahunTerbit` VARCHAR(255), IN `Stok` VARCHAR(255))  NO SQL BEGIN
INSERT INTO buku VALUES (BukuID, KategoriID, Cover, Judul, Penulis, Penerbit, TahunTerbit, Stok);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Tambah_Kategori` (IN `KategoriID` INT(11), IN `NamaKategori` VARCHAR(255))  NO SQL BEGIN
INSERT INTO kategoribuku VALUES (KategoriID, NamaKategori);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Tambah_Koleksi` (IN `KoleksiID` INT(11), IN `UserID` INT(11), IN `BukuID` INT(11))   BEGIN
INSERT INTO koleksipribadi VALUES (KoleksiID, UserID, BukuID);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Tambah_Peminjaman` (IN `PeminjamanID` INT(11), IN `UserID` INT(11), IN `BukuID` INT(11), IN `TanggalPeminjaman` DATE, IN `TanggalPengembalian` DATE, IN `Jumlah` VARCHAR(255), IN `StatusPeminjaman` VARCHAR(255))   BEGIN
INSERT INTO peminjaman VALUES('PeminjamanID', UserID, BukuID, TanggalPeminjaman, TanggalPengembalian, Jumlah, StatusPeminjaman);
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
SET Coverd = Judulp;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`BukuID`, `KategoriID`, `Cover`, `Judul`, `Penulis`, `Penerbit`, `TahunTerbit`, `Stok`) VALUES
(31, 12, 'Filsafat_hukum.png', 'Filsafat Hukum', 'Dr. Dwi Atmoko, S.H, M.H.Dr. Ir. H. Erwin Owan Hermansyah Soetoto, S.E., S.H., M.H., M.M., M.M. Inv.', 'CV Literasi Nusantara Abadi', 2023, '5'),
(34, 7, 'Vol7.png', 'Youjo Senki Vol.7', 'Carlo Zen', 'Enterbrain', 2016, '3'),
(35, 7, 'Vol4.png', 'Youjo Senki Vol.4', 'Carlo Zen', 'Enterbrain', 2015, '2'),
(36, 7, 'Vol11.png', 'Youjo Senki Vol.11', 'Carlo Zen', 'Enterbrain', 2019, '5'),
(37, 7, 'Durarara!!_vol01_Cover.jpg', 'Durarara!!', 'Ryōgo Narita', 'ASCII Media Works', 2004, '5'),
(38, 16, 'Bobo.png', 'Majalah Bobo  (Edisi Koleksi Terbatas 50 Tahun) ', 'Tineke Latumeten, Adi Subrata, Jakob Oetama, PK Ojong', 'Majalah Bobo', 2023, '10'),
(39, 12, '9780718199715-jacket-large.png', 'The Ottoman Endgame', 'Sean McMeekin', 'Penguin', 2016, '3'),
(40, 12, '9780241347188-jacket-large.png', 'The Western Front', 'Nick Lloyd', 'Penguin', 2021, '4'),
(41, 12, '9780140170412-jacket-large.png', 'The Price of Glory', 'Alistair Horne', 'Penguin', 2007, '2'),
(42, 16, '9780241565742-jacket-large.png', 'Fritz and Kurt', 'Jeremy Dronfield, David Ziggy Greene (Illustrator)', 'Puffin', 2023, '5'),
(43, 16, '9780241527054-jacket-large.png', 'The Attack of the Robot Librarians', 'Sam Copeland, Jenny Pearson, Robin Boyden (Illustrator), Katie Kear (Illustrator)', 'Puffin', 2023, '2'),
(44, 16, '9780241596036-jacket-large.png', 'Lizzie and Lucky: The Mystery of the Disappearing Rabbit', 'Megan Rix, Tim Budgen (Illustrator)', 'Puffin', 2023, '3'),
(45, 14, '9781529151633-jacket-large.png', 'How to Build Impossible Things', 'Mark Ellison', 'Hutchinson Heinemann', 2023, '5'),
(46, 14, '9781529149609-jacket-large.png', 'How Not to Be an Antiques Dealer', 'Drew Pritchard', 'Ebury Spotlight', 2023, '2'),
(47, 15, '9781784707910-jacket-large.png', 'Good Pop, Bad Pop', 'Jarvis Cocker', 'Vintage', 2023, '1'),
(48, 15, '9781784743819-jacket-large.png', 'The Dress Diary of Mrs Anne Sykes', 'Kate Strasdin', 'Chatto & Windus', 2023, '1'),
(49, 13, 'IMG-20200612-WA0030.png', 'Ilmu Fiqih (Safinatun Najah)', 'Syekh Salim Ibnu Samir Al – Hadhrami', 'Sinar Baru Algensindo', 1995, '1'),
(50, 13, 'BLK_EADHPT2021679409.png', 'Ensiklopedia Al-Qur`an dan Hadis per Tema', 'Alita Aksara Media', 'Elex Media Komputindo', 2021, '3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `KategoriID` int(11) NOT NULL,
  `NamaKategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Struktur dari tabel `koleksipribadi`
--

CREATE TABLE `koleksipribadi` (
  `KoleksiID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BukuID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `koleksipribadi`
--

INSERT INTO `koleksipribadi` (`KoleksiID`, `UserID`, `BukuID`) VALUES
(8, 4, 37),
(9, 4, 34),
(10, 4, 35);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`, `Level`) VALUES
(1, 'fmaulid', '456', 'fajarmaulid411@gmail.com', 'Fajar Maulid', 'Kp. Neglasari', 'Admin'),
(4, 'asep', '123', 'asepstroberi@gmail.com', 'Asep Stroberi', 'Selat Sunda', 'User'),
(8, 'ryan', '456', 'ryanbatagor@gmail.com', 'Ryan Batagor', 'Ponorogo', 'Petugas');

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
  MODIFY `BukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `KategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  MODIFY `KoleksiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `PeminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`KategoriID`) REFERENCES `kategoribuku` (`KategoriID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
