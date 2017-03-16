--Nombre de clients

SELECT count(CLI_ID)
FROM T_CLIENT


--Les clients triés sur le titre et le nom

SELECT *
FROM T_CLIENT
ORDER BY CLI_NOM , TIT_CODE;


--Les clients triés sur le libellé du titre et le nom

SELECT *
FROM T_CLIENT , T_TITRE
ORDER BY CLI_NOM , TIT_LIBELLE;


--Les clients commençant par 'B'

SELECT *
FROM T_CLIENT
WHERE UPPER(CLI_NOM) like UPPER('B%');


--Les clients homonymes


--Nombre de titres différents

SELECT count(TIT_CODE)
FROM T_TITRE


--Nombre d'enseignes

SELECT distinct count(CLI_ENSEIGNE)
FROM T_CLIENT

--Les clients qui représentent une enseigne 

SELECT distinct (CLI_NOM)
FROM T_CLIENT
WHERE (SELECT distinct (CLI_ENSEIGNE)
		FROM T_CLIENT);

--Les clients qui représentent une enseigne de transports

SELECT distinct (CLI_NOM)
FROM T_CLIENT
WHERE (SELECT distinct (CLI_ENSEIGNE)
		FROM T_CLIENT
		WHERE UPPER(CLI_ENSEIGNE) like UPPER('%transports%'));

--Nombre d'hommes,Nombres de femmes, de demoiselles, Nombres de sociétés

--Nombre d''emails

SELECT distinct count(EML_ID)
FROM T_EMAIL 

--Client sans email 

SELECT distinct count(CLI_ID)
FROM T_EMAIL
WHERE not exists (SELECT CLI_ID
					FROM T_CLIENT);

--Clients sans téléphone 

SELECT  distinct count(CLI_ID)
FROM T_TELEPHONE
WHERE not exists (SELECT  CLI_ID
					FROM T_CLIENT);


--Les phones des clients

SELECT  distinct (TYP_CODE)
FROM T_TELEPHONE

--Ventilation des phones par catégorie



--Les clients ayant plusieurs téléphones

SELECT count(CLI_ID)
FROM T_TELEPHONE
WHERE TEL_NUMERO >=2;

--Clients sans adresse:

SELECT  distinct count(CLI_ID)
FROM T_ADRESSE
WHERE not exists (SELECT  CLI_ID
					FROM T_CLIENT);

--Clients sans adresse mais au moins avec mail ou phone 

--Dernier tarif renseigné

--Tarif débutant le plus tôt 

--Différentes Années des tarifs

--Nombre de chambres de l'hotel 

SELECT count (CHB_NUMERO)
FROM T_CHAMBRE

--Nombre de chambres par étage

--Chambres sans telephone

SELECT  count(CHB_POSTE_TEL)
FROM T_CHAMBRE
WHERE CHB_POSTE_TEL=0;

--Existence d'une chambre n°13 ?

SELECT distinct CHB_NUMERO
FROM T_CHAMBRE
WHERE CHB_NUMERO=13;

--Chambres avec sdb

SELECT count(CHB_BAIN)
FROM T_CHAMBRE
WHERE CHB_BAIN=1;

--Chambres avec douche

SELECT  count(CHB_DOUCHE)
FROM T_CHAMBRE
WHERE CHB_DOUCHE =1;

--Chambres avec WC

SELECT  count(CHB_WC)
FROM T_CHAMBRE
WHERE CHB_WC =1;

--Chambres sans WC séparés

SELECT  count(CHB_WC)
FROM T_CHAMBRE
WHERE CHB_WC =1;

--Quels sont les étages qui ont des chambres sans WC séparés ?

SELECT count(CHB_ETAGE)
FROM T_CHAMBRE
WHERE (SELECT CHB_WC 
		FROM T_CHAMBRE
		WHERE CHB_WC=0);

--Nombre d'équipements sanitaires par chambre trié par ce nombre d'équipement croissant

--Chambres les plus équipées et leur capacité

--Repartition des chambres en fonction du nombre d'équipements et de leur capacité

--Nombre de clients ayant utilisé une chambre

SELECT distinct count (CLI_ID)
FROM TJ_CHB_PLN_CLI

--Clients n'ayant jamais utilisé une chambre (sans facture)

SELECT CLI_ID
FROM T_CLIENT
WHERE (SELECT CLI_ID
		FROM T_FACTURE
		WHERE not exists (CLI_ID));

--Nom et prénom des clients qui ont une facture

--Nom, prénom, telephone des clients qui ont une facture

--Attention si email car pas obligatoire : jointure externe

--Adresse où envoyer factures aux clients

--Répartition des factures par mode de paiement (libellé)

--Répartition des factures par mode de paiement 

--Différence entre ces 2 requêtes ? 



--Factures sans mode de paiement 

SELECT  distinct(FAC_ID)
FROM T_FACTURE
WHERE not exists (SELECT PMT_CODE
					FROM T_FACTURE);

--Repartition des factures par Années

--Repartition des clients par ville

--Montant TTC de chaque ligne de facture (avec remises)

--Classement du montant total TTC (avec remises) des factures

--Tarif moyen des chambres par années croissantes

--Tarif moyen des chambres par étage et années croissantes

--Chambre la plus cher et en quelle année

--Chambre la plus cher par année 

SELECT  TRF_CHB_PRIX
FROM TJ_TRF_CHB
WHERE TRF_CHB_PRIX > (SELECT *
						FROM TJ_TRF_CHB);


--Clasement décroissant des réservation des chambres 

--Classement décroissant des meilleurs clients par nombre de réservations

--Classement des meilleurs clients par le montant total des factures

--Factures payées le jour de leur édition

SELECT FAC_DATE , FAC_PMT_DATE
FROM T_FACTURE
WHERE FAC_DATE = FAC_PMT_DATE; 

--Facture dates et Délai entre date de paiement et date d'édition de la facture