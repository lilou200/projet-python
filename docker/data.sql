-- *********************************************
-- * SQL MySQL generation
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2
-- * Generator date: Sep 14 2021
-- * Generation date: Fri May  6 14:35:05 2022
-- * LUN file: C:\Users\thier\Documents\cours\bloc 2 q1 bdd2\groupe-1 pigeon\db_projet_01\PROJECT pigeon.lun
-- * Schema: SCHEMA relationnel/1-1
-- *********************************************


-- Database Section
-- ________________
drop database northwind;
create database northwind;
use northwind;
-- Tables Section
-- _____________

create table ACHAT_NOURRITURE (
     Id_Commande int not null,
     Id_nourriture int not null,
     Quantite decimal(4,1) not null,
     Prix float not null,
     constraint ID_achat_nourriture_ID primary key (Id_Commande, Id_nourriture));

create table ACHAT_OISEAU (
     Id_oiseau int not null,
     Prix float not null,
     Id_Commande int not null,
     constraint FKach_OIS_ID primary key (Id_Commande, Id_oiseau));

create table AMELIORATION (
     Id_Commande int not null,
     Categorie_service varchar(20) not null,
     Nom_service varchar(50) not null,
     Date_debut date not null,
     Date_fin date not null,
     Description varchar(500) not null,
     Id_Personne int not null,
     constraint FKSER_AME_ID primary key (Id_Commande, Categorie_service, Nom_service));

create table CLIENT (
     Id_Personne int not null,
     constraint FKPER_CLI_ID primary key (Id_Personne));

create table COMMANDE (
     Id_Commande int not null auto_increment,
     Date date not null,
     Id_Personne int not null,
     constraint ID_COMMANDE_ID primary key (Id_Commande));

create table COULEUR (
     Id_oiseau int not null,
     App_Couleur varchar(20) not null,
     constraint ID_App_Couleur_ID primary key (Id_oiseau, App_Couleur));

create table CYBERDOCTEUR (
     Id_Personne int not null,
     constraint FKEMP_CYB_ID primary key (Id_Personne));

create table EMPLOYE (
     Id_Personne int not null,
     Job varchar(50) not null,
     NOURRISSEUR int,
     MEDECIN int,
     ENTRAINEUR int,
     CYBERDOCTEUR int,
     constraint FKPER_EMP_ID primary key (Id_Personne));

create table ENTRAINEMENT (
     Id_Commande int not null,
     Categorie_service varchar(20) not null,
     Nom_service varchar(50) not null,
     Nombre_de_seances int not null,
     constraint FKSER_ENT_ID primary key (Id_Commande, Categorie_service, Nom_service));

create table ENTRAINEUR (
     Id_Personne int not null,
     constraint FKEMP_ENT_ID primary key (Id_Personne));

create table EST_UTILISE_LORS (
     Id_Commande int not null,
     Categorie_service varchar(20) not null,
     Nom_service varchar(50) not null,
     Id_oiseau int not null,
     constraint ID_est_utilise_lors_ID primary key (Id_Commande, Categorie_service, Nom_service, Id_oiseau));

create table FOURNISSEUR (
     Id_Fournisseur int not null auto_increment,
     Adr_Nom_de_rue varchar(50) not null,
     Adr_Numero_de_rue varchar(5) not null,
     Adr_Code_postal varchar(10) not null,
     Adr_Ville varchar(50) not null,
     Adr_Pays varchar(50) not null,
     Nom_entreprise varchar(50) not null,
     Telephone varchar(30) not null,
     Email varchar(50) not null,
     constraint ID_FOURNISSEUR_ID primary key (Id_Fournisseur));

create table LOCATION (
     Id_Commande int not null,
     Categorie_service varchar(20) not null,
     Nom_service varchar(50) not null,
     Date_debut date not null,
     Date_fin date not null,
     constraint FKSER_LOC_ID primary key (Id_Commande, Categorie_service, Nom_service));

create table MEDECIN (
     Id_Personne int not null,
     constraint FKEMP_MED_ID primary key (Id_Personne));

create table NOURRISSAGE (
     Id_nourriture int not null,
     Id_Personne int not null,
     Id_oiseau int not null,
     Date_nourrissage date not null,
     Quantite float not null,
     constraint ID_nourrisage_ID primary key (Date_nourrissage, Id_nourriture, Id_oiseau));

create table NOURRISSEUR (
     Id_Personne int not null,
     constraint FKEMP_NOU_ID primary key (Id_Personne));

create table NOURRITURE (
     Id_nourriture int not null auto_increment,
     Prix_au_kilo float(5) not null,
     OISEAU_FARCIT int,
     NOURRITURE_OISEAU int,
     constraint ID_NOURRITURE_ID primary key (Id_nourriture));

create table NOURRITURE_OISEAU (
     Id_nourriture int not null,
     Nom_nourriture varchar(50) not null,
     Valeur_nutritive float(4) not null,
     Quantite float(7) not null,
     constraint FKNOU_NOU_ID primary key (Id_nourriture));

create table OISEAU (
     Id_oiseau int not null auto_increment,
     App_Envergure float not null,
     App_Poids float not null,
     Nom varchar(50) not null,
     Prix float not null,
     Sexe char not null,
     Date_de_naissance date not null,
     Date_de_deces date,
     Groupe_sanguin char(3) not null,
     Nom_race char(50) not null,
     Id_Personne int,
     constraint ID_OISEAU_ID primary key (Id_oiseau));

create table OISEAU_FARCIT (
     Id_oiseau int not null,
     Id_nourriture int not null,
     Farce varchar(50) not null,
     Poids float not null,
     constraint FKOIS_OIS_ID primary key (Id_oiseau),
     constraint FKNOU_OIS_ID unique (Id_nourriture));

create table PERSONNE (
     Id_Personne int not null auto_increment,
     Adr_Nom_de_la_rue varchar(50) not null,
     Adr_Numero_de_rue varchar(6) not null,
     Adr_Code_postal varchar(10) not null,
     Adr_Ville varchar(50) not null,
     Adr_Boite int,
     Adr_Pays varchar(50) not null,
     Nom varchar(50) not null,
     Prenom varchar(50) not null,
     Telephone varchar(30),
     Email varchar(50) not null,
     EMPLOYE int,
     CLIENT int,
     constraint ID_PERSONNE_ID primary key (Id_Personne),
     constraint IDPERSONNE unique (Email));

create table RACE (
     Nom char(50) not null,
     constraint ID_RACE_ID primary key (Nom));

create table REGIME (
     Id_nourriture int not null,
     Nom char(50) not null,
     constraint ID_regime_ID primary key (Nom, Id_nourriture));

create table REPRODUCTION (
     Id_Commande int not null,
     Categorie_service varchar(20) not null,
     Nom_service varchar(50) not null,
     Date_debut_grossesse date not null,
     Date_fin_grossesse date not null,
     Nombre_oeufs int not null,
     constraint FKSER_REP_ID primary key (Id_Commande, Categorie_service, Nom_service));

create table SEANCE (
     Id_Commande int not null,
     Categorie_service varchar(20) not null,
     Nom_service varchar(50) not null,
     Num_seance int not null auto_increment,
     Date date not null,
     Duree int not null,
     Id_Personne int not null,
     constraint ID_SEANCE_ID primary key (Num_seance, Id_Commande, Categorie_service, Nom_service));

create table SERVICE (
     Id_Commande int not null,
     Categorie_service varchar(20) not null,
     Nom_service varchar(50) not null,
     Prix float not null,
     SOIN int,
     REPRODUCTION int,
     LOCATION int,
     ENTRAINEMENT int,
     AMELIORATION int,
     constraint ID_SERVICE_ID primary key (Id_Commande, Categorie_service, Nom_service));

create table SOIN (
     Id_Commande int not null,
     Categorie_service varchar(20) not null,
     Nom_service varchar(50) not null,
     Date_debut date not null,
     Date_fin date not null,
     Description varchar(500) not null,
     Id_Personne int not null,
     constraint FKSER_SOI_ID primary key (Id_Commande, Categorie_service, Nom_service));

create table TYPE_DE_SERVICE (
     Categorie_service varchar(20) not null,
     Nom_service varchar(50) not null,
     Prix_min float not null,
     Prix_max float not null,
     Temps_min int not null,
     Temps_max int not null,
     constraint ID_TYPE_DE_SERVICE_ID primary key (Categorie_service, Nom_service));

create table VEND_NOURRITURE (
     Id_nourriture int not null,
     Id_Fournisseur int not null,
     Date date not null,
     Prix float not null,
     Quantite decimal(5,1) not null,
     constraint ID_vend_nourriture_ID primary key (Id_nourriture, Id_Fournisseur,Date));

create table VEND_OISEAU (
     Id_oiseau int not null,
     Date date not null,
     Prix float(10) not null,
     VendeurFournisseur int,
     VendeurClient int,
     constraint FKven_OIS_ID primary key (Date, Id_oiseau));


-- Constraints Section
-- ___________________

alter table ACHAT_NOURRITURE add constraint FKach_NOU_FK
     foreign key (Id_nourriture)
     references NOURRITURE (Id_nourriture);

alter table ACHAT_NOURRITURE add constraint FKach_COM_1
     foreign key (Id_Commande)
     references COMMANDE (Id_Commande);

alter table ACHAT_OISEAU add constraint FKach_OIS_FK
     foreign key (Id_oiseau)
     references OISEAU (Id_oiseau);

alter table ACHAT_OISEAU add constraint FKach_COM_FK
     foreign key (Id_Commande)
     references COMMANDE (Id_Commande);

alter table AMELIORATION add constraint FKameliore_FK
     foreign key (Id_Personne)
     references CYBERDOCTEUR (Id_Personne);

alter table AMELIORATION add constraint FKSER_AME_FK
     foreign key (Id_Commande, Categorie_service, Nom_service)
     references SERVICE (Id_Commande, Categorie_service, Nom_service);

alter table CLIENT add constraint FKPER_CLI_FK
     foreign key (Id_Personne)
     references PERSONNE (Id_Personne);

alter table COMMANDE add constraint FKpassent_FK
     foreign key (Id_Personne)
     references CLIENT (Id_Personne);

alter table COULEUR add constraint FKOIS_App
     foreign key (Id_oiseau)
     references OISEAU (Id_oiseau);

alter table CYBERDOCTEUR add constraint FKEMP_CYB_FK
     foreign key (Id_Personne)
     references EMPLOYE (Id_Personne);

alter table EMPLOYE add constraint EXTONE_EMPLOYE
     check((NOURRISSEUR is not null and CYBERDOCTEUR is null and ENTRAINEUR is null and MEDECIN is null)
           or (NOURRISSEUR is null and CYBERDOCTEUR is not null and ENTRAINEUR is null and MEDECIN is null)
           or (NOURRISSEUR is null and CYBERDOCTEUR is null and ENTRAINEUR is not null and MEDECIN is null)
           or (NOURRISSEUR is null and CYBERDOCTEUR is null and ENTRAINEUR is null and MEDECIN is not null));

alter table EMPLOYE add constraint FKPER_EMP_FK
     foreign key (Id_Personne)
     references PERSONNE (Id_Personne);

alter table ENTRAINEMENT add constraint FKSER_ENT_FK
     foreign key (Id_Commande, Categorie_service, Nom_service)
     references SERVICE (Id_Commande, Categorie_service, Nom_service);

alter table ENTRAINEUR add constraint FKEMP_ENT_FK
     foreign key (Id_Personne)
     references EMPLOYE (Id_Personne);

alter table EST_UTILISE_LORS add constraint FKest_OIS_FK
     foreign key (Id_oiseau)
     references OISEAU (Id_oiseau);

