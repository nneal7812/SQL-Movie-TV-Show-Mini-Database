DROP TABLE MovieReviews CASCADE CONSTRAINTS;
DROP TABLE TVShowReviews CASCADE CONSTRAINTS;
DROP TABLE Actor CASCADE CONSTRAINTS;
DROP TABLE Director CASCADE CONSTRAINTS;
DROP TABLE Writer CASCADE CONSTRAINTS;

DROP TABLE DirectsMovie CASCADE CONSTRAINTS;
DROP TABLE WritesMovie CASCADE CONSTRAINTS;
DROP TABLE ActsMovie CASCADE CONSTRAINTS;
DROP TABLE DirectsTVShow CASCADE CONSTRAINTS;
DROP TABLE WritesTVShow CASCADE CONSTRAINTS;
DROP TABLE ActsTVShow CASCADE CONSTRAINTS;

DROP TABLE Movie CASCADE CONSTRAINTS;
DROP TABLE TV_Show CASCADE CONSTRAINTS;
DROP TABLE MovieGenres CASCADE CONSTRAINTS;
DROP TABLE MovieLanguages CASCADE CONSTRAINTS;
DROP TABLE MovieColors CASCADE CONSTRAINTS;
DROP TABLE TVShowGenres CASCADE CONSTRAINTS;
DROP TABLE TVShowLanguages CASCADE CONSTRAINTS;
DROP TABLE TVShowColors CASCADE CONSTRAINTS;

CREATE TABLE Movie (
    Moviename VARCHAR2(300) CONSTRAINT Movie_moviename_nn NOT NULL,
    MovieURL VARCHAR2(1000) CONSTRAINT Movie_movieURL_PK PRIMARY KEY, 
    MovieAgeRating VARCHAR2(10),         
    MoviePlotSummary VARCHAR2(4000),     
    MovieRuntime VARCHAR2(6),                   
    MovieReleaseDate DATE,
    CountryofOrigin VARCHAR2(200),
    MovieSoundMix VARCHAR2(300),
    MovieAspectRatio VARCHAR2(300),
    Budget NUMBER(9),
    GrossIncomeWorldwide NUMBER(12),
    OpeningWeekendIncome_US_CAN NUMBER(9),
    GrossIncome_US_CAN NUMBER(9));

CREATE TABLE TV_Show (
    TVname VARCHAR2(300) CONSTRAINT TV_Show_tvname_nn NOT NULL,
    TVURL VARCHAR2(1000) CONSTRAINT TV_Show_tvURL_PK PRIMARY KEY,
    TVAgeRating VARCHAR2(10),
    TVPlotSummary VARCHAR2(4000),
    TVRuntime VARCHAR2(10),
    TVReleaseDate DATE,
    TVCountryofOrigin VARCHAR2(200),
    TVSoundMix VARCHAR2(300),
    TVAspectRatio VARCHAR2(300),
    Seasons NUMBER(2));

CREATE TABLE Director (
    DFname VARCHAR2(40),
    DMinit CHAR(1),
    DLname VARCHAR2(40) CONSTRAINT Director_DLname_PK PRIMARY KEY,
    DirectorBirthDate DATE);

CREATE TABLE Writer (
    WFname VARCHAR2(40),
    WMinit CHAR(1),
    WLname VARCHAR2(40) CONSTRAINT Writer_WLname_PK PRIMARY KEY,
    WriterBirthDate DATE);

CREATE TABLE Actor (
    AFname VARCHAR2(40),
    AMinit CHAR(1),
    ALname VARCHAR2(40) CONSTRAINT Actor_ALname_PK PRIMARY KEY,
    ActorBirthDate DATE);

CREATE TABLE MovieReviews (
MovieURL         VARCHAR2(1000),
MovieUserURL     VARCHAR2(50),
MovieReviewDate  DATE,
MovieReviewContent VARCHAR2(1000),
CONSTRAINT MovieReviews_MovieURLS_PK PRIMARY KEY(MovieURL, MovieUserURL));

