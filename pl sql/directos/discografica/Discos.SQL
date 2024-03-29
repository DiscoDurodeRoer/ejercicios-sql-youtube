

DROP TABLE DISCOS cascade constraints; 
DROP TABLE MUSICOS cascade constraints; 
DROP TABLE GRUPOS cascade constraints; 
DROP TABLE DISCOGRAFICAS cascade constraints; 


REM ****************** DISCOGRAFICAS *********************
CREATE TABLE DISCOGRAFICAS
(   
 COD_DISCOGRAFICA NUMBER   (4)  NOT NULL,
 NOMBRE_EMPRESA   VARCHAR2 (20) NOT NULL,
 PAIS             VARCHAR2 (20),
 CAPITAL_SOCIAL   NUMBER (12) NOT NULL,
 TIPO             VARCHAR2 (3) NOT NULL,
 CONSTRAINT PK_EMPRESA PRIMARY KEY (COD_DISCOGRAFICA),
 CONSTRAINT CK_TIPO    CHECK (TIPO IN ('SL', 'SA', 'SM'))
);


INSERT INTO DISCOGRAFICAS
VALUES (1, 'ARIOLA', 'REINO UNIDO', 120000, 'SL');

INSERT INTO DISCOGRAFICAS
VALUES (2, 'ARISTA', 'ESTADOS UNIDOS', 121000, 'SL');

INSERT INTO DISCOGRAFICAS
VALUES (3, 'WEA', 'IRLANDA', 113000, 'SA');

INSERT INTO DISCOGRAFICAS
VALUES (4, 'STERN', 'ALEMANIA', 10100, 'SL');

INSERT INTO DISCOGRAFICAS
VALUES (5, 'CUTRE', 'ESPA�A', 1000, 'SM');

INSERT INTO DISCOGRAFICAS
VALUES (6, 'POLYDOR', 'FRANCIA', 220600, 'SA');







REM ****************** GRUPOS *********************
CREATE TABLE GRUPOS
(   
 COD_GRUPO         NUMBER   (4)  NOT NULL,
 NOMBRE_GRUPO      VARCHAR2 (40) NOT NULL,
 PAIS              VARCHAR2 (20),
 FECHA_FUNDACION   DATE NOT NULL,
 FECHA_DISOLUCION  DATE,
 ESTILO            VARCHAR2 (40) NOT NULL,
 DISCOGRAFICA      NUMBER   (4)  NOT NULL,
 CONSTRAINT PK_GRUPO          PRIMARY KEY (COD_GRUPO),
 CONSTRAINT CK_ESTILO         CHECK (ESTILO IN ('ROCK', 'SINFONICO', 'PROGRESIVO')),
 CONSTRAINT FK_DISCOGRAFICA   FOREIGN KEY (DISCOGRAFICA) REFERENCES DISCOGRAFICAS
);


INSERT INTO GRUPOS
VALUES (1, 'The Alan Parsons Project', 'Reino Unido', TO_DATE('11/29/1974','MM/DD/YYYY'), TO_DATE('10/12/1986','MM/DD/YYYY'), 'SINFONICO', 1);

INSERT INTO GRUPOS (COD_GRUPO, NOMBRE_GRUPO, PAIS, FECHA_FUNDACION, ESTILO, DISCOGRAFICA)
VALUES (2, 'Pink Floyd', 'Reino Unido', TO_DATE('09/12/1968','MM/DD/YYYY'), 'SINFONICO', 1);
 

INSERT INTO GRUPOS (COD_GRUPO, NOMBRE_GRUPO, PAIS, FECHA_FUNDACION, ESTILO, DISCOGRAFICA)
VALUES (3, 'Marillion', 'Reino Unido', TO_DATE('09/12/1980','MM/DD/YYYY'), 'PROGRESIVO', 3);


INSERT INTO GRUPOS 
VALUES (4, 'King Crimson', 'Reino Unido', TO_DATE('08/21/1964','MM/DD/YYYY'), TO_DATE('4/27/1992','MM/DD/YYYY'),'PROGRESIVO', 1);


