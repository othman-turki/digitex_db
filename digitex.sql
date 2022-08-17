-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 17 août 2022 à 11:47
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `digitex`
--

-- --------------------------------------------------------

--
-- Structure de la table `downtimes`
--

CREATE TABLE `downtimes` (
  `id` int(11) NOT NULL,
  `digitex` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `downtime` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cur_date` date DEFAULT curdate(),
  `cur_time` time DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fab_orders`
--

CREATE TABLE `fab_orders` (
  `id` int(11) NOT NULL,
  `number` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prod_line` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fo_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'START',
  `start_date` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `import_date` date DEFAULT curdate(),
  `import_time` time DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gamuts`
--

CREATE TABLE `gamuts` (
  `id` int(11) NOT NULL,
  `fab_order_number` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_time` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qte_h` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_date` date DEFAULT curdate(),
  `import_time` time DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `interventions`
--

CREATE TABLE `interventions` (
  `id` int(11) NOT NULL,
  `maintainer_reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `failure_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `machine_ref` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `spare_part` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cur_date` date DEFAULT curdate(),
  `cur_time` time DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `machines`
--

CREATE TABLE `machines` (
  `id` int(11) NOT NULL,
  `ref` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `maintainers`
--

CREATE TABLE `maintainers` (
  `id` int(11) NOT NULL,
  `reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `monitors`
--

CREATE TABLE `monitors` (
  `id` int(11) NOT NULL,
  `reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `prod_line` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digitex` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monitor_reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `call_monitor` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_call_monitor` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `monitor_arrival_time` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `call_maintainer` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_call_maintainer` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `maintainer_arrival_time` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `operators`
--

CREATE TABLE `operators` (
  `id` int(11) NOT NULL,
  `card_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `op_performances`
--

CREATE TABLE `op_performances` (
  `id` int(11) NOT NULL,
  `operator_reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `production_time` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `presence_time` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `downtime` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `performance` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cur_date` date DEFAULT curdate(),
  `cur_time` time DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `packets`
--

CREATE TABLE `packets` (
  `id` int(11) NOT NULL,
  `tag_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pack_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pack_num` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fab_order_number` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_date` date DEFAULT curdate(),
  `import_time` time DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pack_gamuts`
--

CREATE TABLE `pack_gamuts` (
  `id` int(11) NOT NULL,
  `fab_order_number` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pack_num` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_time` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qte_h` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `op_status` tinyint(1) NOT NULL DEFAULT 0,
  `machine_ref` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `digitex` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `import_date` date DEFAULT curdate(),
  `import_time` time DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pack_operations`
--

CREATE TABLE `pack_operations` (
  `id` int(11) NOT NULL,
  `pack_num` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_time` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pack_qte` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `machine_ref` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digitex` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cur_date` date DEFAULT curdate(),
  `cur_time` time DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `presences`
--

CREATE TABLE `presences` (
  `id` int(11) NOT NULL,
  `digitex` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cur_date` date DEFAULT curdate(),
  `cur_time` time DEFAULT curtime()
) ;

-- --------------------------------------------------------

--
-- Structure de la table `prod_lines`
--

CREATE TABLE `prod_lines` (
  `id` int(11) NOT NULL,
  `prod_line` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monitor_reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `machine_ref` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `digitex` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prod_performances`
--

CREATE TABLE `prod_performances` (
  `id` int(11) NOT NULL,
  `prod_line` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_reg_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `performance` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cur_date` date DEFAULT curdate(),
  `cur_time` time DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `tag_sort` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag_exp` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag_operator` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `downtimes`
--
ALTER TABLE `downtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operator_reg_num` (`operator_reg_num`);

--
-- Index pour la table `fab_orders`
--
ALTER TABLE `fab_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Index pour la table `gamuts`
--
ALTER TABLE `gamuts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fab_order_number` (`fab_order_number`);

--
-- Index pour la table `interventions`
--
ALTER TABLE `interventions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maintainer_reg_num` (`maintainer_reg_num`),
  ADD KEY `machine_ref` (`machine_ref`);

--
-- Index pour la table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`ref`);

--
-- Index pour la table `maintainers`
--
ALTER TABLE `maintainers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reg_num` (`reg_num`);

--
-- Index pour la table `monitors`
--
ALTER TABLE `monitors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reg_num` (`reg_num`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operator_reg_num` (`operator_reg_num`),
  ADD KEY `monitor_reg_num` (`monitor_reg_num`);

--
-- Index pour la table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reg_num` (`reg_num`),
  ADD UNIQUE KEY `card_id` (`card_id`);

--
-- Index pour la table `op_performances`
--
ALTER TABLE `op_performances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operator_reg_num` (`operator_reg_num`);

--
-- Index pour la table `packets`
--
ALTER TABLE `packets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pack_num` (`pack_num`),
  ADD UNIQUE KEY `tag_id` (`tag_id`),
  ADD KEY `fab_order_number` (`fab_order_number`);

--
-- Index pour la table `pack_gamuts`
--
ALTER TABLE `pack_gamuts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fab_order_number` (`fab_order_number`);

--
-- Index pour la table `pack_operations`
--
ALTER TABLE `pack_operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operator_reg_num` (`operator_reg_num`);

--
-- Index pour la table `presences`
--
ALTER TABLE `presences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operator_reg_num` (`operator_reg_num`);

--
-- Index pour la table `prod_lines`
--
ALTER TABLE `prod_lines`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `prod_performances`
--
ALTER TABLE `prod_performances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operator_reg_num` (`operator_reg_num`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `downtimes`
--
ALTER TABLE `downtimes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fab_orders`
--
ALTER TABLE `fab_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gamuts`
--
ALTER TABLE `gamuts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `interventions`
--
ALTER TABLE `interventions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `machines`
--
ALTER TABLE `machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `maintainers`
--
ALTER TABLE `maintainers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `monitors`
--
ALTER TABLE `monitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `operators`
--
ALTER TABLE `operators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `op_performances`
--
ALTER TABLE `op_performances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `packets`
--
ALTER TABLE `packets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pack_gamuts`
--
ALTER TABLE `pack_gamuts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pack_operations`
--
ALTER TABLE `pack_operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `presences`
--
ALTER TABLE `presences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `prod_lines`
--
ALTER TABLE `prod_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `prod_performances`
--
ALTER TABLE `prod_performances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `downtimes`
--
ALTER TABLE `downtimes`
  ADD CONSTRAINT `downtimes_ibfk_1` FOREIGN KEY (`operator_reg_num`) REFERENCES `operators` (`reg_num`);

--
-- Contraintes pour la table `gamuts`
--
ALTER TABLE `gamuts`
  ADD CONSTRAINT `gamuts_ibfk_1` FOREIGN KEY (`fab_order_number`) REFERENCES `fab_orders` (`number`) ON DELETE CASCADE;

--
-- Contraintes pour la table `interventions`
--
ALTER TABLE `interventions`
  ADD CONSTRAINT `interventions_ibfk_1` FOREIGN KEY (`maintainer_reg_num`) REFERENCES `maintainers` (`reg_num`),
  ADD CONSTRAINT `interventions_ibfk_2` FOREIGN KEY (`machine_ref`) REFERENCES `machines` (`ref`);

--
-- Contraintes pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`operator_reg_num`) REFERENCES `operators` (`reg_num`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`monitor_reg_num`) REFERENCES `monitors` (`reg_num`);

--
-- Contraintes pour la table `op_performances`
--
ALTER TABLE `op_performances`
  ADD CONSTRAINT `op_performances_ibfk_1` FOREIGN KEY (`operator_reg_num`) REFERENCES `operators` (`reg_num`);

--
-- Contraintes pour la table `packets`
--
ALTER TABLE `packets`
  ADD CONSTRAINT `packets_ibfk_1` FOREIGN KEY (`fab_order_number`) REFERENCES `fab_orders` (`number`) ON DELETE CASCADE;

--
-- Contraintes pour la table `pack_gamuts`
--
ALTER TABLE `pack_gamuts`
  ADD CONSTRAINT `pack_gamuts_ibfk_1` FOREIGN KEY (`fab_order_number`) REFERENCES `fab_orders` (`number`) ON DELETE CASCADE;

--
-- Contraintes pour la table `pack_operations`
--
ALTER TABLE `pack_operations`
  ADD CONSTRAINT `pack_operations_ibfk_1` FOREIGN KEY (`operator_reg_num`) REFERENCES `operators` (`reg_num`);

--
-- Contraintes pour la table `presences`
--
ALTER TABLE `presences`
  ADD CONSTRAINT `presences_ibfk_1` FOREIGN KEY (`operator_reg_num`) REFERENCES `operators` (`reg_num`);

--
-- Contraintes pour la table `prod_performances`
--
ALTER TABLE `prod_performances`
  ADD CONSTRAINT `prod_performances_ibfk_1` FOREIGN KEY (`operator_reg_num`) REFERENCES `operators` (`reg_num`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