-- Creating the DirectsMovie relationship table
CREATE TABLE DirectsMovie (
    MovieURL VARCHAR2(1000),
    dname VARCHAR2(200),
    CONSTRAINT directsmovie_PK PRIMARY KEY (MovieURL, dname));

CREATE TABLE WritesMovie (
    MovieURL VARCHAR2(1000),
    WriterLastName VARCHAR2(20),
    CONSTRAINT writesmovie_movieurl_WLname_PK PRIMARY KEY (MovieURL, WriterLastName));

CREATE TABLE ActsMovie (
    MovieURL VARCHAR2(1000),
    ActorLastName VARCHAR2(20),
CONSTRAINT actsmovie_movieurl_ALname_PK PRIMARY KEY(MovieURL, ActorLastName));

CREATE TABLE MovieGenres (
    MovieURL VARCHAR2(1000),
    MovieGenre VARCHAR2(25),
 CONSTRAINT moviegenres_mURL_mgenre_PK PRIMARY KEY(MovieURL, MovieGenre));

CREATE TABLE MovieLanguages (
    MovieURL VARCHAR2(1000),
    MovieLanguage VARCHAR2(200),
 CONSTRAINT movielanguages_mURL_MLang_PK PRIMARY KEY(MovieURL, MovieLanguage));

CREATE TABLE MovieColors(
   Colors VARCHAR2(100),
   MovieURL VARCHAR2(1000),
 CONSTRAINT moviecolors_colors_movieurl_PK PRIMARY KEY(Colors, MovieURL));

CREATE TABLE TVShowReviews (
TVSURL         VARCHAR2(1000),
TVSUserURL     VARCHAR2(50),
TVSReviewDate  DATE,
TVSReviewContent VARCHAR2(150),
CONSTRAINT TVShowReviews_TVSURLS_PK PRIMARY KEY(TVSURL, TVSUserURL));

CREATE TABLE WritesTVShow (
TVURL          VARCHAR2(1000),
WriterLastName VARCHAR2(20),
CONSTRAINT WritesTVShow_WritesURL_PK PRIMARY KEY(TVURL, WriterLastName));

CREATE TABLE DirectsTVShow (
TVURL          VARCHAR2(1000),
DirectorLastName  VARCHAR2(20),
CONSTRAINT DirectsTVShow_DirectsTVURL_PK PRIMARY KEY(TVURL, DirectorLastName));

CREATE TABLE ActsTVShow (
TVURL          VARCHAR2(1000),
ActorLastName  VARCHAR2(20),
CONSTRAINT ActsTVShow_ActsURL_PK PRIMARY KEY(TVURL, ActorLastName));

CREATE TABLE TVShowGenres (
TVURL          VARCHAR2(1000),
TVGenre        VARCHAR2(25),
CONSTRAINT TVShowGenres_Genres_PK PRIMARY KEY(TVURL, TVGenre));

CREATE TABLE TVShowLanguages (
TVURL         VARCHAR2(1000),
TVLanguage    VARCHAR2(200),
CONSTRAINT TVShowLanguages_Languages_PK PRIMARY KEY(TVURL, TVLanguage));

CREATE TABLE TVShowColors (
TVURL         VARCHAR2(1000),
TVColor       VARCHAR2(100),
CONSTRAINT TVShowColors_Color_PK PRIMARY KEY(TVURL, TVColor));

ALTER TABLE MovieReviews
ADD CONSTRAINT moviereviews_movieurl_fk FOREIGN KEY(MovieURL) 
REFERENCES Movie(MovieURL);

ALTER TABLE DirectsMovie
ADD CONSTRAINT directsmovie_movieurl_fk FOREIGN KEY (MovieURL) REFERENCES Movie(MovieURL);
ALTER TABLE DirectsMovie   
ADD CONSTRAINT directsmovie_director_fk FOREIGN KEY (dname) REFERENCES Director(DLname);

ALTER TABLE WritesMovie 
ADD CONSTRAINT writesmovie_movieurl_fk FOREIGN KEY(MovieURL) REFERENCES Movie(MovieURL);

ALTER TABLE WritesMovie 
ADD CONSTRAINT writesmovie_writerlastname_fk FOREIGN KEY(WriterLastName) REFERENCES Writer(WLname);