alter table EST_UTILISE_LORS add constraint FKest_SER
     foreign key (Id_Commande, Categorie_service, Nom_service)
     references SERVICE (Id_Commande, Categorie_service, Nom_service);

alter table LOCATION add constraint FKSER_LOC_FK
     foreign key (Id_Commande, Categorie_service, Nom_service)
     references SERVICE (Id_Commande, Categorie_service, Nom_service);

alter table MEDECIN add constraint FKEMP_MED_FK
     foreign key (Id_Personne)
     references EMPLOYE (Id_Personne);

alter table NOURRISSAGE add constraint FKnou_OIS_1_FK
     foreign key (Id_oiseau)
     references OISEAU (Id_oiseau);

alter table NOURRISSAGE add constraint FKnou_NOU_2
     foreign key (Id_Personne)
     references NOURRISSEUR (Id_Personne);

alter table NOURRISSAGE add constraint FKnou_NOU_1_FK
     foreign key (Id_nourriture)
     references NOURRITURE_OISEAU (Id_nourriture);

alter table NOURRISSEUR add constraint FKEMP_NOU_FK
     foreign key (Id_Personne)
     references EMPLOYE (Id_Personne);

alter table NOURRITURE add constraint EXTONE_NOURRITURE
     check((NOURRITURE_OISEAU is not null and OISEAU_FARCIT is null)
           or (NOURRITURE_OISEAU is null and OISEAU_FARCIT is not null));

alter table NOURRITURE_OISEAU add constraint FKNOU_NOU_FK
     foreign key (Id_nourriture)
     references NOURRITURE (Id_nourriture);

-- Not implemented
-- alter table OISEAU add constraint ID_OISEAU_CHK
--     check(exists(select * from COULEUR
--                  where COULEUR.Id_oiseau = Id_oiseau));

alter table OISEAU add constraint FKest_de_race_FK
     foreign key (Nom_race)
     references RACE (Nom);

alter table OISEAU add constraint FKappartient_FK
     foreign key (Id_Personne)
     references CLIENT (Id_Personne);

alter table OISEAU_FARCIT add constraint FKOIS_OIS_FK
     foreign key (Id_oiseau)
     references OISEAU (Id_oiseau);

alter table OISEAU_FARCIT add constraint FKNOU_OIS_FK
     foreign key (Id_nourriture)
     references NOURRITURE (Id_nourriture);

alter table PERSONNE add constraint LSTONE_PERSONNE_1
     check(Email is not null or Telephone is not null);

alter table PERSONNE add constraint LSTONE_PERSONNE
     check(EMPLOYE is not null or CLIENT is not null);

alter table REGIME add constraint FKreg_RAC
     foreign key (Nom)
     references RACE (Nom);

alter table REGIME add constraint FKreg_NOU_FK
     foreign key (Id_nourriture)
     references NOURRITURE_OISEAU (Id_nourriture);

alter table REPRODUCTION add constraint FKSER_REP_FK
     foreign key (Id_Commande, Categorie_service, Nom_service)
     references SERVICE (Id_Commande, Categorie_service, Nom_service);

alter table SEANCE add constraint FKentraine_FK
     foreign key (Id_Personne)
     references ENTRAINEUR (Id_Personne);

alter table SEANCE add constraint FKcontient_FK
     foreign key (Id_Commande, Categorie_service, Nom_service)
     references ENTRAINEMENT (Id_Commande, Categorie_service, Nom_service);

-- Not implemented
-- alter table SERVICE add constraint ID_SERVICE_CHK
--     check(exists(select * from EST_UTILISE_LORS
--                  where EST_UTILISE_LORS.Id_Commande = Id_Commande and EST_UTILISE_LORS.Categorie_service = Categorie_service and EST_UTILISE_LORS.Nom_service = Nom_service));

alter table SERVICE add constraint EXTONE_SERVICE
     check((SOIN is not null and LOCATION is null and AMELIORATION is null and ENTRAINEMENT is null and REPRODUCTION is null)
           or (SOIN is null and LOCATION is not null and AMELIORATION is null and ENTRAINEMENT is null and REPRODUCTION is null)
           or (SOIN is null and LOCATION is null and AMELIORATION is not null and ENTRAINEMENT is null and REPRODUCTION is null)
           or (SOIN is null and LOCATION is null and AMELIORATION is null and ENTRAINEMENT is not null and REPRODUCTION is null)
           or (SOIN is null and LOCATION is null and AMELIORATION is null and ENTRAINEMENT is null and REPRODUCTION is not null));

alter table SERVICE add constraint FKest_de_type_FK
     foreign key (Categorie_service, Nom_service)
     references TYPE_DE_SERVICE (Categorie_service, Nom_service);

alter table SERVICE add constraint FKest_constitue
     foreign key (Id_Commande)
     references COMMANDE (Id_Commande);

alter table SOIN add constraint FKsoigne_FK
     foreign key (Id_Personne)
     references MEDECIN (Id_Personne);

alter table SOIN add constraint FKSER_SOI_FK
     foreign key (Id_Commande, Categorie_service, Nom_service)
     references SERVICE (Id_Commande, Categorie_service, Nom_service);

alter table VEND_NOURRITURE add constraint FKven_FOU_FK
     foreign key (Id_Fournisseur)
     references FOURNISSEUR (Id_Fournisseur);

alter table VEND_NOURRITURE add constraint FKven_NOU
     foreign key (Id_nourriture)
     references NOURRITURE_OISEAU (Id_nourriture);

alter table VEND_OISEAU add constraint EXTONE_vend
     check((VendeurFournisseur is not null and VendeurClient is null)
           or (VendeurFournisseur is null and VendeurClient is not null));

alter table VEND_OISEAU add constraint FKvendeur1_FK
     foreign key (VendeurFournisseur)
     references FOURNISSEUR (Id_Fournisseur);

alter table VEND_OISEAU add constraint FKven_OIS_FK
     foreign key (Id_oiseau)
     references OISEAU (Id_oiseau);

alter table VEND_OISEAU add constraint FKvendeur2_FK
     foreign key (VendeurClient)
     references CLIENT (Id_Personne);


-- Index Section
-- _____________

create unique index ID_achat_nourriture_IND
     on ACHAT_NOURRITURE (Id_Commande, Id_nourriture);

create index FKach_NOU_IND
     on ACHAT_NOURRITURE (Id_nourriture);


create index FKach_COM_IND
     on ACHAT_OISEAU (Id_Commande);

create index FKameliore_IND
     on AMELIORATION (Id_Personne);

create unique index FKSER_AME_IND
     on AMELIORATION (Id_Commande, Categorie_service, Nom_service);

create unique index FKPER_CLI_IND
     on CLIENT (Id_Personne);

create unique index ID_COMMANDE_IND
     on COMMANDE (Id_Commande);

create index FKpassent_IND
     on COMMANDE (Id_Personne);

create unique index ID_App_Couleur_IND
     on COULEUR (Id_oiseau, App_Couleur);

create unique index FKEMP_CYB_IND
     on CYBERDOCTEUR (Id_Personne);

create unique index FKPER_EMP_IND
     on EMPLOYE (Id_Personne);

create unique index FKSER_ENT_IND
     on ENTRAINEMENT (Id_Commande, Categorie_service, Nom_service);

create unique index FKEMP_ENT_IND
     on ENTRAINEUR (Id_Personne);

create unique index ID_est_utilise_lors_IND
     on EST_UTILISE_LORS (Id_Commande, Categorie_service, Nom_service, Id_oiseau);

create index FKest_OIS_IND
     on EST_UTILISE_LORS (Id_oiseau);

create unique index ID_FOURNISSEUR_IND
     on FOURNISSEUR (Id_Fournisseur);

create unique index FKSER_LOC_IND
     on LOCATION (Id_Commande, Categorie_service, Nom_service);

create unique index FKEMP_MED_IND
     on MEDECIN (Id_Personne);

create unique index ID_nourrisage_IND
     on NOURRISSAGE (Date_nourrissage, Id_nourriture, Id_oiseau);

create index FKnou_OIS_1_IND
     on NOURRISSAGE (Id_oiseau);

create index FKnou_NOU_1_IND
     on NOURRISSAGE (Id_nourriture);

create unique index FKEMP_NOU_IND
     on NOURRISSEUR (Id_Personne);

create unique index ID_NOURRITURE_IND
     on NOURRITURE (Id_nourriture);

create unique index FKNOU_NOU_IND
     on NOURRITURE_OISEAU (Id_nourriture);

create unique index ID_OISEAU_IND
     on OISEAU (Id_oiseau);

create index FKest_de_race_IND
     on OISEAU (Nom_race);

create index FKappartient_IND
     on OISEAU (Id_Personne);

create unique index FKOIS_OIS_IND
     on OISEAU_FARCIT (Id_oiseau);

create unique index FKNOU_OIS_IND
     on OISEAU_FARCIT (Id_nourriture);

create unique index ID_PERSONNE_IND
     on PERSONNE (Id_Personne);

create unique index ID_RACE_IND
     on RACE (Nom);

create unique index ID_regime_IND
     on REGIME (Nom, Id_nourriture);

create index FKreg_NOU_IND
     on REGIME (Id_nourriture);

create unique index FKSER_REP_IND
     on REPRODUCTION (Id_Commande, Categorie_service, Nom_service);

create unique index ID_SEANCE_IND
     on SEANCE (Num_seance, Id_Commande, Categorie_service, Nom_service);

create index FKentraine_IND
     on SEANCE (Id_Personne);

create index FKcontient_IND
     on SEANCE (Id_Commande, Categorie_service, Nom_service);

create unique index ID_SERVICE_IND
     on SERVICE (Id_Commande, Categorie_service, Nom_service);

create index FKest_de_type_IND
     on SERVICE (Categorie_service, Nom_service);

create index FKsoigne_IND
     on SOIN (Id_Personne);

create unique index FKSER_SOI_IND
     on SOIN (Id_Commande, Categorie_service, Nom_service);

create unique index ID_TYPE_DE_SERVICE_IND
     on TYPE_DE_SERVICE (Categorie_service, Nom_service);

create unique index ID_vend_nourriture_IND
     on VEND_NOURRITURE (Id_nourriture, Id_Fournisseur,Date);

create index FKven_FOU_IND
     on VEND_NOURRITURE (Id_Fournisseur);

create index FKvendeur1_IND
     on VEND_OISEAU (VendeurFournisseur);

create index FKvendeur2_IND
     on VEND_OISEAU (VendeurClient);

-- ALTER TABLE
alter table REPRODUCTION add constraint CHECK_DATE_rep
	check(Date_fin_grossesse is null or Date_debut_grossesse < Date_fin_grossesse);

alter table LOCATION add constraint CHECK_DATE_loc
	check(Date_fin is null or Date_debut < Date_fin);

alter table SOIN add constraint CHECK_DATE_soi
	check(Date_fin is null or Date_debut < Date_fin);

alter table AMELIORATION add constraint CHECK_DATE_ame
	check(Date_fin is null or Date_debut < Date_fin);

alter table TYPE_DE_SERVICE add constraint CHECK_PRIX_ET_DATE_MIN_MAX
     check(Prix_min<=Prix_max and Temps_min<=Temps_max);

alter table PERSONNE add constraint LSTONE_PERSONNE_2
     check(EMPLOYE is true or CLIENT is true);


-- VIEWS --

DELIMITER $$

create view VIEW_ALL_OISEAUX_POSSEDE as
    select o.Id_oiseau as 'Id oiseau', o.Nom as 'Nom oiseau', o.Id_Personne as 'Proprietaire'
    from OISEAU o
    left join PERSONNE P on o.Id_Personne = P.Id_Personne
    where o.Id_Personne is not null
$$

DELIMITER ;

DELIMITER $$

