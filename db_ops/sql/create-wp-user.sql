LOCK TABLES `wp_users` WRITE;
INSERT INTO `wp_users` VALUES (1,'admin',MD5('password'),'admin','praveendias1180@gmail.com','http://wp.test','2023-01-01 01:01:01','',0,'admin');
UNLOCK TABLES;