create table Anime
(
    anime_id    int auto_increment,
    title       text          not null,
    description longtext      null,
    score       decimal(4, 1) not null,
    coverPhoto  longtext      null,
    constraint Anime_Anime_id_uindex
        unique (anime_id)
);

alter table Anime
    add primary key (anime_id);

create table Genre
(
    genre_id int auto_increment,
    anime_id int  not null,
    genre    text not null,
    constraint Genre_genre_id_uindex
        unique (genre_id),
    constraint `Genre___fk(anime_id`
        foreign key (anime_id) references Anime (anime_id)
);

alter table Genre
    add primary key (genre_id);

create table User
(
    user_id      int auto_increment,
    nickName     text     not null,
    userName     text     not null,
    email        text     not null,
    passwordHash longtext not null,
    profilePhoto text     null,
    constraint User_user_id_uindex
        unique (user_id)
);

alter table User
    add primary key (user_id);

create table Review
(
    review_id  int auto_increment,
    reviewText longtext not null,
    user_id    int      not null,
    likes      int      not null,
    dislikes   int      not null,
    anime_id   int      not null,
    grade      double   not null,
    constraint Review_review_id_uindex
        unique (review_id),
    constraint anime_id
        foreign key (anime_id) references Anime (anime_id),
    constraint user_id
        foreign key (user_id) references User (user_id)
);

alter table Review
    add primary key (review_id);

create table UserData
(
    UserData_id int auto_increment,
    review_id   int null,
    type_list   int null,
    anime_id    int null,
    user_id     int not null,
    constraint UserData_UserData_id_uindex
        unique (UserData_id),
    constraint UserData_Review_review_id_fk
        foreign key (review_id) references Review (review_id),
    constraint UserData_User_user_id_fk
        foreign key (user_id) references User (user_id),
    constraint `anime_id(UserData)`
        foreign key (anime_id) references Anime (anime_id)
)
    comment '1-finished; 2-onogoing; 3-watchlist; 4-reviewedAnime';

alter table UserData
    add primary key (UserData_id);

INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (1, 'Kuroko no basket', 'joguinho de basket com poder', 69, 'https://animesbr.biz/wp-content/uploads/2019/07/5CEIm6RPRU9iy4jBpfreUwJkydv.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (2, 'Kimetsu no yaiba', 'alskdfjalksjdf', 85, 'https://www.meon.com.br/source/files/c/152753/Kimetsu_no_Yaiba_2-242118_1028-1301-0-0.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (4, 'Boku no hero academia', 'g;ljfkdsioeqepov', 87.5, 'https://sm.ign.com/ign_br/tv/m/my-hero-ac/my-hero-academia_f9ae.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (7, 'Jujutsu Kaisen', 'Maldito', 68.2, 'https://img1.ak.crunchyroll.com/i/spire3/02c909684baa37d6ef70a9df742d58951610752067_full.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (8, 'Ishuzoku Reviewers', 'Filosofia pura', 100, 'https://upload.wikimedia.org/wikipedia/pt/4/47/Poster_Ishuzoku_Reviewers.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (9, 'Highschool DxD', 'Um classico', 90, 'https://upload.wikimedia.org/wikipedia/pt/e/e2/High_School_DxD_Volume_1.png');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (10, 'Kiss x Sis', 'Para toda familia', 89, 'https://animesonehd.xyz/wp-content/uploads/2020/03/kiss-x-sis-online-em-HD.png');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (11, 'Kaifuku Jutsushi no Yarinaoshi', 'Super herois amigavel', 88, 'https://animesonline.cc/wp-content/uploads/2021/01/uWYp8E45aUl9ctFOkjYDqicC8w4-185x278.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (12, 'Domestic Kanojo', 'Para melhorar o laco entre irmaos', 80, 'https://sucodemanga.com.br/wp-content/uploads/2019/02/domestic-na-kanojo-thumb.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (13, 'Uzaki-chan wa Asobitai!', 'Ela eh maior de idade', 98, 'https://animesonline.cc/wp-content/uploads/2020/07/ynGX83rPx9yQkzqwSEnaNbyf5uV-185x278.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (14, 'Peter Grill to Kenja no Jikan', 'Uma licao para aceitar outras racas', 88, 'https://animesonline.cc/wp-content/uploads/2020/07/k6fagonjajYZ9fLjSmlQnafHtUJ-185x278.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (15, 'Prison School', 'Uma professora amigavel', 88, 'https://animesonline.cc/wp-content/uploads/2020/03/e2yrTcU7L6jIGVWxUOtns0wMOUH-185x278.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (16, 'Sora no Otoshimono', 'Uma licao sobre emocao', 75, 'https://animesonline.cc/wp-content/uploads/2019/11/hNj4zAltMykp1sTn7iOEbpbISjI-185x278.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (17, 'Strike the Blood', 'Sobre uma dupla dinamica', 78, 'https://animesonline.cc/wp-content/uploads/2019/11/oEV7B4gtzOyn2SdlIzFboaBrab7-185x278.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (18, 'Nande Koko ni Sensei ga!?', 'Amizade entre professora e aluno', 81.5, 'https://animesonline.cc/wp-content/uploads/2019/09/qBbXn8dECRo9eDscmpDg9pcuP8U-185x278.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (19, 'No Game No Life', 'Eles nao sao relacionados por sangue', 100, 'https://animesonline.cc/wp-content/uploads/2019/09/aQJVORsEm4GT6H5QqCIyvTzbrCX-185x278.jpg');
INSERT INTO MAL.Anime (anime_id, title, description, score, coverPhoto) VALUES (20, 'Monster Musume no Iru Nichijou', 'Uma licao sobre aceitacao', 100, 'https://animesonline.cc/wp-content/uploads/2019/08/vMQMUEF5mHE7rcQbrmJD8wh3h0X-185x278.jpg');

INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (1, 1, '"Action"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (2, 2, '"Shounen"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (3, 1, '"Sports"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (4, 2, '"Action"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (5, 4, '"Shounen"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (6, 8, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (7, 10, '"Slice of Life"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (8, 12, '"Romance"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (9, 13, '"Comedy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (10, 7, '"Supernatural"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (11, 18, '"Romance"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (12, 9, '"Action"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (13, 9, '"Comedy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (14, 9, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (15, 9, '"Harem"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (16, 10, '"Comedy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (17, 10, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (18, 10, '"Harem"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (19, 10, '"Seinen"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (20, 10, '"Romance"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (21, 8, '"Comedy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (22, 8, '"Fantasy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (23, 11, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (24, 11, '"Fantasy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (25, 12, '"Drama"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (26, 13, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (27, 13, '"Slice of Life"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (28, 14, '"Comedy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (29, 14, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (30, 14, '"Fantasy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (31, 14, '"Harem"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (32, 15, '"Comedy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (33, 15, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (34, 15, '"Romance"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (35, 15, '"Seinem"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (36, 16, '"Comedy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (37, 16, '"Drama"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (38, 16, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (39, 16, '"Fantasy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (40, 16, '"Sci-Fi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (41, 16, '"Harem"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (42, 16, '"Romence"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (43, 16, '"Shounen"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (47, 17, '"Action"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (48, 17, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (49, 17, '"Fantasy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (50, 18, '"Comedy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (51, 18, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (52, 18, '"Seinem"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (53, 19, '"Action"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (54, 19, '"Adventure"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (55, 19, '"Comedy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (56, 19, '"Ecchi"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (57, 19, '"Fantasy"');
INSERT INTO MAL.Genre (genre_id, anime_id, genre) VALUES (58, 19, '"Sci-Fi"');

UPDATE MAL.User SET nickName = 'ferd', userName = 'ferdmax', email = 'adskflj', passwordHash = 'dsalkfj;as;ldkj', profilePhoto = 'https://cdn.discordapp.com/avatars/330702648049270785/de5fa9aeb487f7d471d6b912dd63c3a4.webp?size=80' WHERE user_id = 1;
UPDATE MAL.User SET nickName = 'purdeshize', userName = 'Nakai', email = 'asdflkjg', passwordHash = 'vkxj;fdsigturr', profilePhoto = 'https://cdn.discordapp.com/avatars/255692455557464076/ce8fbc16bc26799abb84a0c1d6984725.webp?size=80' WHERE user_id = 2;
UPDATE MAL.User SET nickName = 'GutaMax3000', userName = 'Deus', email = 'Deus@bool.com', passwordHash = 'uirjasdfuirelad', profilePhoto = 'https://cdn.discordapp.com/avatars/267464470249340928/186ca260369676c4597e58fbf6131a32.webp?size=80' WHERE user_id = 3;
UPDATE MAL.User SET nickName = 'Rapha', userName = 'Rapha', email = 'fdslkgjewr', passwordHash = 'vbioeuwpqweg', profilePhoto = 'https://cdn.discordapp.com/avatars/367412663199858688/6fa7aabdbf60efa5bf3970acf4b6c11b.webp?size=80' WHERE user_id = 4;
UPDATE MAL.User SET nickName = 'ferdmax', userName = 'ferd', email = 'sadf', passwordHash = 'sadf', profilePhoto = 'https://cdn.discordapp.com/avatars/330702648049270785/de5fa9aeb487f7d471d6b912dd63c3a4.webp?size=80' WHERE user_id = 6;
UPDATE MAL.User SET nickName = 'XqcOW', userName = 'felix', email = 'twitch@twitch.tv', passwordHash = 'fdslkjgasfd', profilePhoto = 'https://static-cdn.jtvnw.net/jtv_user_pictures/xqcow-profile_image-9298dca608632101-70x70.jpeg' WHERE user_id = 8;

INSERT INTO MAL.UserData (UserData_id, review_id, type_list, anime_id, user_id) VALUES (1, 1, 4, 1, 1);
INSERT INTO MAL.UserData (UserData_id, review_id, type_list, anime_id, user_id) VALUES (3, 3, 4, 1, 2);
INSERT INTO MAL.UserData (UserData_id, review_id, type_list, anime_id, user_id) VALUES (4, 4, 4, 2, 2);

UPDATE MAL.Review SET reviewText = 'l;kasdjfklavjasldkfjl;askdjfaiosdfklj', user_id = 1, likes = 0, dislikes = 0, anime_id = 1, grade = 69 WHERE review_id = 1;
UPDATE MAL.Review SET reviewText = 'glksjgfioeur', user_id = 2, likes = 0, dislikes = 3, anime_id = 1, grade = 15 WHERE review_id = 3;
UPDATE MAL.Review SET reviewText = 'g;ksldfjgihkwerw', user_id = 2, likes = 1, dislikes = 1, anime_id = 2, grade = 78 WHERE review_id = 4;
UPDATE MAL.Review SET reviewText = 'Melhor anime, muito melhor que FMAB', user_id = 2, likes = 999, dislikes = 0, anime_id = 8, grade = 100 WHERE review_id = 7;
UPDATE MAL.Review SET reviewText = 'Esse anime mudou minha vida', user_id = 2, likes = 80, dislikes = 0, anime_id = 8, grade = 100 WHERE review_id = 8;
UPDATE MAL.Review SET reviewText = 'Curou minha depressao', user_id = 3, likes = 894, dislikes = 0, anime_id = 8, grade = 100 WHERE review_id = 9;
UPDATE MAL.Review SET reviewText = 'Me inspirou a ser uma pessoa melhor', user_id = 4, likes = 63, dislikes = 0, anime_id = 8, grade = 100 WHERE review_id = 10;
UPDATE MAL.Review SET reviewText = 'Muito grito pouca luta', user_id = 2, likes = 12, dislikes = 15, anime_id = 21, grade = 14 WHERE review_id = 11;
UPDATE MAL.Review SET reviewText = 'wqersdaf', user_id = 6, likes = 0, dislikes = 0, anime_id = 23, grade = 90 WHERE review_id = 16;
UPDATE MAL.Review SET reviewText = 'wqersdaf', user_id = 6, likes = 0, dislikes = 0, anime_id = 23, grade = 90 WHERE review_id = 17;
UPDATE MAL.Review SET reviewText = 'wqersdaf', user_id = 6, likes = 0, dislikes = 0, anime_id = 23, grade = 90 WHERE review_id = 18;
UPDATE MAL.Review SET reviewText = 'fruycdhgtv ', user_id = 6, likes = 0, dislikes = 0, anime_id = 23, grade = 90 WHERE review_id = 19;
UPDATE MAL.Review SET reviewText = '', user_id = 6, likes = 0, dislikes = 0, anime_id = 1, grade = 90 WHERE review_id = 30;
UPDATE MAL.Review SET reviewText = 'review_text', user_id = 6, likes = 0, dislikes = 0, anime_id = 1, grade = 90 WHERE review_id = 38;
UPDATE MAL.Review SET reviewText = 'asdf', user_id = 6, likes = 0, dislikes = 0, anime_id = 1, grade = 90 WHERE review_id = 41;
UPDATE MAL.Review SET reviewText = '', user_id = 6, likes = 0, dislikes = 0, anime_id = 4, grade = 90 WHERE review_id = 42;
UPDATE MAL.Review SET reviewText = 'MY BESTO FRIENDO', user_id = 6, likes = 0, dislikes = 0, anime_id = 7, grade = 90 WHERE review_id = 43;
UPDATE MAL.Review SET reviewText = 'Uma lição sobre religiao', user_id = 6, likes = 0, dislikes = 0, anime_id = 9, grade = 90 WHERE review_id = 44;
UPDATE MAL.Review SET reviewText = 'Family friendly', user_id = 6, likes = 0, dislikes = 0, anime_id = 10, grade = 90 WHERE review_id = 45;
UPDATE MAL.Review SET reviewText = 'Perdoar', user_id = 6, likes = 0, dislikes = 0, anime_id = 11, grade = 90 WHERE review_id = 46;
UPDATE MAL.Review SET reviewText = 'Como tratar sua meia irma', user_id = 6, likes = 0, dislikes = 0, anime_id = 12, grade = 90 WHERE review_id = 47;
UPDATE MAL.Review SET reviewText = 'Ela é maior de 18', user_id = 6, likes = 0, dislikes = 0, anime_id = 13, grade = 90 WHERE review_id = 48;
UPDATE MAL.Review SET reviewText = 'Lição de aceitação', user_id = 6, likes = 0, dislikes = 0, anime_id = 14, grade = 90 WHERE review_id = 49;
UPDATE MAL.Review SET reviewText = 'Como se comportar na escola', user_id = 6, likes = 0, dislikes = 0, anime_id = 15, grade = 90 WHERE review_id = 50;
UPDATE MAL.Review SET reviewText = 'Não voe perto do Sol Ikarus', user_id = 6, likes = 0, dislikes = 0, anime_id = 16, grade = 90 WHERE review_id = 51;
UPDATE MAL.Review SET reviewText = 'klfjga', user_id = 6, likes = 0, dislikes = 0, anime_id = 17, grade = 90 WHERE review_id = 52;
UPDATE MAL.Review SET reviewText = 'asdf', user_id = 6, likes = 0, dislikes = 0, anime_id = 19, grade = 90 WHERE review_id = 53;
UPDATE MAL.Review SET reviewText = 'asdf', user_id = 6, likes = 0, dislikes = 0, anime_id = 19, grade = 90 WHERE review_id = 54;
UPDATE MAL.Review SET reviewText = 'asdf', user_id = 6, likes = 0, dislikes = 0, anime_id = 20, grade = 90 WHERE review_id = 55;

