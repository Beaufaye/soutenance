/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     28/07/2023 11:59:07                          */
/*==============================================================*/


drop table if exists DM;

drop table if exists calendrier;

drop table if exists enseignant;

drop table if exists etudiant;

drop table if exists maitre_de_stage;

drop table if exists president_jury;

drop table if exists salle;

drop table if exists soutenances;

/*==============================================================*/
/* Table: DM                                                    */
/*==============================================================*/
create table DM
(
   id                   int not null,
   etu_id               int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   contact              int,
   primary key (id)
);

/*==============================================================*/
/* Table: calendrier                                            */
/*==============================================================*/
create table calendrier
(
   id                   int not null,
   date                 datetime,
   heure                int,
   primary key (id),
   key AK_Identifiant_1 (id)
);

/*==============================================================*/
/* Table: enseignant                                            */
/*==============================================================*/
create table enseignant
(
   id                   int not null,
   DM_id                int,
   cal_id               int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   sexe                 varchar(254),
   contact              int,
   primary key (id),
   key AK_Identifiant_1 (id)
);

/*==============================================================*/
/* Table: etudiant                                              */
/*==============================================================*/
create table etudiant
(
   id                   int not null,
   cal_id               int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   sexe                 varchar(254),
   filiere              varchar(254),
   contact              int,
   primary key (id),
   key AK_Identifiant_1 (id)
);

/*==============================================================*/
/* Table: maitre_de_stage                                       */
/*==============================================================*/
create table maitre_de_stage
(
   id                   int not null,
   etu_id               int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   contact              int,
   primary key (id)
);

/*==============================================================*/
/* Table: president_jury                                        */
/*==============================================================*/
create table president_jury
(
   id                   int not null,
   sou_id               int not null,
   cal_id               int not null,
   nom                  varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table: salle                                                 */
/*==============================================================*/
create table salle
(
   id                   int not null,
   sou_id               int not null,
   nom                  varchar(254),
   primary key (id),
   key AK_Identifiant_1 (id)
);

/*==============================================================*/
/* Table: soutenances                                           */
/*==============================================================*/
create table soutenances
(
   id                   int not null,
   etu_id               int not null,
   date                 datetime,
   primary key (id)
);

alter table DM add constraint FK_Association_3 foreign key (etu_id)
      references etudiant (id) on delete restrict on update restrict;

alter table enseignant add constraint FK_Association_10 foreign key (DM_id)
      references DM (id) on delete restrict on update restrict;

alter table enseignant add constraint FK_Association_7 foreign key (cal_id)
      references calendrier (id) on delete restrict on update restrict;

alter table etudiant add constraint FK_Association_9 foreign key (cal_id)
      references calendrier (id) on delete restrict on update restrict;

alter table maitre_de_stage add constraint FK_Association_2 foreign key (etu_id)
      references etudiant (id) on delete restrict on update restrict;

alter table president_jury add constraint FK_Association_4 foreign key (sou_id)
      references soutenances (id) on delete restrict on update restrict;

alter table president_jury add constraint FK_Association_8 foreign key (cal_id)
      references calendrier (id) on delete restrict on update restrict;

alter table salle add constraint FK_Association_5 foreign key (sou_id)
      references soutenances (id) on delete restrict on update restrict;

alter table soutenances add constraint FK_Association_6 foreign key (etu_id)
      references etudiant (id) on delete restrict on update restrict;