INSERT INTO GRUPOS
VALUES (5, 'Supertramp', 'Reino Unido', TO_DATE('08/16/1969','MM/DD/YYYY'), TO_DATE('2/11/1984','MM/DD/YYYY'), 'SINFONICO', 6);


INSERT INTO GRUPOS
VALUES (6, 'Boston', 'Estados Unidos', TO_DATE('09/14/1971','MM/DD/YYYY'), TO_DATE('12/13/1997','MM/DD/YYYY'), 'ROCK', 2);


INSERT INTO GRUPOS 
VALUES (7, 'Queen', 'Reino Unido', TO_DATE('11/09/1967','MM/DD/YYYY'),TO_DATE('11/24/1991','MM/DD/YYYY'), 'ROCK', 1);


INSERT INTO GRUPOS (COD_GRUPO, NOMBRE_GRUPO, PAIS, FECHA_FUNDACION, ESTILO, DISCOGRAFICA)
VALUES (8, 'Camel', 'Reino Unido', TO_DATE('03/15/1971','MM/DD/YYYY'), 'SINFONICO', 6);











REM ****************** MUSICOS *********************
CREATE TABLE MUSICOS
(   
 COD_MUSICO        NUMBER   (4)  NOT NULL,
 NOMBRE_MUSICO     VARCHAR2 (30) NOT NULL,
 PAIS              VARCHAR2 (20),
 FECHA_NACIMIENTO  DATE,
 GRUPO             NUMBER (4), 
 CONSTRAINT PK_MUSICO PRIMARY KEY (COD_MUSICO),
 CONSTRAINT FK_GRUPO  FOREIGN KEY (GRUPO) REFERENCES GRUPOS
);



INSERT INTO MUSICOS
VALUES (1, 'Alan Parsons', 'Reino Unido', TO_DATE('09/14/1948','MM/DD/YYYY'), 1);


INSERT INTO MUSICOS
VALUES (2, 'Eric Woolfson', 'Reino Unido', TO_DATE('07/12/1947','MM/DD/YYYY'), 1);


INSERT INTO MUSICOS
VALUES (3, 'Ian Bairnson', 'Reino Unido', TO_DATE('09/21/1952','MM/DD/YYYY'), 1);


INSERT INTO MUSICOS
VALUES (4, 'Lenny Zakatek', 'India', TO_DATE('02/24/1949','MM/DD/YYYY'), 1);


INSERT INTO MUSICOS
VALUES (5, 'Andrew Powell', 'Reino Unido', TO_DATE('12/11/1947','MM/DD/YYYY'), 1);


INSERT INTO MUSICOS
VALUES (6, 'David Gilmour', 'Reino Unido', TO_DATE('04/14/1946','MM/DD/YYYY'), 2);


INSERT INTO MUSICOS
VALUES (7, 'Roger Waters', 'Reino Unido', TO_DATE('09/19/1945','MM/DD/YYYY'), 2);


INSERT INTO MUSICOS
VALUES (8, 'Nick Mason', 'Reino Unido', TO_DATE('04/14/1949','MM/DD/YYYY'), 2);


INSERT INTO MUSICOS
VALUES (9, 'Richard Wrigth', 'Reino Unido', TO_DATE('05/22/1948','MM/DD/YYYY'), 2);


INSERT INTO MUSICOS
VALUES (10, 'Dereck Dick (FISH)', 'Reino Unido', TO_DATE('04/14/1951','MM/DD/YYYY'), 3);


INSERT INTO MUSICOS
VALUES (11, 'Steve Rothery', 'Reino Unido', TO_DATE('12/15/1952','MM/DD/YYYY'), 3);


INSERT INTO MUSICOS
VALUES (12, 'Pete Trewavas', 'Reino Unido', TO_DATE('04/19/1958','MM/DD/YYYY'), 3);


INSERT INTO MUSICOS
VALUES (13, 'Steve Hogarth', 'Reino Unido', TO_DATE('07/19/1954','MM/DD/YYYY'), 3);