ALTER TABLE ActsMovie 
ADD CONSTRAINT actssmovie_movieurl_fk FOREIGN KEY (MovieURL) REFERENCES Movie(MovieURL);

ALTER TABLE ActsMovie
ADD CONSTRAINT actsmovie_actorlastname_fk FOREIGN KEY(ActorLastName) REFERENCES Actor(ALname);

ALTER TABLE MovieGenres
ADD CONSTRAINT moviegenres_movieurl_fk FOREIGN KEY (MovieURL) REFERENCES Movie(MovieURL);

ALTER TABLE MovieLanguages
ADD CONSTRAINT movielanguages_movieurl_fk FOREIGN KEY(MovieURL) REFERENCES Movie(MovieURL);

ALTER TABLE MovieColors
ADD CONSTRAINT moviecolors_movieurl_fk FOREIGN KEY(MovieURL) REFERENCES Movie(MovieURL);

ALTER TABLE DirectsTVShow
ADD CONSTRAINT directstvshow_tvurl_fk FOREIGN KEY(TVURL)
REFERENCES TV_Show(TVURL);

ALTER TABLE TVShowReviews
ADD CONSTRAINT tvshowreviews_tvurl_fk FOREIGN KEY(TVSURL) 
REFERENCES TV_Show(TVURL);

ALTER TABLE DirectsTVShow
ADD CONSTRAINT directstvshow_DLastname_fk FOREIGN KEY(DirectorLastName)
REFERENCES Director(DLname);

ALTER TABLE WritesTVShow
ADD CONSTRAINT writestvshow_tvurl_fk FOREIGN KEY(TVURL) 
REFERENCES TV_Show(TVURL);

ALTER TABLE WritesTvShow
ADD CONSTRAINT writestvshow_writerlastname_fk FOREIGN KEY(WriterLastName) 
REFERENCES Writer(WLname);

ALTER TABLE ActsTVShow
ADD CONSTRAINT actstvshow_tvurl_fk FOREIGN KEY(TVURL)
REFERENCES TV_Show(TVURL);

ALTER TABLE ActsTVShow
ADD CONSTRAINT actstvshow_actorlastname_fk FOREIGN KEY(ActorLastName)
REFERENCES Actor(ALname);

ALTER TABLE TVShowGenres
ADD CONSTRAINT tvshowgenres_tvurl_fk FOREIGN KEY(TVURL)
REFERENCES TV_Show(TVURL);

ALTER TABLE TVShowLanguages
ADD CONSTRAINT tvshowlanguages_tvurl_fk FOREIGN KEY(TVURL)
REFERENCES TV_Show(TVURL);

ALTER TABLE TVShowColors
ADD CONSTRAINT tvshowcolor_tvurl_fk FOREIGN KEY(TVURL)
REFERENCES TV_Show(TVURL);


--Insert The second movie, Spider-man: into the Spider-Verse
INSERT INTO Movie
VALUES ('Spider-Man: Into the Spider-Verse', 'https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'PG', 'Teen Miles Morales becomes the Spider-Man of his universe and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.', '1h 57m', '14-December-2018', 'United States', 'Dolby Atmos', '2.39:1', 90000000, 384298736, 35363376, 190241310);
--Insert directors
INSERT INTO Director
VALUES ('Robert', ' ', 'Persichetti', '17-Jan-1973');

INSERT INTO Director
VALUES ('Peter', 'A', 'Ramsey', '23-Dec-1962');

INSERT INTO Director
VALUES ('Rodney', ' ', 'Rothman', '01-Jan-1956');

--Insert Writers
INSERT INTO Writer
VALUES ('Rodney', ' ', 'Rothman', '01-Jan-1956');

--Insert Actors:  
INSERT INTO Actor
VALUES ('Shameik', 'A', 'Moore', '04-May-1995');

INSERT INTO Actor
VALUES ('Hailee', 'C', 'Steinfeld', '11-Dec-1996');

INSERT INTO Actor
VALUES ('Mark', 'J', 'Johnson', '28-May-1978');

INSERT INTO Actor
VALUES ('Brian', 'T', 'Henry', '31-Mar-1982');

INSERT INTO Actor
VALUES ('Luna', 'L', 'Velez', '02-Nov-1964');

--Insert Movie Reviews
INSERT INTO MovieReviews
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'https://www.imdb.com/review/rw5267954/?ref_=tt_urv', '19-Nov-2019', 'So many have commented, so I will be brief. From an intriguing plot to wonderful characterizations using drop dead animation, this film works. About ten minutes into it it thought, "This is just a kind of hip hop version of Spiderman." But the main character is suddenly thrust into a world which he must learn quickly to manage. The canon takes a turn here toward incredible creativity. I avoid mainstream animation, but this has restored my faith.'); 

