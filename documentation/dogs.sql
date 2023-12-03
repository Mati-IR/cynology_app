-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: users_db
-- Generation Time: Dec 03, 2023 at 05:59 PM
-- Wersja serwera: 8.0.32
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dogs`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `passwordHash` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Color`
--

CREATE TABLE `Color` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Dog`
--

CREATE TABLE `Dog` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `kennel_id` int DEFAULT NULL,
  `race_id` int NOT NULL,
  `sex` int NOT NULL,
  `date_of_brith` date NOT NULL,
  `color_id` int NOT NULL,
  `father_id` int NOT NULL,
  `mother_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Kennel`
--

CREATE TABLE `Kennel` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `owner_surname` varchar(255) NOT NULL,
  `kennel_nickname` varchar(255) NOT NULL,
  `phone_number` int NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Medical_history`
--

CREATE TABLE `Medical_history` (
  `id` int NOT NULL,
  `dog_id` int NOT NULL,
  `procedure_name` varchar(255) NOT NULL,
  `procedure_description` text NOT NULL,
  `clinic_name` varchar(45) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Owner`
--

CREATE TABLE `Owner` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` int NOT NULL,
  `city` varchar(255) NOT NULL,
  `addres` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Owner_dog_list`
--

CREATE TABLE `Owner_dog_list` (
  `id` int NOT NULL,
  `owner_id` int NOT NULL,
  `dog_id` int NOT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Race`
--

CREATE TABLE `Race` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `Color`
--
ALTER TABLE `Color`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `Dog`
--
ALTER TABLE `Dog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1` (`kennel_id`),
  ADD KEY `FK_2` (`race_id`),
  ADD KEY `FK_3` (`color_id`),
  ADD KEY `FK_4` (`mother_id`),
  ADD KEY `FK_5` (`father_id`);

--
-- Indeksy dla tabeli `Kennel`
--
ALTER TABLE `Kennel`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `Medical_history`
--
ALTER TABLE `Medical_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1` (`dog_id`);

--
-- Indeksy dla tabeli `Owner`
--
ALTER TABLE `Owner`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `Owner_dog_list`
--
ALTER TABLE `Owner_dog_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1` (`owner_id`),
  ADD KEY `FK_2` (`dog_id`);

--
-- Indeksy dla tabeli `Race`
--
ALTER TABLE `Race`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Dog`
--
ALTER TABLE `Dog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Dog`
--
ALTER TABLE `Dog`
  ADD CONSTRAINT `FK_2` FOREIGN KEY (`kennel_id`) REFERENCES `Kennel` (`id`),
  ADD CONSTRAINT `FK_2_1` FOREIGN KEY (`race_id`) REFERENCES `Race` (`id`),
  ADD CONSTRAINT `FK_3` FOREIGN KEY (`color_id`) REFERENCES `Color` (`id`),
  ADD CONSTRAINT `FK_4` FOREIGN KEY (`mother_id`) REFERENCES `Dog` (`id`),
  ADD CONSTRAINT `FK_5` FOREIGN KEY (`father_id`) REFERENCES `Dog` (`id`);

--
-- Constraints for table `Medical_history`
--
ALTER TABLE `Medical_history`
  ADD CONSTRAINT `FK_8` FOREIGN KEY (`dog_id`) REFERENCES `Dog` (`id`);

--
-- Constraints for table `Owner_dog_list`
--
ALTER TABLE `Owner_dog_list`
  ADD CONSTRAINT `FK_6` FOREIGN KEY (`owner_id`) REFERENCES `Owner` (`id`),
  ADD CONSTRAINT `FK_7` FOREIGN KEY (`dog_id`) REFERENCES `Dog` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