create view VIEW_ALL_ACHAT_OISEAU as
    select ao.Id_oiseau as 'Id oiseau', O.Nom as 'Nom oiseau', round(ao.Prix,2) as 'Prix d achat de l oiseau', C.Date as 'Date d achat',
           C.Id_Personne as 'Id client', P.Nom as 'Nom client', P.Prenom as 'Prenom client'
    from ACHAT_OISEAU ao left join OISEAU O on O.Id_oiseau = ao.Id_oiseau
    left join COMMANDE C on ao.Id_Commande = C.Id_Commande
    left join PERSONNE P on C.Id_Personne = P.Id_Personne

$$

DELIMITER ;


DELIMITER $$

create view VIEW_ALL_COMMANDES as
   select co.Id_Personne as 'Id client', co.Id_Commande as 'Id de commande',
              round(coalesce((select sum(S.Prix) from SERVICE S where S.Id_Commande = co.Id_Commande),0)+
                     coalesce((select sum(AN.Prix) from ACHAT_NOURRITURE AN where AN.Id_Commande = co.Id_Commande),0)+
                     coalesce((select sum(AO.Prix) from ACHAT_OISEAU AO where AO.Id_Commande = co.Id_Commande),0),2) as 'Prix total',
               (select count(  S.Id_Commande ) from SERVICE S where S.Id_Commande = co.Id_Commande) as 'Nombre de services',
               (select count(  AN.Id_Commande ) from ACHAT_NOURRITURE AN where AN.Id_Commande = co.Id_Commande) as 'Nombre d achat nourriture',
               (select count(  AO.Id_Commande ) from ACHAT_OISEAU AO where AO.Id_Commande = co.Id_Commande) as 'Nombre d achats oiseau'
        from COMMANDE co left join ACHAT_OISEAU AO on co.Id_Commande = AO.Id_Commande
            left join ACHAT_NOURRITURE AN on co.Id_Commande = AN.Id_Commande

        left join SERVICE S on co.Id_Commande = S.Id_Commande
    group by co.Id_Personne, co.Id_Commande
      $$


DELIMITER ;



DELIMITER $$
create view VIEW_TYPES_SERVICES as
    select Categorie_service as 'Categorie de service', Nom_service as 'Nom du service',
           Prix_min as 'Prix minimum', Prix_max as 'Prix maximum', Temps_min as 'Temps minimum',
           Temps_max as 'Temps maximum'
    from TYPE_DE_SERVICE
    $$

DELIMITER ;

DELIMITER $$

create view VIEW_OISEAU_A_VENDRE as
    select Id_oiseau as 'ID oiseau', round(App_Envergure,2) as 'Envergure', round(App_Poids,2) as 'Poids',
           Nom,round(Prix,2), Sexe, Date_de_naissance as 'Date de naissance', Date_de_deces as 'Date de deces',
           Groupe_sanguin as 'Groupe sanguin', Nom_race as 'Race'
    from OISEAU
    where Id_Personne is null
    and Date_de_deces is null
$$

DELIMITER ;


DELIMITER $$

create view VIEW_STOCK_NOURRITURE_OISEAU AS
    select noo.Id_nourriture as 'Id nourriture', noo.Nom_nourriture as 'Nom nourriture', noo.Quantite as 'Quantite',
           noo.Valeur_nutritive as 'Valeur nutritive', n.Prix_au_kilo as 'Euros au kilo'
    from NOURRITURE_OISEAU noo, NOURRITURE n
    where noo.Id_nourriture = n.Id_nourriture $$

DELIMITER ;


DELIMITER $$

create view VIEW_ALL_VENTES_OISEAU as
    select vo.Id_oiseau as 'Id oiseau', O.Nom as 'Nom oiseau', vo.Prix as 'Prix de vente', vo.Date as 'Date d achat',
           F.Id_Fournisseur as 'Id fournisseur', F.Nom_entreprise as 'Nom fournisseur',
           C.Id_Personne as 'Id client', P.Nom as 'Nom client', P.Prenom as 'Prenom client'
    from VEND_OISEAU vo
        left outer join OISEAU O on O.Id_oiseau = vo.Id_oiseau
        left outer join FOURNISSEUR F on vo.VendeurFournisseur = F.Id_Fournisseur
        left outer join CLIENT C on vo.VendeurClient = C.Id_Personne
        left join PERSONNE P on C.Id_Personne = P.Id_Personne $$

DELIMITER ;


DELIMITER $$

create view VIEW_STOCK_OISEAU_FARCIT AS
    select ofa.Id_nourriture as 'Id oiseau farcit', ofa.Farce, round(ofa.Poids,2) as 'Poids',
           round(n.Prix_au_kilo,2) as 'Euros au kilo', round(sum(ofa.Poids*n.Prix_au_kilo),2) as 'Prix'
    from OISEAU_FARCIT ofa inner join NOURRITURE n on ofa.Id_nourriture = n.Id_nourriture
    group by ofa.Id_nourriture
$$

DELIMITER ;

-- TRIGGERS

DELIMITER $$

create trigger CHECK_OISEAU_POSSEDE_PAR_BON_CLIENT
    before insert on EST_UTILISE_LORS for each row
    begin
        declare proprio_id int default 0;
        set proprio_id = (select Proprietaire from VIEW_ALL_OISEAUX_POSSEDE where `Id oiseau` = new.Id_oiseau);
        if proprio_id = 0 and (new.Categorie_service <> 'LOCATION' and new.Categorie_service <> 'REPORDUCTION')
        then
            signal sqlstate '45000' set message_text = 'Cet oiseau n\'appartient pas à un client';
        end if ;
        if proprio_id <> (select Id_Personne from COMMANDE where COMMANDE.Id_Commande = new.Id_Commande)
        then
            signal sqlstate '45000' set message_text = 'Cet oiseau  appartient à un autre client.';
        end if;
    end $$

DELIMITER ;

DELIMITER $$

create trigger OISEAU_FARCIT_EST_PIGEON_ET_DATE_DECES
before insert on OISEAU_FARCIT for each row
BEGIN
     if upper((select ra.Nom from OISEAU oi, RACE ra
     where  ra.Nom=oi.Nom_race AND oi.Id_oiseau=new.Id_oiseau LIMIT 1)) <> 'PIGEON'
     then
          signal sqlstate '45000' set message_text = 'La race d un oiseau farcit doit etre un pigeon';
     end if;
     if (select oi.Date_de_deces from OISEAU oi where oi.Id_oiseau = new.Id_oiseau) is null
     then
		signal sqlstate '45000' set message_text = 'Un oiseau doit avoir une date de deces avant de devenir un oiseau farcit';
        end if;
END $$

DELIMITER ;

DELIMITER $$

create trigger QUANTITE_NOURRITURE_SUFFISANTE_ACHAT
before insert on ACHAT_NOURRITURE for each row
begin
	if (select count(*) from OISEAU_FARCIT oif where oif.Id_nourriture = new.Id_nourriture)>0 -- check si la nourriture est de l'oiseau farcit
    then
		if (select count(*) from OISEAU_FARCIT)<new.Quantite
        then
			signal sqlstate '45000' set message_text = 'Il n y a pas assez d oiseaux farcit en stock';
		end if;
	else -- sinon c'est de la nourriture pour oiseaux
		if (select noi.Quantite from NOURRITURE_OISEAU noi where noi.Id_nourriture = new.Id_nourriture)<new.Quantite
        then
			signal sqlstate '45000' set message_text = 'Il n y a pas assez de stock pour ce type de nourriture pour oiseau';
		end if;
	end if;
end $$

DELIMITER ;

DELIMITER $$

create trigger CLIENT_RACHETE_SON_ANCIEN_OISEAU
before insert on ACHAT_OISEAU for each row
begin
	declare  id_racheteur int default 0;
    set id_racheteur = (select Id_Personne from COMMANDE where Id_Commande = new.Id_Commande);

	if (select count(*) from VEND_OISEAU where VendeurClient = id_racheteur) >0
    then
		if (select voi.Date from VEND_OISEAU voi where voi.VendeurClient = id_racheteur and voi.Id_oiseau = new.Id_oiseau order by voi.Date desc limit 1)
			>=date_sub((select com.Date from COMMANDE com where com.Id_Commande = new.Id_Commande order by com.Date desc limit 1),interval 1 month)
		then
			signal sqlstate '45000' set message_text = 'Un client ne peut pas racheter son propre oiseau dans le meme mois';
		end if;
	end if;
end $$

DELIMITER ;

DELIMITER $$

create trigger MISE_ENVENTE_OISEAU_PAR_CLIENT_ET_PAS_MORT
before insert on VEND_OISEAU for each row
begin
declare id_vendeur int default 0;
set id_vendeur = (select Id_Personne from OISEAU where Id_oiseau = new.Id_oiseau);
	if new.VendeurClient is not null
    then
		if id_vendeur = 0 or id_vendeur <> new.VendeurClient
        then
			signal sqlstate '45000' set message_text = 'Un client ne peut vendre que un oiseau qui lui appartient';
		end if;
        if (select Date_de_deces from OISEAU where Id_oiseau = new.Id_oiseau) is not null
        then
			signal sqlstate '45000' set message_text = 'Un client ne peut pas vendre un oiseau mort';
		end if;
	end if;
end $$

DELIMITER ;

DELIMITER $$

create trigger CHECK_REGIME_OISEAU_NOURRISSAGE_ET_QUANTITE
before insert on NOURRISSAGE for each row
begin
declare race_oiseau varchar(50);
set race_oiseau = (select Nom_race from OISEAU where Id_oiseau = new.Id_oiseau);

    if (select count(*) from REGIME where Id_nourriture = new.Id_nourriture and Nom = race_oiseau) =0
    then
		signal sqlstate '45000' set message_text = 'Cette nourriture ne fait pas partit du régime de cet oiseau';
	end if;
    if (select Quantite from NOURRITURE_OISEAU where Id_nourriture = new.Id_nourriture)<new.Quantite
    then
		signal sqlstate '45000' set message_text = 'Il n y a plus assez de stock pour ce nourrisage';
	end if;
end $$

DELIMITER ;


DELIMITER $$

create trigger CHECK_DATE_SEANCE
before insert on SEANCE for each row
begin
declare  max_seance int;
set max_seance = (select Nombre_de_seances from ENTRAINEMENT where Id_Commande = new.Id_Commande
                                               and Categorie_service = new.Categorie_service
                                               and Nom_service = new.Nom_service);

	if (select count(*) from SEANCE where Id_Commande = new.Id_Commande
                                               and Categorie_service = new.Categorie_service
                                               and Nom_service = new.Nom_service) >= max_seance
	    then
	     signal sqlstate '45000' set message_text = 'Il ne peut pas avoir plus de seance pour cet entrainement.';

	end if;
    if(select count(*) from SEANCE where Id_Commande = new.Id_Commande
                                               and Categorie_service = new.Categorie_service
                                               and Nom_service = new.Nom_service
                                               and Date = new.Date) > 0
        then
            signal sqlstate '45000' set message_text = 'Il ne peut pas avoir 2 seances le meme jour pour le meme oiseau';

    end if;
end $$

DELIMITER ;

DELIMITER $$

create trigger CHECK_ACHAT_OISEAU_PAS_MORT
before insert on ACHAT_OISEAU for each row
    begin
        if (select Date_de_deces from OISEAU where OISEAU.Id_oiseau = new.Id_oiseau) is not null
        then
            signal sqlstate '45000' set message_text = 'Vous ne pouvez pas acheter un oiseau mort';
        end if;

    end $$

DELIMITER ;

DELIMITER $$

