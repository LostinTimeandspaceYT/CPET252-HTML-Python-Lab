-- Active: 1674657897839@@127.0.0.1@3306@movies
--make sure this is your Active number 

DROP DATABASE IF EXISTS movies;

CREATE DATABASE movies
    DEFAULT CHARACTER SET = 'utf8';

use movies;

CREATE TABLE Rating
(
   r_id           tinyint(1)       NOT NULL,
   r_title        varchar(8)       NOT NULL,
   age_req        tinyint(3)       NULL DEFAULT 0,
   parent_req     boolean          NULL DEFAULT 0,
   PRIMARY KEY(r_id)
);

INSERT INTO Rating VALUES 
(0, 'Unrated', 0, 0), (1, 'G', 0, 0), (2, 'PG', 0, 1), (3, 'PG-13', 13, 1), (4, 'R', 17, 1), (5, 'NC-17', 17, 0);

CREATE TABLE Company
(
    company_id      smallint(5)     NOT NULL,
    name            VARCHAR(45)     NOT NULL,
    address         VARCHAR(45)     NULL,
    phone           char(12)        NULL,
    state           char(2)         NULL,
    PRIMARY KEY(company_id)
);

-- Example Companies --
INSERT INTO Company VALUES
(01846, 'Disney', '500 South Buena Vista Street Burbank', '407 939-7277', 'CA');
INSERT INTO Company VALUES
(21478, 'Movies-R-Us', '842 East Bay Drive', '847 248-6584', 'GA');
INSERT INTO Company VALUES
(01035, 'Movies Gods', '142 Dairy Park Lane', '653 210-4975', 'GA');
INSERT INTO Company VALUES
(31719, 'Amazon', '410 Terry Ave N Seattle', '206 266-1000', 'WA');
INSERT INTO Company VALUES
(22613, 'Sony Pictures Entertainment', '10202 West Washington Blvd Culver City', '310 244-4000', 'CA');
INSERT INTO Company VALUES
(19157, 'Paramount Global', '1515 Broadway New York', '714 690-3000', 'NY');

