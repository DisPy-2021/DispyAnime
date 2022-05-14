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

