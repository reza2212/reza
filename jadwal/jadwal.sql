-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2020 at 12:07 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jadwal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `kode_dosen` varchar(3) NOT NULL,
  `nama_dosen` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`kode_dosen`, `nama_dosen`, `password`) VALUES
('DRM', 'Doni Ramadhan', '81dc9bdb52d04dc20036dbd8313ed055'),
('REZ', 'Reza Dwi Prasetyo', '81dc9bdb52d04dc20036dbd8313ed055'),
('UFI', 'Shaufiah Abdullah', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kode_jadwal` int(10) NOT NULL,
  `nama_hari` varchar(6) NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_akhir` time NOT NULL,
  `kode_kelas` varchar(20) NOT NULL,
  `kode_ruangan` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`kode_jadwal`, `nama_hari`, `waktu_mulai`, `waktu_akhir`, `kode_kelas`, `kode_ruangan`) VALUES
(3, 'rabu', '06:30:00', '09:30:00', 'TI-3.12', 'F304'),
(4, 'kamis', '08:30:00', '10:30:00', 'KSI', 'F126'),
(7, 'selasa', '14:30:00', '16:30:00', 'TI-3.3', 'E301'),
(8, 'selasa', '10:30:00', '12:30:00', 'KSI', 'F126'),
(13, 'senin', '10:00:00', '12:50:00', 'TI-3.10', 'F304');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` varchar(20) NOT NULL,
  `kapasitas` int(3) NOT NULL,
  `kode_matakuliah` varchar(6) NOT NULL,
  `kode_dosen` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kode_kelas`, `kapasitas`, `kode_matakuliah`, `kode_dosen`) VALUES
('KSI', 20, 'ELA2D3', 'REZ'),
('TI-3.10', 50, 'ELA2D3', 'REZ'),
('TI-3.12', 40, 'CSG3I1', 'REZ'),
('TI-3.3', 40, 'AKG2J1', 'UFI');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(9) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `angkatan` int(4) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `angkatan`, `password`) VALUES
('E41182198', 'Doni Ramadhan', 2018, '81dc9bdb52d04dc20036dbd8313ed055'),
('E41182712', 'Trio Mahendra', 2019, '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_matakuliah` varchar(6) NOT NULL,
  `nama_matakuliah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_matakuliah`, `nama_matakuliah`) VALUES
('AKG2J1', 'Manajemen Basis Data'),
('CSA3J4', 'Pemrograman Berorientasi Objek'),
('CSG3I1', 'Praktikum RPL: Teknik Berorientasi Objek'),
('ELA2D3', 'Aplikasi Mobile'),
('FGH4D3', 'Web Frame Work');

-- --------------------------------------------------------

--
-- Table structure for table `registrasi`
--

CREATE TABLE `registrasi` (
  `kode_registrasi` int(11) NOT NULL,
  `nim` varchar(9) NOT NULL,
  `kode_kelas` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registrasi`
--

INSERT INTO `registrasi` (`kode_registrasi`, `nim`, `kode_kelas`, `timestamp`) VALUES
(17, 'E41182198', 'Lab.RSI', '2020-03-17 14:10:07'),
(18, 'E41182198', 'TI-3.1', '2020-03-17 14:10:11'),
(19, 'E41182198', 'TI-3.3', '2020-03-17 14:10:13'),
(20, 'E41182198', 'KSI', '2020-03-17 14:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kode_ruangan` varchar(4) NOT NULL,
  `kapasitas` int(3) NOT NULL,
  `ada_proyektor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kode_ruangan`, `kapasitas`, `ada_proyektor`) VALUES
('A203', 40, 1),
('B123', 40, 1),
('E301', 40, 1),
('F126', 20, 0),
('F304', 40, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kode_jadwal`),
  ADD KEY `kode_kelas` (`kode_kelas`,`kode_ruangan`),
  ADD KEY `kode_ruangan` (`kode_ruangan`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kelas`),
  ADD KEY `kode_dosen` (`kode_dosen`),
  ADD KEY `kode_matakuliah` (`kode_matakuliah`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_matakuliah`);

--
-- Indexes for table `registrasi`
--
ALTER TABLE `registrasi`
  ADD PRIMARY KEY (`kode_registrasi`),
  ADD KEY `nim` (`nim`,`kode_kelas`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kode_ruangan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `kode_jadwal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `registrasi`
--
ALTER TABLE `registrasi`
  MODIFY `kode_registrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`kode_kelas`) REFERENCES `kelas` (`kode_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_4` FOREIGN KEY (`kode_ruangan`) REFERENCES `ruangan` (`kode_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_3` FOREIGN KEY (`kode_matakuliah`) REFERENCES `mata_kuliah` (`kode_matakuliah`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kelas_ibfk_4` FOREIGN KEY (`kode_dosen`) REFERENCES `dosen` (`kode_dosen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `registrasi`
--
ALTER TABLE `registrasi`
  ADD CONSTRAINT `registrasi_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
