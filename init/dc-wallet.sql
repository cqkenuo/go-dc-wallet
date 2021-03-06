-- -------------------------------------------------------------
-- TablePlus 3.3.0(302)
--
-- https://tableplus.com/
--
-- Database: dc-wallet
-- Generation Time: 2020-04-18 11:07:33.6560
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `t_address_key` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(64) NOT NULL COMMENT '地址',
  `pwd` varchar(512) NOT NULL COMMENT '加密私钥',
  `use_tag` int(11) NOT NULL DEFAULT '0' COMMENT '占用标志 -1 作为热钱包占用\n0 未占用\n>0 作为用户冲币地址占用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `t_address_key_address_idx` (`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_app_config_int` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `k` varchar(64) NOT NULL DEFAULT '' COMMENT '配置键名',
  `v` int(11) NOT NULL COMMENT '配置键值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `k` (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_app_status_int` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `k` varchar(64) NOT NULL DEFAULT '' COMMENT '配置键名',
  `v` int(11) NOT NULL COMMENT '配置键值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `k` (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_tx` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tx_id` varchar(128) NOT NULL DEFAULT '' COMMENT '交易id',
  `from_address` varchar(128) NOT NULL DEFAULT '' COMMENT '来源地址',
  `to_address` varchar(128) NOT NULL DEFAULT '' COMMENT '目标地址',
  `balance` bigint(20) unsigned NOT NULL COMMENT '到账金额Wei',
  `balance_real` varchar(512) NOT NULL COMMENT '到账金额Ether',
  `create_time` bigint(20) unsigned NOT NULL COMMENT '创建时间戳',
  `handle_status` tinyint(4) NOT NULL COMMENT '处理状态',
  `handle_msg` varchar(128) NOT NULL DEFAULT '',
  `handle_time` bigint(20) unsigned NOT NULL COMMENT '处理时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tx_id` (`tx_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;