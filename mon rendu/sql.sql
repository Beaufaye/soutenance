/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     01/08/2023 18:35:54                          */
/*==============================================================*/


drop table if exists DM;

drop table if exists demande_soutenance;

drop table if exists enseignant;

drop table if exists etudiant;

drop table if exists jury;

drop table if exists maitre_de_stage;

drop table if exists president_jury;

drop table if exists role;

drop table if exists salle;

drop table if exists soutenances;

drop table if exists utilisateur;

/*==============================================================*/
/* Table: DM                                                    */
/*==============================================================*/
create table DM
(
   id                   int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   contact              int,
   primary key (id)
);

/*==============================================================*/
/* Table: demande_soutenance                                    */
/*==============================================================*/
create table demande_soutenance
(
   id                   int not null,
   etu_id               int not null,
   statut               varchar(254),
   primary key (id),
   key AK_Identifier_1 (id)
);

/*==============================================================*/
/* Table: enseignant                                            */
/*==============================================================*/
create table enseignant
(
   id                   int not null,
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
   DM_id                int not null,
   mai_id               int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   sexe                 varchar(254),
   filiere              varchar(254),
   contact              int,
   primary key (id),
   key AK_Identifiant_1 (id)
);

/*==============================================================*/
/* Table: jury                                                  */
/*==============================================================*/
create table jury
(
   id                   int not null,
   ens_id               int not null,
   mai_id               int,
   sou_id               int,
   DM_id                int not null,
   nom                  varchar(254),
   primary key (id),
   key AK_Identifier_1 (id)
);

/*==============================================================*/
/* Table: maitre_de_stage                                       */
/*==============================================================*/
create table maitre_de_stage
(
   id                   int not null,
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
   nom                  varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   id                   int not null,
   uti_id               int,
   "label"              varchar(254),
   primary key (id),
   key AK_Identifier_1 (id)
);

/*==============================================================*/
/* Table: salle                                                 */
/*==============================================================*/
create table salle
(
   id                   int not null,
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
   dem_id               int not null,
   pre_id               int not null,
   sal_id               int not null,
   date                 datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: utilisateur                                           */
/*==============================================================*/
create table utilisateur
(
   id                   int not null,
   etu_id               int,
   nom                  varchar(254),
   prenom               varchar(254),
   contact              int,
   primary key (id)
);

alter table demande_soutenance add constraint FK_Association_26 foreign key (etu_id)
      references etudiant (id) on delete restrict on update restrict;

alter table etudiant add constraint FK_Association_22 foreign key (DM_id)
      references DM (id) on delete restrict on update restrict;

alter table etudiant add constraint FK_Association_23 foreign key (mai_id)
      references maitre_de_stage (id) on delete restrict on update restrict;

alter table jury add constraint FK_Association_18 foreign key (ens_id)
      references enseignant (id) on delete restrict on update restrict;

alter table jury add constraint FK_Association_19 foreign key (mai_id)
      references maitre_de_stage (id) on delete restrict on update restrict;

alter table jury add constraint FK_Association_20 foreign key (sou_id)
      references soutenances (id) on delete restrict on update restrict;

alter table jury add constraint FK_Association_21 foreign key (DM_id)
      references DM (id) on delete restrict on update restrict;

alter table role add constraint FK_Association_28 foreign key (uti_id)
      references utilisateur (id) on delete restrict on update restrict;

alter table soutenances add constraint FK_Association_24 foreign key (pre_id)
      references president_jury (id) on delete restrict on update restrict;

alter table soutenances add constraint FK_Association_25 foreign key (sal_id)
      references salle (id) on delete restrict on update restrict;

alter table soutenances add constraint FK_Association_27 foreign key (dem_id)
      references demande_soutenance (id) on delete restrict on update restrict;

alter table utilisateur add constraint FK_Association_29 foreign key (etu_id)
      references etudiant (id) on delete restrict on update restrict;

