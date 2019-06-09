-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08-Jun-2019 às 19:38
-- Versão do servidor: 10.1.39-MariaDB
-- versão do PHP: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `id` int(100) NOT NULL,
  `funcionariochave` int(100) NOT NULL,
  `clientechave` int(100) NOT NULL,
  `tiposervicochave` int(100) NOT NULL,
  `dia` varchar(100) NOT NULL,
  `horarioinicial` varchar(100) NOT NULL,
  `observacao` varchar(100) NOT NULL,
  `horariofinal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `atendimentos`
--

INSERT INTO `atendimentos` (`id`, `funcionariochave`, `clientechave`, `tiposervicochave`, `dia`, `horarioinicial`, `observacao`, `horariofinal`) VALUES
(2, 5, 11, 1, '10', '11:00', 'ss', '12:00'),
(3, 5, 11, 1, '5555', '12', '11', '11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(100) NOT NULL,
  `nomecliente` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `sexo` varchar(11) NOT NULL,
  `telefone` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nomecliente`, `email`, `cpf`, `sexo`, `telefone`, `status`) VALUES
(11, 'paula', 'paula@cliente.com.br', '85236974012', 'F', '999', 'ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `telefone` varchar(100) NOT NULL,
  `sexo` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `endereco`, `cpf`, `telefone`, `sexo`, `cargo`, `email`, `senha`) VALUES
(4, 'vanessa', 'rua tal', '8523649700', '85223698', 'F', 'suporte', 'vanessa@funcionario.com', '123'),
(5, 'fernando', 'rua umbu', '5879642100', '456', 'M', 'sla', 'fernando@gmail.com', '123'),
(6, 'marrie', 'porto alegre', '', '85369874', 'F', 'suporte', 'vanny@gmail.com', '66');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiposervico`
--

CREATE TABLE `tiposervico` (
  `id` int(11) NOT NULL,
  `descricaoserv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tiposervico`
--

INSERT INTO `tiposervico` (`id`, `descricaoserv`) VALUES
(1, 'pintar cabelo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_cadastro` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionario_fk` (`funcionariochave`),
  ADD KEY `cliente_fk` (`clientechave`),
  ADD KEY `tiposervico_fk` (`tiposervicochave`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tiposervico`
--
ALTER TABLE `tiposervico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `usuario_email_key` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atendimentos`
--
ALTER TABLE `atendimentos`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tiposervico`
--
ALTER TABLE `tiposervico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD CONSTRAINT `cliente_fk` FOREIGN KEY (`clientechave`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `funcionario_fk` FOREIGN KEY (`funcionariochave`) REFERENCES `funcionarios` (`id`),
  ADD CONSTRAINT `tiposervico_fk` FOREIGN KEY (`tiposervicochave`) REFERENCES `tiposervico` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