INSERT INTO MUSICOS
VALUES (14, 'Ian Mosley', 'Estados Unidos', TO_DATE('12/11/1954','MM/DD/YYYY'), 3);

INSERT INTO MUSICOS
VALUES (15, 'Mark Kelly', 'Reino Unido', TO_DATE('04/14/1951','MM/DD/YYYY'), 3);

INSERT INTO MUSICOS
VALUES (16, 'Pete Sinfield', 'Reino Unido', TO_DATE('02/12/1945','MM/DD/YYYY'), 4);


INSERT INTO MUSICOS
VALUES (17, 'Robert Fripp', 'Estados Unidos', TO_DATE('2/11/1949','MM/DD/YYYY'), 4);

INSERT INTO MUSICOS
VALUES (18, 'Mel Collins', 'Reino Unido', TO_DATE('1/20/1949','MM/DD/YYYY'), 4);

INSERT INTO MUSICOS
VALUES (19, 'Ian Wallace', 'Reino Unido', TO_DATE('2/27/1949','MM/DD/YYYY'), 4);


INSERT INTO MUSICOS
VALUES (20, 'Boz Burrell', 'Reino Unido', TO_DATE('12/18/1951','MM/DD/YYYY'), 4);


INSERT INTO MUSICOS
VALUES (21, 'Roger Hodgson', 'Reino Unido', TO_DATE('4/19/1953','MM/DD/YYYY'), 5);


INSERT INTO MUSICOS
VALUES (22, 'Rick Davies', 'Reino Unido', TO_DATE('4/22/1951','MM/DD/YYYY'), 5);

INSERT INTO MUSICOS
VALUES (23, 'John A. Helliwell', 'Reino Unido', TO_DATE('5/2/1953','MM/DD/YYYY'), 5);

INSERT INTO MUSICOS
VALUES (24, 'Dougie Thompson', 'Irlanda', TO_DATE('5/29/1953','MM/DD/YYYY'), 5);

INSERT INTO MUSICOS
VALUES (25, 'Bob C. Benberg', 'Reino Unido', TO_DATE('5/27/1953','MM/DD/YYYY'), 5);


INSERT INTO MUSICOS
VALUES (26, 'Russell Pope', 'Irlanda', TO_DATE('7/24/1953','MM/DD/YYYY'), 5);



INSERT INTO MUSICOS
VALUES (27, 'David Sikes', 'Estados Unidos', TO_DATE('4/21/1949','MM/DD/YYYY'), 6);


INSERT INTO MUSICOS
VALUES (28, 'Tom Scholz', 'Estados Unidos', TO_DATE('3/22/1951','MM/DD/YYYY'), 6);


INSERT INTO MUSICOS
VALUES (29, 'Brad Delp', 'Alemania', TO_DATE('7/22/1948','MM/DD/YYYY'), 6);


INSERT INTO MUSICOS
VALUES (30, 'Freddie Mercury', 'Zanzibar', TO_DATE('4/23/1950','MM/DD/YYYY'), 7);


INSERT INTO MUSICOS
VALUES (31, 'Brian May', 'Reino Unido', TO_DATE('5/22/1952','MM/DD/YYYY'), 7);


INSERT INTO MUSICOS
VALUES (32, 'John Deacon', 'Reino Unido', TO_DATE('1/27/1954','MM/DD/YYYY'), 7);

INSERT INTO MUSICOS
VALUES (33, 'Roger Taylor', 'Reino Unido', TO_DATE('5/12/1953','MM/DD/YYYY'), 7);

INSERT INTO MUSICOS
VALUES (34, 'Andrew Latimer', 'Reino Unido', TO_DATE('5/17/1949','MM/DD/YYYY'), 8);

INSERT INTO MUSICOS
VALUES (35, 'Peter Bardens', 'Reino Unido', TO_DATE('6/19/1944','MM/DD/YYYY'), 8);

INSERT INTO MUSICOS
VALUES (36, 'Andy Ward', 'Reino Unido', TO_DATE('9/28/1952','MM/DD/YYYY'), 8);