--Insert Movies directed 
INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Persichetti');

INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Ramsey');

INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Rothman');

INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Rothman');

--Insert Movies Acted
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Moore');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Steinfeld');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Henry');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Velez');

INSERT INTO ActsMovie 
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Johnson');

--Insert MOvie's Genre
INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Animation');

INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Action');

INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'Adventure');

--Insert Movie's Language
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1', 'English');

--INsert Movie's Colors
INSERT INTO MovieColors
VALUES ('ImageWorks', 'https://www.imdb.com/title/tt4633694/?ref_=tt_sims_tt_i_1' );



--Insert Spiderman across the spider verse 
INSERT INTO Movie
VALUES ('SpiderMan: Across the Spider-Verse', 'https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'PG', 'Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence. When the heroes clash on how to handle a new threat, Miles must redefine what it means to be a hero.', '2h 20m',  '2-June-2023', 'United States', 'Dolby Atmos', '2.39:1', 150000000, 690516673, 120663589, 381311319);
--Insert directors
INSERT INTO Director
VALUES ('Joaquim', 'D', 'Santos', '22-Jun-1977');

INSERT INTO Director
VALUES ('Kemp', ' ', 'Powers', '30-Oct-1973');

INSERT INTO Director
VALUES ('Justin', 'K', 'Thompson', '09-Jan-1981');

--Insert Writers
INSERT INTO Writer
VALUES ('Phil', 'A', 'Lord', '12-Jul-1975');

INSERT INTO Writer
VALUES ('Christopher', 'R', 'Miller', '23-Jun-1975');

INSERT INTO Writer
VALUES ('Dave', 'E', 'Callaham', '24-Oct-1977');

--Insert Actors: None, the second movie had the same actors as the first movie.


--Insert Movie Reviews
INSERT INTO MovieReviews
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'https://www.imdb.com/review/rw9093623/?ref_=tt_urv', '1-June-2023', 'Spider-Man: Into the Spider-Verse is probably my favorite Spider-Man movie. However, my feelings about Spider-Man: Across the Spider-Verse are currently glitching. On one hand, the action scenes are spectacular, and the animation is, once again, amazing. On the other hand, this movie is 2 hours and 20 minutes long and it feels like it. Plus, the visuals can be so kinetic that the film becomes busy and chaotic. This sequel offers some real drama, however it is not a complete story, and it ends on a cliffhanger. I think my rating will solidify when I watch Beyond the Spider-Verse and see how it all ends.'); 

--Insert Movies directed 
INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Santos');

INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Powers');

INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Thompson');

--Insert Movies Written
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Lord');

INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Miller');

INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Callaham');

--Insert Movies Acted
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Moore');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Steinfeld');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Henry');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Velez');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Johnson');

--Insert Movie's Genre
INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Animation');

INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Action');

INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'Adventure');

--Insert Movie's Language
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov', 'English');

--INsert Movie's Colors
INSERT INTO MovieColors
VALUES ('ACES', 'https://www.imdb.com/title/tt9362722/?ref_=ttpl_ov');



