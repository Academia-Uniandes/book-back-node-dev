# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.20)
# Base de datos: bookstore
# Tiempo de Generación: 2018-09-05 14:01:17 +0000
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
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `birthdate` date NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;

INSERT INTO `author` (`id`, `name`, `description`, `birthdate`, `image`)
VALUES
	(100,'J.K. Rowling','J. K. Rowling and Robert Galbraith, is a British novelist, philanthropist, film and television producer and screenwriter best known for writing the Harry Potter fantasy series. \n\nThe books have won multiple awards, and sold more than 500 million copies, becoming the best-selling book series in history. They have also been the basis for a film series, over which Rowling had overall approval on the scripts and was a producer on the final films in the series.','1965-07-04','http://cdn1us.denofgeek.com/sites/denofgeekus/files/2016/11/rowling.jpg'),
	(200,'Charles Cumming','Charles Cumming was educated at Ludgrove School (1979-1984), Eton College (1985-1989) and the University of Edinburgh (1990-1994), where he graduated with 1st Class Honours in English Literature.\n\nIn 1995, Charles was approached for recruitment by the United Kingdom\'s Secret Intelligence Service (MI6). A Spy By Nature, a novel partly based on his experiences with MI6, was published in the UK in June 2001. The novel\'s hero, Alec Milius, is a flawed loner in his early 20s who is recruited by MI5 to sell doctored research data on oil exploration in the Caspian Sea to the Central Intelligence Agency (CIA).','1971-04-05','https://magazineclonerepub.blob.core.windows.net/mcepub/567/167688/image/323b1a12-0f69-4940-981c-37a2fdf301ec.jpg'),
	(300,'Ken Follett','Ken Follett is a British author of thrillers and historical novels who has sold more than 160 million copies of his works. Many of his books have achieved high ranking on best seller lists. For example, in the USA, many reached the number 1 position on the New York Times Best Seller list, including Edge of Eternity, Fall of Giants, A Dangerous Fortune, The Key to Rebecca, Lie Down with Lions, Triple, Winter of the World, and World Without End.','1949-06-05','https://www.ken-follett.com/images/media/berlin/Ken_Follett_in_Berlin_2014_6_credit_Olivier_Favre.jpg');

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
	(100,100),
	(200,100),
	(300,100),
	(400,100),
	(1400,100),
	(1500,100),
	(800,200),
	(900,200),
	(1000,200),
	(500,300),
	(600,300),
	(700,300),
	(1100,300),
	(1200,300),
	(1300,300);