create trigger CHECK_OISEAU_PAS_DANS_2_SERVICES
before insert on EST_UTILISE_LORS for each row
begin
declare date_debut_new date;
declare date_fin_new date;
	if (select count(*) from EST_UTILISE_LORS where Id_oiseau = new.Id_oiseau)>0
    then

		if (select count(*) from REPRODUCTION rep where new.Id_Commande=rep.Id_Commande
		                                                                         and new.Categorie_service=rep.Categorie_service
		                                                                         and new.Nom_service=rep.Nom_service) > 0

		    then
                set date_debut_new = (select rep.Date_debut_grossesse from REPRODUCTION rep where new.Id_Commande=rep.Id_Commande
		                                                                         and new.Categorie_service=rep.Categorie_service
		                                                                         and new.Nom_service=rep.Nom_service);
                set date_fin_new = (select rep.Date_fin_grossesse from REPRODUCTION rep where new.Id_Commande=rep.Id_Commande
		                                                                         and new.Categorie_service=rep.Categorie_service
		                                                                         and new.Nom_service=rep.Nom_service);


        elseif (select count(*) from  LOCATION loc where new.Id_Commande=loc.Id_Commande
		                                                                         and new.Categorie_service=loc.Categorie_service
		                                                                         and new.Nom_service=loc.Nom_service) > 0
		    then
		        set date_debut_new = (select loc.Date_debut from  LOCATION loc where new.Id_Commande=loc.Id_Commande
		                                                                         and new.Categorie_service=loc.Categorie_service
		                                                                         and new.Nom_service=loc.Nom_service);
		        set date_fin_new = (select loc.Date_fin from  LOCATION loc where new.Id_Commande=loc.Id_Commande
		                                                                         and new.Categorie_service=loc.Categorie_service
		                                                                         and new.Nom_service=loc.Nom_service);

		elseif (select count(*) from  SOIN soi where new.Id_Commande=soi.Id_Commande
		                                                                         and new.Categorie_service=soi.Categorie_service
		                                                                         and new.Nom_service=soi.Nom_service) > 0
		    then
		        set date_debut_new = (select soi.Date_debut from  SOIN soi where  new.Id_Commande=soi.Id_Commande
		                                                                         and new.Categorie_service=soi.Categorie_service
		                                                                         and new.Nom_service=soi.Nom_service);
		        set date_fin_new = (select soi.Date_fin from  SOIN soi where  new.Id_Commande=soi.Id_Commande
		                                                                         and new.Categorie_service=soi.Categorie_service
		                                                                         and new.Nom_service=soi.Nom_service);


        elseif (select count(*) from AMELIORATION ame where new.Id_Commande=ame.Id_Commande
		                                                                         and new.Categorie_service=ame.Categorie_service
		                                                                         and new.Nom_service=ame.Nom_service) > 0
            then
                set date_debut_new = (select ame.Date_debut from AMELIORATION ame where new.Id_Commande=ame.Id_Commande
		                                                                         and new.Categorie_service=ame.Categorie_service
		                                                                         and new.Nom_service=ame.Nom_service);
                set date_fin_new = (select ame.Date_fin from AMELIORATION ame where new.Id_Commande=ame.Id_Commande
		                                                                         and new.Categorie_service=ame.Categorie_service
		                                                                         and new.Nom_service=ame.Nom_service);
        end if;

       if (select count(eul.Id_oiseau) from EST_UTILISE_LORS eul
    left  join REPRODUCTION rep on eul.Id_Commande = rep.Id_Commande and eul.Nom_service = rep.Nom_service and eul.Categorie_service = rep.Categorie_service
    left join LOCATION l on eul.Id_Commande = l.Id_Commande and eul.Nom_service = l.Nom_service and eul.Categorie_service = l.Categorie_service
    left join SOIN s on eul.Id_Commande = s.Id_Commande and eul.Nom_service = s.Nom_service and eul.Categorie_service = s.Categorie_service
    left join AMELIORATION a on eul.Id_Commande = a.Id_Commande and eul.Nom_service = a.Nom_service and eul.Categorie_service = a.Categorie_service
    where eul.Id_oiseau =new.Id_oiseau
    and (((date_debut_new>=rep.Date_debut_grossesse and date_debut_new<= rep.Date_fin_grossesse) or(date_fin_new>=rep.Date_debut_grossesse and date_fin_new<=rep.Date_fin_grossesse))
        or
         ((date_debut_new>=l.Date_debut and date_debut_new<= l.Date_fin) or(date_fin_new>=l.Date_debut and date_fin_new<=l.Date_fin))
        or
         ((date_debut_new>=s.Date_debut and date_debut_new<= s.Date_fin) or(date_fin_new>=s.Date_debut and date_fin_new<=s.Date_fin))
        or
         ((date_debut_new>=a.Date_debut and date_debut_new<= a.Date_fin) or(date_fin_new>=a.Date_debut and date_fin_new<=a.Date_fin))
        or
         ((date_debut_new>= (select coalesce(min(sea.Date),'9999-12-31') from SEANCE sea where eul.Id_Commande = sea.Id_Commande and eul.Nom_service = sea.Nom_service and eul.Categorie_service = sea.Categorie_service)
               and date_debut_new<= (select coalesce(max(sea.Date),'0001-01-01') from SEANCE sea where eul.Id_Commande = sea.Id_Commande and eul.Nom_service = sea.Nom_service and eul.Categorie_service = sea.Categorie_service))
              or (date_fin_new>=(select coalesce(min(sea.Date),'9999-12-31') from SEANCE sea where eul.Id_Commande = sea.Id_Commande and eul.Nom_service = sea.Nom_service and eul.Categorie_service = sea.Categorie_service)
                      and date_fin_new<=(select  coalesce(max(sea.Date),'0001-01-01') from SEANCE sea where eul.Id_Commande = sea.Id_Commande and eul.Nom_service = sea.Nom_service and eul.Categorie_service = sea.Categorie_service)))
        )
        )>0
        then
            signal sqlstate '45000' set message_text ='L oiseau est deja dans un autres service pour la meme date';
        end if;
	end if;
end $$

DELIMITER ;

DELIMITER $$

create trigger CHECK_INSERT_NEW_SEANCE_AUTRES_SERVICES
    before insert on SEANCE for each row
    begin
    declare oiseau_id int;
    set oiseau_id = (select Id_oiseau from EST_UTILISE_LORS where EST_UTILISE_LORS.Id_Commande = new.Id_Commande
                                                            and EST_UTILISE_LORS.Categorie_service = new.Categorie_service
                                                            and EST_UTILISE_LORS.Nom_service = new.Nom_service);
    if (select count(eul.Id_oiseau) from EST_UTILISE_LORS eul
    left  join REPRODUCTION rep on eul.Id_Commande = rep.Id_Commande and eul.Nom_service = rep.Nom_service and eul.Categorie_service = rep.Categorie_service
    left join LOCATION l on eul.Id_Commande = l.Id_Commande and eul.Nom_service = l.Nom_service and eul.Categorie_service = l.Categorie_service
    left join SOIN s on eul.Id_Commande = s.Id_Commande and eul.Nom_service = s.Nom_service and eul.Categorie_service = s.Categorie_service
    left join AMELIORATION a on eul.Id_Commande = a.Id_Commande and eul.Nom_service = a.Nom_service and eul.Categorie_service = a.Categorie_service
    left join SEANCE e on eul.Id_Commande <> e.Id_Commande and eul.Categorie_service <> e.Categorie_service and eul.Nom_service <> e.Nom_service
    where eul.Id_oiseau =oiseau_id
    and (((new.Date>=rep.Date_debut_grossesse and new.Date<= rep.Date_fin_grossesse) or(new.Date>=rep.Date_debut_grossesse and new.Date<=rep.Date_fin_grossesse))
        or
         ((new.Date>=l.Date_debut and new.Date<= l.Date_fin) or(new.Date>=l.Date_debut and new.Date<=l.Date_fin))
        or
         ((new.Date>=s.Date_debut and new.Date<= s.Date_fin) or(new.Date>=s.Date_debut and new.Date<=s.Date_fin))
        or
         ((new.Date>=a.Date_debut and new.Date<= a.Date_fin) or(new.Date>=a.Date_debut and new.Date<=a.Date_fin)))
        or
         (new.Date = e.Date)
    )>0
    then
        signal sqlstate '45000' set message_text = 'L\'oiseau est déjà dans un autre service à cette date la.';
    end if;
    end $$

    DELIMITER ;

    DELIMITER $$

create trigger CHECK_PAS_DANS_SERVICE_OISEAU_FARCIT
    before insert ON OISEAU_FARCIT for each row
    begin
        declare  date_deces date;
        set date_deces = (select Date_de_deces from OISEAU where OISEAU.Id_oiseau = new.Id_oiseau);

        if (select count(*) from EST_UTILISE_LORS eul left join REPRODUCTION r on r.Categorie_service = eul.Categorie_service and r.Id_Commande = eul.Id_Commande and r.Nom_service = eul.Nom_service
                                                    left join LOCATION l on l.Categorie_service = eul.Categorie_service and l.Id_Commande = eul.Id_Commande and l.Nom_service = eul.Nom_service
                             where eul.Id_oiseau = new.Id_oiseau
                             and ((date_deces>=r.Date_debut_grossesse and date_deces<=r.Date_fin_grossesse)
                                      or
                                  (date_deces>=l.Date_debut and date_deces<=l.Date_fin))
                             ) > 0
        then
            signal sqlstate '45000' set message_text = 'L\'oiseau ne peut pas etre transformÃ© en oiseau farcit maintenant car il est dans un service.';
        end if;


    end $$

DELIMITER ;

-- PROCEDURES --

DELIMITER $$

create procedure INSERT_REPRODUCTION( in service_nom varchar(50), in commande_id int,
 in debut_date date, in fin_date date, in nbr_oeufs int, in service_prix float, in oiseau_id1 int, in oiseau_id2 int )
begin
    declare exit handler for sqlexception
    begin
        rollback;
        resignal ;
    end;
    if oiseau_id1 = oiseau_id2
        then
        signal sqlstate '45000' set message_text = 'Un oiseau ne peut pas se reporduire avec lui meme.';
    end if;

    start transaction;
    insert into SERVICE (Id_Commande, Categorie_service, Nom_service, Prix, REPRODUCTION)
        VALUES (commande_id, 'REPRODUCTION', service_nom, service_prix, 1 );
    insert into REPRODUCTION (Id_Commande, Categorie_service, Nom_service, Date_debut_grossesse, Date_fin_grossesse, Nombre_oeufs)
        VALUES (commande_id, 'REPRODUCTION', service_nom, debut_date, fin_date, nbr_oeufs);
    insert into EST_UTILISE_LORS (Id_Commande, Categorie_service, Nom_service, Id_oiseau)
        VALUES (commande_id, 'REPRODUCTION', service_nom, oiseau_id1);
    insert into EST_UTILISE_LORS (Id_Commande, Categorie_service, Nom_service, Id_oiseau)
        VALUES (commande_id, 'REPRODUCTION', service_nom, oiseau_id2);
    commit;
end $$

DELIMITER ;


DELIMITER $$

create procedure FOURNISSEUR_VEND_OISEAU (in ID_FOUR int, in DATE_ACHAT date, in NEW_PRIX float, in NEW_NOM varchar(50), in RACE varchar(50), in GROUPE_SANG char(3))
begin
	insert into OISEAU (App_Envergure,App_Poids,Nom,Prix,Sexe,Date_de_naissance,Groupe_sanguin,Nom_race)
    values (rand()*200,rand()*10,NEW_NOM,NEW_PRIX*1.5,floor(rand()+0.5),date_sub(DATE_ACHAT,interval floor(rand()*10) month),GROUPE_SANG,RACE);
    insert into VEND_OISEAU (Id_oiseau,Prix,Date,VendeurFournisseur) values ((select last_insert_id()),NEW_PRIX,DATE_ACHAT,ID_FOUR);