--Insert movie
INSERT INTO Movie
VALUES('Spider-Man: Homecoming', 'https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'PG-13', 'Peter Parker balances his life as an ordinary high school student in Queens with his superhero alter-ego Spider-Man, and finds himself on the trail of a new menace prowling the skies of New York City.', '2h 13m', ' 7-July-2017', 'United States', 'Dolby Atmos', '2.39:1', 175000000, 880166924, 117027503, 334201140); 

--Insert Director
INSERT INTO Director
VALUES('Jon', ' ', 'Watts', '28-Jun-1981');

--Insert Writers 
INSERT INTO Writer
VALUES ('Jonathan', 'M', 'Goldstein', '02-Sep-1968');

INSERT INTO Writer
VALUES ('John', 'F','Daley', '20-Jul-1985');

INSERT INTO Writer
VALUES ('Jon', ' ', 'Watts', '28-Jun-1981');

--Insert Actors
INSERT INTO Actor
VALUES ('Tom', 'S', 'Holland', '01-Jun-1996');

INSERT INTO Actor
VALUES ('Micheal', 'J', 'Keaton', '05-Sep-1951');

INSERT INTO Actor
Values ('Robert', 'J', 'Downey', '04-Apr-1965');

INSERT INTO Actor
VALUES ('Marisa', '', 'Tomei', '04-Dec-1964');

INSERT INTO Actor
VALUES ('Jon', '', 'Favreau', '19-Oct-1966');

--Insert User Review
INSERT INTO MovieReviews
VALUES('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'https://www.imdb.com/review/rw5804003/?ref_=tt_urv', '6-June-2020', 'Spider-Man Homecoming is a refreshing Mcu film. It is very fun and lighthearted with great characters and entertaining scenes. The action sequences are very good and the movie knows when to be goofy and when not to be.');

--Insert directed 
INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Watts');

--Insert Written by
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Goldstein');

INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Daley');

INSERT INTO WritesMovie
VALUES('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Watts');

--Insert acted
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Holland');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Keaton');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Downey');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Tomei');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Favreau');

--Insert movie's Genre
INSERT INTO MovieGenres
VALUES('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Action');

INSERT INTO MovieGenres
VALUES('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Sci-Fi');

--Language
INSERT INTO MovieLanguages
VALUES('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'English'); 

INSERT INTO MovieLanguages
VALUES('https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1', 'Spanish'); 

--Color
INSERT INTO MovieColors
VALUES('Cantina Creative', 'https://www.imdb.com/title/tt2250912/?ref_=tt_sims_tt_i_1');



--Insert Movie
INSERT INTO Movie
VALUES('Spider-Man: Far From Home', 'https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'PG-13', 'Following the events of Avengers: Endgame (2019), Spider-Man must step up to take on new threats in a world that has changed forever.', '2h 9m', '2-July-2019', 'United States', 'Dolby Surround 7.1', '2.39:1', 160000000, 1131927996, 92579212, 390532085);

--Insert Directors: The director was the same director as the previous movie

--Insert Writers
INSERT INTO Writer
VALUES ('Christopher', 'L', 'McKenna', '18-Oct-1977');

INSERT INTO Writer
VALUES ('Erik', ' ', 'Sommers', '16-Jan-1976');

INSERT INTO Writer
VALUES ('Stan', ' ', 'Lee', '28-Dec-1922');

--Insert Actor
INSERT INTO Actor
VALUES ('Samuel', 'L', 'Jackson', '21-Dec-1948');

INSERT INTO Actor
VALUES ('Jake', 'B', 'Gyllenhaal', '19-Dec-1980');

--Insert User Review
INSERT INTO MovieReviews
VALUES('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'https://www.imdb.com/review/rw4973838/?ref_=tt_urv', '3-July-2019', 'It is hard not to enjoy this quirky teen romance disguised as a Marvel movie. This Spider-Man sequel is hilarious and charming. It swings along through a great story and takes time to enjoy itself along the way. There are some terrifically trippy sequences that showcase the coolness of Mysterio. Gyllenhaal brings his typical great performance and is one of the better Marvel villains. Far From Home is loads of fun and a great segue into the next era of the MCU. Make sure you stay for the mid-credits scene as it is probably the best one in MCU history.');

--Insert Directed
INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Watts');

--Insert Written
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'McKenna');

INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Sommers');

INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Lee')

--Insert Acted
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Holland');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Tomei');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Favreau');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Jackson');

INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Gyllenhaal');

--Insert Movie Genre
INSERT INTO MovieGenres
VALUES('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Action');

INSERT INTO MovieGenres
VALUES('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Adventure');

INSERT INTO MovieGenres
VALUES('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Comedy');

--Insert Movie Language
INSERT INTO MovieLanguages
VALUES('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'English'); 

INSERT INTO MovieLanguages
VALUES('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Italian'); 

INSERT INTO MovieLanguages
VALUES('https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1', 'Czech'); 

--Insert Movie Color
INSERT INTO MovieColors
VALUES('Luma Pictures', 'https://www.imdb.com/title/tt6320628/?ref_=tt_sims_tt_i_1');

--Actors
--Ironman
INSERT INTO Actor
VALUES ('Robert', 'J', 'Downey Jr', '04-Apr-1965');
INSERT INTO Actor
VALUES ('Gwyneth', 'K', 'Paltrow', '27-Sep-1972');
INSERT INTO Actor
VALUES ('Terrence', '', 'Howard', '11-Mar-1969');
--IronMan3
--robeert and gwyneth both act in this one again so only one new actor
INSERT INTO Actor
VALUES ('Guy', 'E', 'Pearce', '05-Oct-1967');
--Avengers
--Robert Downey in this again
INSERT INTO Actor
VALUES ('Chris', 'R', 'Evans', '13-Jun-1981');
INSERT INTO Actor
VALUES ('Scarlett', 'I', 'Johansson', '22-Nov-1984');
--Directors
--Iron Man
INSERT INTO Director
VALUES ('Jon', 'K', 'Favreau', '19-Oct-1966');
--IronMan3
INSERT INTO Director
VALUES ('Shane', '' ,'Black', '16-Dec-1961');
--TheAvengers
INSERT INTO Director
VALUES ('Joss', 'H', 'Whedon', '23-Jun-1964');

--Writers
--IronMan
INSERT INTO Writer
VALUES ('Mark', '', 'Fergus', '');
INSERT INTO Writer
VALUES ('Hawk', 'N', 'Ostby', '');
INSERT INTO Writer
VALUES ('Art', 'N', 'Marcum', '');

--IronMan3
INSERT INTO Writer
VALUES ('Shane',' ' ,'Black', '16-Dec-1961');
INSERT INTO Writer
VALUES ('Drew', NULL, 'Pearce', '24-Aug-1975');
--Avengers
INSERT INTO Writer
VALUES ('Joss', 'H', 'Whedon', '23-Jun-1964');
INSERT INTO Writer
VALUES ('Zak', 'H', 'Penn', '23-Mar-1968');
--Movies
INSERT INTO Movie
VALUES ('Iron Man', 'https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man', 'PG-13','After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.', '2h 6m','05-May-2008','United States', 'SDDS, Dolby Digital, DTS, Dolby Atmos', '2.39: 1',140000000,585796247,319034126,98618668);

INSERT INTO Movie
VALUES ('Iron Man 3', 'https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203', 'PG-13', 'When Tony Starks world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution', '2h 10m','26-Apr-2013', 'United States', 'Dolby Digital, Datasat, Dolby Atmos, Dolby Surround 7.1 SDDS', '2.39: 1',200000000,1215577205,409013994,174144585);

INSERT INTO Movie
VALUES ('The Avengers', 'https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers', 'PG-13', 'Earths mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.', '2h 23m', '04-May-2012', 'United States', 'Datasat, Dolby Digital, Dolby Surround 7.1, SDDS, Auro 11.1, Dolby Atmos', '1.85:1',220000000,1520538536,623357910,207438708);
--Moviereview
--IronMan
INSERT INTO MovieReviews
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','https://www.imdb.com/review/rw1976997/?ref_=tt_urv', '17-Nov-2008','Iron Man is one of the better superhero movies. It is based off the popular Marvel comics. On one of the reviews, I was shocked to see that the person liked the new Hulk better. I agree that Hulk is a great movie, but Iron Man is 100 times better. Tony Stark, a popular weapons company owner gets kidnapped by a cult called Ten Rings in the Middle East. They want Stark to build a weapon for them. Instead he builds his Iron Man suit. He eventually escapes and later becomes Iron Man. Will he have revenge on the cult and it is surprising leader? You will have to watch to find out. The acting is better than expected in this film. Robert Downey Jr. did such a unexpected great job. Gwyneth Paltrow did well as her role of Pepper Potts. I also liked Terrence Howard as Rhodey. The special effects were great as they are with superhero movies. The plot has its share of intriguing twists. I believe that this Iron Man is original, but that is my opinion. I rate this movie 10/10.');
--IronMan3
INSERT INTO MovieReviews
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203','https://www.imdb.com/review/rw2795924/?ref_=tt_urv', '11-May-2013','This movie has lots of special effects and lots of noise and lots of excellent actors, but it forgot to include one thing: a story. Well, actually, there is a story, of sorts, but it is so superficial as to render it moot. This movie is proof that special effects alone do not make for a good movie, or for even a fair movie. When Miss Penny has to bail out Iron Man, that is a sure sign that the script department is desperate. But that aside, the story is so shallow and the bad guys so predictable that the movie loses dramatic power, rendering it stale. Of course, this can happen when a comic book story is transposed onto the screen. If not portrayed correctly, the story will not be taken seriously, and the movie tanks. Iron Man 1 and 2 managed to avoid that problem; this movie does not. As a result, we have');

--TheAvengers
INSERT INTO MovieReviews
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers','https://www.imdb.com/review/rw7256045/?ref_=tt_urv','21-Aug-2021','This might be controversial to say but this is my personal favorite MCU movie. Up until this point, nothing had been done like this in film and it was executed magnificently. Going into this movie in 2012 (having only seen Iron Man beforehand) I was skeptical and not interested. Then my brother took us to the theater to see it and it was one hell of a blast. I was blown away and wanted to watch all of the other Phase 1 movies and learn more about these other heroes. The casting and chemistry between them is on point, the villain is compelling and gets under your skin in the best way, and Robert Downey Jr. humor all around is unforgettable, and how can I not mention that glorifying theme song?? Not to mention Stan Lee has a perfect cameo!');

--ActsMovie
--IronMan
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man', 'Downey Jr');
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man', 'Paltrow');
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man', 'Howard');
--IronMan3
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203', 'Downey Jr');
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203', 'Pearce');
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203', 'Paltrow');
--TheAvengers
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers', 'Downey Jr');
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers', 'Evans');
INSERT INTO ActsMovie
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers', 'Johansson');
--Directsmovie
--Ironman
INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man', 'Favreau');
--Ironman3
INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203', 'Black');
--TheAvengers
INSERT INTO DirectsMovie
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers', 'Whedon');
--writesmovie
--Ironman
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man', 'Fergus');
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man', 'Ostby');
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man', 'Marcum');
--Ironman3
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203', 'Marcum');
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203', 'Black');
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203', 'Pearce');
--TheAvengers
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers', 'Whedon');
INSERT INTO WritesMovie
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers', 'Penn');
--MovieGenre
--IronMan
INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','Action');
INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','Adventure');
INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','Sci-fi');
--IronMan3
INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203','Action');
INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203','Adventure');
INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203','Sci-fi');
--Avengers
INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers','Action');
INSERT INTO MovieGenres
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers','Sci-fi');
--MovieLanguages
--IronMan
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','English');
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','Persian');
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','Urdu');
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','Arabic');
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','Kurdish');
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','Hindi');
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man','Hungarian');
--IronMan3
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203', 'English');
--Avengers
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers', 'English');
INSERT INTO MovieLanguages
VALUES ('https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers', 'Russian');
--MovieColors
--Ironman
INSERT INTO MovieColors
VALUES ('Color', 'https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man');
--Ironman3
INSERT INTO MovieColors
VALUES ('Color', 'https://www.imdb.com/title/tt1300854/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_iron%2520man%25203');
--Avengers
INSERT INTO MovieColors
VALUES ('Color', 'https://www.imdb.com/title/tt0848228/?ref_=nv_sr_srsg_3_tt_8_nm_0_q_avengers');
--TVSHOWSTART

--Sunnyside
INSERT INTO TV_Show
VALUES ('Sunnyside','https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','TV-14','Garrett Modi (Kal Penn) is a former New York city councilman who finds his calling when faced with immigrants in need of his help and in search of the American Dream.','25 minutes', '26-Sep-2019', 'United States', 'Stereo', '16:9 HD', 1);
INSERT INTO Actor
VALUES ('Kal', '', 'Penn','23-Apr-1977');
INSERT INTO Actor
VALUES ('Kiran', '', 'Deol','');
INSERT INTO Actor
VALUES ('Moses', '', 'Storm','06-May-1990');
--Directors
INSERT INTO Director
VALUES ('Oz', '', 'Rodriguez','');
INSERT INTO Director
VALUES ('Anya', '', 'Adams','');
INSERT INTO Director
VALUES ('Rebecca', 'E', 'Asher','17-Jun-1969');
INSERT INTO Director
VALUES ('Payman', '', 'Benz','');
INSERT INTO Director
VALUES ('Jeffrey', '', 'Blitz','');
INSERT INTO Director
VALUES ('Maggie', '', 'Carey','');
INSERT INTO Director
VALUES ('Heather', '', 'Jack','');
INSERT INTO Director
VALUES ('Jaime', 'E', 'Karas','');
INSERT INTO Director
VALUES ('Linda', '', 'Mendoza','21-Oct-1957');
INSERT INTO Director
VALUES ('David', 'J', 'Miller','');
--Writers
INSERT INTO Writer
VALUES ('Matt', '','Murray','');
INSERT INTO Writer
VALUES ('Polina', '','Diaz','');
INSERT INTO Writer
VALUES ('Ayo', '','Edebiri','03-Oct-1995');
INSERT INTO Writer
VALUES ('Paiman', '','Kalayeh','');
INSERT INTO Writer
VALUES ('Evan', '','Waite','');
INSERT INTO Writer
VALUES ('Aseem', '','Batra','28-Dec-1975');
INSERT INTO Writer
VALUES ('Andy', '','Gosche','');
INSERT INTO Writer
VALUES ('Amy', '','Hubbs','');
INSERT INTO Writer
VALUES ('Dan', '','Klein','');
INSERT INTO Writer
VALUES ('Damir', '','Konjicija','');
INSERT INTO Writer
VALUES ('Dario', '','Anton','');
INSERT INTO Writer
VALUES ('April', 'K','Quioh','');
--TVReviews
INSERT INTO TVShowReviews
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','https://www.imdb.com/review/rw5194926/?ref_=tt_urv','18-Oct-2019','Silly but fun to watch. The brother and sister characters make the show so far. Worth watching because of them');
--Writestvshow
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Murray');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Penn');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Diaz');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Edebiri');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Kalayeh');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Waite');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Batra');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Gosche');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Hubbs');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Klein');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Konjicija');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Anton');
INSERT INTO WritesTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov','Quioh');
--Directstvshow
INSERT INTO DirectsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Rodriguez');
INSERT INTO DirectsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Adams');
INSERT INTO DirectsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Asher');
INSERT INTO DirectsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Benz');
INSERT INTO DirectsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Blitz');
INSERT INTO DirectsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Carey');
INSERT INTO DirectsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Jack');
INSERT INTO DirectsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Karas');
INSERT INTO DirectsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Mendoza');
INSERT INTO DirectsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Miller');
--actstvshow
INSERT INTO ActsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Penn');
INSERT INTO ActsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Deol');
INSERT INTO ActsTVShow
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Storm');
--Tvgenre
INSERT INTO TVShowGenres
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Comedy');
--tvlanguages
INSERT INTO TVShowLanguages
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'English');
--tvcolors
INSERT INTO TVShowColors
VALUES ('https://www.imdb.com/title/tt9165776/?ref_=ttep_ov', 'Color');




