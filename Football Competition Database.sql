-- Football Competition Coordination SQL to create and populate tables
DROP TABLE football_match CASCADE CONSTRAINTS PURGE;
DROP TABLE referee CASCADE CONSTRAINTS PURGE;
DROP TABLE player CASCADE CONSTRAINTS PURGE;
DROP TABLE team CASCADE CONSTRAINTS PURGE;
DROP TABLE team_manager CASCADE CONSTRAINTS PURGE;
DROP TABLE club CASCADE CONSTRAINTS PURGE;
DROP TABLE competition CASCADE CONSTRAINTS PURGE;

/* Create table statements */

-- Create table competition - holds details of all competitions being run
CREATE TABLE competition
(
	competition_id       NUMBER(3) NOT NULL ,
	competition_sponsor  VARCHAR2(20) NULL ,
	competition_age_group NUMBER(2) NULL ,
	competition_fee      NUMBER(4,2) NULL ,
	competition_prize    NUMBER(6,2) NULL ,
	competition_organiser_name VARCHAR2(30) NULL ,
	competition_organiser_phone VARCHAR2(11) NULL ,
	competition_name     VARCHAR2(20) NULL ,
CONSTRAINT  XPKcompetition PRIMARY KEY (competition_id)
);

-- Create table club - holds details of all clubs
CREATE TABLE club
(
	club_id              NUMBER(3) NOT NULL ,
	home_ground_location VARCHAR2(50) NULL ,
	club_manager_name    VARCHAR2(30) NULL ,
	club_name            VARCHAR2(20) NULL ,
	club_manager_phone   VARCHAR2(11) NULL ,
CONSTRAINT  XPKclub PRIMARY KEY (club_id)
);

-- Create table team_manager - holds details of all managers of teams
CREATE TABLE team_manager
(
	team_manager_id      NUMBER(3) NOT NULL ,
	team_manager_name    VARCHAR2(30) NULL ,
CONSTRAINT  XPKteam_manager PRIMARY KEY (team_manager_id)
);

-- Create table team - holds details of all teams that can enter competitions
CREATE TABLE team
(
	team_id              NUMBER(3) NOT NULL ,
	team_age_group       NUMBER(2) NULL ,
	team_phone           VARCHAR2(11) NULL ,
	team_address         VARCHAR2(50) NULL ,
	competition_id       NUMBER(3) NULL ,
	club_id              NUMBER(3) NULL ,
	team_manager_id      NUMBER(3) NULL ,
	team_name            VARCHAR2(20) NULL ,
CONSTRAINT  XPKteam PRIMARY KEY (team_id),
CONSTRAINT team_comp_fk FOREIGN KEY (competition_id) REFERENCES competition (competition_id),
CONSTRAINT team_club_fk FOREIGN KEY (club_id) REFERENCES club (club_id),
CONSTRAINT team_man_fk FOREIGN KEY (team_manager_id) REFERENCES team_manager (team_manager_id)
);

-- Create table player - holds details of all players
CREATE TABLE player
(
	player_id            NUMBER(4) NOT NULL ,
	player_dob           DATE NULL ,
	player_name          VARCHAR2(30) NULL ,
	player_address       VARCHAR2(50) NULL ,
	guardian_name        VARCHAR2(30) NULL ,
	team_id              NUMBER(3) NOT NULL ,
CONSTRAINT  XPKplayer PRIMARY KEY (player_id),
CONSTRAINT player_team_fk FOREIGN KEY (team_id) REFERENCES team (team_id)
);

-- Create table referee - holds details of all referees
CREATE TABLE referee
(
	referee_id           NUMBER(3) NOT NULL ,
	referee_qualification VARCHAR2(30) NULL ,
	referee_phone        VARCHAR2(11) NULL ,
	referee_email        VARCHAR2(50) NULL ,
	referee_name         VARCHAR2(30) NULL ,
CONSTRAINT  XPKreferee PRIMARY KEY (referee_id)
);