end $$

DELIMITER ;

DELIMITER $$

create procedure FOURNISSEUR_NEW_NOURRITURE_OISEAU (IN ID_FOUR int, IN DATE_ACHAT date,IN QTE decimal(5, 1),
                                                        IN PRIX_ACHAT float,
                                                             IN NEW_NOM varchar(50))
begin
    declare exit handler for sqlexception
        begin
            rollback;
            resignal ;
        end;
    start transaction ;
    insert into NOURRITURE (Prix_au_kilo,NOURRITURE_OISEAU) values ((PRIX_ACHAT/QTE)*1.5,1);
    insert into NOURRITURE_OISEAU (Id_nourriture,Nom_nourriture,Valeur_nutritive,Quantite)
    values (last_insert_id(),NEW_NOM,rand()*20,QTE);
    insert into VEND_NOURRITURE (Id_nourriture,Id_Fournisseur,Prix,Date,Quantite)
    values (last_insert_id(),ID_FOUR,PRIX_ACHAT,DATE_ACHAT,QTE);
    commit ;
end; $$

DELIMITER ;


DELIMITER $$

create procedure FOURNISSEUR_VEND_NOURRITURE(IN ID_FOUR int, IN DATE_ACHAT date,
                                                                   IN ID_NOUR int, IN QTE decimal(5, 1),
                                                                   IN NEW_PRIX float)
begin
    declare exit handler for sqlexception
        begin
            rollback;
            resignal ;
        end;
    start transaction ;
		update NOURRITURE_OISEAU set Quantite = Quantite + QTE where Id_nourriture=ID_NOUR ;
    insert into VEND_NOURRITURE (Id_nourriture,Id_Fournisseur,Prix,Date,Quantite)
    values (ID_NOUR,ID_FOUR,NEW_PRIX,DATE_ACHAT,QTE);
    commit;
end $$

DELIMITER ;

DELIMITER $$

create procedure INSERT_PERSONNE_CLIENT (in RUE varchar(50), in NUM_RUE varchar(6), in CODE_POST varchar(10), in VILLE varchar(50), in BOITE int, in PAYS varchar(50), in NEW_NOM varchar(50), in NEW_PRENOM varchar(50), in TEL varchar(30), in NEW_EMAIL varchar(50))
begin
     insert into PERSONNE (Adr_Nom_de_la_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Pays, Adr_Boite, Nom, Prenom, Telephone, Email,CLIENT)
     VALUES (RUE,NUM_RUE,CODE_POST,VILLE,PAYS,BOITE,NEW_NOM,NEW_PRENOM,TEL,NEW_EMAIL,1);
    insert  into CLIENT (Id_Personne) VALUES (last_insert_id());
end $$

DELIMITER ;

DELIMITER $$

create procedure INSERT_PERSONNE_EMPLOYE (in RUE varchar(50), in NUM_RUE varchar(6), in CODE_POST varchar(10), in VILLE varchar(50), in BOITE int, in PAYS varchar(50), in NEW_NOM varchar(50), in NEW_PRENOM varchar(50), in TEL varchar(30), in NEW_EMAIL varchar(50), in NEW_JOB varchar(50), in STATUT char)
begin
    declare exit handler for sqlexception
        begin
            rollback;
            resignal ;
        end;
     start transaction;
    insert into PERSONNE (Adr_Nom_de_la_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Pays, Adr_Boite, Nom, Prenom, Telephone, Email,EMPLOYE)
VALUES (RUE,NUM_RUE,CODE_POST,VILLE,PAYS,BOITE,NEW_NOM,NEW_PRENOM,TEL,NEW_EMAIL,1);
    if(upper(STATUT) = 'C')
        then
            insert  into EMPLOYE (Id_Personne,Job,CYBERDOCTEUR,ENTRAINEUR,MEDECIN,NOURRISSEUR) VALUES (last_insert_id(),NEW_JOB,1,null,null,null);
            insert into CYBERDOCTEUR (Id_Personne) VALUES (last_insert_id());
    elseif(upper(STATUT) ='E')
        then
            insert  into EMPLOYE (Id_Personne,Job,CYBERDOCTEUR,ENTRAINEUR,MEDECIN,NOURRISSEUR) VALUES (last_insert_id(),NEW_JOB,null,1,null,null);
            insert into ENTRAINEUR (Id_Personne) VALUES (last_insert_id());

    elseif(upper(STATUT)='M')
        then
            insert  into EMPLOYE (Id_Personne,Job,CYBERDOCTEUR,ENTRAINEUR,MEDECIN,NOURRISSEUR) VALUES (last_insert_id(),NEW_JOB,null,null,1,null);
            insert into MEDECIN (Id_Personne) VALUES (last_insert_id());
    elseif(upper(STATUT)='N')
        then
            insert  into EMPLOYE (Id_Personne,Job,CYBERDOCTEUR,ENTRAINEUR,MEDECIN,NOURRISSEUR) VALUES (last_insert_id(),NEW_JOB,null,null,null,1);
            insert into NOURRISSEUR (Id_Personne) VALUES (last_insert_id());

    else
            signal sqlstate '45000' set message_text = 'Pas de job valide selectionné.';
    end if;
    commit;
end $$

DELIMITER ;

DELIMITER $$

create procedure CLIENT_VEND_OISEAU (IN ID_CLI int, IN ID_OIS int, IN DATE_ACHAT date, IN NEW_PRIX float)
begin
    declare exit handler for sqlexception
        begin
            rollback;
            resignal ;
        end;
    start transaction ;
    insert into VEND_OISEAU (Id_oiseau, Prix, Date, VendeurClient)
        VALUES (ID_OIS,NEW_PRIX,DATE_ACHAT,ID_CLI);
    update OISEAU set Prix = (NEW_PRIX*1.5) , Id_Personne = null where Id_oiseau = ID_OIS;
    commit;
end $$

DELIMITER ;

DELIMITER $$

create procedure CLIENT_ACHAT_OISEAU(in commande_id int, in oiseau_id int)
begin
    declare oiseau_prix float default 0.0;
    declare nouveau_proprio int default 0;
    if (select Id_Personne from OISEAU where Id_oiseau = oiseau_id) is not null
    then
        signal sqlstate '45000' set message_text = 'L\'oiseau appartient deja a un client.';
    end if;
    if (select count(Id_oiseau) from OISEAU where Id_oiseau = oiseau_id) is null or (select Id_Commande from COMMANDE where Id_Commande = commande_id) =0
        then
            signal sqlstate '45000' set message_text = 'L\'oiseau ou la commande n\'existe pas.';
        else
            set oiseau_prix = (select oi.Prix from OISEAU oi where Id_oiseau = oiseau_id);
            set nouveau_proprio = (select Id_Personne from COMMANDE where Id_Commande = commande_id);
            insert ACHAT_OISEAU (Id_oiseau, Prix, Id_Commande) VALUES (oiseau_id,oiseau_prix, commande_id);
            update OISEAU oi set oi.Id_Personne = nouveau_proprio where oi.Id_oiseau = oiseau_id;
    end if;

end $$

DELIMITER ;



DELIMITER $$

create procedure INSERT_NEW_COMMANDE(in myid_client int, in date_commande date)
    begin
        insert COMMANDE (Date, Id_Personne)VALUES (date_commande,myid_client);
        select * from COMMANDE where Date = date_commande and Id_Personne = myid_client;
    end $$

DELIMITER ;

DELIMITER $$

create procedure INSERT_ENTRAINEMENT( IN service_nom varchar(50),
                                                     IN commande_id int, in nbr_seance int, in service_prix float,in oiseau_id int)
begin
    declare exit handler for sqlexception
        begin
            rollback;
            resignal;
        end;
    start transaction ;
    insert into SERVICE (Id_Commande, Categorie_service, Nom_service, Prix, ENTRAINEMENT)
        VALUES (commande_id, 'ENTRAINEMENT', service_nom, service_prix, 1 );
    insert into ENTRAINEMENT (Id_Commande, Categorie_service, Nom_service, Nombre_de_seances)
        VALUES (commande_id,'ENTRAINEMENT',service_nom,nbr_seance);
    insert into EST_UTILISE_LORS (Id_Commande, Categorie_service, Nom_service, Id_oiseau)
        VALUES (commande_id,'ENTRAINEMENT',service_nom,oiseau_id);
    commit;
end $$

DELIMITER ;

DELIMITER $$

create procedure INSERT_SEANCE( IN service_nom varchar(50),
                                                     IN commande_id int, in seance_date date, in seance_duree int)
begin
    declare ent_id int default  0;

    set ent_id = (select Id_Personne from (select e.Id_Personne, count(S.Id_Personne) as count_seance from ENTRAINEUR e
         left  join SEANCE S on e.Id_Personne = S.Id_Personne
         group by e.Id_Personne
        order by count_seance ) as Seances_Entraineurs limit 1) ;
    if ent_id = 0
    then
        signal sqlstate '45000' set message_text = 'Il n\'y a pas de medecin disponible';
    end if;
    insert into SEANCE (Id_Commande, Categorie_service, Nom_service, Date, Duree, Id_Personne)
        VALUES (commande_id,'ENTRAINEMENT',service_nom,seance_date,seance_duree,ent_id);
end $$

DELIMITER ;

DELIMITER $$

create procedure INSERT_LOCATION(IN service_nom varchar(50), IN commande_id int, IN debut_date date, in fin_date date,
                                                     IN service_prix float, IN oiseau_id int)
begin
    declare exit handler for sqlexception
        begin
            rollback;
            resignal ;
        end;
    if oiseau_id in (select Id_oiseau from OISEAU where Id_Personne is not null )
    then
        signal sqlstate '45000' set message_text = 'Un client ne peut pas louer un oiseau appartenant à un autre client.';
    end if;
    start transaction ;
        insert into SERVICE (Id_Commande, Categorie_service, Nom_service, Prix, LOCATION)
            VALUES (commande_id, 'LOCATION', service_nom, service_prix, 1 );
        insert into LOCATION (Id_Commande, Categorie_service, Nom_service, Date_debut, Date_fin)
            VALUES (commande_id,'LOCATION',service_nom,debut_date,fin_date);
        insert into EST_UTILISE_LORS (Id_Commande, Categorie_service, Nom_service, Id_oiseau)
            VALUES (commande_id,'LOCATION',service_nom,oiseau_id);
    commit;

end $$

DELIMITER ;

DELIMITER $$

create procedure INSERT_SOIN(IN service_nom varchar(50), IN commande_id int, IN debut_date date,
                                                 IN fin_date date, IN service_prix float, IN oiseau_id int, in descrip varchar(500))
begin
    declare med_id int default  0;

    declare exit handler for sqlexception
        begin
            rollback;
            resignal ;
        end;
    set med_id = (select Id_Personne from (select med.Id_Personne, count(S.Id_Personne) as count_soin from MEDECIN med
         left  join SOIN S on med.Id_Personne = S.Id_Personne
         group by med.Id_Personne
        order by count_soin ) as Soins_Medecin limit 1) ;
    if med_id = 0
    then
        signal sqlstate '45000' set message_text = 'Il n\'y a pas de medecin disponible';
    end if;
    start transaction ;
        insert into SERVICE (Id_Commande, Categorie_service, Nom_service, Prix, SOIN)
            VALUES (commande_id, 'SOIN', service_nom, service_prix, 1 );
        insert into SOIN (Id_Commande, Categorie_service, Nom_service, Date_debut, Date_fin, Description, Id_Personne)
            VALUES (commande_id,'SOIN',service_nom,debut_date,fin_date,descrip,med_id);
        insert into EST_UTILISE_LORS (Id_Commande, Categorie_service, Nom_service, Id_oiseau)
            VALUES (commande_id,'SOIN',service_nom,oiseau_id);
    commit ;