CREATE TABLE Studio
(
    studio_id       smallint(5)     NOT NULL,
    company_id      smallint(5)     NULL,
    name            VARCHAR(45)     NOT NULL,
    address         VARCHAR(45)     NULL,
    phone           char(12)        NULL,
    state           char(2)         NULL,
    PRIMARY KEY(studio_id),
    FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- Example Studios --
INSERT INTO Studio VALUES
(00014, 01846, 'Marvel', '135 West 50th Street Seventh Floor New York','844 362-7835','NY');
INSERT INTO Studio VALUES
(00462, NULL, 'Pixar', '875 Wallace Gromet Drive','554 874-9965','FL');
INSERT INTO Studio VALUES
(00850, 21478, 'DreamWorks', '45 Gran Hill Road','966 210-9471','NH');
INSERT INTO Studio VALUES
(01478, 01035, 'IBM', '17 Hollace Park Lane','114 475-0024','PA');
INSERT INTO Studio VALUES
(21260, 31719, 'Metro-Goldwyn-Mayer', '245 N Beverly Dr Beverly Hills','310 449-3000','CA');
INSERT INTO Studio VALUES
(21999, NULL, 'Produzioni Europee Associati', NULL, NULL, NULL);
INSERT INTO Studio VALUES
(16209, 22613, 'Warner Bros. Pictures', '3400 Warner Blvd Burbank','818 954-2451','CA');
INSERT INTO Studio VALUES
(23945, NULL, 'Orion-Nova Productions', NULL, NULL, NULL);
INSERT INTO Studio VALUES
(20364, NULL, 'RKO Radio Pictures', NULL, NULL, NULL);
INSERT INTO Studio VALUES
(03510, 19157, 'Paramount Pictures', '5555 Melrose Ave Los Angeles','323 956-5000','CA');
CREATE TABLE Movie
(
   m_id           int(7) 	        NOT NULL,
   m_title        varchar(200)      NOT NULL,
   genre          varchar(30)       NULL,
   minutes        smallint          NULL,
   release_date   date              NULL,
   budget         decimal(13,2)     NULL,
   r_id           tinyint(1)        NULL DEFAULT 0,
   studio_id      smallint(7)       NULL,
   FOREIGN KEY(r_id) REFERENCES Rating(r_id),
   PRIMARY KEY(m_id)
);

-- Movie Examples --
INSERT INTO Movie VALUES 
(0000010, 'Egg McGuffin vs. William Cheese', 'action', 100,'2023-07-18', 2834723.59, 3, 0000014);
INSERT INTO Movie VALUES 
(2889025, 'The Wizard of Oz', 'fantasy', 112,'1939-08-25', 2777000, 1, 21260);
INSERT INTO Movie VALUES 
(4380074, 'The Good, the Bad and the Ugly', 'spaghetti western', 178,'1966-12-23', 1200000, 4, 21999);
INSERT INTO Movie VALUES 
(9070821, 'Casablanca', 'romance', 112,'1943-01-23', 1039000, 2, 16209);
INSERT INTO Movie VALUES 
(8563048, '12 Angry Men', 'drama', 96,'1957-04-10', 337000, 0, 23945);
INSERT INTO Movie VALUES 
(5397590, 'Citizen Kane', 'mystery', 119,'1941-09-05', 839727, 2, 20364);
INSERT INTO Movie VALUES 
(5089444, 'Gone with the Wind', 'romance', 238,'1939-12-15', 3850000, 1, 21260);
INSERT INTO Movie VALUES 
(8285143, 'The Godfather', 'crime', 175,'1972-03-14', 6000000, 4, 03510);


CREATE TABLE Director 
(  
    dir_id      Char(12) PRIMARY Key,
    name_Full   VARCHAR(255),
    address     VARCHAR(255),
    state       CHAR (2),
    phoneNum    Char(12),
    email       VARCHAR(255),
    CHECK (dir_id rlike 
    '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    CHECK (phonenum rlike 
    '[0-9][0-9][0-9] [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
); 

-- Example Directors --
INSERT INTO Director Values 
('022-318-8901','Victor Fleming','37 air st','CA','310 555-8923','TheWizardVic@hotmail.com');
INSERT INTO Director Values 
('010-319-2904','Sergio Leone','125 allroads Rd','RO','378 123-5782','Spaghettiman@gmail.com');
INSERT INTO Director Values 
('120-240-1886','Michael Curtiz','150 thatroad CT','CA','310 454-1244','Michael24@yahoomail.com');
INSERT INTO Director Values 
('007-025-1924','Sidney Lumet','7106 Angry Rd','CA','374 788-5782','LumetS25@gmail.com');
INSERT INTO Director Values 
('005-006-1915','Orson Welles','1 southmain st','CA','310 345-4325','WellesOrME@hotmail.com');
INSERT INTO Director Values 
('004-007-1939','Francis Ford Coppola','34 Caliplace st','CA','310 355-1997','CapoCoppola@hotmail.com');

CREATE TABLE Writer 
(  
    wri_id      CHAR(12) PRIMARY Key,
    name_Full   VARCHAR(255),
    address     VARCHAR(255),
    state       CHAR(2),
    phoneNum    Char(12),
    email       VARCHAR(255),
    CHECK (wri_id rlike
    '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    CHECK (phonenum rlike 
    '[0-9][0-9][0-9] [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
); 

-- Insert Writers Here --
INSERT INTO Writer Values 
('251-219-1104','Noel Langley','57 main st','CA','310 517-7814','NoelLangley25@gmail.com');
INSERT INTO Writer Values  
('092-018-9208','Florence Ryerson','1700 Mexico RD','CA','310 553-5232','FlorenceCA@gmail.com');
INSERT INTO Writer Values 
('191-420-0519','Age & Scarpelli','156 Rome RD','RO','378 553-7878','AgenScar@gmail.com');
INSERT INTO Writer Values 
('008-022-1909','Julius J. Epstein','56 anotherRd St','CA','310 126-7899','JuliustheJ@gmail.com');
INSERT INTO Writer Values 
('012-010-1920','Reginald Rose','52 main st','CT','203 244-2309','RegitheRose@gmail.com');
INSERT INTO Writer Values 
('011-007-1897','Herman J. Mankiewicz','14 Rome RD','CA','310 532-1245','Hermanman7@gmail.com');
INSERT INTO Writer Values 
('010-015-1920','Mario Puzo','123 Writer st','NY','332 123-9914','MarioTheWriter@gmail.com');
INSERT INTO Writer Values 
('007-026-1891','Sidney Howard','5 south st','MA','508 113-2344','Howardyoudoing25@gmail.com');

CREATE TABLE DirectorMovie
(
    dir_id      CHAR(12)    NOT NULL,
    m_id        int(7)      NOT NULL,
    FOREIGN Key (dir_id)    REFERENCES Director(dir_id),
    FOREIGN Key (m_id)      REFERENCES Movie(m_id),
    PRIMARY KEY (dir_id, m_id)
);

-- Example Director Movies --
INSERT INTO DirectorMovie VALUES('022-318-8901',2889025);
INSERT INTO DirectorMovie VALUES('022-318-8901',5089444);
INSERT INTO DirectorMovie VALUES('010-319-2904',4380074);
INSERT INTO DirectorMovie VALUES('120-240-1886',9070821);
INSERT INTO DirectorMovie VALUES('007-025-1924',8563048);
INSERT INTO DirectorMovie VALUES('005-006-1915',5397590);
INSERT INTO DirectorMovie VALUES('004-007-1939',8285143);

CREATE TABLE WriterMovie
(
    wri_id  CHAR(12)        NOT NULL,
    m_id    int(7)          NOT NULL,
    FOREIGN Key (wri_id)    REFERENCES Writer(wri_id),
    FOREIGN Key (m_id)      REFERENCES Movie(m_id),
    PRIMARY KEY (wri_id, m_id)
);

-- Example Writer Movies --
INSERT INTO WriterMovie VALUES('251-219-1104',2889025);
INSERT INTO WriterMovie VALUES('092-018-9208',2889025);
INSERT INTO WriterMovie VALUES('191-420-0519',4380074);
INSERT INTO WriterMovie VALUES('008-022-1909',9070821);
INSERT INTO WriterMovie VALUES('012-010-1920',8563048);
INSERT INTO WriterMovie VALUES('011-007-1897',5397590);
INSERT INTO WriterMovie VALUES('007-026-1891',5089444);
INSERT INTO WriterMovie VALUES('010-015-1920',8285143);

CREATE TABLE Actor
(
    actor_id    int(5)          NOT NULL,
    name        VARCHAR(50)     NOT NULL,
    phone       char(12)        NULL,
    address     VARCHAR(40)     NULL,
    state       char(2)         NULL,
    PRIMARY KEY(actor_id),
    CHECK (phone rlike '[0-9][0-9][0-9] [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
);

-- Example Actors --
INSERT INTO Actor VALUES 
(45863, 'McLovin', '632 856-3408', '213 McDanks st.', 'FL');
INSERT INTO Actor VALUES  
(86472, 'Luke Sky', '874 246-2933', '54 Flapp Rd.', 'MG');
INSERT INTO Actor VALUES  
(86632, 'Brad Pitt', '142 874-2210', '9357 Mayflower Dr. Thibodaux', 'LA');
INSERT INTO Actor VALUES 
(84432, 'Tony Stark', '989 656-4471', '7929 Bayport St. Kingston,', 'NY');
INSERT INTO Actor VALUES 
(89752, 'Harry Johns', '210 555-1589', '378 El Dorado Ave. Oxford', 'MS');
INSERT INTO Actor VALUES 
(01245, 'Bryn Chelo', '474 336-2274', '7399 Somerset St. Allentown', 'PA');
INSERT INTO Actor VALUES 
(35478, 'Cynefrith Boutros', '446 331-4896', '8273 Wild Horse Rd. Valparaiso', 'IN');
INSERT INTO Actor VALUES 
(45120, 'Angharad Həcər', '900 474-5547', '797 Indian Spring Lane Oxon Hill', 'MD');
INSERT INTO Actor VALUES 
(02105, 'Eugen Turnus', '442 777-9833', '706 Park St. Phoenixville', 'PA');
INSERT INTO Actor VALUES 
(74302, 'Khafra Imram', '675 222-4172', '970 Piper Ave. Pottstown', 'PA');
INSERT INTO Actor VALUES 
(01405, 'Monte Vatslav', '347 485-6524', '4 Griffin Rd. Mcminnville', 'TN');
INSERT INTO Actor VALUES 
(02140, 'Aron Joos', '775 551-3654', '188 Rockville Dr. Fort Mill', 'SC');
INSERT INTO Actor VALUES 
(09587, 'Gurutz Eugênio', '745 584-2514', '779 Warren Lane Centereach', 'NY');
CREATE TABLE ActorMovie
(
    movie_id        int(7)          NOT NULL,
    actor_id        int(5)          NOT NULL,
    actor_role      VARCHAR(20)     NULL,
    actor_character VARCHAR(20)     NULL,
    FOREIGN KEY(movie_id)           REFERENCES Movie(m_id),
    FOREIGN KEY(actor_id)           REFERENCES Actor(actor_id),
    PRIMARY KEY(movie_id, actor_id)
);

-- Example Actor Movies --

INSERT INTO ActorMovie VALUES
(0000010, 45863, NULL, NULL);
INSERT INTO ActorMovie VALUES
(0000010, 01405, NULL, NULL);
INSERT INTO ActorMovie VALUES
(4380074, 02105, NULL, NULL);
INSERT INTO ActorMovie VALUES
(4380074,45863, NULL, NULL);
INSERT INTO ActorMovie VALUES
(4380074,86632, NULL, NULL);
INSERT INTO ActorMovie VALUES
(2889025,02105, NULL, NULL);
INSERT INTO ActorMovie VALUES
(9070821,89752, NULL, NULL);
INSERT INTO ActorMovie VALUES
(9070821,45120, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8563048,89752, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8563048,35478, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8563048,84432, NULL, NULL);
INSERT INTO ActorMovie VALUES
(5397590,45863, NULL, NULL);
INSERT INTO ActorMovie VALUES
(5397590,89752, NULL, NULL);
INSERT INTO ActorMovie VALUES
(5089444,86472, NULL, NULL);
INSERT INTO ActorMovie VALUES
(5089444,89752, NULL, NULL);
INSERT INTO ActorMovie VALUES
(5089444,84432, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8285143,74302, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8285143,45120, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8285143,01245, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8285143,09587, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8285143,02105, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8285143,02140, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8285143,35478, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8285143,89752, NULL, NULL);
INSERT INTO ActorMovie VALUES
(8285143,86632, NULL, NULL);


CREATE TABLE Theater
(
    theater_id  CHAR(12)        NOT NULL,
    name        VARCHAR(45)     NOT NULL,
    address     VARCHAR(40)     NULL,
    city        VARCHAR(20)     NULL,
    state       VARCHAR(2)      NULL,
    zip         CHAR(5)         NULL,
    phone       char(12)        NOT NULL DEFAULT 'XXX-XXX-XXXX',
    website     VARCHAR(200)    NULL,
    PRIMARY KEY(theater_id),
    CHECK (theater_id rlike '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    CHECK (phone rlike '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    CHECK ((zip rlike '[0-9][0-9][0-9][0-9][0-9]') OR NULL) -- This null allows this feild to be null or a 5 digit combo--
);

-- Example Theaters -- 
INSERT INTO Theater VALUES 
('409-560-7008', 'Acme', '123 Main st.', 'Portland', 'OR', '12345','123-456-7890','www.acme.com');
INSERT INTO Theater VALUES 
('010-789-0356', 'Regal', '282 Loudon rd.', 'Concord', 'NH', '03301','844-462-7342','https://www.regmovies.com/theatres/regal-concord/1725?utm_source=google&utm_medium=organic&utm_campaign=gmb-listing#/buy-tickets-by-cinema?in-cinema=1725&at=2023-01-25&view-mode=list');
INSERT Theater VALUES 
('764-561-9064', "Smitty's", '630 W Main St', 'Tilton', 'NH', '03276','603-286-3275','https://www.smittyscinema.com/');
INSERT INTO Theater VALUES 
('808-101-3356', "Chunky's cinema pub", '707 Huse Rd', 'Manchester', 'NH', '03103','603-206-3888','https://www.chunkys.com/movie-theater/chunkysmanchester');
INSERT INTO Theater VALUES
('747-123-2365', 'Red River Theater', '11 S Main St Suite L1', 'Concord', 'NH', '03301','603-224-4600','www.redrivertheatres.org');
INSERT INTO Theater VALUES 
('972-303-1662', "AMC Theaters", '9769 Rockwell St.', 'Jacksonville', 'NC', '28540', '690-042-0110', 'www.AMCMovies.com');
INSERT INTO Theater VALUES
('979-515-3609', 'Magic Movies', '433 Wellington Court', 'Anchorage', 'AK', '99504', '240-183-3366', 'www.notarealtheater.com');
INSERT INTO Theater VALUES 
('253-552-1848', 'Blaster Theaters', '19 Victoria Court','West Babylon','NY', '11704', '456-667-1928', 'www.definitelyarealtheater.com');
INSERT INTO Theater VALUES
('494-669-4126', "Not your momma's movies", "536 Hartford St.", 'Rocky Mount', 'NC', '27804', '073-415-8628', 'www.notafaketheater.com');
INSERT INTO Theater VALUES
('842-849-8030', "Four Reels Theaters", '52 Leeton Ridge Ave.', 'Prior Lake', 'MN', '55372', '486-911-7804', 'www.fourreels.com');

CREATE TABLE TheaterMovie
(
    theater_id      VARCHAR(12)     NOT NULL,
    m_id            INT(7)          NOT NULL,
    ticket_sales    DECIMAL(13,2)   NULL,
    start_date      DATE            NULL,
    end_date        DATE            NULL,
    FOREIGN KEY(theater_id) REFERENCES Theater(theater_id),
    FOREIGN KEY(m_id)   REFERENCES Movie(m_id),
    PRIMARY KEY (theater_id, m_id)

);

-- Example Theater Movies --
INSERT INTO TheaterMovie VALUES 
('409-560-7008', 0000010, 1000000.50, '2019-04-20', '2019-05-03');
INSERT INTO TheaterMovie VALUES 
('409-560-7008', 4380074, 1111300.00, '2019-07-21', '2019-08-18');
INSERT INTO TheaterMovie VALUES 
('409-560-7008', 9070821, 273459.00, '2019-03-07', '2019-03-28');
INSERT INTO TheaterMovie VALUES 
('764-561-9064', 8563048, 1000000.50, '2019-05-21', '2019-06-23');
INSERT INTO TheaterMovie VALUES 
('764-561-9064', 4380074, 552234.00, '2019-06-21', '2019-07-19');
INSERT INTO TheaterMovie VALUES 
('764-561-9064', 5397590, 273459.00, '2019-03-07', '2019-03-28');
INSERT INTO TheaterMovie VALUES 
('842-849-8030', 2889025, 1000000.50, '2019-03-01', '2019-03-29');
INSERT INTO TheaterMovie VALUES 
('842-849-8030', 8563048, 552234.00, '2019-05-21', '2019-06-16');
INSERT INTO TheaterMovie VALUES 
('842-849-8030', 5397590, 273459.00, '2019-02-07', '2019-02-28');
INSERT INTO TheaterMovie VALUES 
('842-849-8030', 8285143, 300666.00, '2019-09-07', '2019-09-30');
