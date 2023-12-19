
USE `autochek`;

/*Table structure for table `borrower_table` */

DROP TABLE IF EXISTS `borrower_table`;

CREATE TABLE `borrower_table` (
  `Borrower_id` varchar(20) NOT NULL,
  `State` varchar(10) DEFAULT NULL,
  `City` varchar(10) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `borrower_credit_score` varchar(11) DEFAULT NULL,
  `borrower_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Borrower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `borrower_table` */

insert  into `borrower_table`(`Borrower_id`,`State`,`City`,`zip_code`,`borrower_credit_score`,`borrower_name`) values 
('123fd35','dfgc','12olki','19473','4','jane'),
('123fd36','rtgio','89hfg','923475','a','john');

/*Table structure for table `branches` */

DROP TABLE IF EXISTS `branches`;

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `branch` varchar(100) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `branches` */

insert  into `branches`(`branch_id`,`branch`) values 
(1,'kenya'),
(2,'nigeria');

/*Table structure for table `loan_payment` */

DROP TABLE IF EXISTS `loan_payment`;

CREATE TABLE `loan_payment` (
  `loan_id` varchar(20) DEFAULT NULL,
  `payment_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Amount_paid` double DEFAULT NULL,
  `Date_paid` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `loan_payment_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan_table` (`Loan_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `loan_payment` */

insert  into `loan_payment`(`loan_id`,`payment_id`,`Amount_paid`,`Date_paid`) values 
('32u09wekjbfje','3434r409kmPAID123456',100790.3333,'2021-03-31'),
('32u09wekjbfje','3434r409kmPAID123457',100790.3333,'2021-03-31'),
('32u09wekjbfje','3434r409kmPAID123458',100790.3333,'2021-04-27'),
('32u09wekjbfje','3434r409kmPAID123459',100790.3333,'2021-05-27'),
('32u09wekjbfje','3434r409kmPAID123460',100790.3333,'2021-06-27'),
('32u09wekjbfje','3434r409kmPAID123461',100790.3333,'2021-07-31'),
('32u09wekjbfje','3434r409kmPAID123462',100790.3333,'2021-10-31'),
('32u09wekjbfje','3434r409kmPAID123463',100790.3333,'2021-10-31'),
('32u09wekjbfje','3434r409kmPAID123464',100790.3333,'2021-10-27'),
('32u09wekjbfje','3434r409kmPAID123465',100790.3333,'2021-11-27'),
('32u09wekjbfje','3434r409kmPAID123466',100790.3333,'2021-12-27'),
('32u09wekjbfje','3434r409kmPAID123467',100790.3333,'2022-01-27'),
('09u924rbwf','9924rmnkvknvPAID364783',1271803.806,'2021-05-16'),
('09u924rbwf','9924rmnkvknvPAID364784',1271803.806,'2021-06-16'),
('09u924rbwf','9924rmnkvknvPAID364785',1271803.806,'2021-07-16'),
('09u924rbwf','9924rmnkvknvPAID364786',1271803.806,'2021-08-16'),
('09u924rbwf','9924rmnkvknvPAID364787',1271803.806,'2021-09-16'),
('09u924rbwf','9924rmnkvknvPAID364788',1271803.806,'2021-10-16'),
('09u924rbwf','9924rmnkvknvPAID364789',1271803.806,'2021-11-16'),
('09u924rbwf','9924rmnkvknvPAID364790',1271803.806,'2021-12-16'),
('09u924rbwf','9924rmnkvknvPAID364791',1271803.806,'2022-01-16'),
('09u924rbwf','9924rmnkvknvPAID364792',1271803.806,'2022-02-16'),
('09u924rbwf','9924rmnkvknvPAID364793',1271803.806,'2022-03-16'),
('09u924rbwf','9924rmnkvknvPAID364794',1271803.806,'2022-04-16'),
('09u924rbwf','9924rmnkvknvPAID364795',1271803.806,'2022-05-16'),
('09u924rbwf','9924rmnkvknvPAID364796',1271803.806,'2022-06-16'),
('09u924rbwf','9924rmnkvknvPAID364797',1271803.806,'2022-07-16'),
('09u924rbwf','9924rmnkvknvPAID364798',1271803.806,'2022-08-16'),
('09u924rbwf','9924rmnkvknvPAID364799',1271803.806,'2022-09-16'),
('09u924rbwf','9924rmnkvknvPAID364800',1271803.806,'2022-10-16'),
('09u924rbwf','9924rmnkvknvPAID364801',1271803.806,'2022-11-16'),
('09u924rbwf','9924rmnkvknvPAID364802',1271803.806,'2022-12-16'),
('09u924rbwf','9924rmnkvknvPAID364803',1271803.806,'2023-01-16'),
('09u924rbwf','9924rmnkvknvPAID364804',1271803.806,'2023-02-16'),
('09u924rbwf','9924rmnkvknvPAID364805',1271803.806,'2023-03-16'),
('09u924rbwf','9924rmnkvknvPAID364806',1271803.806,'2023-04-16'),
('09u924rbwf','9924rmnkvknvPAID364807',1271803.806,'2023-05-16'),
('09u924rbwf','9924rmnkvknvPAID364808',1271803.806,'2023-06-16'),
('09u924rbwf','9924rmnkvknvPAID364809',1271803.806,'2023-07-16'),
('09u924rbwf','9924rmnkvknvPAID364810',1271803.806,'2023-08-16'),
('09u924rbwf','9924rmnkvknvPAID364811',1271803.806,'2023-09-16'),
('09u924rbwf','9924rmnkvknvPAID364812',1271803.806,'2023-10-16'),
('09u924rbwf','9924rmnkvknvPAID364813',1271803.806,'2023-11-16'),
('09u924rbwf','9924rmnkvknvPAID364814',1271803.806,'2023-12-16'),
('09u924rbwf','9924rmnkvknvPAID364815',1271803.806,'2024-01-16'),
('09u924rbwf','9924rmnkvknvPAID364816',1271803.806,'2024-02-16'),
('09u924rbwf','9924rmnkvknvPAID364817',1271803.806,'2024-03-16'),
('09u924rbwf','9924rmnkvknvPAID364818',1271803.806,'2024-04-16'),
('9190i0-nbfb','ij3949nfnjnfbPAID42345',516417.9583,'2021-03-31'),
('9190i0-nbfb','ij3949nfnjnfbPAID42346',516417.9583,'2021-04-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42347',516417.9583,'2021-05-28'),
('9190i0-nbfb','ij3949nfnjnfbPAID42348',516417.9583,'2021-07-31'),
('9190i0-nbfb','ij3949nfnjnfbPAID42349',516417.9583,'2021-07-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42350',516417.9583,'2021-08-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42351',516417.9583,'2021-09-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42352',516417.9583,'2021-10-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42353',516417.9583,'2021-11-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42354',516417.9583,'2021-12-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42355',516417.9583,'2022-02-28'),
('9190i0-nbfb','ij3949nfnjnfbPAID42356',516417.9583,'2022-02-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42357',516417.9583,'2022-05-31'),
('9190i0-nbfb','ij3949nfnjnfbPAID42358',516417.9583,'2022-05-31'),
('9190i0-nbfb','ij3949nfnjnfbPAID42359',516417.9583,'2022-05-31'),
('9190i0-nbfb','ij3949nfnjnfbPAID42360',516417.9583,'2022-06-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42361',516417.9583,'2022-07-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42362',516417.9583,'2022-08-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42363',516417.9583,'2022-09-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42364',516417.9583,'2022-10-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42365',516417.9583,'2022-11-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42366',516417.9583,'2022-12-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42367',516417.9583,'2023-01-02'),
('9190i0-nbfb','ij3949nfnjnfbPAID42368',516417.9583,'2023-02-02'),
('3240-9rfwb','klnin09u4njPAID33464',102907.5,'2021-04-26'),
('3240-9rfwb','klnin09u4njPAID33465',102907.5,'2021-05-26'),
('3240-9rfwb','klnin09u4njPAID33466',102907.5,'2021-06-26'),
('3240-9rfwb','klnin09u4njPAID33467',102907.5,'2021-07-26'),
('3240-9rfwb','klnin09u4njPAID33468',102907.5,'2021-08-26'),
('3240-9rfwb','klnin09u4njPAID33469',102907.5,'2021-09-26'),
('3240-9rfwb','klnin09u4njPAID33470',102907.5,'2021-10-26'),
('3240-9rfwb','klnin09u4njPAID33471',102907.5,'2021-11-26'),
('3240-9rfwb','klnin09u4njPAID33472',102907.5,'2021-12-26'),
('3240-9rfwb','klnin09u4njPAID33473',102907.5,'2022-01-26'),
('3240-9rfwb','klnin09u4njPAID33474',102907.5,'2022-02-26'),
('3240-9rfwb','klnin09u4njPAID33475',102907.5,'2022-03-26');

/*Table structure for table `loan_table` */

DROP TABLE IF EXISTS `loan_table`;

CREATE TABLE `loan_table` (
  `Borrower_id` varchar(20) DEFAULT NULL,
  `Loan_id` varchar(20) NOT NULL,
  `Date_of_release` date DEFAULT NULL,
  `Term` int(11) DEFAULT NULL,
  `InterestRate` float DEFAULT NULL,
  `LoanAmount` bigint(20) DEFAULT NULL,
  `Downpayment` bigint(20) DEFAULT NULL,
  `Payment_frequency` bigint(20) DEFAULT NULL,
  `Maturity_date` date DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Loan_id`),
  KEY `Borrower_id` (`Borrower_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `loan_table_ibfk_1` FOREIGN KEY (`Borrower_id`) REFERENCES `borrower_table` (`Borrower_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `loan_table_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `loan_table` */

insert  into `loan_table`(`Borrower_id`,`Loan_id`,`Date_of_release`,`Term`,`InterestRate`,`LoanAmount`,`Downpayment`,`Payment_frequency`,`Maturity_date`,`branch_id`) values 
('123fd35','09u924rbwf','2021-01-27',36,1.05,45784937,1200000,1271804,'2022-01-31',1),
('123fd36','3240-9rfwb','2021-02-01',12,1.05,1234890,132000,102908,'2023-03-01',2),
('123fd35','32u09wekjbfje','2021-04-16',12,1.05,1209484,124993,100790,'2024-04-30',1),
('123fd36','9190i0-nbfb','2021-03-26',24,1.05,12394031,1000000,516418,'2022-03-31',2);

/*Table structure for table `payment_schedule` */

DROP TABLE IF EXISTS `payment_schedule`;

CREATE TABLE `payment_schedule` (
  `loan_id` varchar(20) DEFAULT NULL,
  `schedule_id` varchar(20) NOT NULL,
  `Expected_payment_date` date DEFAULT NULL,
  `Expected_payment_amount` double DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `payment_schedule_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan_table` (`Loan_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `payment_schedule` */

insert  into `payment_schedule`(`loan_id`,`schedule_id`,`Expected_payment_date`,`Expected_payment_amount`) values 
('32u09wekjbfje','3434r409km123456','2021-02-27',100790.3333),
('32u09wekjbfje','3434r409km123457','2021-03-27',100790.3333),
('32u09wekjbfje','3434r409km123458','2021-04-27',100790.3333),
('32u09wekjbfje','3434r409km123459','2021-05-27',100790.3333),
('32u09wekjbfje','3434r409km123460','2021-06-27',100790.3333),
('32u09wekjbfje','3434r409km123461','2021-07-27',100790.3333),
('32u09wekjbfje','3434r409km123462','2021-08-27',100790.3333),
('32u09wekjbfje','3434r409km123463','2021-09-27',100790.3333),
('32u09wekjbfje','3434r409km123464','2021-10-27',100790.3333),
('32u09wekjbfje','3434r409km123465','2021-11-27',100790.3333),
('32u09wekjbfje','3434r409km123466','2021-12-27',100790.3333),
('32u09wekjbfje','3434r409km123467','2022-01-27',100790.3333),
('09u924rbwf','9924rmnkvknv364783','2021-05-16',1271803.806),
('09u924rbwf','9924rmnkvknv364784','2021-06-16',1271803.806),
('09u924rbwf','9924rmnkvknv364785','2021-07-16',1271803.806),
('09u924rbwf','9924rmnkvknv364786','2021-08-16',1271803.806),
('09u924rbwf','9924rmnkvknv364787','2021-09-16',1271803.806),
('09u924rbwf','9924rmnkvknv364788','2021-10-16',1271803.806),
('09u924rbwf','9924rmnkvknv364789','2021-11-16',1271803.806),
('09u924rbwf','9924rmnkvknv364790','2021-12-16',1271803.806),
('09u924rbwf','9924rmnkvknv364791','2022-01-16',1271803.806),
('09u924rbwf','9924rmnkvknv364792','2022-02-16',1271803.806),
('09u924rbwf','9924rmnkvknv364793','2022-03-16',1271803.806),
('09u924rbwf','9924rmnkvknv364794','2022-04-16',1271803.806),
('09u924rbwf','9924rmnkvknv364795','2022-05-16',1271803.806),
('09u924rbwf','9924rmnkvknv364796','2022-06-16',1271803.806),
('09u924rbwf','9924rmnkvknv364797','2022-07-16',1271803.806),
('09u924rbwf','9924rmnkvknv364798','2022-08-16',1271803.806),
('09u924rbwf','9924rmnkvknv364799','2022-09-16',1271803.806),
('09u924rbwf','9924rmnkvknv364800','2022-10-16',1271803.806),
('09u924rbwf','9924rmnkvknv364801','2022-11-16',1271803.806),
('09u924rbwf','9924rmnkvknv364802','2022-12-16',1271803.806),
('09u924rbwf','9924rmnkvknv364803','2023-01-16',1271803.806),
('09u924rbwf','9924rmnkvknv364804','2023-02-16',1271803.806),
('09u924rbwf','9924rmnkvknv364805','2023-03-16',1271803.806),
('09u924rbwf','9924rmnkvknv364806','2023-04-16',1271803.806),
('09u924rbwf','9924rmnkvknv364807','2023-05-16',1271803.806),
('09u924rbwf','9924rmnkvknv364808','2023-06-16',1271803.806),
('09u924rbwf','9924rmnkvknv364809','2023-07-16',1271803.806),
('09u924rbwf','9924rmnkvknv364810','2023-08-16',1271803.806),
('09u924rbwf','9924rmnkvknv364811','2023-09-16',1271803.806),
('09u924rbwf','9924rmnkvknv364812','2023-10-16',1271803.806),
('09u924rbwf','9924rmnkvknv364813','2023-11-16',1271803.806),
('09u924rbwf','9924rmnkvknv364814','2023-12-16',1271803.806),
('09u924rbwf','9924rmnkvknv364815','2024-01-16',1271803.806),
('09u924rbwf','9924rmnkvknv364816','2024-02-16',1271803.806),
('09u924rbwf','9924rmnkvknv364817','2024-03-16',1271803.806),
('09u924rbwf','9924rmnkvknv364818','2024-04-16',1271803.806),
('9190i0-nbfb','ij3949nfnjnfb42345','2021-03-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42346','2021-04-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42347','2021-05-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42348','2021-06-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42349','2021-07-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42350','2021-08-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42351','2021-09-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42352','2021-10-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42353','2021-11-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42354','2021-12-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42355','2022-01-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42356','2022-02-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42357','2022-03-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42358','2022-04-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42359','2022-05-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42360','2022-06-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42361','2022-07-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42362','2022-08-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42363','2022-09-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42364','2022-10-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42365','2022-11-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42366','2022-12-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42367','2023-01-02',516417.9583),
('9190i0-nbfb','ij3949nfnjnfb42368','2023-02-02',516417.9583),
('3240-9rfwb','klnin09u4nj33464','2021-04-26',102907.5),
('3240-9rfwb','klnin09u4nj33465','2021-05-26',102907.5),
('3240-9rfwb','klnin09u4nj33466','2021-06-26',102907.5),
('3240-9rfwb','klnin09u4nj33467','2021-07-26',102907.5),
('3240-9rfwb','klnin09u4nj33468','2021-08-26',102907.5),
('3240-9rfwb','klnin09u4nj33469','2021-09-26',102907.5),
('3240-9rfwb','klnin09u4nj33470','2021-10-26',102907.5),
('3240-9rfwb','klnin09u4nj33471','2021-11-26',102907.5),
('3240-9rfwb','klnin09u4nj33472','2021-12-26',102907.5),
('3240-9rfwb','klnin09u4nj33473','2022-01-26',102907.5),
('3240-9rfwb','klnin09u4nj33474','2022-02-26',102907.5),
('3240-9rfwb','klnin09u4nj33475','2022-03-26',102907.5);