end $$

DELIMITER ;

DELIMITER $$

create procedure INSERT_AMELIORATION(IN service_nom varchar(50), IN commande_id int, IN debut_date date,
                                                 IN fin_date date, IN service_prix float, IN oiseau_id int, in descrip varchar(500))
begin
    declare cyb_id int default  0;

    declare exit handler for sqlexception
        begin
            rollback;
            resignal ;
        end;
    set cyb_id = (select Id_Personne from (select cyb.Id_Personne, count(a.Id_Personne) as count_ame from CYBERDOCTEUR cyb
         left  join AMELIORATION a on cyb.Id_Personne = a.Id_Personne
         group by cyb.Id_Personne
        order by count_ame ) as Soins_Medecin limit 1) ;
    if cyb_id = 0
    then
        signal sqlstate '45000' set message_text = 'Il n\'y a pas de cyberdocteur disponible';
    end if;
    start transaction ;
        insert into SERVICE (Id_Commande, Categorie_service, Nom_service, Prix, AMELIORATION)
            VALUES (commande_id, 'AMELIORATION', service_nom, service_prix, 1 );
        insert into AMELIORATION (Id_Commande, Categorie_service, Nom_service, Date_debut, Date_fin, Description, Id_Personne)
            VALUES (commande_id,'AMELIORATION',service_nom,debut_date,fin_date,descrip,cyb_id);
        insert into EST_UTILISE_LORS (Id_Commande, Categorie_service, Nom_service, Id_oiseau)
            VALUES (commande_id,'AMELIORATION',service_nom,oiseau_id);
    commit ;
end $$

DELIMITER ;

DELIMITER $$

create procedure TRANSFORMER_OISEAU_FARCIT (in oiseau_id int, in gout_farce varchar(50), in date_decaptiation date)
begin
    declare oiseau_Poids float;
    declare oiseau_Prix float;
    declare proprio int default 0;
    declare exit handler for sqlexception
        begin
            rollback;
            resignal ;
        end;
    set oiseau_Poids = (select App_Poids from OISEAU where Id_oiseau = oiseau_id) ;
    set oiseau_Prix = (select Prix from OISEAU where Id_oiseau = oiseau_id);
    set proprio = (select Id_Personne from OISEAU where Id_oiseau = oiseau_id);
    if (select Date_de_deces from OISEAU where Id_oiseau = oiseau_id) is not null
    then
        signal sqlstate '45000' set message_text = 'L\'oiseau est deja mort';
    end if;
    if proprio <> 0
    then
        signal sqlstate '45000' set message_text = 'L\'oiseau appartient a un client.';
    end if;
    start transaction ;
    update OISEAU set Date_de_deces = date_decaptiation where Id_oiseau =
                                                              oiseau_id;
    insert into NOURRITURE (Prix_au_kilo, OISEAU_FARCIT, NOURRITURE_OISEAU)
        VALUES ((oiseau_Prix/oiseau_Poids)*1.5,1,null);
    insert into OISEAU_FARCIT (Id_oiseau, Id_nourriture, Farce, Poids)
        VALUES (oiseau_id,last_insert_id(),gout_farce,oiseau_Poids*1.5);
    commit ;
end $$

DELIMITER ;

DELIMITER $$

create procedure OISEAU_CLIENT_MORT(in oiseau_id int, in proprio int, in date_mort date)
begin
    if (select Date_de_deces from OISEAU where Id_oiseau = oiseau_id) is not null
        then
            signal sqlstate '45000' set message_text = 'L\'oiseau est deja mort.';
    end if;
    update OISEAU set Date_de_deces = date_mort where Id_oiseau = oiseau_id and Id_Personne = proprio;
end $$

DELIMITER ;

DELIMITER $$

create procedure INSERT_NOURRISSAGE (in oiseau_id int, in nourriture_id int, in nourri_date date, in qte float)
begin
declare nourr_id int default  0;
declare exit handler for sqlexception
    begin
        rollback;
        resignal ;
    end;
set nourr_id = (select Id_Personne from (select nou.Id_Personne, count(N.Id_Personne) as count_nourr from NOURRISSEUR nou
         left  join NOURRISSAGE N on nou.Id_Personne = N.Id_Personne
         group by nou.Id_Personne
        order by count_nourr ) as Nourrisages_Nourr limit 1) ;
    if nourr_id = 0
    then
        signal sqlstate '45000' set message_text = 'Il n y a pas de medecin disponible';
    end if;
start transaction ;
insert into NOURRISSAGE (Id_nourriture, Id_Personne, Id_oiseau, Date_nourrissage, Quantite)
    VALUES (nourriture_id, nourr_id, oiseau_id, nourri_date, qte);
update NOURRITURE_OISEAU set Quantite = qte where Id_nourriture = nourriture_id;
commit;
end 
$$
DELIMITER ;

DELIMITER $$

create procedure VIEW_SERVICE_POUR_OISEAU (in oiseau_id int)
begin
select o.Id_oiseau, o.Nom, eul.Nom_service ,
       eul.Categorie_service from OISEAU o , EST_UTILISE_LORS eul where o.Id_oiseau = eul.Id_oiseau and o.Id_oiseau = oiseau_id;
end $$

DELIMITER ;

DELIMITER $$

create procedure VIEW_ALL_INFO_UN_OISEAU (in oiseau_id int)
begin
    select o.Nom, o.Sexe,o.Date_de_naissance as 'Date de naissance',o.Date_de_deces as 'Date de deces',
           o.Groupe_sanguin as 'Groupe sanguin', o.Nom_race as 'Race',o.App_Envergure as 'Envergure', 
           c.App_Couleur as 'Couleur', o.Prix, o.Id_Personne as 'Proprietaire' FROM OISEAU o left join COULEUR c on o.Id_oiseau = c.Id_oiseau
    left join PERSONNE P on o.Id_Personne = P.Id_Personne
    where o.Id_oiseau = oiseau_id;
end $$

DELIMITER ;

DELIMITER $$

create procedure DONNEES_PERSONNELLES (in client_id int)
begin
    select p.Adr_Nom_de_la_rue,p.Adr_Numero_de_rue,p.Adr_Code_postal,
           p.Adr_Ville,p.Adr_Boite,p.Adr_Pays,p.Nom,p.Prenom,p.Telephone,p.Email
    FROM PERSONNE p left join CLIENT c on p.Id_Personne = c.Id_Personne
    where p.Id_personne = client_id;
end $$

DELIMITER ;


DELIMITER $$

create procedure VIEW_BILAN_COMPTABLE(in year int)
begin
    declare benefice float default 0;
    declare depense float default 0;
    declare depense_vente_nourriture float default 0;
    declare depense_vente_oiseau float default 0;
    declare benefice_service float default 0;
    declare benefice_achat_oiseau float default 0;
    declare benefice_achat_nourriture float default 0;
    set benefice_achat_nourriture = benefice_achat_nourriture + coalesce((select sum(AN.Prix) from COMMANDE c left join ACHAT_NOURRITURE AN on c.Id_Commande = AN.Id_Commande where year(c.Date) = year),0);
    set benefice_achat_oiseau = benefice_achat_oiseau + coalesce((select sum(AO.Prix) from COMMANDE c left join ACHAT_OISEAU AO on c.Id_Commande = AO.Id_Commande where year(c.Date) = year),0);
    set benefice_service = benefice_service + coalesce((select sum(S.Prix) from COMMANDE c left join SERVICE S on c.Id_Commande = S.Id_Commande where year(c.Date) = year),0);
    set benefice = benefice_achat_nourriture + benefice_achat_oiseau + benefice_service;
    set depense_vente_nourriture = depense_vente_nourriture - coalesce((select sum(VN.Prix) from VEND_NOURRITURE VN where year(VN.Date)= year),0);
    set depense_vente_oiseau = depense_vente_oiseau - coalesce((select sum(VO.Prix) from VEND_OISEAU VO where year(VO.Date) = year),0);
    set depense = depense_vente_oiseau + depense_vente_nourriture;
    select year as 'Annee comptable', benefice as 'Benefice total', benefice_achat_oiseau as 'Benefice des ventes d oiseaux',
           benefice_service as 'Benefice des services vendus', benefice_achat_nourriture as 'Benefice des ventes de nourriture',
           depense as 'Depense totale', depense_vente_oiseau as 'Depense en achat d oiseaux', depense_vente_nourriture as 'Depense en achat de nourriture',
           round(sum(benefice+depense),2) as 'Profit de l annee';

end $$

DELIMITER ;

DELIMITER $$

create procedure VIEW_BILAN_COMPTABLE_MONTH(in year int,in mois int)
begin
    declare benefice float default 0;
    declare depense float default 0;
    declare depense_vente_nourriture float default 0;
    declare depense_vente_oiseau float default 0;
    declare benefice_service float default 0;
    declare benefice_achat_oiseau float default 0;
    declare benefice_achat_nourriture float default 0;
    set benefice_achat_nourriture = benefice_achat_nourriture + coalesce((select sum(AN.Prix) from COMMANDE c left join ACHAT_NOURRITURE AN on c.Id_Commande = AN.Id_Commande where year(c.Date) = year and month(c.Date) = mois) ,0);
    set benefice_achat_oiseau = benefice_achat_oiseau + coalesce((select sum(AO.Prix) from COMMANDE c left join ACHAT_OISEAU AO on c.Id_Commande = AO.Id_Commande where year(c.Date) = year and month(c.Date) = mois),0);
    set benefice_service = benefice_service + coalesce((select sum(S.Prix) from COMMANDE c left join SERVICE S on c.Id_Commande = S.Id_Commande where year(c.Date) = year and month(c.Date) = mois),0);
    set benefice = benefice_achat_nourriture + benefice_achat_oiseau + benefice_service;
    set depense_vente_nourriture = depense_vente_nourriture - coalesce((select sum(VN.Prix) from VEND_NOURRITURE VN where year(VN.Date)= year and month(VN.Date) = mois),0);
    set depense_vente_oiseau = depense_vente_oiseau - coalesce((select sum(VO.Prix) from VEND_OISEAU VO where year(VO.Date) = year and month(VO.Date) = mois),0);
    set depense = depense_vente_oiseau + depense_vente_nourriture;
    select year as 'Annee comptable', benefice as 'Benefice total', benefice_achat_oiseau as 'Benefice des ventes d oiseaux',
           benefice_service as 'Benefice des services vendus', benefice_achat_nourriture as 'Benefice des ventes de nourriture',
           depense as 'Depense totale', depense_vente_oiseau as 'Depense en achat d oiseaux', depense_vente_nourriture as 'Depense en achat de nourriture',
           round(sum(benefice+depense),2) as 'Profit de l annee';

end $$

DELIMITER ;

DELIMITER $$

create procedure CONNEXION_CLIENT (email_client varchar(50))
begin

    declare  client_id int;
    set  client_id = 0;
    set client_id = (select Id_Personne from PERSONNE where Email = email_client);
    select client_id;

end $$

DELIMITER ;

DELIMITER $$

create procedure VIEW_MES_OISEAUX (in client_id int)
begin
    select o.Id_oiseau as 'Id oiseau', o.Nom as 'Nom oiseau'
    from OISEAU o left join  CLIENT c on o.Id_Personne = c.Id_Personne
    where o.Id_Personne = client_id;
end $$

DELIMITER ;

DELIMITER $$

