
create table CLIENT
	(
		NUMCLIENT decimal (20) not null,
		NOM char (20) not null,
		PRENOM char (20) not null,
		ADRESSE char (60) not null,
		
		primary key (NUMCLIENT),
			on delete cascade on update cascade
	)
	in SP_CLIENT;
	
create table PRODUIT
	(
		CODEPRODUIT char (20) not null,
		LIBELLE char (20) not null,
		PRIX_UNITAIRE decimal (5) not null,
		
		primary key (CODEPRODUIT),
			on delete cascade on update cascade
	)
	in SP_PRODUIT;
	
create table COMMANDE
	(
		NUMCOMMANDE decimal (20) not null,
		DATE_COMMANDE date not null,
		ADRESSE_LIVRAISON char (20) not null,
		NUMCLIENT decimal (20) not null,
		
		primary key (NUMCOMMANDE),
			on delete no action on update no action,
		foreign key (NUMCLIENT) references CLIENT(NUMCLIENT),
			on delete no action on update no action
	)
	in SP_COMMANDE;
	
create table CONTENU
	(
		QUANTITE_PRODUIT decimal (3) not null,
		CODEPRODUIT char (20) not null,
		NUMCOMMANDE decimal (20) not null,
		
		primary key (QUANTITE_PRODUIT,CODEPRODUIT,NUMCOMMANDE),
		foreign key (CODEPRODUIT) references PRODUIT(CODEPRODUIT),
			on delete no action on update no action,
		foreign key (NUMCOMMANDE) references COMMANDE(NUMCOMMANDE),
			on delete no action on update no action
	)
	in SP_COMMANDE;