INSERT INTO MUSICOS
VALUES (37, 'David Paton', 'Reino Unido', TO_DATE('10/29/1949','MM/DD/YYYY'), 8);



REM ****************** DISCOS *********************
CREATE TABLE DISCOS
(   
 COD_DISCO         NUMBER   (4)  NOT NULL,
 NOMBRE_DISCO      VARCHAR2 (40) NOT NULL,
 FECHA_PUBLICACION DATE NOT NULL,
 MILLONES_VENDIDOS NUMBER (10),
 FORMATO_INICIAL   VARCHAR2 (3),
 GRUPO             NUMBER (4),
 DISCOGRAFICA      NUMBER (4),  
 CONSTRAINT PK_DISCO   PRIMARY KEY (COD_DISCO),
 CONSTRAINT FK_BANDA   FOREIGN KEY  (GRUPO) REFERENCES GRUPOS,
 CONSTRAINT FK_EMPRESA FOREIGN KEY  (DISCOGRAFICA) REFERENCES DISCOGRAFICAS,
 CONSTRAINT CK_FORMATO CHECK (FORMATO_INICIAL IN ('CD', 'LP'))
 );


INSERT INTO DISCOS
VALUES (1, 'Tales of mystery and imagination',  TO_DATE('2/22/1976','MM/DD/YYYY'), 1, 'LP', 1, 2);

INSERT INTO DISCOS
VALUES (2, 'I Robot',  TO_DATE('4/21/1977','MM/DD/YYYY'), 3, 'LP', 1, 2);

INSERT INTO DISCOS
VALUES (3, 'Pyramid',  TO_DATE('07/11/1978','MM/DD/YYYY'), 6, 'LP', 1, 2);

INSERT INTO DISCOS
VALUES (4, 'Eve',  TO_DATE('5/2/1979','MM/DD/YYYY'), 5, 'LP', 1, 2);

INSERT INTO DISCOS
VALUES (5, 'The turn of a friendly card',  TO_DATE('3/10/1980','MM/DD/YYYY'), 16, 'LP', 1, 2);

INSERT INTO DISCOS
VALUES (6, 'Eye in the sky',  TO_DATE('12/5/1982','MM/DD/YYYY'), 19, 'LP', 1, 2);

INSERT INTO DISCOS
VALUES (7, 'Ammonia Avenue',  TO_DATE('10/12/1983','MM/DD/YYYY'), 6, 'LP', 1, 2);

INSERT INTO DISCOS
VALUES (8, 'Vulture Culture',  TO_DATE('10/12/1984','MM/DD/YYYY'), 3, 'LP', 1, 2);


INSERT INTO DISCOS
VALUES (9, 'Stereotomy',  TO_DATE('10/12/1985','MM/DD/YYYY'), 4, 'LP', 1, 2);

INSERT INTO DISCOS
VALUES (10, 'Gaudi',  TO_DATE('9/5/1986','MM/DD/YYYY'), 4, 'LP', 1, 2);


INSERT INTO DISCOS
VALUES (11, 'Meddle',  TO_DATE('9/5/1971','MM/DD/YYYY'), 2, 'LP', 2, 1);


INSERT INTO DISCOS
VALUES (12, 'The dark side of the moon',  TO_DATE('10/12/1973','MM/DD/YYYY'), 54, 'LP', 2, 1);


INSERT INTO DISCOS
VALUES (13, 'Wish you were here',  TO_DATE('1/7/1975','MM/DD/YYYY'), 14, 'LP', 2, 1);


INSERT INTO DISCOS
VALUES (14, 'Animals',  TO_DATE('7/1/1977','MM/DD/YYYY'), 4, 'LP', 2, 1);

INSERT INTO DISCOS
VALUES (15, 'The Wall',  TO_DATE('11/15/1979','MM/DD/YYYY'), 45, 'LP', 2, 1);