create procedure MODIF_DONNEES_CLIENT (in id_client int, in RUE varchar(50), in NUM_RUE varchar(6), in CODE_POST varchar(10), in VILLE varchar(50), in BOITE int, in PAYS varchar(50), in NEW_NOM varchar(50), in NEW_PRENOM varchar(50), in TEL varchar(30), in NEW_EMAIL varchar(50))
begin
     update PERSONNE set Adr_Nom_de_la_rue = RUE, Adr_Numero_de_rue = NUM_RUE,
                         Adr_Code_postal = CODE_POST, Adr_Ville = VILLE, Adr_Pays = PAYS,
                         Adr_Boite = BOITE, Nom = NEW_NOM, Prenom = NEW_PRENOM,
                         Telephone = TEL, Email = NEW_EMAIL
    where Id_Personne = id_client;
end $$

DELIMITER ;

DELIMITER $$

create procedure CLIENT_ACHAT_NOURRITURE(in commande_id int, in nourriture_id int,in quantite_nourr float)
begin
    declare poids_nourriture float default 0;
    declare prix_poids float default 0;
    declare exit handler for sqlexception
        begin
            rollback;
            resignal ;
        end;

    if (select count(*) from NOURRITURE where Id_nourriture = nourriture_id ) = 0
        then
        signal sqlstate '45000' set message_text = 'Cette nourriture n existe pas.';
    end if;
    start transaction ;
    if (select OISEAU_FARCIT from NOURRITURE where Id_nourriture = nourriture_id) = 1
        then
        if quantite_nourr <> 1
            then
            signal sqlstate '45000' set message_text = 'La quantite doit etre de 1 pour acheter un oiseau farcit';
        else
            set prix_poids = (select Prix_au_kilo from NOURRITURE where Id_nourriture = nourriture_id);
            set poids_nourriture = (select Poids from OISEAU_FARCIT where Id_nourriture =nourriture_id);
            insert into ACHAT_NOURRITURE (Id_Commande, Id_nourriture, Quantite, Prix)
                VALUES (commande_id,nourriture_id,1,poids_nourriture*prix_poids);
            delete FROM OISEAU_FARCIT where Id_nourriture = nourriture_id;
        end if;
    else
        if (select Quantite from NOURRITURE_OISEAU where Id_nourriture = nourriture_id) < quantite_nourr
            then
            signal sqlstate '45000' set message_text = 'Pas assez de stock pour la quantite demandée.';
        end if;
        set prix_poids = (select Prix_au_kilo from NOURRITURE where Id_nourriture = nourriture_id);

        insert into ACHAT_NOURRITURE (Id_Commande, Id_nourriture, Quantite, Prix)
            VALUES (commande_id,nourriture_id,quantite_nourr,quantite_nourr*prix_poids);
        update NOURRITURE_OISEAU set Quantite = Quantite - quantite_nourr where Id_nourriture = nourriture_id;
    end if;
    commit ;
end $$

DELIMITER ;


DELIMITER $$

create procedure SUPPRIMER_CLIENT (in client_id int)
begin
    update PERSONNE set Adr_Nom_de_la_rue = 'anonyme', Adr_Numero_de_rue = 0,
                        Adr_Code_postal = 0, Adr_Ville = 'anonyme',
                        Adr_Pays = 'anonyme', Adr_Boite = 0,
                        Nom = 'anonyme', Prenom = 'anonyme', Telephone = 'anonyme',
                        Email = client_id
    where Id_Personne = client_id;
end $$

DELIMITER ;

DELIMITER $$

create procedure VIEW_MY_COMMANDES (in client_id int)
    begin
       select co.Id_Personne as 'Id client', co.Id_Commande as 'Id de commande',
              round(coalesce((select sum(S.Prix) from SERVICE S where S.Id_Commande = co.Id_Commande),0)+
                     coalesce((select sum(AN.Prix) from ACHAT_NOURRITURE AN where AN.Id_Commande = co.Id_Commande),0)+
                     coalesce((select sum(AO.Prix) from ACHAT_OISEAU AO where AO.Id_Commande = co.Id_Commande),0),2) as 'Prix total',
               (select count(  S.Id_Commande ) from SERVICE S where S.Id_Commande = co.Id_Commande) as 'Nombre de services',
               (select count(  AN.Id_Commande ) from ACHAT_NOURRITURE AN where AN.Id_Commande = co.Id_Commande) as 'Nombre d achat nourriture',
               (select count(  AO.Id_Commande ) from ACHAT_OISEAU AO where AO.Id_Commande = co.Id_Commande) as 'Nombre d achats oiseau'
        from COMMANDE co left join ACHAT_OISEAU AO on co.Id_Commande = AO.Id_Commande
            left join ACHAT_NOURRITURE AN on co.Id_Commande = AN.Id_Commande

        left join SERVICE S on co.Id_Commande = S.Id_Commande
                where co.Id_Personne =client_id
    group by co.Id_Personne, co.Id_Commande;
      end $$


DELIMITER ;


/*----Remplissage----*/

-- INSERT into RACE

insert into RACE(Nom) VALUES ('Pigeon');
insert into RACE(Nom) VALUES ('Pingouin');
insert into RACE(Nom) VALUES ('Perroquet');
insert into RACE(Nom) VALUES ('Corbeau');
insert into RACE(Nom) VALUES ('Mesange');
insert into RACE(Nom) VALUES ('Colombe');
insert into RACE(Nom) VALUES ('Colibri');
insert into RACE(Nom) VALUES ('Vautour');


-- INSERT into FOURNISSEUR

insert into FOURNISSEUR (Adr_Nom_de_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Pays, Nom_entreprise, Telephone, Email)
VALUES ('Rue de Bruxelles','52A','5000','Namur','Belgique','FourniLesPiges','0032412131415','fourni@piges.be');
insert into FOURNISSEUR (Adr_Nom_de_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Pays, Nom_entreprise, Telephone, Email)
VALUES ('Boulevard D Avroy','122','4000','Liege','Belgique','Piaf&Co','0032412131416','piafco@piaf.be');
insert into FOURNISSEUR (Adr_Nom_de_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Pays, Nom_entreprise, Telephone, Email)
VALUES ('Place de l Yser','33','6700','Arlon','Belgique','Flappi','0032412131417','flapi@skynet.be');
insert into FOURNISSEUR (Adr_Nom_de_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Pays, Nom_entreprise, Telephone, Email)
VALUES ('Ilevollen','2','7018','Trondheim','Norvège','Pingu','0032412131418','pingu@noot.no');

-- INSERT into CLIENT


call northwind.INSERT_PERSONNE_CLIENT('Rue Albert','4','5030','Gembloux',null,'Belgique', 'Leclerc','Monique','0477889956','monique.leclerc@gmail.com');
call northwind.INSERT_PERSONNE_CLIENT('Rue Godefroid','101','5000','Namur',null,'Belgique','Dupont','Jean','0477889955','jean.dupont@gmail.com');
call INSERT_PERSONNE_CLIENT('Chaussée de bruxelles','544','1410','Waterloo',null,'Belgique','Galberd','Radian','0477454585','radioan.gal@hotmail.com');



-- INSERT into EMPLOYE

call northwind.INSERT_PERSONNE_EMPLOYE('Rue de l Esperance','66','6061','Charleroi',
    null,'Belgique','Peeters','Emile','0477889957','bob.peeters@gmail.com','Medecin en chef','M');
call northwind.INSERT_PERSONNE_EMPLOYE('Rue des paquerettes','42','1000','Bruxelles',
    null,'Belgique','La Perche','Jean-Yves','0032477445522','jy.perche@gmail.com','Nourrisseur spécialisé en régime de pigeons','N');
call northwind.INSERT_PERSONNE_EMPLOYE('Boulevard des Combattants','1002A','4470','Saint-Georges-sur-Meuse',
    null,'Belgique','LaTope','René','0471114142','renelat@gmail.com','entraineur de yoga','E');
call northwind.INSERT_PERSONNE_EMPLOYE('Rue de fer','124','5000','Namur',
    null,'Belgique','DesChamps','Yvelynne','0477998857','yvette.lapaquerette@gmail.com','Mécanicienne en échappement libre','C');
call northwind.INSERT_PERSONNE_EMPLOYE('Rue du Paradis','69','5100','Namur',
    null,'Belgique','Ziegler','Angela','04768696696','angela.ziegler@gmail.com','Medecin de terrain','M');
call northwind.INSERT_PERSONNE_EMPLOYE('Avenue fin de la guerre','42','59200 ','Tourcoing',
    null,'France','Cassidy','Cole','04760614156','cole.cassidy@gmail.com','spécialiste en prothèse','C');
call northwind.INSERT_PERSONNE_EMPLOYE('Rue des Cieux','13','29690  ','Huelgoat',
    null,'France','Amari','Fareeha','04767896544','fareeha.amari@gmail.com','entraineuse en vol acrobatique','E');
call northwind.INSERT_PERSONNE_EMPLOYE('Route de la Mort','7','77300  ','Fontainebleau',
    null,'France','Reyes','Gabriel','04760101010','gabriel.reyes@gmail.com','Nourrisseur spécialisé en vautour','N');

-- INSERT into TYPE_DE_SERVICE

insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('REPRODUCTION','Reproduction entre rapaces',199.99,599.99,24,2200);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('REPRODUCTION','Reproduction entre pure race',499.99,1001.01,48,2200);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('REPRODUCTION','Reproduction basique',50,149.90,24,72);

insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('LOCATION','Lot de 50 pigeons',99.00,10000,24,2200);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('LOCATION','Lot de 50 pigeons blanc',150,15000,24,2200);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('LOCATION','Lot de 50 colombes pure sang',399.90,40000,24,2200);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('LOCATION','Faucon chasseur',250,25000,24,2200);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('SOIN','Massage thailandais',9.99,149.99,1,15);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('SOIN','Lissage des plumes',15,100,1,7);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('SOIN','Epilation du bec',50,150,1,3);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('ENTRAINEMENT','Entrainement du cardio',150,15000,3,100);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('ENTRAINEMENT','Entrainement pour la vitesse de pointe',250,25000,3,100);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('ENTRAINEMENT','Entrainement aux vols de haute altitude',500,50000,3,100);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('AMELIORATION','Ajout d une visiere antimouchettes',10000,20000,8,24);
insert into TYPE_DE_SERVICE (Categorie_service, Nom_service, Prix_min, Prix_max, Temps_min, Temps_max)
VALUES ('AMELIORATION','Implantation d une balise gps haute portee',5000,15000,2,12);

-- INSERT into OISEAU

