/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     2018/10/26 15:12:35                          */
/*==============================================================*/


drop table cmfz_admin cascade constraints;

drop table cmfz_album cascade constraints;

drop table cmfz_article cascade constraints;

drop table cmfz_banner cascade constraints;

drop table cmfz_chapter cascade constraints;

drop table cmfz_counter cascade constraints;

drop table cmfz_course cascade constraints;

drop table cmfz_guru cascade constraints;

drop table cmfz_menu cascade constraints;

drop table cmfz_user cascade constraints;

/*==============================================================*/
/* Table: cmfz_admin                                            */
/*==============================================================*/
create table cmfz_admin  (
   id                   VARCHAR(40)                     not null,
   name                 VARCHAR(40),
   telphone             VARCHAR(40),
   password             VARCHAR(40),
   constraint PK_CMFZ_ADMIN primary key (id)
);

/*==============================================================*/
/* Table: cmfz_album                                            */
/*==============================================================*/
create table cmfz_album  (
   id                   VARCHAR(40)                     not null,
   title                VARCHAR(40),
   publishDate          DATE,
   count                int,
   coverImg             VARCHAR(40),
   star                 VARCHAR(20),
   author               VARCHAR(40),
   broadCast            VARCHAR(40),
   brief                VARCHAR(500),
   constraint PK_CMFZ_ALBUM primary key (id)
);

/*==============================================================*/
/* Table: cmfz_article                                          */
/*==============================================================*/
create table cmfz_article  (
   id                   VARCHAR(40)                     not null,
   title                VARCHAR(40),
   imgPath              VARCHAR(40),
   publishDate          DATE,
   content              VARCHAR(500),
   constraint PK_CMFZ_ARTICLE primary key (id)
);

/*==============================================================*/
/* Table: cmfz_banner                                           */
/*==============================================================*/
create table cmfz_banner  (
   id                   VARCHAR(40)                     not null,
   title                VARCHAR(40),
   imgPath              VARCHAR(100),
   description          VARCHAR(40),
   status               VARCHAR(0),
   createDate           DATE,
   constraint PK_CMFZ_BANNER primary key (id)
);

/*==============================================================*/
/* Table: cmfz_chapter                                          */
/*==============================================================*/
create table cmfz_chapter  (
   id                   VARCHAR(40)                     not null,
   title                VARCHAR(40),
   fileSize              VARCHAR(40),
   duration             VARCHAR(40),
   downPath             VARCHAR(40),
   uploadTime           date,
   album_id                   VARCHAR(40)
   constraint PK_CMFZ_CHAPTER primary key (id)
);

/*==============================================================*/
/* Table: cmfz_counter                                          */
/*==============================================================*/
create table cmfz_counter  (
   id                   VARCHAR(40)                     not null,
   title                VARCHAR(40),
   count                int,
   recordDate           date,
   user_id              VARCHAR(40),
   couser_id            VARCHAR(40),
   constraint PK_CMFZ_COUNTER primary key (id)
);

/*==============================================================*/
/* Table: cmfz_course                                           */
/*==============================================================*/
create table cmfz_course  (
   id                   VARCHAR(40)                     not null,
   title                VARCHAR(40),
   marking              VARCHAR(40),
   recordDate           DATE,
   constraint PK_CMFZ_COURSE primary key (id)
);

/*==============================================================*/
/* Table: cmfz_guru                                             */
/*==============================================================*/
create table cmfz_guru  (
   id                   VARCHAR(40)                     not null,
   img                  VARCHAR(40),
   name                 VARCHAR(40),
   sex                  VARCHAR(10),
   constraint PK_CMFZ_GURU primary key (id)
);

/*==============================================================*/
/* Table: cmfz_menu                                             */
/*==============================================================*/
create table cmfz_menu  (
   id                   VARCHAR(40)                     not null,
   title                VARCHAR(40),
   href                 VARCHAR(100),
   iconCls              VARCHAR(40),
   fid                  VARCHAR(40),
   constraint PK_CMFZ_MENU primary key (id)
);

/*==============================================================*/
/* Table: cmfz_user                                             */
/*==============================================================*/
create table cmfz_user  (
   id                   VARCHAR(40)                     not null,
   img                  VARCHAR(40),
   phoneNum             VARCHAR(40),
   username             VARCHAR(40),
   password             VARCHAR(40),
   nickName             VARCHAR(40),
   name                 VARCHAR(40),
   sex                  VARCHAR(10),
   addr                 VARCHAR(100),
   sign                 VARCHAR(500),
   stauts               VARCHAR(40),
   createDate           date,
   salt                 VARCHAR(40),
   constraint PK_CMFZ_USER primary key (id)
);