-- Create table football_match - holds details of all matches
CREATE TABLE football_match
(
	match_id             NUMBER(3) NOT NULL ,
	match_venue          VARCHAR2(50) NULL ,
	match_date           DATE NULL ,
	match_time           DATE NULL ,
	competition_id       NUMBER(3) NULL ,
	referee_id           NUMBER(3) NULL ,
	home_team            NUMBER(3) NULL ,
	away_team            NUMBER(3) NULL ,
	home_team_score      NUMBER(2) NULL ,
	away_team_score      NUMBER(2) NULL ,
CONSTRAINT  XPKmatch PRIMARY KEY (match_id),
CONSTRAINT match_comp_fk FOREIGN KEY (competition_id) REFERENCES competition (competition_id),
CONSTRAINT match_ref_fk FOREIGN KEY (referee_id) REFERENCES referee (referee_id),
CONSTRAINT match_hteam_fk FOREIGN KEY (home_team) REFERENCES team (team_id),
CONSTRAINT match_ateam_fk FOREIGN KEY (away_team) REFERENCES team (team_id)
);

-- Insert statements to populate the tables

-- Competition inserted first
insert into competition (competition_id, competition_name, competition_sponsor, competition_age_group, competition_fee, competition_prize, competition_organiser_name, competition_organiser_phone) values (1, 'Local Open', 'Cisco', 14, 81, 724, 'Maria Austin', '086 9626375');
insert into competition (competition_id, competition_name, competition_sponsor, competition_age_group, competition_fee, competition_prize, competition_organiser_name, competition_organiser_phone) values (2, 'Town Shield', 'Amazon', 17, 28, 1120, 'Todd Moore', '087 5436676');
insert into competition (competition_id, competition_name, competition_sponsor, competition_age_group, competition_fee, competition_prize, competition_organiser_name, competition_organiser_phone) values (3, 'National Cup', 'Google', 18, 57, 609, 'Frank Simmons', '087 5785936');
insert into competition (competition_id, competition_name, competition_sponsor, competition_age_group, competition_fee, competition_prize, competition_organiser_name, competition_organiser_phone) values (4, 'Championship', 'IBM', 12, 20, 1161, 'Walter Ward', '086 3352502');
insert into competition (competition_id, competition_name, competition_sponsor, competition_age_group, competition_fee, competition_prize, competition_organiser_name, competition_organiser_phone) values (5, 'Super Cup', 'LinkedIn', 16, 40, 891, 'Brian Oliver', '087 5252144');
insert into competition (competition_id, competition_name, competition_sponsor, competition_age_group, competition_fee, competition_prize, competition_organiser_name, competition_organiser_phone) values (6, 'Senior Shield', 'Groupon', 13, 49, 1130, 'Stephanie Ward', '087 7306392');
insert into competition (competition_id, competition_name, competition_sponsor, competition_age_group, competition_fee, competition_prize, competition_organiser_name, competition_organiser_phone) values (7, 'Grand Slam', 'Oracle', 18, 47, 815, 'Bonnie Crawford', '086 6178425');
insert into competition (competition_id, competition_name, competition_sponsor, competition_age_group, competition_fee, competition_prize, competition_organiser_name, competition_organiser_phone) values (8, 'Junior Shield', 'Yahoo', 17, 37, 756, 'Diane Henderson', '086 8285733');
insert into competition (competition_id, competition_name, competition_sponsor, competition_age_group, competition_fee, competition_prize, competition_organiser_name, competition_organiser_phone) values (9, 'Provincial Cup', 'Twitter', 13, 46, 1088, 'Denise Campbell', '086 4711549');
insert into competition (competition_id, competition_name, competition_sponsor, competition_age_group, competition_fee, competition_prize, competition_organiser_name, competition_organiser_phone) values (10, 'Premier Cup', 'Facebook', 18, 64, 824, 'Carlos Pierce', '087 0210855');

-- Club inserted next
insert into club (club_id, club_name, club_manager_name, club_manager_phone, home_ground_location) values (1, 'Ardmore Rovers', 'Helen McLaughlin', '086 1774395', 'Adamstown');
insert into club (club_id, club_name, club_manager_name, club_manager_phone, home_ground_location) values (2, 'Wayside Celtic', 'Gerry O Callaghan', '087 6231544', 'Jackson Park');
insert into club (club_id, club_name, club_manager_name, club_manager_phone, home_ground_location) values (3, 'Kingswood FC', 'John Paterson', '087 1304908', 'Ballymount Park');
insert into club (club_id, club_name, club_manager_name, club_manager_phone, home_ground_location) values (4, 'Railway Union', 'Mary DeCourcy', '086 0557342', 'Park Avenue');
insert into club (club_id, club_name, club_manager_name, club_manager_phone, home_ground_location) values (5, 'Beechwood FC', 'David Thomson', '087 9475523', 'Herbert Park');
insert into club (club_id, club_name, club_manager_name, club_manager_phone, home_ground_location) values (6, 'Templeogue Utd', 'Jimmy Farrell', '087 9937254', 'Tymon Park');
insert into club (club_id, club_name, club_manager_name, club_manager_phone, home_ground_location) values (7, 'Shankill FC', 'Stephen Spain', '086 8079517', 'Shanganagh Park');
insert into club (club_id, club_name, club_manager_name, club_manager_phone, home_ground_location) values (8, 'Brookfield Celtic', 'Brian Jones', '086 3472298', 'Jobstown Park');
insert into club (club_id, club_name, club_manager_name, club_manager_phone, home_ground_location) values (9, 'St James Ath', 'Eddie McGrath', '086 8102950', 'Rosemount');
insert into club (club_id, club_name, club_manager_name, club_manager_phone, home_ground_location) values (10, 'Dalkey United', 'Cormac O Hanrahan', '087 9968832', 'Hyde Park');