call FOURNISSEUR_VEND_OISEAU(1, '2022-05-10',149.99,'Pilou','Corbeau','AB+');
call FOURNISSEUR_VEND_OISEAU(1, '2022-03-10', 229.99, 'Origon', 'Vautour', 'O-');
call FOURNISSEUR_VEND_OISEAU(2, '2019-04-10', 1249.99, 'Pallium', 'Perroquet', 'A+');
call FOURNISSEUR_VEND_OISEAU(4, '2020-04-10', 49.99, 'Cotontige', 'Pigeon', 'B+');
call FOURNISSEUR_VEND_OISEAU(1, '2022-04-20',68.99,'Pistache','Pigeon','O+');
call FOURNISSEUR_VEND_OISEAU(3, '2022-05-17',1100.99,'Rose','Perroquet','A+');
call FOURNISSEUR_VEND_OISEAU(4, '2022-02-23',990.99,'Victoire','Colombe','AB+');
call FOURNISSEUR_VEND_OISEAU(2, '2022-01-04',42.69,'Joker','Pigeon','A+');
call FOURNISSEUR_VEND_OISEAU(1, '2021-07-12',562.99,'Nat','Mesange','B-');
call FOURNISSEUR_VEND_OISEAU(2, '2021-12-14',746.99,'Winston','Vautour','B-');
call FOURNISSEUR_VEND_OISEAU(4, '2022-03-21',1165.99,'Bruce','Perroquet','O-');
call FOURNISSEUR_VEND_OISEAU(1, '2020-02-29',149.99,'Lena','Pigeon','AB-');
call FOURNISSEUR_VEND_OISEAU(3, '2021-04-20',499.99,'Amelie','Corbeau','O+');
call FOURNISSEUR_VEND_OISEAU(3, '2021-08-15',387.99,'Gerard','Pigeon','A-');
call FOURNISSEUR_VEND_OISEAU(4, '2021-11-21',1795.99,'Mina','Perroquet','A+');
call FOURNISSEUR_VEND_OISEAU(1, '2021-06-01',827.99,'Akande','Colombe','B+');
call FOURNISSEUR_VEND_OISEAU(4, '2022-04-01',643.99,'harley','Pigeon','O-');
call FOURNISSEUR_VEND_OISEAU(2, '2021-09-21',925.99,'Jessy','Mesange','AB+');
call FOURNISSEUR_VEND_OISEAU(3, '2021-04-18',1496.99,'Jack','Vautour','O+');
call FOURNISSEUR_VEND_OISEAU(3, '2020-12-16',1199.99,'Efi','Pingouin','O-');
call FOURNISSEUR_VEND_OISEAU(3, '2021-09-15',111.99,'Gerard','Pigeon','A-');
call FOURNISSEUR_VEND_OISEAU(4, '2020-08-17',204.99,'Hana','Pigeon','AB+');
call FOURNISSEUR_VEND_OISEAU(4, '2021-04-06',117.99,'Naome ','Pigeon','O+');
call FOURNISSEUR_VEND_OISEAU(2, '2021-10-13',94.99,'Vanille','Pigeon','A+');
call FOURNISSEUR_VEND_OISEAU(1, '2022-01-23',89.99,'Bruce','Pigeon','AB-');
call FOURNISSEUR_VEND_OISEAU(1, '2021-05-17',105.99,'King','Pigeon','O+');
call FOURNISSEUR_VEND_OISEAU(2, '2021-11-01',142.99,'Jason','Pigeon','B+');
call FOURNISSEUR_VEND_OISEAU(3, '2021-09-11',214.99,'Wuly','Pigeon','A-');


-- INSERT into COMMANDE

call INSERT_NEW_COMMANDE(1,'2022-05-16');
call INSERT_NEW_COMMANDE(2,'2022-04-10');
call INSERT_NEW_COMMANDE(3,'2022-12-24');



-- INSERT into ACHAT_OISEAU

call CLIENT_ACHAT_OISEAU(1, 1);
call CLIENT_ACHAT_OISEAU(2,4);
call CLIENT_ACHAT_OISEAU(3,3);



-- INSERT into REPRODUCTION SERVICE EST_UTILISE_LORS

call INSERT_REPRODUCTION('Reproduction basique', 1, '2022-05-16','2022-08-15', 3, 69.99, 1, 2 );
call INSERT_REPRODUCTION('Reproduction basique', 2, '2022-08-17','2022-12-24', 3, 69.99, 4, 2 );

call INSERT_ENTRAINEMENT('Entrainement du cardio',2,3,350.00,4);

call INSERT_SEANCE('Entrainement du cardio',2,'2023-01-01',60);
call INSERT_SEANCE('Entrainement du cardio',2,'2023-01-02',60);
call INSERT_SEANCE('Entrainement du cardio',2,'2023-01-03',60);



-- INSERT into NOURRITURE NOURRITURE_OISEAU

insert into NOURRITURE (Id_nourriture, Prix_au_kilo, OISEAU_FARCIT, NOURRITURE_OISEAU)
VALUES (1,7.5,null,1);
insert into NOURRITURE (Id_nourriture, Prix_au_kilo, OISEAU_FARCIT, NOURRITURE_OISEAU)
VALUES (2,12,null,1);
insert into NOURRITURE (Id_nourriture, Prix_au_kilo, OISEAU_FARCIT, NOURRITURE_OISEAU)
VALUES (3,41.5,null,1);
insert into NOURRITURE (Id_nourriture, Prix_au_kilo, OISEAU_FARCIT, NOURRITURE_OISEAU)
VALUES (4,10.5,null,1);
insert into NOURRITURE (Id_nourriture, Prix_au_kilo, OISEAU_FARCIT, NOURRITURE_OISEAU)
VALUES (5,11,null,1);
insert into NOURRITURE (Id_nourriture, Prix_au_kilo, OISEAU_FARCIT, NOURRITURE_OISEAU)
VALUES (6,13.5,null,1);
insert into NOURRITURE (Id_nourriture, Prix_au_kilo, OISEAU_FARCIT, NOURRITURE_OISEAU)
VALUES (7,12,null,1);
insert into NOURRITURE (Id_nourriture, Prix_au_kilo, OISEAU_FARCIT, NOURRITURE_OISEAU)
VALUES (8,52.5,null,1);

INSERT into NOURRITURE_OISEAU (Id_nourriture, Nom_nourriture, Valeur_nutritive, Quantite)
VALUES (1,'Graines de tournesol',10.2,735);
INSERT into NOURRITURE_OISEAU (Id_nourriture, Nom_nourriture, Valeur_nutritive, Quantite)
VALUES (2,'Graines de mais',19.2,642);
INSERT into NOURRITURE_OISEAU (Id_nourriture, Nom_nourriture, Valeur_nutritive, Quantite)
VALUES (3,'Noix de pecan',53.5,194);
INSERT into NOURRITURE_OISEAU (Id_nourriture, Nom_nourriture, Valeur_nutritive, Quantite)
VALUES (4,'Graines de pavot',10.2,400);
INSERT into NOURRITURE_OISEAU (Id_nourriture, Nom_nourriture, Valeur_nutritive, Quantite)
VALUES (5,'Graines d\'avoine',14.3,307);
INSERT into NOURRITURE_OISEAU (Id_nourriture, Nom_nourriture, Valeur_nutritive, Quantite)
VALUES (6,'Graine de lin',17.2,245);
INSERT into NOURRITURE_OISEAU (Id_nourriture, Nom_nourriture, Valeur_nutritive, Quantite)
VALUES (7,'Graine de chanvre',6.7,657);
INSERT into NOURRITURE_OISEAU (Id_nourriture, Nom_nourriture, Valeur_nutritive, Quantite)
VALUES (8,'Sardines',202,100);

-- INSERT into NOURRITURE OISEAU_FRACIT

call TRANSFORMER_OISEAU_FARCIT( 24, 'chair à saucisse','2022-05-17');
call TRANSFORMER_OISEAU_FARCIT( 25, 'rhum / ananas','2022-05-17');
call TRANSFORMER_OISEAU_FARCIT( 26, 'Pomelo / citron / gingembre','2022-05-17');
call TRANSFORMER_OISEAU_FARCIT( 27, 'choux de Bruxelles / lardons','2022-05-17');
call TRANSFORMER_OISEAU_FARCIT( 28, 'Pomme / Pastis','2022-05-17');




-- INSERT into COULEUR

insert COULEUR (Id_oiseau, App_Couleur) VALUES (1,'Jaune');
insert COULEUR (Id_oiseau, App_Couleur) VALUES (2,'Bleu');
insert COULEUR (Id_oiseau, App_Couleur) VALUES (3,'Noir');

-- INSERT into REGIME

insert into  REGIME (Id_nourriture, Nom) VALUES (6,'Colibri');
insert into REGIME (Id_nourriture, Nom) VALUES (2,'Colombe');
insert into REGIME (Id_nourriture, Nom) VALUES (4,'Corbeau');
insert into REGIME (Id_nourriture, Nom) VALUES (1,'Mesange');
insert into REGIME (Id_nourriture, Nom) VALUES (1,'Perroquet');
insert into REGIME (Id_nourriture, Nom) VALUES (5,'Pigeon');
insert into REGIME (Id_nourriture, Nom) VALUES (8,'Pingouin');
insert into REGIME (Id_nourriture, Nom) VALUES (8,'Vautour');


create user 'client'@'%' identified by 'password';
grant select on VIEW_OISEAU_A_VENDRE to 'client'@'%';
grant select on VIEW_TYPES_SERVICES TO 'client'@'%';
grant select on VIEW_STOCK_OISEAU_FARCIT to 'client'@'%';
grant select on PERSONNE to 'client'@'%';
grant update on PERSONNE to 'client'@'%';
grant execute ON procedure CLIENT_ACHAT_OISEAU to 'client'@'%';
grant execute ON procedure CLIENT_VEND_OISEAU to 'client'@'%';
grant execute ON procedure INSERT_AMELIORATION to 'client'@'%';
grant execute ON procedure INSERT_NEW_COMMANDE to 'client'@'%';
grant execute ON procedure INSERT_SOIN to 'client'@'%';
grant execute ON procedure INSERT_REPRODUCTION to 'client'@'%';
grant execute ON procedure INSERT_ENTRAINEMENT to 'client'@'%';
grant execute ON procedure INSERT_LOCATION to 'client'@'%';
grant execute ON procedure INSERT_SEANCE to 'client'@'%';
grant execute ON procedure INSERT_PERSONNE_CLIENT to 'client'@'%';
grant execute ON procedure OISEAU_CLIENT_MORT to 'client'@'%';
grant execute ON procedure VIEW_SERVICE_POUR_OISEAU to 'client'@'%';
grant execute ON procedure INSERT_LOCATION to 'client'@'%';
grant execute ON procedure VIEW_ALL_INFO_UN_OISEAU to 'client'@'%';
grant execute ON procedure DONNEES_PERSONNELLES to 'client'@'%';
grant execute ON procedure MODIF_DONNEES_CLIENT to 'client'@'%';
grant execute ON procedure VIEW_MES_OISEAUX to 'client'@'%';
grant execute ON procedure CLIENT_ACHAT_NOURRITURE to 'client'@'%';
grant execute ON procedure SUPPRIMER_CLIENT to 'client'@'%';
grant execute ON procedure CONNEXION_CLIENT to 'client'@'%';
grant execute ON procedure VIEW_MY_COMMANDES to 'client'@'%';


create user 'gerant'@'%' identified by 'password';

grant insert, update on FOURNISSEUR to 'gerant'@'%';
grant insert, update on REGIME to 'gerant'@'%';
grant insert, update on COULEUR to 'gerant'@'%';
grant insert on RACE to 'gerant'@'%';
grant select on * to 'gerant'@'%';
grant execute ON procedure FOURNISSEUR_VEND_NOURRITURE to 'gerant'@'%';
grant execute ON procedure FOURNISSEUR_VEND_OISEAU to 'gerant'@'%';
grant execute ON procedure FOURNISSEUR_NEW_NOURRITURE_OISEAU to 'gerant'@'%';
grant execute ON procedure INSERT_NOURRISSAGE to 'gerant'@'%';
grant execute ON procedure INSERT_PERSONNE_EMPLOYE to 'gerant'@'%';
grant execute ON procedure TRANSFORMER_OISEAU_FARCIT to 'gerant'@'%';
grant select on VIEW_ALL_ACHAT_OISEAU TO 'gerant'@'%';
grant select on VIEW_ALL_OISEAUX_POSSEDE TO 'gerant'@'%';
grant select on VIEW_ALL_VENTES_OISEAU TO 'gerant'@'%';
grant select on VIEW_STOCK_NOURRITURE_OISEAU TO 'gerant'@'%';
grant execute ON procedure VIEW_ALL_INFO_UN_OISEAU to 'gerant'@'%';
grant execute ON procedure VIEW_BILAN_COMPTABLE to 'gerant'@'%';
grant execute ON procedure VIEW_BILAN_COMPTABLE_MONTH to 'gerant'@'%';
grant select on VIEW_ALL_COMMANDES TO 'gerant'@'%';


