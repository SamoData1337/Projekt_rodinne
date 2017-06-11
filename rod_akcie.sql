-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Ne 11.Jún 2017, 22:43
-- Verzia serveru: 10.1.19-MariaDB
-- Verzia PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `rod_akcie`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `jedla`
--

CREATE TABLE `jedla` (
  `ID` int(11) NOT NULL,
  `Nazov_jedla` varchar(45) NOT NULL,
  `Popis_jedla` varchar(500) NOT NULL,
  `Cena` double NOT NULL,
  `Typ_jedla_ID` int(11) DEFAULT NULL,
  `wadresa` varchar(200) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `jedla`
--

INSERT INTO `jedla` (`ID`, `Nazov_jedla`, `Popis_jedla`, `Cena`, `Typ_jedla_ID`, `wadresa`, `image`) VALUES
(3, 'Rezen', 'jedlo hahahah', 11, NULL, 'Rezen', NULL),
(4, 'dkakw', 'wdawdwa', 22, NULL, 'dkakw', NULL),
(5, 'Polievocka', 'polievka horuca', 4, NULL, 'Polievocka', NULL);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `menu`
--

CREATE TABLE `menu` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `menu`
--

INSERT INTO `menu` (`ID`) VALUES
(1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `menu_has_jedla`
--

CREATE TABLE `menu_has_jedla` (
  `Menu_ID` int(11) NOT NULL,
  `Jedla_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `menu_has_jedla`
--

INSERT INTO `menu_has_jedla` (`Menu_ID`, `Jedla_ID`) VALUES
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `miesto_konania`
--

CREATE TABLE `miesto_konania` (
  `ID` int(11) NOT NULL,
  `Mesto` varchar(45) NOT NULL,
  `Adresa` varchar(45) NOT NULL,
  `Nazov_miesta` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `miesto_konania`
--

INSERT INTO `miesto_konania` (`ID`, `Mesto`, `Adresa`, `Nazov_miesta`) VALUES
(1, 'Nitra', 'Stefanikova 45', 'Restauracia Olymp'),
(2, 'Bratislava', 'Hlavna 2', 'Hotel Sano');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `objednavka`
--

CREATE TABLE `objednavka` (
  `ID` int(11) NOT NULL,
  `Specialne_poziadavky_ID` int(11) NOT NULL,
  `Typ_oslavy` varchar(45) NOT NULL,
  `Miesto_konania_ID` int(11) NOT NULL,
  `Vyzdoba_ID` int(11) NOT NULL,
  `Menu_ID` int(11) NOT NULL,
  `program_typ_has_Ucinkujuci_program_typ_ID` int(11) DEFAULT NULL,
  `program_typ_has_Ucinkujuci_Ucinkujuci_ID` int(11) DEFAULT NULL,
  `wadresa` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `objednavka`
--

INSERT INTO `objednavka` (`ID`, `Specialne_poziadavky_ID`, `Typ_oslavy`, `Miesto_konania_ID`, `Vyzdoba_ID`, `Menu_ID`, `program_typ_has_Ucinkujuci_program_typ_ID`, `program_typ_has_Ucinkujuci_Ucinkujuci_ID`, `wadresa`) VALUES
(2, 1, 'Narodeninova oslava', 1, 2, 1, NULL, NULL, 'Narodeninova');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `program_typ`
--

CREATE TABLE `program_typ` (
  `ID` int(11) NOT NULL,
  `Nazov` varchar(45) NOT NULL,
  `cas_OD` time NOT NULL,
  `cas_DO` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `program_typ`
--

INSERT INTO `program_typ` (`ID`, `Nazov`, `cas_OD`, `cas_DO`) VALUES
(1, 'Disko', '21:00:00', '03:00:00'),
(2, 'Zabijacka', '14:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `program_typ_has_ucinkujuci`
--

CREATE TABLE `program_typ_has_ucinkujuci` (
  `program_typ_ID` int(11) NOT NULL,
  `Ucinkujuci_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `program_typ_has_ucinkujuci`
--

INSERT INTO `program_typ_has_ucinkujuci` (`program_typ_ID`, `Ucinkujuci_ID`) VALUES
(1, 1),
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `specialne_poziadavky`
--

CREATE TABLE `specialne_poziadavky` (
  `ID` int(11) NOT NULL,
  `Poziadavka` varchar(455) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `specialne_poziadavky`
--

INSERT INTO `specialne_poziadavky` (`ID`, `Poziadavka`) VALUES
(1, 'Viac kvetov');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `typ_jedla`
--

CREATE TABLE `typ_jedla` (
  `ID` int(11) NOT NULL,
  `Typ` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `typ_jedla`
--

INSERT INTO `typ_jedla` (`ID`, `Typ`) VALUES
(1, 'Polievka'),
(3, 'Pred jedlo'),
(4, 'Hlavne jedlo'),
(5, 'Dezert');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `typ_vyzdoby`
--

CREATE TABLE `typ_vyzdoby` (
  `ID` int(11) NOT NULL,
  `Simple` tinyint(1) NOT NULL DEFAULT '0',
  `Standart` tinyint(1) NOT NULL DEFAULT '0',
  `Exclusive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `typ_vyzdoby`
--

INSERT INTO `typ_vyzdoby` (`ID`, `Simple`, `Standart`, `Exclusive`) VALUES
(1, 1, 0, 0),
(2, 0, 1, 0),
(3, 0, 0, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `ucinkujuci`
--

CREATE TABLE `ucinkujuci` (
  `ID` int(11) NOT NULL,
  `Meno` varchar(45) NOT NULL,
  `Priezvisko` varchar(45) NOT NULL,
  `Cena_hodina` double NOT NULL,
  `Kategoria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `ucinkujuci`
--

INSERT INTO `ucinkujuci` (`ID`, `Meno`, `Priezvisko`, `Cena_hodina`, `Kategoria`) VALUES
(1, 'Palo ', 'Habera', 30, 'spevak'),
(2, 'Johnny', 'Beat', 40, 'tanecnik');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Meno` varchar(55) NOT NULL,
  `Priezvisko` varchar(55) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`ID`, `Meno`, `Priezvisko`, `email`) VALUES
(1, 'user1', 'user1priezvisko', 'user1@gmail.com'),
(2, 'user2', 'user2priezvisko', 'user2@gmail.com');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `vyzdoba`
--

CREATE TABLE `vyzdoba` (
  `ID` int(11) NOT NULL,
  `Typ_vyzdoby_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sťahujem dáta pre tabuľku `vyzdoba`
--

INSERT INTO `vyzdoba` (`ID`, `Typ_vyzdoby_ID`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `jedla`
--
ALTER TABLE `jedla`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Jedla_Typ_jedla1_idx` (`Typ_jedla_ID`);

--
-- Indexy pre tabuľku `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pre tabuľku `menu_has_jedla`
--
ALTER TABLE `menu_has_jedla`
  ADD PRIMARY KEY (`Menu_ID`,`Jedla_ID`),
  ADD KEY `fk_Menu_has_Jedla_Jedla1_idx` (`Jedla_ID`),
  ADD KEY `fk_Menu_has_Jedla_Menu_idx` (`Menu_ID`);

--
-- Indexy pre tabuľku `miesto_konania`
--
ALTER TABLE `miesto_konania`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pre tabuľku `objednavka`
--
ALTER TABLE `objednavka`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Objednavka_Specialne_poziadavky1_idx` (`Specialne_poziadavky_ID`),
  ADD KEY `fk_Objednavka_Miesto_konania1_idx` (`Miesto_konania_ID`),
  ADD KEY `fk_Objednavka_Vyzdoba1_idx` (`Vyzdoba_ID`),
  ADD KEY `fk_Objednavka_Menu1_idx` (`Menu_ID`),
  ADD KEY `fk_Objednavka_program_typ_has_Ucinkujuci1_idx` (`program_typ_has_Ucinkujuci_program_typ_ID`,`program_typ_has_Ucinkujuci_Ucinkujuci_ID`);

--
-- Indexy pre tabuľku `program_typ`
--
ALTER TABLE `program_typ`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pre tabuľku `program_typ_has_ucinkujuci`
--
ALTER TABLE `program_typ_has_ucinkujuci`
  ADD PRIMARY KEY (`program_typ_ID`,`Ucinkujuci_ID`),
  ADD KEY `fk_program_typ_has_Ucinkujuci_Ucinkujuci1_idx` (`Ucinkujuci_ID`),
  ADD KEY `fk_program_typ_has_Ucinkujuci_program_typ1_idx` (`program_typ_ID`);

--
-- Indexy pre tabuľku `specialne_poziadavky`
--
ALTER TABLE `specialne_poziadavky`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pre tabuľku `typ_jedla`
--
ALTER TABLE `typ_jedla`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pre tabuľku `typ_vyzdoby`
--
ALTER TABLE `typ_vyzdoby`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pre tabuľku `ucinkujuci`
--
ALTER TABLE `ucinkujuci`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pre tabuľku `vyzdoba`
--
ALTER TABLE `vyzdoba`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Vyzdoba_Typ_vyzdoby1_idx` (`Typ_vyzdoby_ID`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `jedla`
--
ALTER TABLE `jedla`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pre tabuľku `menu`
--
ALTER TABLE `menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pre tabuľku `miesto_konania`
--
ALTER TABLE `miesto_konania`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pre tabuľku `objednavka`
--
ALTER TABLE `objednavka`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pre tabuľku `program_typ`
--
ALTER TABLE `program_typ`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pre tabuľku `specialne_poziadavky`
--
ALTER TABLE `specialne_poziadavky`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pre tabuľku `typ_jedla`
--
ALTER TABLE `typ_jedla`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pre tabuľku `typ_vyzdoby`
--
ALTER TABLE `typ_vyzdoby`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pre tabuľku `ucinkujuci`
--
ALTER TABLE `ucinkujuci`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pre tabuľku `vyzdoba`
--
ALTER TABLE `vyzdoba`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `jedla`
--
ALTER TABLE `jedla`
  ADD CONSTRAINT `fk_Jedla_Typ_jedla1` FOREIGN KEY (`Typ_jedla_ID`) REFERENCES `typ_jedla` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `menu_has_jedla`
--
ALTER TABLE `menu_has_jedla`
  ADD CONSTRAINT `fk_Menu_has_Jedla_Jedla1` FOREIGN KEY (`Jedla_ID`) REFERENCES `jedla` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Menu_has_Jedla_Menu` FOREIGN KEY (`Menu_ID`) REFERENCES `menu` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `objednavka`
--
ALTER TABLE `objednavka`
  ADD CONSTRAINT `fk_Objednavka_Menu1` FOREIGN KEY (`Menu_ID`) REFERENCES `menu` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Objednavka_Miesto_konania1` FOREIGN KEY (`Miesto_konania_ID`) REFERENCES `miesto_konania` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Objednavka_Specialne_poziadavky1` FOREIGN KEY (`Specialne_poziadavky_ID`) REFERENCES `specialne_poziadavky` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Objednavka_Vyzdoba1` FOREIGN KEY (`Vyzdoba_ID`) REFERENCES `vyzdoba` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Objednavka_program_typ_has_Ucinkujuci1` FOREIGN KEY (`program_typ_has_Ucinkujuci_program_typ_ID`,`program_typ_has_Ucinkujuci_Ucinkujuci_ID`) REFERENCES `program_typ_has_ucinkujuci` (`program_typ_ID`, `Ucinkujuci_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `program_typ_has_ucinkujuci`
--
ALTER TABLE `program_typ_has_ucinkujuci`
  ADD CONSTRAINT `fk_program_typ_has_Ucinkujuci_Ucinkujuci1` FOREIGN KEY (`Ucinkujuci_ID`) REFERENCES `ucinkujuci` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_program_typ_has_Ucinkujuci_program_typ1` FOREIGN KEY (`program_typ_ID`) REFERENCES `program_typ` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `vyzdoba`
--
ALTER TABLE `vyzdoba`
  ADD CONSTRAINT `fk_Vyzdoba_Typ_vyzdoby1` FOREIGN KEY (`Typ_vyzdoby_ID`) REFERENCES `typ_vyzdoby` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