-- Manager inserted next
insert into team_manager (team_manager_id, team_manager_name) values (1, 'Katherine Spencer');
insert into team_manager (team_manager_id, team_manager_name) values (2, 'Samuel Harrison');
insert into team_manager (team_manager_id, team_manager_name) values (3, 'Howard Campbell');
insert into team_manager (team_manager_id, team_manager_name) values (4, 'Michael Willis');
insert into team_manager (team_manager_id, team_manager_name) values (5, 'Aaron Reyes');
insert into team_manager (team_manager_id, team_manager_name) values (6, 'Ralph Dunn');
insert into team_manager (team_manager_id, team_manager_name) values (7, 'Brenda Olson');
insert into team_manager (team_manager_id, team_manager_name) values (8, 'Edward Mendoza');
insert into team_manager (team_manager_id, team_manager_name) values (9, 'Ruby Daniels');
insert into team_manager (team_manager_id, team_manager_name) values (10, 'Jonathan Dunn');

-- Team inserted next
insert into team (team_id, team_name, team_age_group, team_phone, team_address, competition_id, club_id, team_manager_id) values (1, 'Eagles', 17, '086 3121940', '19816 Farmco Drive', 2, 8, 10);
insert into team (team_id, team_name, team_age_group, team_phone, team_address, competition_id, club_id, team_manager_id) values (2, 'Tigers', 18, '087 0648300', '22927 Golden Leaf Pass', 7, 3, 10);
insert into team (team_id, team_name, team_age_group, team_phone, team_address, competition_id, club_id, team_manager_id) values (3, 'Panthers', 16, '087 3223116', '2520 Hauk Pass', 5, 3, 7);
insert into team (team_id, team_name, team_age_group, team_phone, team_address, competition_id, club_id, team_manager_id) values (4, 'Knights', 18, '086 7378668', '114 Valley Edge Point', 7, 1, 1);
insert into team (team_id, team_name, team_age_group, team_phone, team_address, competition_id, club_id, team_manager_id) values (5, 'Lions', 18, '087 7127830', '4188 Declaration Alley', 7, 4, 5);
insert into team (team_id, team_name, team_age_group, team_phone, team_address, competition_id, club_id, team_manager_id) values (6, 'Bears', 13, '087 6509188', '2626 Dixon Drive', 9, 5, 6);
insert into team (team_id, team_name, team_age_group, team_phone, team_address, competition_id, club_id, team_manager_id) values (7, 'Hawks', 14, '086 3171035', '8 Ridgeway Junction', 1, 6, 1);
insert into team (team_id, team_name, team_age_group, team_phone, team_address, competition_id, club_id, team_manager_id) values (8, 'Warriors', 17, '086 5260383', '077 Warner Parkway', 2, 1, 4);
insert into team (team_id, team_name, team_age_group, team_phone, team_address, competition_id, club_id, team_manager_id) values (9, 'Wildcats', 13, '086 9369421', '93 Mayer Crossing', 9, 8, 8);
insert into team (team_id, team_name, team_age_group, team_phone, team_address, competition_id, club_id, team_manager_id) values (10, 'Pioneers', 17, '087 5835108', '16673 7th Hill', 2, 9, 4);

