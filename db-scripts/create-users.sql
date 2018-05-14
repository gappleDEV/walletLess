CREATE TABLE 'Users' (
  `id` float() NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `acctType` int(11) NOT NULL DEFAULT '0',
  `createDate` datetime NOT NULL,
  `isActive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