/*!40000 ALTER TABLE `author_book` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla book
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `publish_date` date NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `isbn` varchar(255) NOT NULL DEFAULT '',
  `editorial_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `editorial_id` (`editorial_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`editorial_id`) REFERENCES `editorial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;

INSERT INTO `book` (`id`, `name`, `description`, `publish_date`, `image`, `isbn`, `editorial_id`)
VALUES
	(100,'The Cuckoo\'s calling','After losing his leg to a land mine in Afghanistan, Cormoran Strike is barely scraping by as a private investigator. Strike is down to one client, and creditors are calling. He has also just broken up with his longtime girlfriend and is living in his office.\n\nThen John Bristow walks through his door with an amazing story: His sister, thelegendary supermodel Lula Landry, known to her friends as the Cuckoo, famously fell to her death a few months earlier. The police ruled it a suicide, but John refuses to believe that. The case plunges Strike into the world of multimillionaire beauties, rock-star boyfriends, and desperate designers, and it introduces him to every variety of pleasure, enticement, seduction, and delusion known to man.\n\nYou may think you know detectives, but you\'ve never met one quite like Strike. You may think you know about the wealthy and famous, but you\'ve never seen them under an investigation like this.\n\nIntroducing Cormoran Strike, this is the acclaimed first crime novel by J.K. Rowling, writing under the pseudonym Robert Galbraith.','2013-04-03','http://www.wordsworth.co.za/wp-content/uploads/2016/09/Cuckoo.jpg','9780316206853',100),
	(200,'The Silkworm','When novelist Owen Quine goes missing, his wife calls in private detective Cormoran Strike. At first, Mrs. Quine just thinks her husband has gone off by himself for a few days--as he has done before--and she wants Strike to find him and bring him home.\n\nBut as Strike investigates, it becomes clear that there is more to Quine\'s disappearance than his wife realizes. The novelist has just completed a manuscript featuring poisonous pen-portraits of almost everyone he knows. If the novel were to be published, it would ruin lives--meaning that there are a lot of people who might want him silenced.\n\nWhen Quine is found brutally murdered under bizarre circumstances, it becomes a race against time to understand the motivation of a ruthless killer, a killer unlike any Strike has encountered before...\n\nA compulsively readable crime novel with twists at every turn, THE SILKWORM is the second in the highly acclaimed series featuring Cormoran Strike and his determined young assistant, Robin Ellacott.','2014-06-19','https://timedotcom.files.wordpress.com/2014/06/galbraith.png','9780316206891',100),
	(300,'Career of Evil','When a mysterious package is delivered to Robin Ellacott, she is horrified to discover that it contains a woman\'s severed leg. Her boss, private detective Cormoran Strike, is less surprised but no less alarmed. There are four people from his past who he thinks could be responsible--and Strike knows that any one of them is capable of sustained and unspeakable brutality.\n\nWith the police focusing on one of the suspects, Strike and Robin delve into the dark and twisted worlds of the other three men. But as more horrendous acts occur, time is running out for the two of them...','2015-10-22','https://d30a6s96kk7rhm.cloudfront.net/original/readings/978/075/156/9780751563580.jpg','9780316349895',100),
	(400,'Lethal White',' When Billy, a troubled young man, comes to private eye Cormoran Strike’s office to ask for his help investigating a crime he thinks he witnessed as a child, Strike is left deeply unsettled. While Billy is obviously mentally distressed, and cannot remember many concrete details, there is something sincere about him and his story. But before Strike can question him further, Billy bolts from his office in a panic.\n\nTrying to get to the bottom of Billy’s story, Strike and Robin Ellacott—once his assistant, now a partner in the agency—set off on a twisting trail that leads them through the backstreets of London, into a secretive inner sanctum within Parliament, and to a beautiful but sinister manor house deep in the countryside.\n\nAnd during this labyrinthine investigation, Strike’s own life is far from straightforward: his newfound fame as a private eye means he can no longer operate behind the scenes as he once did. Plus, his relationship with his former assistant is more fraught than it ever has been—Robin is now invaluable to Strike in the business, but their personal relationship is much, much trickier than that.\n\nThe most epic Robert Galbraith novel yet, Lethal White is both a gripping mystery and a page-turning next instalment in the ongoing story of Cormoran Strike and Robin Ellacott. ','2018-09-18','https://www.hachette.com.au/content/custom/LethalWhite.jpg','9780316422734',100),
	(500,'Fall of Giants','A thirteen-year-old Welsh boy enters a man’s world in the mining pits. . . . An American law student rejected in love finds a surprising new career in Woodrow Wilson’s White House. . . . A housekeeper for the aristocratic Fitzherberts takes a fateful step above her station, while Lady Maud Fitzherbert herself crosses deep into forbidden territory when she falls in love with a German spy. . . . And two orphaned Russian brothers embark on radically different paths when their plan to emigrate to America falls afoul of war, conscription, and revolution. \n\nFrom the dirt and danger of a coal mine to the glittering chandeliers of a palace, from the corridors of power to the bedrooms of the mighty, Fall of Giants takes us into the inextricably entangled fates of five families—and into a century that we thought we knew, but that now will never seem the same again. . . . ','2010-09-28','https://images-na.ssl-images-amazon.com/images/I/91zB9X%2BjhwL.jpg','9780451232854',200),
	(600,'Winter of the World','Picking up where Fall of Giants, the first novel in the extraordinary Century Trilogy, left off, Winter of the World follows its five interrelated families—American, German, Russian, English, and Welsh—through a time of enormous social, political, and economic turmoil, beginning with the rise of the Third Reich, through the great dramas of World War II, and into the beginning of the long Cold War.\n\nCarla von Ulrich, born of German and English parents, finds her life engulfed by the Nazi tide until daring to commit a deed of great courage and heartbreak . . . . American brothers Woody and Chuck Dewar, each with a secret, take separate paths to momentous events, one in Washington, the other in the bloody jungles of the Pacific . . . . English student Lloyd Williams discovers in the crucible of the Spanish Civil War that he must fight Communism just as hard as Fascism . . . . Daisy Peshkov, a driven social climber, cares only for popularity and the fast set until war transforms her life, while her cousin Volodya carves out a position in Soviet intelligence that will affect not only this war but also the war to come.','2012-09-12','https://i.pinimg.com/originals/57/ff/64/57ff64aa544ce613fb3070f39d7e0530.jpg','9780451468222',200),
	(700,'Edge of Eternity','In Fall of Giants and Winter of the World, Ken Follett followed the fortunes of five international families—American, German, Russian, English, and Welsh—as they made their way through the twentieth century. Now they come to one of the most tumultuous eras of all: the 1960s through the 1980s, from civil rights, assassinations, mass political movements, and Vietnam to the Berlin Wall, the Cuban Missile Crisis, presidential impeachment, revolution—and rock and roll.\n\nEast German teacher Rebecca Hoffmann discovers she’s been spied on by the Stasi for years and commits an impulsive act that will affect her family for the rest of their lives. . . . George Jakes, the child of a mixed-race couple, bypasses a corporate law career to join Robert F. Kennedy\'s Justice Department and finds himself in the middle of not only the seminal events of the civil rights battle but a much more personal battle of his own. . . . Cameron Dewar, the grandson of a senator, jumps at the chance to do some official and unofficial espionage for a cause he believes in, only to discover that the world is a much more dangerous place than he\'d imagined. . . . Dimka Dvorkin, a young aide to Nikita Khrushchev, becomes an agent both for good and for ill as the United States and the Soviet Union race to the brink of nuclear war, while his twin sister, Tanya, carves out a role that will take her from Moscow to Cuba to Prague to Warsaw—and into history.','2014-09-16','https://i.pinimg.com/originals/d6/f9/ad/d6f9ad6e815fb4eb81e083b4789a250d.jpg','9780451474025',200),
	(800,'A Foreign Country','On the vacation of a lifetime in Egypt, an elderly French couple are brutally murdered. Days later, a meticulously-planned kidnapping takes place on the streets of Paris. Amelia Levene, the first female Chief of MI6, has disappeared without a trace, six weeks before she is due to take over as the most influential spy in Europe. \n\nIt is the gravest crisis MI6 has faced in more than a decade. Desperate not only to find her, but to keep her disappearance a secret, Britain\'s top intelligence agents turn to one of their own: disgraced MI6 officer Thomas Kell. Tossed out of the Service only months before, Kell is given one final chance to redeem himself - find Amelia Levene at any cost. \n\nThe trail leads Kell to France and Tunisia, where he uncovers a shocking secret and a conspiracy that could have unimaginable repercussions for Britain and its allies. Only Kell stands in the way of personal and political catastrophe.','2012-08-01','https://images-na.ssl-images-amazon.com/images/I/51MsRfBnzuL._SX324_BO1,204,203,200_.jpg','9781250049056',300),
	(900,'A Colder War','A top-ranking Iranian military official is blown up while trying to defect to the West. An investigative journalist is arrested and imprisoned for writing an article critical of the Turkish government. An Iranian nuclear scientist is assassinated on the streets of Tehran. These three incidents, seemingly unrelated, have one crucial link. Each of the three had been recently recruited by Western intelligence, before being removed or killed.\n\nThen Paul Wallinger, MI6\'s most senior agent in Turkey, dies in a puzzling plane crash. Fearing the worst, MI6 bypasses the usual protocol and brings disgraced agent Tom Kell in from the cold to investigate. Kell soon discovers what Wallinger had already begun to suspect―that there\'s a mole somewhere in the Western intelligence, a traitor who has been systematically sabotaging scores of joint intelligence operations in the Middle East.','2014-06-01','https://images-na.ssl-images-amazon.com/images/I/51Ju3YZIHRL._SX322_BO1,204,203,200_.jpg','9781250025548',300),
	(1000,'A Divided Spy','Thomas Kell thought he was done with spying. A former MI6 officer, he devoted his life to the Service, but it has left him with nothing but grief and a simmering anger against the Kremlin.\n\nThen Kell is offered an unexpected chance at revenge. Taking the law into his own hands, he embarks on a mission to recruit a top Russian spy who is in possession of a terrifying secret. As Kell tracks his man from Moscow to London, he finds himself in a high stakes game of cat and mouse in which it becomes increasingly difficult to know who is playing whom.\n\nAs the mission reaches boiling point, the threat of a catastrophic terrorist attack looms over Britain. Kell is faced with an impossible choice. Loyalty to MI6―or to his own conscience?','2016-05-23','https://images.gr-assets.com/books/1457530898l/27254199.jpg','9781250025555',300),
	(1100,'The Pillars of the Earth','“Follett risks all and comes out a clear winner,” extolled Publishers Weekly on the release of The Pillars of the Earth. A departure for the bestselling thriller writer, the historical epic stunned readers and critics alike with its ambitious scope and gripping humanity. Today, it stands as a testament to Follett’s unassailable command of the written word and to his universal appeal. \n \nThe Pillars of the Earth tells the story of Philip, prior of Kingsbridge, a devout and resourceful monk driven to build the greatest Gothic cathedral the world has known . . . of Tom, the mason who becomes his architect—a man divided in his soul . . . of the beautiful, elusive Lady Aliena, haunted by a secret shame . . . and of a struggle between good and evil that will turn church against state and brother against brother.\n \nA spellbinding epic tale of ambition, anarchy, and absolute power set against the sprawling medieval canvas of twelfth-century England, this is Ken Follett’s historical masterpiece.','1989-01-01','https://images.penguinrandomhouse.com/cover/9780451488336','9780451166890',400),
	(1200,'World Without End','World Without End takes place in the same town of Kingsbridge, two centuries after the townspeople finished building the exquisite Gothic cathedral that was at the heart of The Pillars of the Earth. The cathedral and the priory are again at the center of a web of love and hate, greed and pride, ambition and revenge, but this sequel stands on its own. This time the men and women of an extraordinary cast of characters find themselves at a crossroads of new ideas—about medicine, commerce, architecture, and justice. In a world where proponents of the old ways fiercely battle those with progressive minds, the intrigue and tension quickly reach a boiling point against the devastating backdrop of the greatest natural disaster ever to strike the human race—the Black Death. \n\nThree years in the writing and nearly eighteen years since its predecessor, World Without End breathes new life into the epic historical novel and once again shows that Ken Follett is a masterful author writing at the top of his craft.','2007-01-01','https://images.gr-assets.com/books/1509545511l/5064.jpg','9780451224996',400),
	(1300,'A Column of Fire','In 1558, the ancient stones of Kingsbridge Cathedral look down on a city torn apart by religious conflict. As power in England shifts precariously between Catholics and Protestants, royalty and commoners clash, testing friendship, loyalty, and love. \n \nNed Willard wants nothing more than to marry Margery Fitzgerald. But when the lovers find themselves on opposing sides of the religious conflict dividing the country, Ned goes to work for Princess Elizabeth. When she becomes queen, all Europe turns against England. The shrewd, determined young monarch sets up the country’s first secret service to give her early warning of assassination plots, rebellions, and invasion plans. Over a turbulent half century, the love between Ned and Margery seems doomed as extremism sparks violence from Edinburgh to Geneva. Elizabeth clings to her throne and her principles, protected by a small, dedicated group of resourceful spies and courageous secret agents.\n \nThe real enemies, then as now, are not the rival religions. The true battle pitches those who believe in tolerance and compromise against the tyrants who would impose their ideas on everyone else—no matter what the cost.\n \nSet during one of the most turbulent and revolutionary times in history, A Column of Fire is one of Follett’s most exciting and ambitious works yet. It will delight longtime fans of the Kingsbridge series and is the perfect introduction for readers new to Ken Follett.','2017-09-12','https://images.gr-assets.com/books/1498850103l/33571713.jpg','9780525954972',400),
	(1400,'The Casual Vacancy','When Barry Fairbrother dies in his early forties, the town of Pagford is left in shock.\n\nPagford is, seemingly, an English idyll, with a cobbled market square and an ancient abbey, but what lies behind the pretty façade is a town at war.\n\nRich at war with poor, teenagers at war with their parents, wives at war with their husbands, teachers at war with their pupils...Pagford is not what it first seems.\n\nAnd the empty seat left by Barry on the parish council soon becomes the catalyst for the biggest war the town has yet seen. Who will triumph in an election fraught with passion, duplicity, and unexpected revelations?\n\nA big novel about a small town, The Casual Vacancy is J.K. Rowling\'s first novel for adults. It is the work of a storyteller like no other.','2017-09-12','https://nationalpostcom.files.wordpress.com/2012/09/casual-vacancy-cover-art-hi-res.jpg','9780316228589',500),
	(1500,'Very Good Lives','In 2008, J.K. Rowling delivered a deeply affecting commencement speech at Harvard University. Now published for the first time in book form, VERY GOOD LIVES presents J.K. Rowling\'s words of wisdom for anyone at a turning point in life. How can we embrace failure? And how can we use our imagination to better both ourselves and others?\n\nDrawing from stories of her own post-graduate years, the world famous author addresses some of life\'s most important questions with acuity and emotional force.','2015-04-14','https://imagessl7.casadellibro.com/a/l/t0/87/9781408706787.jpg','9780316369152',500);

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
	(100,'Sphere'),
	(200,'Pan Books'),
	(300,'HarperCollins Publishers'),
	(400,'Penguin Random House'),
	(500,'Little, Brown and Company');

/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;

INSERT INTO `review` (`id`, `title`, `description`, `book_id`)
VALUES
	(100,'Awesome',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',100),
	(200,'Terrific',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',100),
	(300,'Overpriced',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',100),
	(400,'Amazing book',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',200),
	(500,'Loved it',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',200),
	(600,'Best book ever',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',300),
	(700,'Not bad...',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',300),
	(800,'Don\'t waste your time!',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',400),
	(1000,'Best history book',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',500),
	(1100,'Amazing story',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',500),
	(1200,'Compelling characters!',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',500),
	(1300,'Best way to learn about history!',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',600),
	(1400,'This man is a genious!',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',700),
	(1500,'Damn, she can write!',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',100),
	(1600,'A very good start',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',500),
	(1700,'Good spy thriller',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',800),
	(1800,'Worth reading',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',800),
	(1900,'Spectacular',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',800),
	(2000,'Not sure I would recommend it...',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',800),
	(2100,'A good follow up',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',900),
	(2200,'Heartbreaking story',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',1000),
	(2300,'Very moving',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia ac libero sit amet pharetra. Vivamus euismod quam non nisi auctor, sit amet dapibus leo consectetur. Fusce semper, nibh quis iaculis consequat, ligula mauris dictum diam, non vestibu',1500);

/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