-- Player inserted next
insert into player (player_id, player_dob, player_name, player_address, guardian_name, team_id) values (1, '21 Nov 2000', 'Patricia Peters', '86019 Riverside Lane', 'Teresa Lane', 7);
insert into player (player_id, player_dob, player_name, player_address, guardian_name, team_id) values (2, '29 Apr 2000', 'Catherine Fields', '23 Dwight Terrace', 'Rebecca Cook', 7);
insert into player (player_id, player_dob, player_name, player_address, guardian_name, team_id) values (3, '15 Sep 2001', 'Louis Oliver', '14 Northfield Road', 'Shawn Reed', 6);
insert into player (player_id, player_dob, player_name, player_address, guardian_name, team_id) values (4, '21 Jul 2001', 'Jacqueline Wagner', '22633 Paget Hill', 'Brenda Long', 6);
insert into player (player_id, player_dob, player_name, player_address, guardian_name, team_id) values (5, '24 Apr 1996', 'Virginia Nguyen', '70 Ridgeview Parkway', 'Charles Jordan', 5);
insert into player (player_id, player_dob, player_name, player_address, guardian_name, team_id) values (6, '20 Apr 1996', 'Justin Porter', '36 American Ash Park', 'Laura Ramirez', 2);
insert into player (player_id, player_dob, player_name, player_address, guardian_name, team_id) values (7, '27 Apr 1996', 'Cynthia Burton', '402 Beilfuss Road', 'Carolyn Ellis', 4);
insert into player (player_id, player_dob, player_name, player_address, guardian_name, team_id) values (8, '02 Feb 2014', 'Joe Arnold', '15024 Twin Pines Road', 'Theresa Stephens', 8);
insert into player (player_id, player_dob, player_name, player_address, guardian_name, team_id) values (9, '21 Jun 2001', 'George Fox', '68857 Westend Road', 'Norma Evans', 6);
insert into player (player_id, player_dob, player_name, player_address, guardian_name, team_id) values (10, '29 May 2001', 'Janice Morrison', '940 Grover Place', 'Louis Arnold', 6);

-- Referee inserted next
insert into referee (referee_id, referee_name, referee_qualification, referee_phone, referee_email) values (1, 'Mildred Stewart', 'FAI Referee Beginner', '086 2277922', 'mstewart0@dedecms.com');
insert into referee (referee_id, referee_name, referee_qualification, referee_phone, referee_email) values (2, 'Bruce Martin', 'FAI Referee', '086 6623473', 'bmartin1@addthis.com');
insert into referee (referee_id, referee_name, referee_qualification, referee_phone, referee_email) values (3, 'Eugene Burton', 'FAI Referee', '087 6004090', 'eburton2@gnu.org');
insert into referee (referee_id, referee_name, referee_qualification, referee_phone, referee_email) values (4, 'Jessica Schmidt', 'FAI Referee Beginner', '086 7455580', 'jschmidt3@privacy.gov.ie');
insert into referee (referee_id, referee_name, referee_qualification, referee_phone, referee_email) values (5, 'Ruth Morris', 'FAI Referee Beginner', '087 7551496', 'rmorris4@hostgator.com');
insert into referee (referee_id, referee_name, referee_qualification, referee_phone, referee_email) values (6, 'Jason Moore', 'FAI Referee Beginner', '087 3994839', 'jmoore5@usa.gov.ie');
insert into referee (referee_id, referee_name, referee_qualification, referee_phone, referee_email) values (7, 'Virginia Perez', 'FAI Referee', '086 6108659', 'vperez6@usa.gov.ie');
insert into referee (referee_id, referee_name, referee_qualification, referee_phone, referee_email) values (8, 'Karen Boyd', 'FAI Referee', '087 3944104', 'kboyd7@yahoo.com');
insert into referee (referee_id, referee_name, referee_qualification, referee_phone, referee_email) values (9, 'Joyce Wagner', 'FAI Referee Beginner', '087 7552141', 'jwagner8@cam.ac.ie');
insert into referee (referee_id, referee_name, referee_qualification, referee_phone, referee_email) values (10, 'Carolyn Nichols', 'FAI Referee', '086 5843879', 'cnichols9@hostgator.com');

