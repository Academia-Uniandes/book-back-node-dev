# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.20)
# Base de datos: bookstore
# Tiempo de Generación: 2018-08-28 23:18:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla author
# ------------------------------------------------------------

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;

INSERT INTO `author` (`id`, `birthdate`, `description`, `name`, `image`)
VALUES
	(100,'1965-07-04','Joanne  Rowling, OBE, FRSL, pen names J. K. Rowling and Robert Galbraith, is a British novelist, screenwriter and film producer best known as the author of the Harry Potter fantasy series.','J.K. Rowling','http://cdn1us.denofgeek.com/sites/denofgeekus/files/2016/11/rowling.jpg'),
	(200,'1892-03-01','Joanne  Rowling, OBE, FRSL, pen names J. K. Rowling and Robert Galbraith, is a British novelist, screenwriter and film producer best known as the author of the Harry Potter fantasy series.','J. R. R. Tolkien','http://www.biografiasyvidas.com/biografia/t/fotos/tolkien.jpg'),
	(300,'1948-09-20','asA smkcxm slklkc n names J. K. Rowling and Robert Galbraith, is a British novelist','George R. R. Martin','http://static1.businessinsider.com/image/54d3c832eab8eabe028b4569-960/george-rr-martin-2011.jpg'),
	(400,'1973-06-06','Joanne  Rowling, OBE, FRSL, pen names J. K. Rowling and Robert Galbraith, is a British novelist, screenwriter and film producer best known as the author of the Harry Potter fantasy series.','Patrick Rothfuss','http://librista.es/blog/wp-content/uploads/2014/05/patrick-rothfuss.jpg/5x10');

/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla author_book
# ------------------------------------------------------------

DROP TABLE IF EXISTS `author_book`;

CREATE TABLE `author_book` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `author_book_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `author_book_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `author_book` WRITE;
/*!40000 ALTER TABLE `author_book` DISABLE KEYS */;

INSERT INTO `author_book` (`book_id`, `author_id`)
VALUES
	(200,100),
	(600,100),
	(100,200),
	(300,300),
	(400,300),
	(500,400);

/*!40000 ALTER TABLE `author_book` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla book
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `isbn` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `publish_date` date NOT NULL,
  `editorial_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `editorial_id` (`editorial_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`editorial_id`) REFERENCES `editorial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;

INSERT INTO `book` (`id`, `description`, `image`, `isbn`, `name`, `publish_date`, `editorial_id`)
VALUES
	(100,'Supplement R Tympanic Membrane with Synth Sub, Via Opening','https://images-na.ssl-images-amazon.com/images/I/516GyHY9p6L.jpg','930330149-8','The Lord of the Rings','1996-08-20',100),
	(200,'Occlusion of Right Femoral Artery, Percutaneous Approach','http://m.cdn.blog.hu/ko/kockagyar/image/harry_potter_poster/harry_potter_1.jpg','507119915-7','Harry Potter and the Sorcerer´s Stone','2014-02-19',100),
	(300,'Removal of Spacer from T-lum Jt, Perc Approach','http://t1.gstatic.com/images?q=tbn:ANd9GcQEV8WgR73kXg3mpoFrUiOHaX9eUxe5K7Z4sN-u-ORABH8nwIm4','279453624-9','A Game of Thrones','1998-07-04',100),
	(400,'Reposition Left Femoral Shaft, Perc Endo Approach','http://www.darkmediaonline.com/wp-content/uploads/2013/01/WindsofWinter.jpg','744706866-7','The Winds of Winter','1998-10-10',200),
	(500,'Supplement Lower Artery with Autol Sub, Perc Approach','http://www.patrickrothfuss.com/images/page/cover-slow-regard_277.jpg','260760424-9','The Slow Regard of Silent Things','2013-09-05',200),
	(600,'disse accumsan tortor quis turp Perc Approach','https://katemacdonalddotnet.files.wordpress.com/2015/11/potter-1-4.jpg','260760424-9','Harry Potter and the Philosopher´s Stone','2013-09-05',200);

/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla editorial
# ------------------------------------------------------------

DROP TABLE IF EXISTS `editorial`;

CREATE TABLE `editorial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;

INSERT INTO `editorial` (`id`, `name`)
VALUES
	(100,'Oveja Negra'),
	(200,'Siruela');

/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `source` varchar(255) NOT NULL DEFAULT '',
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;

INSERT INTO `review` (`id`, `description`, `name`, `source`, `book_id`)
VALUES
	(100,'This is not really like other books, even its imitators, though the best of them are similarly long, variable in pace and diverse in language and location. The early part of the story was meant to be a follow-up  ',' ',' ',100),
	(200,'The trilogy is worth reading once. For readers who like fast paced action , this is not a series I would recommend. It progresses quite slowly and the descriptions are lengthy - not really my type. But if you have the patience, the plot is worth it.',' ',' ',100),
	(300,'This isnt really like other books, even its imitators, though the best of them are similarly long, variable in pace and diverse in language and location. The early part of the story was meant to be a follow-up to The Hobbit, u ',' ',' ',200),
	(400,'The trilogy is worth reading once. For readers who like fast paced action , this is not a series I would recommend. It progresses quite slowly and the descriptions are lengthy - not really my type. But if you have the patience, the plot is worth it.',' ',' ',300);

/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