INSERT INTO DISCOS
VALUES (16, 'The final cut',  TO_DATE('11/7/1983','MM/DD/YYYY'), 6, 'LP', 2, 1);



INSERT INTO DISCOS
VALUES (17, 'A momentary lapse of reason',  TO_DATE('12/15/1986','MM/DD/YYYY'), 8, 'LP', 2, 1);

INSERT INTO DISCOS
VALUES (18, 'The division bell',  TO_DATE('6/4/1994','MM/DD/YYYY'), 6, 'CD', 2, 1);



INSERT INTO DISCOS
VALUES (19, 'Script for a jester tear',  TO_DATE('6/14/1983','MM/DD/YYYY'), 1, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (20, 'Fugazi',  TO_DATE('6/12/1984','MM/DD/YYYY'), 1, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (21, 'Misplaced Childhood',  TO_DATE('6/12/1986','MM/DD/YYYY'), 11, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (22, 'The last straw',  TO_DATE('7/14/1987','MM/DD/YYYY'), 5, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (23, 'Seasons end',  TO_DATE('2/21/1988','MM/DD/YYYY'), 6, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (24, 'Holidays in Eden',  TO_DATE('1/16/1991','MM/DD/YYYY'), 7, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (25, 'Brave',  TO_DATE('2/17/1994','MM/DD/YYYY'), 7, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (26, 'Afraid of sunlight',  TO_DATE('11/4/1995','MM/DD/YYYY'), 3, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (27, 'This strange engine',  TO_DATE('3/8/1997','MM/DD/YYYY'), 4, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (28, 'Radiation',  TO_DATE('3/15/1998','MM/DD/YYYY'), 2, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (29, 'Anoraknophobia',  TO_DATE('8/15/2001','MM/DD/YYYY'), 2, 'CD', 3, 3);


INSERT INTO DISCOS
VALUES (30, 'Marbles',  TO_DATE('7/12/2004','MM/DD/YYYY'), 3, 'CD', 3, 3);

INSERT INTO DISCOS
VALUES (65, 'Somewhere else',  TO_DATE('4/09/2007','MM/DD/YYYY'), 2, 'CD', 3, 3);

INSERT INTO DISCOS
VALUES (66, 'Happiness is the Road',  TO_DATE('10/20/2008','MM/DD/YYYY'), 4, 'CD', 3, 3);

INSERT INTO DISCOS
VALUES (67, 'Less is more',  TO_DATE('10/2/2009','MM/DD/YYYY'), 2, 'CD', 3, 3);

INSERT INTO DISCOS
VALUES (68, 'Sounds That Can not Be Made',  TO_DATE('9/17/2012','MM/DD/YYYY'), 4, 'CD', 3, 3);




INSERT INTO DISCOS
VALUES (31, 'In the court of the Crimson King',  TO_DATE('11/11/1969','MM/DD/YYYY'), 2, 'CD', 4, 4);


INSERT INTO DISCOS
VALUES (32, 'In the wake of poseidon',  TO_DATE('10/12/1970','MM/DD/YYYY'), 2, 'CD', 4, 4);


INSERT INTO DISCOS
VALUES (33, 'Islands',  TO_DATE('7/7/1971','MM/DD/YYYY'), 3, 'CD', 4, 4);


INSERT INTO DISCOS
VALUES (34, 'Lizards',  TO_DATE('8/24/1970','MM/DD/YYYY'), 2, 'CD', 4, 4);


INSERT INTO DISCOS
VALUES (35, 'Larks tongues is Aspic',  TO_DATE('2/21/1973','MM/DD/YYYY'), 5, 'CD', 4, 4);


INSERT INTO DISCOS
VALUES (36, 'Starless and bible black',  TO_DATE('7/31/1974','MM/DD/YYYY'), 8, 'CD', 4, 4);


INSERT INTO DISCOS
VALUES (37, 'Red',  TO_DATE('5/4/1974','MM/DD/YYYY'), 4, 'CD', 4, 4);



INSERT INTO DISCOS
VALUES (38, 'Crime of the century',  TO_DATE('3/2/1973','MM/DD/YYYY'), 11, 'CD', 5, 2);


INSERT INTO DISCOS
VALUES (39, 'Crisis. what crisis',  TO_DATE('12/3/1975','MM/DD/YYYY'), 8, 'CD', 5, 2);


INSERT INTO DISCOS
VALUES (40, 'Even in the quietest moments',  TO_DATE('12/3/1977','MM/DD/YYYY'), 11, 'CD', 5, 2);


INSERT INTO DISCOS
VALUES (41, 'Breakfast in America',  TO_DATE('11/12/1979','MM/DD/YYYY'), 16, 'CD', 5, 2);


INSERT INTO DISCOS
VALUES (42, 'Famous last words',  TO_DATE('5/13/1983','MM/DD/YYYY'), 10, 'CD', 5, 2);



INSERT INTO DISCOS
VALUES (43, 'More than a feeling',  TO_DATE('3/12/1976','MM/DD/YYYY'), 4, 'CD', 6, 6);


INSERT INTO DISCOS
VALUES (44, 'Feeling satisfied',  TO_DATE('5/12/1977','MM/DD/YYYY'), 2, 'CD', 6, 6);


INSERT INTO DISCOS
VALUES (45, 'A day in the races',  TO_DATE('1/13/1976','MM/DD/YYYY'), 14, 'CD', 7, 6);


INSERT INTO DISCOS
VALUES (46, 'A night at the opera',  TO_DATE('11/23/1977','MM/DD/YYYY'), 21, 'CD', 7, 6);

INSERT INTO DISCOS
VALUES (47, 'Camel',  TO_DATE('02/15/1973','MM/DD/YYYY'), 1, 'LP', 8, 6);

INSERT INTO DISCOS
VALUES (48, 'Mirage',  TO_DATE('03/1/1974','MM/DD/YYYY'), 1, 'LP', 8, 6);

INSERT INTO DISCOS
VALUES (49, 'The Snow Goose',  TO_DATE('04/20/1975','MM/DD/YYYY'), 5, 'LP', 8, 6);

INSERT INTO DISCOS
VALUES (50, 'Moonmadness',  TO_DATE('03/25/1976','MM/DD/YYYY'), 2, 'LP', 8, 6);

INSERT INTO DISCOS
VALUES (51, 'Rain dances',  TO_DATE('09/27/1977','MM/DD/YYYY'), 2, 'LP', 8, 6);

INSERT INTO DISCOS
VALUES (52, 'Breathless',  TO_DATE('09/22/1978','MM/DD/YYYY'), 2, 'LP', 8, 6);

INSERT INTO DISCOS
VALUES (53, 'I can see your house from here',  TO_DATE('10/29/1979','MM/DD/YYYY'), 2, 'LP', 8, 6);

INSERT INTO DISCOS
VALUES (54, 'Nude',  TO_DATE('01/12/1981','MM/DD/YYYY'), 2, 'LP', 8, 6);

INSERT INTO DISCOS
VALUES (55, 'The single factor',  TO_DATE('05/06/1982','MM/DD/YYYY'), 2, 'LP', 8, 6);

INSERT INTO DISCOS
VALUES (56, 'Stationary traveller',  TO_DATE('08/22/1984','MM/DD/YYYY'), 3, 'LP', 8, 6);

INSERT INTO DISCOS
VALUES (57, 'Dust and dreams',  TO_DATE('05/15/1991','MM/DD/YYYY'), 2, 'CD', 8, 6);

INSERT INTO DISCOS
VALUES (58, 'Habour of tears',  TO_DATE('01/15/1996','MM/DD/YYYY'), 2, 'CD', 8, 6);

INSERT INTO DISCOS
VALUES (59, 'Rajaz',  TO_DATE('10/21/1999','MM/DD/YYYY'), 2, 'CD', 5, 6);

INSERT INTO DISCOS
VALUES (60, 'A nod and a wink',  TO_DATE('07/19/1992','MM/DD/YYYY'), 3, 'CD', 8, 6);




commit;