-- Match inserted finally
insert into football_match (match_id, match_venue, match_date, home_team, away_team, competition_id, referee_id, home_team_score, away_team_score) values (1, 'Jobstown Park', '17 Apr 2014', 1, 8, 2, 7, 5, 5);
insert into football_match (match_id, match_venue, match_date, home_team, away_team, competition_id, referee_id, home_team_score, away_team_score) values (2, 'Adamstown', '24 Apr 2014', 8, 1, 2, 7, 5, 5);
insert into football_match (match_id, match_venue, match_date, home_team, away_team, competition_id, referee_id, home_team_score, away_team_score) values (3, 'Rosemount', '01 Aug 2014', 10, 1, 2, 10, 2, 2);
insert into football_match (match_id, match_venue, match_date, home_team, away_team, competition_id, referee_id, home_team_score, away_team_score) values (4, 'Jobstown Park', '08 Aug 2014', 1, 10, 2, 10, 2, 2);
insert into football_match (match_id, match_venue, match_date, home_team, away_team, competition_id, referee_id, home_team_score, away_team_score) values (5, 'Adamstown', '25 May 2014', 8, 10, 2, 8, 3, 1);
insert into football_match (match_id, match_venue, match_date, home_team, away_team, competition_id, referee_id, home_team_score, away_team_score) values (6, 'Ballymount Park', '10 May 2014', 2, 4, 7, 1, 4, 3);
insert into football_match (match_id, match_venue, match_date, home_team, away_team, competition_id, referee_id, home_team_score, away_team_score) values (7, 'Adamstown', '17 May 2014', 4, 2, 7, 1, 4, 3);
insert into football_match (match_id, match_venue, match_date, home_team, away_team, competition_id, referee_id, home_team_score, away_team_score) values (8, 'Park Avenue', '23 Feb 2014', 5, 2, 7, 2, 1, 1);
insert into football_match (match_id, match_venue, match_date, home_team, away_team, competition_id, referee_id, home_team_score, away_team_score) values (9, 'Adamstown', '11 Jul 2014', 4, 5, 7, 7, 3, 4);
insert into football_match (match_id, match_venue, match_date, home_team, away_team, competition_id, referee_id, home_team_score, away_team_score) values (10, 'Herbert Park', '20 Sep 2014', 6, 9, 9, 3, 2, 2);

-- Commit included to persist the data
commit;

/* ------------------- */
/* ----- Queries ----- */
/* ------------------- */


/* SINGLE ROW function - Club List */
SELECT club_id, UPPER(club_name) FROM club;

/* AGGREGATE function - Venue Match Count*/
SELECT match_venue "Venue", COUNT(match_id) "Matches Played" FROM football_match 
GROUP BY match_venue 
ORDER BY COUNT(match_id) DESC;

/*  INNER JOIN on two tables - Team / Club List */
SELECT t.team_id "Team ID", t.team_name "Team Name", c.club_name "Club Name" FROM team t
INNER JOIN club c ON t.club_id = c.club_id
ORDER BY t.team_id;

/*  INNER JOIN on three tables - Match List (Date Ordered) */
SELECT fm.match_date "Date", c.competition_name "Competition", home.team_name "Home Team", fm.home_team_score "H", fm.away_team_score "A", away.team_name "Away Team" FROM football_match fm
INNER JOIN team home ON (fm.home_team = home.team_id)
INNER JOIN team away ON (fm.away_team = away.team_id)
INNER JOIN competition c ON (fm.competition_id = c.competition_id)
ORDER BY fm.match_date ASC;

/* LEFT OUTER JOIN - Managers with no teams */
SELECT tm.team_manager_id "ID", tm.team_manager_name "Manager Name" FROM team_manager tm
LEFT OUTER JOIN team t ON tm.team_manager_id = t.team_manager_id
WHERE t.team_manager_id IS NULL;

/* RIGHT OUTER JOIN - Referee Match Count (DESC) */
SELECT r.referee_id "ID", r.referee_name "Referee Name", COUNT(fm.match_id) "Matches Refereed (DESC)" FROM referee r
RIGHT OUTER JOIN football_match fm ON r.referee_id = fm.referee_id
GROUP BY (r.referee_id, r.referee_name)
ORDER BY COUNT(fm.match_id) DESC;

/* ------------------- */
/* --- Alterations --- */
/* ------------------- */


/* UPDATE selected data - Change Sponsor */
UPDATE competition
SET competition_sponsor = 'VMWare'
WHERE competition_id = 8;

/* ADD a column to a table - Add phone column to Player */
ALTER TABLE player
ADD player_phone VARCHAR2(11);

/* ADD a value constraint to a table - Add UNIQUE constraint to Team Name */
ALTER TABLE team
ADD CONSTRAINT team_name_unique UNIQUE (team_name);

/* MODIFY a column on a table - Lengthen Team Name */
ALTER TABLE team
MODIFY team_name VARCHAR2(30);

/* DROP a column on a table - Remove email column from Player */
ALTER TABLE player
DROP COLUMN player_phone;

/* DROP a constraint on a table - Remove UNIQUE constraint from Team Name */
ALTER TABLE team
DROP CONSTRAINT team_name_unique;

-- Commit included to persist the data
commit;