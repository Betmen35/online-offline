-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 06 Ara 2021, 19:50:12
-- Sunucu sürümü: 10.1.21-MariaDB
-- PHP Sürümü: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `chat`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odalar`
--

CREATE TABLE `odalar` (
  `id` int(11) NOT NULL,
  `oda` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `dosya` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `tarih` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `sonodeme` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `sifre` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `kilit` int(11) NOT NULL,
  `kilidim` int(11) NOT NULL,
  `odakilitle` int(11) NOT NULL,
  `odakilitmetin` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `besrole_id` int(11) NOT NULL,
  `onay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `odalar`
--

INSERT INTO `odalar` (`id`, `oda`, `dosya`, `tarih`, `sonodeme`, `sifre`, `kilit`, `kilidim`, `odakilitle`, `odakilitmetin`, `role_id`, `besrole_id`, `onay`) VALUES
(2, 'canlı müzik', 'txtler/canli.txt', '30.10.2021', '30.11.2021', '', 0, 1, 0, 'hayır', 1, 5, 1),
(3, 'türkü', 'txtler/turku.txt', '29.11.2021', '29.12.2021', 'abc', 1, 1, 0, 'hayır', 1, 5, 1),
(5, 'siyaset', 'txtler/siyaset.txt', '04.12.2021', '03.01.2022', '', 0, 1, 0, '', 1, 5, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ozelmesal`
--

CREATE TABLE `ozelmesal` (
  `id` int(11) NOT NULL,
  `kimden` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kimin_id` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `yazi` text COLLATE utf8_turkish_ci NOT NULL,
  `kime` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ozelmesal`
--

INSERT INTO `ozelmesal` (`id`, `kimden`, `kimin_id`, `yazi`, `kime`, `tarih`) VALUES
(3, 'Baha', '6', 'merhaba batı', 'bati', '2021-11-28 16:16:05'),
(4, 'bati', '5', 'iyiyim sen', 'Baha', '2021-11-28 16:16:05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `rutbe` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `profil_resmi` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `tarih` datetime NOT NULL,
  `onlinemi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `rutbe`, `remember_token`, `profil_resmi`, `tarih`, `onlinemi`) VALUES
(5, 'bati', 'batiaktas@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'üye', '', '', '0000-00-00 00:00:00', 0),
(8, 'ahmet', 'betmenlerdiyari@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'üye', '', '', '0000-00-00 00:00:00', 0),
(11, 'esra', 'esra35@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e', 5, 'superadmin', '', '', '2021-12-06 21:38:22', 1),
(23, 'betmen', 'baha35@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e', 3, 'banlı', NULL, '', '2021-12-06 21:34:37', 1),
(24, 'Baha', 'info@yazilimmutfagi.xyz', 'fa7392ea342575c9b1307d6c0a9cac55', 1, 'yönetici', NULL, 'profilresmi/2576.jpg', '2021-12-06 21:49:31', 1),
(25, 'mehmet', 'mehmet@gmail.com', 'fcea920f7412b5da7be0cf42b8c93759', 0, 'üye', NULL, '', '0000-00-00 00:00:00', 0);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `odalar`
--
ALTER TABLE `odalar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `ozelmesal`
--
ALTER TABLE `ozelmesal`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `odalar`
--
ALTER TABLE `odalar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Tablo için AUTO_INCREMENT değeri `ozelmesal`
--
ALTER TABLE `ozelmesal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
