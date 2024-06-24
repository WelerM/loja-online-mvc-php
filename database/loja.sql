-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/06/2024 às 21:18
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `answer` text DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `message_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `answer_created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chat`
--

INSERT INTO `chat` (`id`, `user_id`, `product_id`, `message`, `answer`, `active`, `message_created_at`, `answer_created_at`) VALUES
(62, 19, 47, 'oi', 'ola', 0, '2024-06-24 12:41:19', '2024-06-24 12:42:20'),
(63, 19, 47, 'disponível?', 'sim', 0, '2024-06-24 12:53:58', '2024-06-24 12:54:26'),
(64, 19, 47, 'vou querer entao', '', 0, '2024-06-24 12:54:44', '2024-06-24 12:59:46'),
(65, 19, 47, 'vou querer', 'ok', 0, '2024-06-24 13:00:59', '2024-06-24 13:01:25'),
(66, 19, 52, 'ola', NULL, 1, '2024-06-24 16:38:39', NULL),
(67, 19, 59, 'tenho interesse', NULL, 1, '2024-06-24 17:25:11', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `img_src` varchar(150) NOT NULL,
  `img_file_name` varchar(200) DEFAULT NULL,
  `link` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `img_src`, `img_file_name`, `link`, `updated_at`, `created_at`, `deleted_at`) VALUES
(56, 'blusa preta', 200, 'wwfwef', 'assets/images/products/blusa preta_1719248970602.png', 'blusa preta_1719248970602.png', 'f', '2024-06-24 17:09:30', '2024-06-24 17:09:30', '2024-06-24 18:12:14'),
(58, 'jaquet', 200, '2', 'assets/images/products/jaquet_1719249029720.png', 'jaquet_1719249029720.png', '2', '2024-06-24 17:10:29', '2024-06-24 17:10:29', '2024-06-24 17:39:08'),
(59, 'oculos', 100, 'dsdgsgsd', 'assets/images/products/oculos_1719249063231.png', 'oculos_1719249063231.png', '2424\'', '2024-06-24 17:11:03', '2024-06-24 17:11:03', NULL),
(60, 'jaqueta', 200, 'a jaqueta laranja é uma peça vibrante e estilosa, perfeita para quem deseja adicionar um toque de cor e personalidade ao seu guarda-roupa. feita com materiais de alta qualidade, essa jaqueta combina conforto e durabilidade, sendo ideal para diversas ', 'assets/images/products/jaqueta_1719252266388.png', 'jaqueta_1719252266388.png', 'www.google.com', '2024-06-24 18:04:26', '2024-06-24 18:04:26', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `product_messages`
--

CREATE TABLE `product_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `message_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `answer_created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `product_messages`
--

INSERT INTO `product_messages` (`id`, `user_id`, `product_id`, `message`, `answer`, `active`, `message_created_at`, `answer_created_at`, `deleted_at`) VALUES
(72, 19, 59, 'tenho interesse', 'ok', 0, '2024-06-24 17:25:51', '2024-06-24 17:26:11', '2024-06-24 17:27:25'),
(73, 19, 58, 'olar', 'oi', 0, '2024-06-24 17:27:00', '2024-06-24 17:27:09', NULL),
(74, 19, 58, 'oi', 'opa', 0, '2024-06-24 17:29:25', '2024-06-24 17:29:53', NULL),
(75, 19, 59, 'oi', 'sim', 0, '2024-06-24 17:29:29', '2024-06-24 17:29:57', '2024-06-24 17:30:17'),
(76, 19, 59, 'oi', 'oi', 0, '2024-06-24 17:30:42', '2024-06-24 17:30:51', NULL),
(77, 19, 59, 'immm', 'dddd', 0, '2024-06-24 17:30:59', '2024-06-24 17:31:09', NULL),
(78, 19, 59, 'oi', NULL, 1, '2024-06-24 17:32:09', NULL, NULL),
(79, 19, 58, 'oi', NULL, 1, '2024-06-24 17:32:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT '''client''',
  `password` text NOT NULL,
  `password_reset_token` varchar(250) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `purl` varchar(300) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `user_type`, `password`, `password_reset_token`, `active`, `purl`, `updated_at`, `created_at`) VALUES
(1, 'welerr', 'welerson194@gmail.com', 'admin', '$2y$10$12v4jesZPI3z9EZ2.5/YSezmCjiUYJuXKRGehh6IiUyGM2XdmppOK', 'dfe8e8b2f438329867b50f2fbc6380fef511cce67e93a28afae36c1697190d70', 1, '', '2024-06-21 16:17:44', '2024-05-28 14:11:17'),
(19, 'ana', 'welerson25@yahoo.com', 'client', '$2y$10$0H0nlAQWApiNxDkWJKB4me7EVMd3IvHYgVD2fw29ByLEN8RtnyIK6', NULL, 1, '', '2024-06-21 20:30:38', '2024-06-21 20:29:47');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`user_id`);

--
-- Índices de tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `product_messages`
--
ALTER TABLE `product_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_msg_product_id` (`product_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `product_messages`
--
ALTER TABLE `product_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `product_messages`
--
ALTER TABLE `product_messages`
  ADD CONSTRAINT `product_msg_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
